# Firestore Security Rules Setup

## The Problem

You're getting a permission error for **user profile data**, NOT vocabulary data. This is happening because:

1. **UserController** is trying to fetch user profile from Firestore `users` collection
2. Your Firestore security rules are blocking this access
3. This is SEPARATE from vocabulary lesson data (which should work fine)

## The Solution

### Step 1: Update Firestore Security Rules

I've created a `firestore.rules` file with the correct rules. Now you need to deploy it:

#### Option A: Via Firebase Console (Easiest)

1. Open [Firebase Console](https://console.firebase.google.com/)
2. Select your project
3. Go to **Firestore Database** → **Rules** tab
4. Copy and paste the rules from `/Users/yellhtetkyaw/Projects/hiragana/firestore.rules`
5. Click **Publish**

#### Option B: Via Firebase CLI

```bash
cd /Users/yellhtetkyaw/Projects/hiragana
firebase deploy --only firestore:rules
```

### Step 2: Verify the Rules

The new rules allow:

✅ **Everyone** can READ:
- `vocabulary_lessons` (needed for the app)
- `hiragana_table`, `katakana_table`
- `hiragana_map`, `katakana_map`

✅ **Authenticated users** can READ/WRITE:
- Their own `users/{userId}` document

✅ **Admin (mgyehtetkyaw@gmail.com)** can:
- READ/WRITE everything
- Manage all vocabulary lessons
- Access all user profiles

### Step 3: Test

After deploying the rules:

1. **Sign in** to the app with your account
2. The user data error should disappear
3. Vocab page will load properly
4. Admin panel will work (you're already signed in with admin email)

## Why This Happened

When you first open the app, `UserController` tries to load your user profile from Firestore to track:
- Learning progress
- Completed lessons
- User preferences

Without proper security rules, Firestore blocks this read operation, causing the error you saw.

## Quick Fix (Temporary)

If you want to test immediately without user profiles, you can comment out the user data fetch in `UserController`, but the proper fix is to deploy the security rules above.

Let me know once you've deployed the rules and I'll verify everything is working! 🚀
