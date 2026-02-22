# Admin Panel - User Guide

## Overview

The Admin Panel allows administrators to manage vocabulary lessons directly from the app. All changes are saved to Firebase Firestore in real-time.

## Features

✅ **View All Lessons** - See all 25 vocabulary lessons in a grid layout  
✅ **Edit Lessons** - Modify vocabulary items in any lesson  
✅ **Add Vocabulary** - Add new words to existing lessons  
✅ **Delete Vocabulary** - Remove words from lessons  
✅ **Real-time Updates** - Changes are immediately saved to Firestore  

## Setup

### 1. Add Admin Email

Open `/lib/app/data/services/admin_service.dart` and add your admin email:

```dart
static const List<String> adminEmails = [
  'your-admin-email@gmail.com',  // Add your email here
];
```

### 2. Access Admin Panel

Add a navigation button to access the admin panel. For example, in your main menu:

```dart
ElevatedButton(
  onPressed: () => Get.to(() => AdminPanelPage()),
  child: const Text('Admin Panel'),
)
```

Or add it to your navigation drawer/settings page.

### 3. Sign in with Admin Account

Make sure you're signed in with Firebase Auth using the email you added to the admin list.

## Usage

### Viewing Lessons

1. Open the Admin Panel
2. You'll see a grid of all 25 lessons
3. Each card shows the lesson number and word count

### Editing a Lesson

1. Click on any lesson card
2. You'll see a list of all vocabulary items in that lesson
3. Each item shows:
   - Burmese translation
   - Japanese (hiragana/katakana)
   - Kanji (if available)
   - Romaji
   - Example sentence (if available)

### Adding Vocabulary

1. In the lesson editor, click the "Add Word" button (top right)
2. Fill in the form:
   - **Burmese** (required): Myanmar translation
   - **Japanese** (required): Hiragana/Katakana
   - **Kanji** (optional): Kanji characters
   - **Romaji** (required): Romanization
   - **Image URL** (optional): URL to an image
   - **Example** (optional): Example sentence with translation (separate lines)
3. Click "Add"
4. Changes are saved immediately to Firestore

### Editing Vocabulary

1. Click the edit icon (pencil) on any vocabulary item
2. Modify the fields as needed
3. Click "Update"
4. Changes are saved immediately to Firestore

### Deleting Vocabulary

1. Click the delete icon (trash) on any vocabulary item
2. Confirm the deletion
3. The item is removed from Firestore immediately

## Data Structure

Each vocabulary item is stored as:

```json
{
  "burmese_word": [
    "japanese (hiragana/katakana)",
    "kanji",
    "romaji",
    "image_url",
    "example_sentence\ntranslation"
  ]
}
```

Example:
```json
{
  "ဂျပန်": [
    "にほん",
    "日本",
    "nihon",
    "",
    "日本は美しい国です。\nဂျပန်သည် လှပသောနိုင်ငံဖြစ်သည်။"
  ]
}
```

## Security Notes

⚠️ **Important Security Considerations**:

1. **Admin Emails are Hardcoded**: Currently admin emails are in the code. For production, consider:
   - Moving admin list to Firestore with security rules
   - Using Firebase Custom Claims for role-based access
   - Implementing a separate admin dashboard web app

2. **Firestore Security Rules**: Make sure to add security rules:

```javascript
// Firestore Security Rules
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Only allow admins to write to vocabulary_lessons
    match /vocabulary_lessons/{lesson} {
      allow read: if true;  // Everyone can read
      allow write: if request.auth != null 
                   && request.auth.token.email in [
                     'your-admin-email@gmail.com'
                   ];
    }
  }
}
```

## Troubleshooting

### "Access Denied" Error

**Cause**: Your current user email is not in the admin list  
**Solution**: Add your email to `adminEmails` in `admin_service.dart`

### Changes Not Appearing in App

**Cause**: App is using cached data  
**Solution**: 
1. Clear app cache in repository settings
2. Force refresh by calling `dataRepo.refreshAll()`
3. Restart the app

### Firestore Permission Denied

**Cause**: Firestore security rules don't allow writes  
**Solution**: Update your Firestore security rules (see Security Notes above)

## Future Enhancements

Potential improvements:

- [ ] Add search/filter for vocabulary items
- [ ] Bulk import/export vocabulary (CSV/JSON)
- [ ] Preview changes before saving
- [ ] Undo/redo functionality
- [ ] Analytics dashboard (most studied words, completion rates)
- [ ] Multi-language support for admin UI
- [ ] Image upload to Firebase Storage
- [ ] Audio pronunciation upload

## Support

For issues or questions:
1. Check Firestore console for data integrity
2. Check browser/app console for error messages
3. Verify Firebase Auth is working properly
