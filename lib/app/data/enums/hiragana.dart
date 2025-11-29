final List<Map<String, dynamic>> hiraganaTable = [
  {
    'consonant': '',
    'hiragana': ['あ', 'い', 'う', 'え', 'お'],
    'romaji': ['a', 'i', 'u', 'e', 'o'],
  },
  {
    'consonant': 'k',
    'hiragana': ['か', 'き', 'く', 'け', 'こ'],
    'romaji': ['ka', 'ki', 'ku', 'ke', 'ko'],
  },
  {
    'consonant': 's',
    'hiragana': ['さ', 'し', 'す', 'せ', 'そ'],
    'romaji': ['sa', 'shi', 'su', 'se', 'so'],
  },
  {
    'consonant': 't',
    'hiragana': ['た', 'ち', 'つ', 'て', 'と'],
    'romaji': ['ta', 'chi', 'tsu', 'te', 'to'],
  },
  {
    'consonant': 'n',
    'hiragana': ['な', 'に', 'ぬ', 'ね', 'の'],
    'romaji': ['na', 'ni', 'nu', 'ne', 'no'],
  },
  {
    'consonant': 'h',
    'hiragana': ['は', 'ひ', 'ふ', 'へ', 'ほ'],
    'romaji': ['ha', 'hi', 'fu', 'he', 'ho'],
  },
  {
    'consonant': 'm',
    'hiragana': ['ま', 'み', 'む', 'め', 'も'],
    'romaji': ['ma', 'mi', 'mu', 'me', 'mo'],
  },
  {
    'consonant': 'y',
    'hiragana': ['や', '', 'ゆ', '', 'よ'],
    'romaji': ['ya', '', 'yu', '', 'yo'],
  },
  {
    'consonant': 'r',
    'hiragana': ['ら', 'り', 'る', 'れ', 'ろ'],
    'romaji': ['ra', 'ri', 'ru', 're', 'ro'],
  },
  {
    'consonant': 'w',
    'hiragana': ['わ', '', '', '', 'を'],
    'romaji': ['wa', '', '', '', 'wo'],
  },
  {
    'consonant': 'n',
    'hiragana': ['ん', '', '', '', ''],
    'romaji': ['n', '', '', '', ''],
  },
];

final Map<String, String> hiraganaMap = {
  // Basic vowels
  'あ': 'a',
  'い': 'i',
  'う': 'u',
  'え': 'e',
  'お': 'o',

  // K-row
  'か': 'ka',
  'き': 'ki',
  'く': 'ku',
  'け': 'ke',
  'こ': 'ko',

  // S-row
  'さ': 'sa',
  'し': 'shi',
  'す': 'su',
  'せ': 'se',
  'そ': 'so',

  // T-row
  'た': 'ta',
  'ち': 'chi',
  'つ': 'tsu',
  'て': 'te',
  'と': 'to',

  // N-row
  'な': 'na',
  'に': 'ni',
  'ぬ': 'nu',
  'ね': 'ne',
  'の': 'no',

  // H-row
  'は': 'ha',
  'ひ': 'hi',
  'ふ': 'fu',
  'へ': 'he',
  'ほ': 'ho',

  // M-row
  'ま': 'ma',
  'み': 'mi',
  'む': 'mu',
  'め': 'me',
  'も': 'mo',

  // Y-row
  'や': 'ya',
  'ゆ': 'yu',
  'よ': 'yo',

  // R-row
  'ら': 'ra',
  'り': 'ri',
  'る': 'ru',
  'れ': 're',
  'ろ': 'ro',

  // W-row
  'わ': 'wa',
  'を': 'wo',

  // N
  'ん': 'n',

  // Dakuten (voiced sounds)
  'が': 'ga',
  'ぎ': 'gi',
  'ぐ': 'gu',
  'げ': 'ge',
  'ご': 'go',

  'ざ': 'za',
  'じ': 'ji',
  'ず': 'zu',
  'ぜ': 'ze',
  'ぞ': 'zo',

  'だ': 'da',
  'ぢ': 'ji',
  'づ': 'zu',
  'で': 'de',
  'ど': 'do',

  'ば': 'ba',
  'び': 'bi',
  'ぶ': 'bu',
  'べ': 'be',
  'ぼ': 'bo',

  // Handakuten (p-sounds)
  'ぱ': 'pa',
  'ぴ': 'pi',
  'ぷ': 'pu',
  'ぺ': 'pe',
  'ぽ': 'po',

  // Combination sounds (yōon)
  'きゃ': 'kya',
  'きゅ': 'kyu',
  'きょ': 'kyo',
  'しゃ': 'sha',
  'しゅ': 'shu',
  'しょ': 'sho',
  'ちゃ': 'cha',
  'ちゅ': 'chu',
  'ちょ': 'cho',
  'にゃ': 'nya',
  'にゅ': 'nyu',
  'にょ': 'nyo',
  'ひゃ': 'hya',
  'ひゅ': 'hyu',
  'ひょ': 'hyo',
  'みゃ': 'mya',
  'みゅ': 'myu',
  'みょ': 'myo',
  'りゃ': 'rya',
  'りゅ': 'ryu',
  'りょ': 'ryo',

  // Dakuten yōon
  'ぎゃ': 'gya',
  'ぎゅ': 'gyu',
  'ぎょ': 'gyo',
  'じゃ': 'ja',
  'じゅ': 'ju',
  'じょ': 'jo',
  'びゃ': 'bya',
  'びゅ': 'byu',
  'びょ': 'byo',
  'ぴゃ': 'pya',
  'ぴゅ': 'pyu',
  'ぴょ': 'pyo',
};

final vocabLessons = [
  minnaLesson1,
  minnaLesson2,
  minnaLesson3,
  minnaLesson4,
  minnaLesson5,
  minnaLesson6,
  minnaLesson7,
  minnaLesson8,
  minnaLesson9,
  minnaLesson10,
  minnaLesson11,
  minnaLesson12,
  minnaLesson13,
  minnaLesson14,
  minnaLesson15,
  minnaLesson16,
  minnaLesson17,
  minnaLesson18,
  minnaLesson19,
  minnaLesson20,
  minnaLesson21,
  minnaLesson22,
  minnaLesson23,
  minnaLesson24,
  minnaLesson25,
];

final minnaLesson1 = {
  'ကျွန်တော်၊ ကျွန်မ': [
    'わたし',
    '私',
    'watashi',
    'https://cdn-icons-png.flaticon.com/512/4140/4140048.png'
  ],
  'ခင်ဗျာ၊ မင်း၊ နင်': [
    'あなた',
    'あなた',
    'anata',
    'https://cdn-icons-png.flaticon.com/512/4140/4140054.png'
  ],
  'ဟိုလူ (ရိုးရိုးအသုံး)': [
    'あのひと',
    'あの人',
    'ano hito',
    'https://cdn-icons-png.flaticon.com/512/4140/4140037.png'
  ],
  'ဟိုလူ (ယဉ်ကျေးသောအသုံး)': [
    'あのかた',
    'あの方',
    'ano kata',
    'https://cdn-icons-png.flaticon.com/512/4140/4140061.png'
  ],
  '(နာမည်နောက်က တင်သုံးသည့်ခေါ်နည်း)': [
    '～さん',
    '～さん',
    '～san',
    'https://cdn-icons-png.flaticon.com/512/166/166258.png'
  ],
  '(ကလေးများအတွက် ချစ်စွာခေါ်နည်း)': [
    '～ちゃん',
    '～ちゃん',
    '～chan',
    'https://cdn-icons-png.flaticon.com/512/2922/2922510.png'
  ],
  '--လူမျိုး (ဥပမာ アメリカじん = အမေရိကန်လူမျိုး)': [
    '～じん',
    '～人',
    '～jin',
    'https://cdn-icons-png.flaticon.com/512/921/921347.png'
  ],
  'အမေရိကန်လူမျိုး': [
    'アメリカじん',
    'アメリカ人',
    'Amerika-jin',
    'https://cdn-icons-png.flaticon.com/512/197/197484.png'
  ],
  'ဆရာ၊ ဆရာမ': [
    'せんせい',
    '先生',
    'sensei',
    'https://cdn-icons-png.flaticon.com/512/2784/2784465.png'
  ],
  'ဆရာ၊ ဆရာမ (အလုပ်အကိုင်)': [
    'きょうし',
    '教師',
    'kyōshi',
    'https://cdn-icons-png.flaticon.com/512/3235/3235043.png'
  ],
  'ကျောင်းသား၊ ကျောင်းသူ': [
    'がくせい',
    '学生',
    'gakusei',
    'https://cdn-icons-png.flaticon.com/512/3135/3135755.png'
  ],
  'ကုမ္ပဏီဝန်ထမ်း': [
    'かいしゃいん',
    '会社員',
    'kaishain',
    'https://cdn-icons-png.flaticon.com/512/3135/3135692.png'
  ],
  '(ကုမ္ပဏီအတွင်း ဝန်ထမ်း)': [
    'しゃいん',
    '社員',
    'shain',
    'https://cdn-icons-png.flaticon.com/512/681/681611.png'
  ],
  'ဘဏ်ဝန်ထမ်း': [
    'ぎんこういん',
    '銀行員',
    'ginkōin',
    'https://cdn-icons-png.flaticon.com/512/2830/2830060.png'
  ],
  'ဆရာဝန်': [
    'いしゃ',
    '医者',
    'isha',
    'https://cdn-icons-png.flaticon.com/512/3774/3774299.png'
  ],
  'သုတေသနပညာရှင်': [
    'けんきゅうしゃ',
    '研究者',
    'kenkyūsha',
    'https://cdn-icons-png.flaticon.com/512/3845/3845837.png'
  ],
  'တက္ကသိုလ်': [
    'だいがく',
    '大学',
    'daigaku',
    'https://cdn-icons-png.flaticon.com/512/8074/8074800.png'
  ],
  'ဆေးရုံ': [
    'びょういん',
    '病院',
    'byōin',
    'https://cdn-icons-png.flaticon.com/512/3004/3004458.png'
  ],
  'ဘယ်သူ (ရိုးရိုး)': [
    'だれ',
    'だれ',
    'dare',
    'https://cdn-icons-png.flaticon.com/512/4140/4140047.png'
  ],
  'ဘယ်သူ (ယဉ်ကျေး)': [
    'どなた',
    'どなた',
    'donata',
    'https://cdn-icons-png.flaticon.com/512/4140/4140044.png'
  ],
  'အသက် -- နှစ်': [
    '～さい',
    '～歳',
    '～sai',
    'https://cdn-icons-png.flaticon.com/512/992/992700.png'
  ],
  'အသက်ဘယ်နှစ်နှစ်လဲ': [
    'なんさい',
    '何歳',
    'nansai',
    'https://cdn-icons-png.flaticon.com/512/4712/4712108.png'
  ],
  'အသက်ဘယ်နှစ်နှစ်လဲ (ယဉ်ကျေး)': [
    'おいくつ',
    'おいくつ',
    'oikutsu',
    'https://cdn-icons-png.flaticon.com/512/4712/4712108.png'
  ],
  'ဟုတ်တယ်': [
    'はい',
    'はい',
    'hai',
    'https://cdn-icons-png.flaticon.com/512/709/709510.png'
  ],
  'မဟုတ်ဘူး': [
    'いいえ',
    'いいえ',
    'īe',
    'https://cdn-icons-png.flaticon.com/512/753/753345.png'
  ],
  'တွေ့ရတာ၀မ်းသာပါတယ်': [
    'はじめまして',
    '初めまして',
    'hajimemashite',
    'https://cdn-icons-png.flaticon.com/512/456/456212.png'
  ],
  '-- ကနေ လာပါတယ်': [
    '～からきました',
    '～から来ました',
    '～ kara kimashita',
    'https://cdn-icons-png.flaticon.com/512/197/197606.png'
  ],
  'ကျေးဇူးပြု၍ ရင်းရင်းနီးနီးဆက်ဆံပါလို့ တောင်းဆိုချင်ပါတယ်': [
    'どうぞ、よろしく おねがいします',
    'どうぞ、よろしく お願いします',
    'dōzo, yoroshiku onegaishimasu',
    'https://cdn-icons-png.flaticon.com/512/4712/4712109.png'
  ],
  'တောင်းပန်ပါတယ် (မေးခွန်းမေးချင်သောအခါ)': [
    'しつれいですが',
    '失礼ですが',
    'shitsurei desu ga',
    'https://cdn-icons-png.flaticon.com/512/6364/6364087.png'
  ],
  'နာမည်ဘယ်လိုခေါ်ပါသလဲ': [
    'おなまえは？',
    'お名前は？',
    'o namae wa?',
    'https://cdn-icons-png.flaticon.com/512/1077/1077063.png'
  ],
  'ဤသူမှာ ～ さん ဖြစ်ပါတယ်': [
    'こちらは～さんです',
    'こちらは～さんです',
    'kochira wa ～-san desu',
    'https://cdn-icons-png.flaticon.com/512/4140/4140039.png'
  ],
  'အမေရိကာ (နိုင်ငံ)': [
    'アメリカ',
    'アメリカ',
    'Amerika',
    'https://cdn-icons-png.flaticon.com/512/197/197484.png'
  ],
  'အင်္ဂလန် (နိုင်ငံ)': [
    'イギリス',
    'イギリス',
    'Igirisu',
    'https://cdn-icons-png.flaticon.com/512/197/197374.png'
  ],
  'အိန္ဒြိယ (နိုင်ငံ)': [
    'インド',
    'インド',
    'Indo',
    'https://cdn-icons-png.flaticon.com/512/197/197419.png'
  ],
  'အင်ဒိုနီးရှား (နိုင်ငံ)': [
    'インドネシア',
    'インドネシア',
    'Indoneshia',
    'https://cdn-icons-png.flaticon.com/512/197/197561.png'
  ],
  'တောင်ကိုရီးယား (နိုင်ငံ)': [
    'かんこく',
    '韓国',
    'Kankoku',
    'https://cdn-icons-png.flaticon.com/512/197/197582.png'
  ],
  'ထိုင်း (နိုင်ငံ)': [
    'タイ',
    'タイ',
    'Tai',
    'https://cdn-icons-png.flaticon.com/512/197/197452.png'
  ],
  'တရုတ် (နိုင်ငံ)': [
    'ちゅうごく',
    '中国',
    'Chūgoku',
    'https://cdn-icons-png.flaticon.com/512/197/197375.png'
  ],
  'ဂျာမနီ (နိုင်ငံ)': [
    'ドイツ',
    'ドイツ',
    'Doitsu',
    'https://cdn-icons-png.flaticon.com/512/197/197571.png'
  ],
  'ဂျပန် (နိုင်ငံ)': [
    'にほん',
    '日本',
    'Nihon',
    'https://cdn-icons-png.flaticon.com/512/197/197604.png'
  ],
  'ဘရာဇီး (နိုင်ငံ)': [
    'ブラジル',
    'ブラジル',
    'Burajiru',
    'https://cdn-icons-png.flaticon.com/512/197/197386.png'
  ],
};

final minnaLesson2 = {
  // I. ညွှန်းဆိုသောနာမ်စားများ (Demonstratives)
  'ဒါ (ဤဟာ)': ['これ', 'これ', 'kore', ''],
  'အဲ့ဒါ (နီးကပ်သူ)': ['それ', 'それ', 'sore', ''],
  'ဟိုဟာ (ဝေးသူ)': ['あれ', 'あれ', 'are', ''],
  'ဘယ်ဟာ': ['どれ', 'どれ', 'dore', ''],

  'ဤအရာ (နာမ်ရှေ့တွင်)': ['この', 'この', 'kono', ''],
  'အဲ့ဒီအရာ (နာမ်ရှေ့တွင်)': ['その', 'その', 'sono', ''],
  'ဟိုအရာ (နာမ်ရှေ့တွင်)': ['あの', 'あの', 'ano', ''],
  'ဘယ်အရာ (နာမ်ရှေ့တွင်)': ['どの', 'どの', 'dono', ''],

  // II. နာမ်များ (Nouns)
  'စာအုပ်': ['ほん', '本', 'hon', ''],
  'အဘိဓာန်': ['じしょ', '辞書', 'jisho', ''],
  'မဂ္ဂဇင်း': ['ざっし', '雑誌', 'zasshi', ''],
  'သတင်းစာ': ['しんぶん', '新聞', 'shinbun', ''],
  'နုတ်စာအုပ်': ['ノート', 'ノート', 'nōto', ''], // Note book
  'မှတ်စုစာအုပ်': ['てちょう', '手帳', 'techō', ''], // Pocket book, diary
  'လုပ်ငန်းကတ်/ နာမည်ကတ်': ['めいし', '名刺', 'meishi', ''],
  'ကတ်': ['カード', 'カード', 'kādo', ''],
  'ခဲတံ': ['えんぴつ', '鉛筆', 'enpitsu', ''],
  'ဘောပင်': ['ボールペン', 'ボールペン', 'bōrupen', ''],
  'စက်ခဲတံ (Sharp Pencil)': ['シャープペンシル', 'シャープペンシル', 'shāpu penshiru', ''],
  'သော့': ['かぎ', '鍵', 'kagi', ''],
  'နာရီ': ['とけい', '時計', 'tokei', ''],
  'ထီး': ['かさ', '傘', 'kasa', ''],
  'အိတ်': ['かばん', 'かばん', 'kaban', ''],
  'စီဒီ': ['CD', 'CD', 'shīdī', ''],
  'တယ်လီဗီးရှင်း': ['テレビ', 'テレビ', 'terebi', ''],
  'ရေဒီယို': ['ラジオ', 'ラジオ', 'rajio', ''],
  'ကင်မရာ': ['カメラ', 'カメラ', 'kamera', ''],
  'ကွန်ပျူတာ': ['コンピューター', 'コンピューター', 'konpyūtā', ''],
  'ကား': ['くるま', '車', 'kuruma', ''],
  'စားပွဲ': ['つくえ', '机', 'tsukue', ''],
  'ချောကလက်': ['チョコレート', 'チョコレート', 'chokorēto', ''],
  'လက်ဆောင် (အမှတ်တရ)': ['おみやげ', 'おみやげ', 'omiyage', ''],

  // III. အခြားစကားလုံးများနှင့် နှုတ်ဆက်စကားများ (Others & Greetings)
  'ဒါဟုတ်လား၊ ဒီလိုလား': ['そうですか', 'そうですか', 'sō desu ka', ''],
  'မဟုတ်ပါဘူး၊ မမှန်ပါဘူး': ['ちがいます', '違います', 'chigaimasu', ''],
  'ကျေးဇူးတင်ပါတယ် (အတိုချုပ်)': ['どうも', 'どうも', 'dōmo', ''],
  'ကျေးဇူးအထူးတင်ပါတယ်': [
    'どうもありがとうございます',
    'どうもありがとうございます',
    'dōmo arigatō gozaimasu',
    ''
  ],
  'အခုကစပြီး ကျေးဇူးပြုပြီး ကူညီပါ': [
    'これからおせわになります',
    'これからお世話になります',
    'korekara o-sewa ni narimasu',
    ''
  ],
  'ကျွန်တော် (ကျွန်မ) နဲ့လည်း ရင်းရင်းနီးနီးဆက်ဆံပါ': [
    'こちらこそよろしく',
    'こちらこそよろしく',
    'kochira koso yoroshiku',
    ''
  ],
  'ကျေးဇူးပြု၍ (တောင်းဆိုရာတွင်)': ['おねがいします', 'お願いします', 'onegaishimasu', ''],
  'ဂျပန် (နိုင်ငံ)': ['にほん', '日本', 'Nihon', ''],
  'အင်္ဂလိပ် (ဘာသာစကား)': ['えいご', '英語', 'eigo', ''],
  'ဂျပန် (ဘာသာစကား)': ['にほんご', '日本語', 'Nihongo', ''],
};

final minnaLesson3 = {
  "ဒီမှာ၊ ဒီနေရာ": [
    "ここ",
    "ここ",
    "koko",
    "https://cdn-icons-png.flaticon.com/512/3097/3097204.png"
  ],
  "အဲဒီမှာ၊ အဲဒီနေရာ": [
    "そこ",
    "そこ",
    "soko",
    "https://cdn-icons-png.flaticon.com/512/3097/3097204.png"
  ],
  "ဟိုမှာ၊ ဟိုနေရာ": [
    "あそこ",
    "あそこ",
    "asoko",
    "https://cdn-icons-png.flaticon.com/512/3097/3097204.png"
  ],
  "ဘယ်မှာလဲ": [
    "どこ",
    "どこ",
    "doko",
    "https://cdn-icons-png.flaticon.com/512/3097/3097202.png"
  ],
  "ဒီဘက်မှာ (ယဉ်ကျေး)": [
    "こちら",
    "こちら",
    "kochira",
    "https://cdn-icons-png.flaticon.com/512/4992/4992743.png"
  ],
  "ဟိုဘက်မှာ (ယဉ်ကျေး)": [
    "そちら",
    "そちら",
    "sochira",
    "https://cdn-icons-png.flaticon.com/512/4992/4992743.png"
  ],
  "ဟိုးဘက်မှာ (ယဉ်ကျေး)": [
    "あちら",
    "あちら",
    "achira",
    "https://cdn-icons-png.flaticon.com/512/4992/4992743.png"
  ],
  "ဘယ်ဘက်မှာလဲ (ယဉ်ကျေး)": [
    "どちら",
    "どちら",
    "dochira",
    "https://cdn-icons-png.flaticon.com/512/4992/4992745.png"
  ],
  "စာသင်ခန်း": [
    "きょうしつ",
    "教室",
    "kyōshitsu",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "ထမင်းစားခန်း/ ထမင်းဆိုင်": [
    "しょくどう",
    "食堂",
    "shokudō",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ရုံးခန်း": [
    "じむしょ",
    "事務所",
    "jimusho",
    "https://cdn-icons-png.flaticon.com/512/4762/4762637.png"
  ],
  "အစည်းအဝေးခန်း": [
    "かいぎしつ",
    "会議室",
    "kaigishitsu",
    "https://cdn-icons-png.flaticon.com/512/5110/5110191.png"
  ],
  "စုံစမ်းရန်ကောင်တာ": [
    "うけつけ",
    "受付",
    "uketsuke",
    "https://cdn-icons-png.flaticon.com/512/4603/4603612.png"
  ],
  "ဧည့်ခန်း၊ ဟိုတယ်ဧည့်ခန်း": [
    "ロビー",
    "ロビー",
    "robī",
    "https://cdn-icons-png.flaticon.com/512/2855/2855776.png"
  ],
  "အခန်း": [
    "へや",
    "部屋",
    "heya",
    "https://cdn-icons-png.flaticon.com/512/2528/2528407.png"
  ],
  "အိမ်သာ": [
    "トイレ",
    "トイレ",
    "toire",
    "https://cdn-icons-png.flaticon.com/512/2851/2851508.png"
  ],
  "လှေခါး": [
    "かいだん",
    "階段",
    "kaidan",
    "https://cdn-icons-png.flaticon.com/512/5193/5193910.png"
  ],
  "ဓါတ်လှေခါး": [
    "エレベーター",
    "エレベーター",
    "erebētā",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ],
  "စက်လှေခါး": [
    "エスカレーター",
    "エスカレーター",
    "esukarētā",
    "https://cdn-icons-png.flaticon.com/512/5323/5323419.png"
  ],
  "အလိုအလျောက်ဈေးရောင်းသည့်စက်": [
    "じどうはんばいき",
    "自動販売機",
    "jidōhanbaiki",
    "https://cdn-icons-png.flaticon.com/512/3757/3757731.png"
  ],
  "တယ်လီဖုန်း": [
    "でんわ",
    "電話",
    "denwa",
    "https://cdn-icons-png.flaticon.com/512/126/126509.png"
  ],
  "နိုင်ငံ": [
    "くに",
    "国",
    "kuni",
    "https://cdn-icons-png.flaticon.com/512/1261/1261689.png"
  ],
  "ကုမ္ပဏီ": [
    "かいしゃ",
    "会社",
    "kaisha",
    "https://www.entrepreneur.com/wp-content/uploads/sites/2/2016/06/20150805204041-google-company-building-corporate.jpeg"
  ],
  "အိမ်": [
    "うち",
    "うち",
    "uchi",
    "https://www.bhg.com/thmb/H9VV9JNnKl-H1faFXnPlQfNprYw=/1799x0/filters:no_upscale():strip_icc()/white-modern-house-curved-patio-archway-c0a4a3b3-aa51b24d14d0464ea15d36e05aa85ac9.jpg"
  ],
  "ဖိနပ်": [
    "くつ",
    "靴",
    "kutsu",
    "https://upload.wikimedia.org/wikipedia/commons/d/dc/74892143_f94145facb.jpg"
  ],
  "လည်စည်း (Necktie)": [
    "ネクタイ",
    "ネクタイ",
    "nekutai",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Krawaty.jpg/250px-Krawaty.jpg"
  ],
  "ဝိုင်": ["ワイン", "ワイン", "wain", "https://en.wikipedia.org/wiki/Red_wine"],
  "အရောင်းကောင်တာ": [
    "うりば",
    "売り場",
    "uriba",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Cash_Registers.JPG/1200px-Cash_Registers.JPG"
  ],
  "မြေအောက်": [
    "ちか",
    "地下",
    "chika",
    "https://upload.wikimedia.org/wikipedia/commons/2/27/Tenjin_Chikagai%28Tenjin_Underground_City%29_-_02.JPG"
  ],
  "~အထပ်": [
    "～かい",
    "～階",
    "～kai",
    "https://cdn-icons-png.flaticon.com/512/569/569947.png"
  ],
  "ဘယ်နှစ်ထပ်": [
    "なんがい",
    "何階",
    "nangai",
    "https://i.pinimg.com/736x/d1/4f/fa/d14ffa353b68eca67faaab4db73030f9.jpg"
  ],
  "ဂျပန်ပိုက်ဆံ (ယန်း)": [
    "えん",
    "円",
    "en",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Series_F_10000_yen_front.jpg/250px-Series_F_10000_yen_front.jpg"
  ],
  "ဘယ်လောက်လဲ": [
    "いくら",
    "いくら",
    "ikura",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "တစ်ရာ": [
    "ひゃく",
    "百",
    "hyaku",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "တစ်ထောင်": [
    "せん",
    "千",
    "sen",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "တစ်သောင်း": [
    "まん",
    "万",
    "man",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "တောင်းပန်ပါတယ်၊ တစ်ဆိတ်လောက်": [
    "すみません",
    "すみません",
    "sumimasen",
    "https://cdn-icons-png.flaticon.com/512/6364/6364087.png"
  ],
  "ကျေးဇူးပါ။": [
    "どうも",
    "どうも",
    "dōmo",
    "https://cdn-icons-png.flaticon.com/512/2528/2528577.png"
  ],
  "ကြိုဆိုပါတယ်": [
    "いらっしゃいませ",
    "いらっしゃいませ",
    "irasshaimase",
    "https://cdn-icons-png.flaticon.com/512/4028/4028308.png"
  ],
  "[~ကို] ပြပါ": [
    "～をみせてください",
    "～を見せてください",
    "～ o misete kudasai",
    "https://cdn-icons-png.flaticon.com/512/2776/2776008.png"
  ],
  "ဒါဆိုရင်/ ကဲ": [
    "じゃ",
    "じゃあ",
    "jaa",
    "https://cdn-icons-png.flaticon.com/512/412/412852.png"
  ],
  "[~ကို] ပေးပါ": [
    "～をください",
    "～をください",
    "～ o kudasai",
    "https://cdn-icons-png.flaticon.com/512/1255/1255850.png"
  ],
  "အီတလီ": [
    "イタリア",
    "イタリア",
    "Itaria",
    "https://cdn-icons-png.flaticon.com/512/197/197626.png"
  ],
  "ဆွစ်ဇာလန်": [
    "スイス",
    "スイス",
    "Suisu",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Flag_of_Switzerland_%28Pantone%29.svg/1920px-Flag_of_Switzerland_%28Pantone%29.svg.png"
  ],
  "ပြင်သစ်": [
    "フランス",
    "フランス",
    "Furansu",
    "https://cdn-icons-png.flaticon.com/512/197/197560.png"
  ],
  "ဂျကာတာ": [
    "ジャカルタ",
    "ジャカルタ",
    "Jakaruta",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ],
  "ဘန်ကောက်": [
    "バンコク",
    "バンコク",
    "Bankoku",
    "https://cdn-icons-png.flaticon.com/512/2157/2157079.png"
  ],
  "ဘာလင်": [
    "ベルリン",
    "ベルリン",
    "Berurin",
    "https://cdn-icons-png.flaticon.com/512/2157/2157080.png"
  ],
  "ရှင်းအိုဆာကာ": [
    "しんおおさか",
    "新大阪",
    "Shin-Ōsaka",
    "https://cdn-icons-png.flaticon.com/512/2157/2157081.png"
  ]
};

final minnaLesson4 = {
  "ထသည်။ နိုးသည်": [
    "おきます",
    "起きます",
    "okimasu",
    "https://cdn-icons-png.flaticon.com/512/3217/3217431.png"
  ],
  "အိပ်သည်။": [
    "ねます",
    "寝ます",
    "nemasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069172.png"
  ],
  "အလုပ်လုပ်သည်": [
    "はたらきます",
    "働きます",
    "hatarakimasu",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "အနားယူသည်။": [
    "やすみます",
    "休みます",
    "yasumimasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069185.png"
  ],
  "စာကျက်သည်။": [
    "べんきょうします",
    "勉強します",
    "benkyō shimasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "ပြီးဆုံးသည်။": [
    "おわります",
    "終わります",
    "owarimasu",
    "https://cdn-icons-png.flaticon.com/512/2920/2920745.png"
  ],
  "ကုန်တိုက်": [
    "デパート",
    "デパート",
    "depāto",
    "https://cdn-icons-png.flaticon.com/512/3257/3257917.png"
  ],
  "ဘဏ်": [
    "ぎんこう",
    "銀行",
    "ginkō",
    "https://cdn-icons-png.flaticon.com/512/3134/3134914.png"
  ],
  "စာတိုက်": [
    "ゆうびんきょく",
    "郵便局",
    "yūbinkyoku",
    "https://cdn-icons-png.flaticon.com/512/3421/3421008.png"
  ],
  "စာကြည့်တိုက်": [
    "としょかん",
    "図書館",
    "toshokan",
    "https://cdn-icons-png.flaticon.com/512/3069/3069248.png"
  ],
  "အနုပညာပြတိုက်": [
    "びじゅつかん",
    "美術館",
    "bijutsukan",
    "https://cdn-icons-png.flaticon.com/512/3134/3134812.png"
  ],
  "အခု": [
    "いま",
    "今",
    "ima",
    "https://cdn-icons-png.flaticon.com/512/3421/3421019.png"
  ],
  "--နာရီ": [
    "～じ",
    "～時",
    "～ji",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "မိနစ်": [
    "ふん/ぷん",
    "分",
    "fun/pun",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "တစ်ဝက်": [
    "はん",
    "半",
    "han",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "ဘယ်နှစ်နာရီ၊ ဘယ်အချိန်": [
    "なんじ",
    "何時",
    "nanji",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "ဘယ်နှစ်မိနစ်": [
    "なんぷん",
    "何分",
    "nanpun",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "မနက်ပိုင်း am": [
    "ごぜん",
    "午前",
    "gozen",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "နေ့ခင်းပိုင်း၊ ညနေပိုင်း pm": [
    "ごご",
    "午後",
    "gogo",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "မနက်": [
    "あさ",
    "朝",
    "asa",
    "https://cdn-icons-png.flaticon.com/512/3069/3069170.png"
  ],
  "နေ့လည်": [
    "ひる",
    "昼",
    "hiru",
    "https://cdn-icons-png.flaticon.com/512/3069/3069170.png"
  ],
  "ည": [
    "ばん/よる",
    "晩/夜",
    "ban/yoru",
    "https://cdn-icons-png.flaticon.com/512/3069/3069170.png"
  ],
  "တစ်နေ့က": [
    "おととい",
    "一昨日",
    "ototoi",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "မနေ့က": [
    "きのう",
    "昨日",
    "kinō",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "ဒီနေ့": [
    "きょう",
    "今日",
    "kyō",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "မနက်ဖန်": [
    "あした/あす",
    "明日",
    "ashita/asu",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "သဘက်ခါ": [
    "あさって",
    "明後日",
    "asatte",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "ဒီမနက်": [
    "けさ",
    "今朝",
    "kesa",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "ဒီည": [
    "こんばん",
    "今晩",
    "konban",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "နားရက်၊ အားလပ်ရက်": [
    "やすみ",
    "休み",
    "yasumi",
    "https://cdn-icons-png.flaticon.com/512/3069/3069185.png"
  ],
  "နေလည်နားချိန်": [
    "ひるやすみ",
    "昼休み",
    "hiruyasumi",
    "https://cdn-icons-png.flaticon.com/512/3069/3069185.png"
  ],
  "စာမေးပွဲ": [
    "しけん",
    "試験",
    "shiken",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "အစည်းအဝေး": [
    "かいぎ",
    "会議",
    "kaigi",
    "https://cdn-icons-png.flaticon.com/512/5110/5110191.png"
  ],
  "ရုပ်ရှင်": [
    "えいが",
    "映画",
    "eiga",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "မနက်တိုင်း": [
    "まいあさ",
    "毎朝",
    "maiasa",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "ညတိုင်း": [
    "まいばん",
    "毎晩",
    "maiban",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "နေတိုင်း": [
    "まいにち",
    "毎日",
    "mainichi",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "တနင်္လာနေ့": [
    "げつようび",
    "月曜日",
    "getsuyōbi",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "အင်္ဂါနေ့": [
    "かようび",
    "火曜日",
    "kayōbi",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "ဗုဒ္ဓဟူးနေ့": [
    "すいようび",
    "水曜日",
    "suiyōbi",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "ကြာသပတေးနေ့": [
    "もくようび",
    "木曜日",
    "mokuyōbi",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "သောကြာနေ့": [
    "きんようび",
    "金曜日",
    "kin'yōbi",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "စနေနေ့": [
    "どようび",
    "土曜日",
    "doyōbi",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "တနင်္ဂနွေနေ့": [
    "にちようび",
    "日曜日",
    "nichiyōbi",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "ဘာနေ့": [
    "なんようび",
    "何曜日",
    "nan'yōbi",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "--မှ စ၍": [
    "～から",
    "～から",
    "～ kara",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "--အထိ": [
    "～まで",
    "～まで",
    "～ made",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "--နှင့်": [
    "～と～",
    "～と～",
    "～ to ～",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "ဒုက္ခများမှာဘဲနော်": [
    "たいへんですね",
    "大変ですね",
    "taihen desu ne",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "နံပါတ်": [
    "ばんごう",
    "番号",
    "bangō",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "ဘာနံပါတ်": [
    "なんばん",
    "何番",
    "nanban",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "အဲဒီမှာ၊ အဲဒီဘက်မှာ (ယဉ်ကျေး)": [
    "そちら",
    "そちら",
    "sochira",
    "https://cdn-icons-png.flaticon.com/512/4992/4992743.png"
  ],
  "နယူးယောက်မြို့": [
    "ニューヨーク",
    "ニューヨーク",
    "Nyūyōku",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ],
  "ပီကင်းမြို့": [
    "ペキン",
    "北京",
    "Pekin",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ],
  "လော့စ်အိန်ဂျယ်လစ်မြို့": [
    "ロサンゼルス",
    "ロサンゼルス",
    "Rosanzerusu",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ],
  "လန်ဒန်မြို့": [
    "ロンドン",
    "ロンドン",
    "Rondon",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ],
  "Asuka စားသောက်ဆိုင်": [
    "あすか",
    "アスカ",
    "Asuka",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "Apple ဘဏ်": [
    "アップルぎんこう",
    "アップル銀行",
    "Appuru Ginkō",
    "https://cdn-icons-png.flaticon.com/512/3134/3134914.png"
  ],
  "Midori စာကြည့်တိုက်": [
    "みどりとしょかん",
    "みどり図書館",
    "Midori Toshokan",
    "https://cdn-icons-png.flaticon.com/512/3069/3069248.png"
  ],
  "Yamato အနုပညာပြတိုက်": [
    "やまとびじゅつかん",
    "やまと美術館",
    "Yamato Bijutsukan",
    "https://cdn-icons-png.flaticon.com/512/3134/3134812.png"
  ]
};

final minnaLesson5 = {
  "သွားသည်": [
    "いきます",
    "行きます",
    "ikimasu",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "လာသည်": [
    "きます",
    "来ます",
    "kimasu",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "ပြန်သည် (အိမ်ပြန်သည်)": [
    "かえります",
    "帰ります",
    "kaerimasu",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "စာသင်ကျောင်း": [
    "がっこう",
    "学校",
    "gakkō",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "super market": [
    "スーパー",
    "スーパー",
    "sūpā",
    "https://cdn-icons-png.flaticon.com/512/3257/3257917.png"
  ],
  "ဘူတာ": [
    "えき",
    "駅",
    "eki",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ],
  "လေယာဉ်ပျံ": [
    "ひこうき",
    "飛行機",
    "hikōki",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ],
  "သင်္ဘော": [
    "ふね",
    "船",
    "fune",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ],
  "လျှပ်စစ်ရထား": [
    "でんしゃ",
    "電車",
    "densha",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ],
  "မြေအောက်ရထား": [
    "ちかてつ",
    "地下鉄",
    "chikatetsu",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ],
  "ကျည်ဆံရထား": [
    "しんかんせん",
    "新幹線",
    "shinkansen",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ],
  "ဘတ်စ်ကား": [
    "バス",
    "バス",
    "basu",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ],
  "တက္ကစီ": [
    "タクシー",
    "タクシー",
    "takushī",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ],
  "စက်ဘီး": [
    "じてんしゃ",
    "自転車",
    "jitensha",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ],
  "လမ်းလျှောက်ပြီး": [
    "あるいて",
    "歩いて",
    "aruite",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "လူ": [
    "ひと",
    "人",
    "hito",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "သူငယ်ချင်း": [
    "ともだち",
    "友達",
    "tomodachi",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "သူချစ်သူ": [
    "かれ",
    "彼",
    "kare",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "သူမ/ချစ်သူ": [
    "かのじょ",
    "彼女",
    "kanojo",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "မိသားစု": [
    "かぞく",
    "家族",
    "kazoku",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "တစ်ယောက်တည်း": [
    "ひとりで",
    "一人で",
    "hitori de",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ပြီးခဲ့တဲ့ အပတ်": [
    "せんしゅう",
    "先週",
    "senshū",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "အခု အပတ်": [
    "こんしゅう",
    "今週",
    "konshū",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "လာမဲ့ အပတ်": [
    "らいしゅう",
    "来週",
    "raishū",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "ပြီးခဲ့တဲ့ လ": [
    "せんげつ",
    "先月",
    "sengetsu",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "ဒီလ": [
    "こんげつ",
    "今月",
    "kongetsu",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "လာမဲ့ လ(နောက်လ)": [
    "らいげつ",
    "来月",
    "raigetsu",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "မနှစ်က (ပြီးခဲ့တဲ့ နှစ်)": [
    "きょねん",
    "去年",
    "kyonen",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "ဒီနှစ်": [
    "ことし",
    "今年",
    "kotoshi",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "နောက်နှစ်၊ နောင်နှစ်": [
    "らいねん",
    "来年",
    "rainen",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "---နှစ်": [
    "～ねん",
    "～年",
    "～ nen",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "ဘာနှစ်လဲ": [
    "なんねん",
    "何年",
    "nan nen",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "---လ(ဇန်နဝါရီလ၊ ဖေဖော်ဝါရီလ)": [
    "～がつ",
    "～月",
    "～ gatsu",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "ဘယ်လ": [
    "なんがつ",
    "何月",
    "nan gatsu",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "၁ ရက်": [
    "ついたち",
    "１日",
    "tsuitachi",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "၂ ရက်": [
    "ふつか",
    "２日",
    "futsuka",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "၃ ရက်": [
    "みっか",
    "３日",
    "mikka",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "၄ ရက်": [
    "よっか",
    "４日",
    "yokka",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "၅ ရက်": [
    "いつか",
    "５日",
    "itsuka",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "၆ ရက်": [
    "むいか",
    "６日",
    "muika",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "၇ ရက်": [
    "なのか",
    "７日",
    "nanoka",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "၈ ရက်": [
    "ようか",
    "８日",
    "yōka",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "၉ ရက်": [
    "ここのか",
    "９日",
    "kokonoka",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "၁၀ ရက်": [
    "とおか",
    "１０日",
    "tōka",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "၁၄ ရက်": [
    "じゅうよっか",
    "１４日",
    "jūyokka",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "၂၀ ရက်": [
    "はつか",
    "２０日",
    "hatsuka",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "၂၄ ရက်": [
    "にじゅうよっか",
    "２４日",
    "nijūyokka",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "---ရက်": [
    "～にち",
    "～日",
    "～ nichi",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "ဘယ်ရက်": [
    "なんにち",
    "何日",
    "nan nichi",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "ဘယ်တုန်းက၊ ဘယ်တော့": [
    "いつ",
    "いつ",
    "itsu",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "မွေးနေ့": [
    "たんじょうび",
    "誕生日",
    "tanjōbi",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "ဟုတ်တယ်နော်": [
    "そうですね",
    "そうですね",
    "sō desu ne",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကျေးဇူးအများကြီးတင်ပါတယ်": [
    "[どうも]ありがとうございました",
    "どうもありがとうございました",
    "dōmo arigatō gozaimashita",
    "https://cdn-icons-png.flaticon.com/512/2528/2528577.png"
  ],
  "ရပါတယ်၊ ကြိုဆိုပါတယ်": [
    "どういたしまして",
    "どういたしまして",
    "dō itashimashite",
    "https://cdn-icons-png.flaticon.com/512/2528/2528577.png"
  ],
  "ရထားစီးသော platform": [
    "～ばんせん",
    "～番線",
    "～ bansen",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ],
  "နောက်ဟာ": [
    "つぎの",
    "次の",
    "tsugi no",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "သာမာန်/ရိုးရိုးရထား": [
    "ふつう",
    "普通",
    "futsū",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ],
  "အမြန်ရထား": [
    "きゅうこう",
    "急行",
    "kyūkō",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ],
  "အထူးရထား": [
    "とっきゅう",
    "特急",
    "tokkyū",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ],
  "Koushien": [
    "こうしえん",
    "甲子園",
    "Kōshien",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ],
  "အိုဆာကာရဲတိုက်": [
    "おおさかじょう",
    "大阪城",
    "Ōsakajō",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ]
};

final minnaLesson6 = {
  "စားသည်။": [
    "たべます",
    "食べます",
    "tabemasu",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "သောက်သည်။": [
    "のみます",
    "飲みます",
    "nomimasu",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ဆေးလိပ်သောက်သည်": [
    "すいます",
    "吸います",
    "suimasu",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ကြည့်သည်": [
    "みます",
    "見ます",
    "mimasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "နားထောင်သည်။": [
    "ききます",
    "聞きます",
    "kikimasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "ဖတ်သည်။": [
    "よみます",
    "読みます",
    "yomimasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069248.png"
  ],
  "ရေးသည်။": [
    "かきます",
    "書きます",
    "kakimasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069248.png"
  ],
  "ဝယ်သည်။": [
    "かいます",
    "買います",
    "kaimasu",
    "https://cdn-icons-png.flaticon.com/512/3257/3257917.png"
  ],
  "ရိုက်သည်": [
    "とります",
    "撮ります",
    "torimasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "(ဓါတ်ပုံကို)": [
    "[しゃしんを]とります",
    "[写真を]撮ります",
    "[shashin o] torimasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "လုပ်သည်": [
    "します",
    "します",
    "shimasu",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "တွေ့သည်": [
    "あいます",
    "会います",
    "aimasu",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "(သူငယ်ချင်းနဲ့)": [
    "[ともだちに]あいます",
    "[友達に]会います",
    "[tomodachi ni] aimasu",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ထမင်း": [
    "ごはん",
    "ご飯",
    "gohan",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "မနက်စာ၊ မနက်ထမင်း": [
    "あさごはん",
    "朝ご飯",
    "asagohan",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "နေ့လည်စာ၊ နေ့လည်ထမင်း": [
    "ひるごはん",
    "昼ご飯",
    "hirugohan",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ညစာ၊ ညထမင်း": [
    "ばんごはん",
    "晩ご飯",
    "bangohan",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ပေါင်မုန့်": [
    "パン",
    "パン",
    "pan",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ကြက်ဥ": [
    "たまご",
    "卵",
    "tamago",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "အသား": [
    "にく",
    "肉",
    "niku",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ငါး": [
    "さかな",
    "魚",
    "sakana",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ဟင်းသီးဟင်းရွတ်": [
    "やさい",
    "野菜",
    "yasai",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "သစ်သီးဝလံ": [
    "くだもの",
    "果物",
    "kudamono",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ရေ": [
    "みず",
    "水",
    "mizu",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ဂျပန်ရေနွေးကြမ်း": [
    "おちゃ",
    "お茶",
    "ocha",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "လက်ဖက်ရည်": [
    "こうちゃ",
    "紅茶",
    "kōcha",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "နွားနို့": [
    "ぎゅうにゅう",
    "牛乳",
    "gyūnyū",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "နွားနို့၊ နိုရည်": [
    "ミルク",
    "ミルク",
    "miruku",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ဖျော်ရည်": [
    "ジュース",
    "ジュース",
    "jūsu",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ဘီယာ": [
    "ビール",
    "ビール",
    "bīru",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "အရက်": [
    "おさけ",
    "お酒",
    "osake",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ဆေးလိပ်": [
    "たばこ",
    "たばこ",
    "tabako",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "letter": [
    "てがみ",
    "手紙",
    "tegami",
    "https://cdn-icons-png.flaticon.com/512/3421/3421008.png"
  ],
  "report အစီရင်ခံစာ": [
    "レポート",
    "レポート",
    "repōto",
    "https://cdn-icons-png.flaticon.com/512/3069/3069248.png"
  ],
  "ဓါတ်ပုံ": [
    "しゃしん",
    "写真",
    "shashin",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "ဗီဒီယို": [
    "ビデオ",
    "ビデオ",
    "bideo",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "ဆိုင်": [
    "みせ",
    "店",
    "mise",
    "https://cdn-icons-png.flaticon.com/512/3257/3257917.png"
  ],
  "ခြံဝင်း": [
    "にわ",
    "庭",
    "niwa",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "အိမ်စာ": [
    "しゅくだい",
    "宿題",
    "shukudai",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "တင်းနစ်အားကစား": [
    "テニス",
    "テニス",
    "tenisu",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "ဘောလုံးအားကစား": [
    "サッカー",
    "サッカー",
    "sakkā",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "ပန်းကြည့်ခြင်း": [
    "おはなみ",
    "お花見",
    "ohanami",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "ဘာ": [
    "なに",
    "何",
    "nani",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "အတူတူ": [
    "いっしょに",
    "一緒に",
    "issho ni",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ခဏ၊ နည်းနည်း": [
    "ちょっと",
    "ちょっと",
    "chotto",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အမြဲတမ်း": [
    "いつも",
    "いつも",
    "itsumo",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "တခါတလေ": [
    "ときどき",
    "時々",
    "tokidoki",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အဲဒီနောက်": [
    "それから",
    "それから",
    "sorekara",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အင်း": [
    "ええ",
    "ええ",
    "ee",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကောင်းတယ်နော်": [
    "いいですね",
    "いいですね",
    "ii desu ne",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "နားလည်ပါပြီ": [
    "わかりました",
    "わかりました",
    "wakarimashita",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဘာလဲ": [
    "なんでか",
    "何ですか",
    "nan desu ka",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "မက္ကဆီကို": [
    "メキシコ",
    "メキシコ",
    "Mekishiko",
    "https://cdn-icons-png.flaticon.com/512/197/197592.png"
  ],
  "အိုဆာကာကုန်တိုက်": [
    "おおさかデパート",
    "大阪デパート",
    "Ōsaka Depāto",
    "https://cdn-icons-png.flaticon.com/512/3257/3257917.png"
  ],
  "Tsuruya စားသောက်ဆိုင်": [
    "つるや",
    "つるや",
    "Tsuruya",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "Furansu စူပါမားကတ်": [
    "フランスや",
    "フランス屋",
    "Furansu-ya",
    "https://cdn-icons-png.flaticon.com/512/3257/3257917.png"
  ],
  "Mainichi စူပါမားကတ်": [
    "まいにちや",
    "毎日屋",
    "Mainichi-ya",
    "https://cdn-icons-png.flaticon.com/512/3257/3257917.png"
  ]
};

final minnaLesson7 = {
  "ဖြတ်သည်။ ကိုက်ဖြတ်သည်": [
    "きります",
    "切ります",
    "kirimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ပို့သည်။(ပစ္စည်း၊ စာ)": [
    "おくります",
    "送ります",
    "okurimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421008.png"
  ],
  "ပေးသည်။": [
    "あげます",
    "あげます",
    "agemasu",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ယူသည်။ လက်ခံရရှိသည်": [
    "もらいます",
    "もらいます",
    "moraimasu",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ငှါးသည်။ (သူများကိုငှါး)": [
    "かします",
    "貸します",
    "kashimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "ချေးငှါးသည်။(သူများဆီမှချေး)": [
    "かります",
    "借ります",
    "karimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "သင်ကြားသည်": [
    "おしえます",
    "教えます",
    "oshiemasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "သင်ယူသည်။": [
    "ならいます",
    "習います",
    "naraimasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "ဖုန်းဆက်သည်": [
    "かけます[でんわを～]",
    "かけます[電話を～]",
    "kakemasu [denwa o ~]",
    "https://cdn-icons-png.flaticon.com/512/126/126509.png"
  ],
  "လက်": [
    "て",
    "手",
    "te",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "တူ(ထမင်းစားတဲ့တူ)": [
    "はし",
    "はし",
    "hashi",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ဇွန်း": [
    "スプーン",
    "スプーン",
    "supūn",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ဓါး": [
    "ナイフ",
    "ナイフ",
    "naifu",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ခက်ရင်း": [
    "フォーク",
    "フォーク",
    "fōku",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ကတ်ကြေး": [
    "はさみ",
    "はさみ",
    "hasami",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကွန်ပျူတာ": [
    "パソコン",
    "パソコン",
    "pasokon",
    "https://cdn-icons-png.flaticon.com/512/4762/4762637.png"
  ],
  "လက်ကိုင်ဖုန်း": [
    "ケータイ",
    "ケータイ",
    "kētai",
    "https://cdn-icons-png.flaticon.com/512/126/126509.png"
  ],
  "အီးမေးလ်": [
    "メール",
    "メール",
    "mēru",
    "https://cdn-icons-png.flaticon.com/512/126/126509.png"
  ],
  "new year card": [
    "ねんがじょう",
    "年賀状",
    "nengajō",
    "https://cdn-icons-png.flaticon.com/512/3421/3421008.png"
  ],
  "punch": [
    "パンチ",
    "パンチ",
    "panchi",
    "https://cdn-icons-png.flaticon.com/512/4762/4762637.png"
  ],
  "stapler": [
    "ホッチキス",
    "ホッチキス",
    "hotchikisu",
    "https://cdn-icons-png.flaticon.com/512/4762/4762637.png"
  ],
  "တိပ်": [
    "セロテープ",
    "セロテープ",
    "serotēpu",
    "https://cdn-icons-png.flaticon.com/512/4762/4762637.png"
  ],
  "ခဲဖျတ်": [
    "けしゴム",
    "消しゴム",
    "keshigomu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "စာရွက်": [
    "かみ",
    "紙",
    "kami",
    "https://cdn-icons-png.flaticon.com/512/3069/3069248.png"
  ],
  "ပန်း": [
    "はな",
    "花",
    "hana",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "ရှပ်အင်္ကျီ": [
    "シャツ",
    "シャツ",
    "shatsu",
    "https://cdn-icons-png.flaticon.com/512/2851/2851508.png"
  ],
  "လက်ဆောင်": [
    "プレゼント",
    "プレゼント",
    "purezento",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "အထုပ်၊ ပါဆယ်အထုပ်": [
    "にもつ",
    "荷物",
    "nimotsu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421008.png"
  ],
  "ပိုက်ဆံ": [
    "おかね",
    "お金",
    "okane",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "လက်မှတ်": [
    "きっぷ",
    "切符",
    "kippu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "ခရစ်စမတ်": [
    "クリスマス",
    "クリスマス",
    "Kurisumasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "အဖေ(မိမိ၏ဖခင်ကိုခေါ်သောအခေါ်အဝေါ်)": [
    "ちち",
    "父",
    "chichi",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "အမေ(မိမိ၏မိခင်ကိုခေါ်သောအခေါ်အဝေါ်)": [
    "はは",
    "母",
    "haha",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "အဖေ(သူတစ်ပါး၏အဖေကိုခေါ်သောအခေါ်အဝေါ်)": [
    "おとうさん",
    "お父さん",
    "otōsan",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "အမေ(သူတစ်ပါး၏အမေကိုခေါ်သောအခေါ်အဝေါ်)": [
    "おかあさん",
    "お母さん",
    "okāsan",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "မ---သေးဘူး": [
    "もう～",
    "もう～",
    "mō ~",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အခုကစပြီး---": [
    "まだ",
    "まだ",
    "mada",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "လှသော၊ စွဲမက်ဖွယ်ကောင်းသော": [
    "これから",
    "これから",
    "korekara",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကြိုဆိုပါတယ်": [
    "いらっしゃい",
    "いらっしゃい",
    "irasshai",
    "https://cdn-icons-png.flaticon.com/512/4028/4028308.png"
  ],
  "ကျေးဇူးပြုပြီး အိမ်ပေါ်တက်ပါ။": [
    "どうぞ、おあがりください",
    "どうぞ、おあがりください",
    "dōzo, oagari kudasai",
    "https://cdn-icons-png.flaticon.com/512/4028/4028308.png"
  ],
  "ခွင့်ပြုပါ (သူတစ်ပါး၏ အခန်းသို့ဝင်ရန် ခွင့်တောင်းခြင်း)": [
    "しつれいします",
    "失礼します",
    "shitsurei shimasu",
    "https://cdn-icons-png.flaticon.com/512/4028/4028308.png"
  ],
  "စားပါမယ် (အစားအသောက်ကို မစားခင်တွင်ပြောသောစကား)": [
    "いただきます",
    "いただきます",
    "itadakimasu",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "(အစားအသောက်ကို စားပြီးသည့်အခါပြောသောစကား)": [
    "ごちそうさま [でした]",
    "ごちそうさま [でした]",
    "gochisōsama [deshita]",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "စပိန်": [
    "スペイン",
    "スペイン",
    "Supein",
    "https://cdn-icons-png.flaticon.com/512/197/197605.png"
  ]
};

final minnaLesson8 = {
  "ခန့်ချောသော(ကျား)": [
    "ハンサム [な]",
    "ハンサム [な]",
    "hansamu [na]",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "လှသော၊ ချောမောသော(မ)": [
    "きれい [な]",
    "きれい [な]",
    "kirei [na]",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "တိတ်ဆိတ်သော": [
    "しずか [な]",
    "静か [な]",
    "shizuka [na]",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "စည်ကားသော": [
    "にぎやか [な]",
    "賑やか [な]",
    "nigiyaka [na]",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "နာမည်ကြီးသော": [
    "ゆうめい [な]",
    "有名 [な]",
    "yūmei [na]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဖေါ်ွေသော။ ကြင်နာတတ်သော": [
    "しんせつ [な]",
    "親切 [な]",
    "shinsetsu [na]",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ကျန်းမာသော၊ သန်မာသော": [
    "げんき [な]",
    "元気 [な]",
    "genki [na]",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "အားသော၊ အားလပ်သော": [
    "ひま [な]",
    "暇 [な]",
    "hima [na]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အဆင်ပြေသော": [
    "べんり [な]",
    "便利 [な]",
    "benri [na]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "လှသော၊ စွဲမက်ဖွယ်ကောင်းသော": [
    "すてき [な]",
    "素敵 [な]",
    "suteki [na]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကြီးသော": [
    "おおきい",
    "大きい",
    "ōkii",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "သေးသော": [
    "ちいさい",
    "小さい",
    "chiisai",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "သစ်သော၊ အသစ်ဖြစ်သော": [
    "あたらしい",
    "新しい",
    "atarashii",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဟောင်းသော": [
    "ふるい",
    "古い",
    "furui",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကောင်းသော": [
    "いい/よい",
    "いい/良い",
    "ii/yoi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဆိုးသော": [
    "わるい",
    "悪い",
    "warui",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ပူအိုက်သော": [
    "あつい",
    "暑い/熱い",
    "atsui",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ချမ်းသော(ရာသီဥတု)": [
    "さむい",
    "寒い",
    "samui",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အေးမြသော": [
    "つめたい",
    "冷たい",
    "tsumetai",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ခက်သော": [
    "むずかしい",
    "難しい",
    "muzukashii",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "လွယ်သော": [
    "やさしい",
    "易しい",
    "yasashii",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "မြင့်သော၊ ဈေးကြီးသော": [
    "たかい",
    "高い",
    "takai",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "သက်သာသော၊ ဈေးပေါသော": [
    "やすい",
    "安い",
    "yasui",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "နိမ့်သော": [
    "ひくい",
    "低い",
    "hikui",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "စိတ်ဝင်စားစရာကောင်းသော": [
    "おもしろい",
    "おもしろい",
    "omoshiroi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အရသာရှိသော": [
    "おいしい",
    "おいしい",
    "oishii",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "အလုပ်များသော": [
    "いそがしい",
    "忙しい",
    "isogashii",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "ပျော်ရွှင်သော": [
    "たのしい",
    "楽しい",
    "tanoshii",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "ဖြူသော": [
    "しろい",
    "白い",
    "shiroi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "မဲသော": [
    "くろい",
    "黒い",
    "kuroi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "နီသော": [
    "あかい",
    "赤い",
    "akai",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ပြာသော": [
    "あおい",
    "青い",
    "aoi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဆာကူရာပန်း၊ ချယ်ရီပန်း": [
    "さくら",
    "桜",
    "sakura",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "တောတောင်": [
    "やま",
    "山",
    "yama",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "မြို့": [
    "まち",
    "町",
    "machi",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "စားစရာ": [
    "たべもの",
    "食べ物",
    "tabemono",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "နေရာ": [
    "ところ",
    "所",
    "tokoro",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "အဆောင်": [
    "りょう",
    "寮",
    "ryō",
    "https://cdn-icons-png.flaticon.com/512/2528/2528407.png"
  ],
  "စားသောက်ဆိုင်": [
    "レストラン",
    "レストラン",
    "resutoran",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "နေထိုင်မှု": [
    "せいかつ",
    "生活",
    "seikatsu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အလုပ်အကိုင်": [
    "おしごと",
    "お仕事",
    "oshigoto",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "ဘယ်လိုလဲ": [
    "どう",
    "どう",
    "dō",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "ဘယ်လိုမျိုး": [
    "どんな～",
    "どんな～",
    "donna ~",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "အလွန်": [
    "とても",
    "とても",
    "totemo",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "သိပ်--": [
    "あまり",
    "あまり",
    "amari",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အဲဒီနောက်၊ ပြီးနောက်": [
    "そして",
    "そして",
    "soshite",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "-ပေမဲ့လဲ-": [
    "～が、～",
    "～が、～",
    "～ ga, ～",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "နေကောင်းလား(နှုတ်ဆက်သည့်အခါတွင်လည်းသုံးပါသည်)": [
    "おげんきですか",
    "お元気ですか",
    "ogenki desu ka",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ဟုတ်တယ်နော်": [
    "そうですね",
    "そうですね",
    "sō desu ne",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "နောက်တစ်ခွက်": [
    "もういっぱい",
    "もう一杯",
    "mō ippai",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ဘယ်လိုလဲဟင်": [
    "いかがですか",
    "いかがですか",
    "ikaga desu ka",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "ရှန်ဟိုင်း": [
    "シャンハイ",
    "シャンハイ",
    "Shanhai",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ],
  "Kinkakuji ကျောင်းတော်": [
    "きんかくじ",
    "金閣寺",
    "Kinkakuji",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ],
  "Nara ပန်းခြံ": [
    "ならこうえん",
    "奈良公園",
    "Nara Kōen",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "ဖူဂျီတောင်": [
    "ふじさん",
    "富士山",
    "Fuji-san",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "စာမူရိုင်း ၇ယောက်ရှေးရုပ်ရှင်": [
    "しちにんのさむらい",
    "「七人の侍」",
    "Shichinin no Samurai",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ]
};

final minnaLesson9 = {
  "နားလည်သည်။": [
    "わかります",
    "わかります",
    "wakarimasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "ရှိသည်။(သက်မဲ့)": [
    "あります",
    "あります",
    "arimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကြိုက်သော": [
    "すき [な]",
    "好き [な]",
    "suki [na]",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "မုန်းသော": [
    "きらい [な]",
    "嫌い [な]",
    "kirai [na]",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "တော်သော": [
    "じょうず [な]",
    "上手 [な]",
    "jōzu [na]",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "ညံ့သော": [
    "へた [な]",
    "下手 [な]",
    "heta [na]",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "သောက်စရာ": [
    "のみもの",
    "飲み物",
    "nomimono",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ဟင်း၊ အစားအစာ": [
    "りょうり",
    "料理",
    "ryōri",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "အားကစား": [
    "スポーツ",
    "スポーツ",
    "supōtsu",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "base ball": [
    "やきゅう",
    "野球",
    "yakyuu",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "အက": [
    "ダンス",
    "ダンス",
    "dansu",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "ဂီတ": [
    "おんがく",
    "音楽",
    "ongaku",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "သီချင်း": [
    "うた",
    "歌",
    "uta",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "ရှေးဟောင်းသီချင်း": [
    "クラシック",
    "クラシック",
    "kurashikku",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "jass သီချင်း": [
    "ジャズ",
    "ジャズ",
    "jazu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "ဂီတဖျော်ဖြေပွဲ": [
    "コンサート",
    "コンサート",
    "konsāto",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "ကာရာအိုကေ": [
    "カラオケ",
    "カラオケ",
    "karaoke",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "ဂျပန်ရိုးရာဇာတ်ပွဲ": [
    "かぶき",
    "歌舞伎",
    "kabuki",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "ပန်းချီ": [
    "え",
    "絵",
    "e",
    "https://cdn-icons-png.flaticon.com/512/3134/3134812.png"
  ],
  "စာလုံး": [
    "じ",
    "字",
    "ji",
    "https://cdn-icons-png.flaticon.com/512/3069/3069248.png"
  ],
  "ဂျပန်စာလုံး": [
    "かんじ",
    "漢字",
    "kanji",
    "https://cdn-icons-png.flaticon.com/512/3069/3069248.png"
  ],
  "ဟိရဂနစာလုံး": [
    "ひらがな",
    "ひらがな",
    "hiragana",
    "https://cdn-icons-png.flaticon.com/512/3069/3069248.png"
  ],
  "ခတခနစာလုံး": [
    "かたかな",
    "カタカナ",
    "katakana",
    "https://cdn-icons-png.flaticon.com/512/3069/3069248.png"
  ],
  "ရိုးမာဂျိစာလုံး": [
    "ローマじ",
    "ローマ字",
    "rōmaji",
    "https://cdn-icons-png.flaticon.com/512/3069/3069248.png"
  ],
  "ပိုက်ဆံအကြွေ": [
    "こまかいおかね",
    "細かいお金",
    "komakai okane",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "လက်မှတ်": [
    "チケット",
    "チケット",
    "chiketto",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "အချိန်": [
    "じかん",
    "時間",
    "jikan",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "ကိစ္စ": [
    "ようじ",
    "用事",
    "yōji",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကတိ၊ ချိန်းဆိုထားခြင်း": [
    "やくそく",
    "約束",
    "yakusoku",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အချိန်ပိုင်းအလုပ်": [
    "アルバイト",
    "アルバイト",
    "arubaito",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "ခင်ပွန်း(သူတပါး၏ ယောက်ျား)": [
    "ごしゅじん",
    "ご主人",
    "goshujin",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "မိမိ၏ယောက်ျား": [
    "おっと/しゅじん",
    "夫/主人",
    "otto/shujin",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ဇနီး (သူတပါး၏ ဇနီး)": [
    "おくさん",
    "奥さん",
    "okusan",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "မိမိ၏ဇနီး၊ မိန်းမ": [
    "つま/かない",
    "妻/家内",
    "tsuma/kanai",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ကလေး": [
    "こども",
    "子ども",
    "kodomo",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ကောင်းကောင်း၊ ခဏခဏ": [
    "よく",
    "よく",
    "yoku",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အကြမ်းအားဖြင့်": [
    "だいたい",
    "だいたい",
    "daitai",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အများကြီး၊ များများ": [
    "たくさん",
    "たくさん",
    "takusan",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "နည်းနည်း": [
    "すこし",
    "少し",
    "sukoshi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "လုံးဝ": [
    "ぜんぜん",
    "全然",
    "zenzen",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "စောစော၊ မြန်မြန်": [
    "はやく",
    "早く",
    "hayaku",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "---ဖြစ်လို့": [
    "～から",
    "～から",
    "～ kara",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "ဘာဖြစ်လို့": [
    "どうして",
    "どうして",
    "dōshite",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "ရပါတယ်": [
    "いいですよ",
    "いいですよ",
    "ii desu yo",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "စိတ်မကောင်းပါဘူး": [
    "ざんねん [ですが]",
    "残念です [が]",
    "zannen desu [ga]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အော်--": [
    "ああ、",
    "ああ、",
    "ā,",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အတူတူ ဘယ်လိုလဲဟင်": [
    "いっしょにいかがですか",
    "一緒 [に] いかがですか",
    "issho ni ikaga desu ka",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "နည်းနည်း၊ ခဏ၊ သိပ်ပြီးတော့-- (အကြောင်းအရာတစ်ခုကို ငြင်းသည့်အခါသုံးသည်)": [
    "[～は]ちょっと･･･",
    "[～は]ちょっと･･･",
    "[~ wa] chotto...",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "မရဘူးလား": [
    "だめですか",
    "だめですか",
    "dame desu ka",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "နောက်တခါ---တောင်းဆိုပါတယ်": [
    "またこんどおねがいします",
    "また今度お願いします",
    "mata kondo onegai shimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ခရီးသွားခြင်း": [
    "りょこう",
    "旅行",
    "ryokō",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ]
};

final minnaLesson10 = {
  "ရှိသည်။(သက်မဲ့)": [
    "あります",
    "あります",
    "arimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ရှိသည်။ နေသည်။(သက်ရှိ)": [
    "います",
    "います",
    "imasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အမျိုးမျိုး": [
    "いろいろ [な]",
    "いろいろ [な]",
    "iroiro [na]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အမျိုးသား၊ ယောက်ျားလေး": [
    "おとこのひと",
    "男の人",
    "otoko no hito",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "အမျိုးသမီး၊ မိန်းကလေး": [
    "おんなのひと",
    "女の人",
    "onna no hito",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ကောင်လေး": [
    "おとこのこ",
    "男の子",
    "otoko no ko",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ကောင်မလေး": [
    "おんなのこ",
    "女の子",
    "onna no ko",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ခွေး": [
    "いぬ",
    "犬",
    "inu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "ကြောင်": [
    "ねこ",
    "猫",
    "neko",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "ပန်ဒါ": [
    "パンダ",
    "パンダ",
    "panda",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "ဆင်": [
    "ぞう",
    "象",
    "zō",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "သစ်ပင်": [
    "き",
    "木",
    "ki",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "အရာဝတ္ထု": [
    "もの",
    "物",
    "mono",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဓါတ်ခဲ": [
    "でんち",
    "電池",
    "denchi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဗူး": [
    "はこ",
    "箱",
    "hako",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "မီးခလုတ်": [
    "スイッチ",
    "スイッチ",
    "suicchi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ရေခဲသေတ္တာ": [
    "れいぞうこ",
    "冷蔵庫",
    "reizōko",
    "https://cdn-icons-png.flaticon.com/512/2528/2528407.png"
  ],
  "စားပွဲခုံ": [
    "テーブル",
    "テーブル",
    "tēburu",
    "https://cdn-icons-png.flaticon.com/512/2528/2528407.png"
  ],
  "အိပ်ရာ၊ ကုတင်": [
    "ベッド",
    "ベッド",
    "beddo",
    "https://cdn-icons-png.flaticon.com/512/2528/2528407.png"
  ],
  "စင်(စာအုပ်စင်၊ ပန်းကန်စင်)": [
    "たな",
    "棚",
    "tana",
    "https://cdn-icons-png.flaticon.com/512/2528/2528407.png"
  ],
  "တံခါး": [
    "ドア",
    "ドア",
    "doa",
    "https://cdn-icons-png.flaticon.com/512/2528/2528407.png"
  ],
  "ပြတင်းပေါက်": [
    "まど",
    "窓",
    "mado",
    "https://cdn-icons-png.flaticon.com/512/2528/2528407.png"
  ],
  "စာတိုက်ပုံး": [
    "ポスト",
    "ポスト",
    "posuto",
    "https://cdn-icons-png.flaticon.com/512/3421/3421008.png"
  ],
  "အဆောက်အဦး": [
    "ビル",
    "ビル",
    "biru",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "အလိုအလျောက်ငွေထုတ်စက်": [
    "ATM",
    "ATM",
    "Ē Tī Emu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "convenience store": [
    "コンビニ",
    "コンビニ",
    "konbini",
    "https://cdn-icons-png.flaticon.com/512/3257/3257917.png"
  ],
  "ပန်းခြံ": [
    "こうえん",
    "公園",
    "kōen",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "လက်ဖက်ရည်/ကော်ဖီဆိုင်": [
    "きっさてん",
    "喫茶店",
    "kissaten",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "စာအုပ်ဆိုင်": [
    "ほんや",
    "本屋",
    "hon'ya",
    "https://cdn-icons-png.flaticon.com/512/3257/3257917.png"
  ],
  "---ဆိုင်": [
    "～や",
    "～屋",
    "～ ya",
    "https://cdn-icons-png.flaticon.com/512/3257/3257917.png"
  ],
  "---ယာဉ်စီးတဲ့နေရာ": [
    "～のりば",
    "～乗り場",
    "～ noriba",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ],
  "ခရိုင် (prefecture)": [
    "けん",
    "県",
    "ken",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ],
  "အပေါ်": [
    "うえ",
    "上",
    "ue",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အောက်": [
    "した",
    "下",
    "shita",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ရှေ့၊ အရှေ့": [
    "まえ",
    "前",
    "mae",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "နောက်၊ အနောက်": [
    "うしろ",
    "後ろ",
    "ushiro",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ညာဘက်": [
    "みぎ",
    "右",
    "migi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဘယ်ဘက်": [
    "ひだり",
    "左",
    "hidari",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အထဲ(မှာ)": [
    "なか",
    "中",
    "naka",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အပြင်(မှာ)": [
    "そと",
    "外",
    "soto",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အနား(မှာ)": [
    "そば",
    "そば",
    "soba",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အနီးနား(မှာ)": [
    "ちかく",
    "近く",
    "chikaku",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "နှစ်ခုကြား (မှာ)": [
    "あいだ",
    "間",
    "aida",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "---နဲ့---တွေ": [
    "～や～など",
    "～や～など",
    "～ ya ～ nado",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "(ယှက်ဖြစ်ရင်ခွင့်လွှတ်ပါ)": [
    "どうもすみません",
    "[どうも]すみません",
    "[dōmo] sumimasen",
    "https://cdn-icons-png.flaticon.com/512/6364/6364087.png"
  ],
  "ငံပြာရည်": [
    "ナンプラー",
    "ナンプラー",
    "nanpurā",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ကော်နာ": [
    "コーナー",
    "コーナー",
    "kōnā",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အောက်ဆုံး": [
    "いちばんした",
    "一番下",
    "ichiban shita",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "တိုကျို ဒစ်စနေလန်း": [
    "とうきょうディズニーランド",
    "東京ディズニーランド",
    "Tōkyō Dizunīrando",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ],
  "အာဂျီအာ စတိုးဆိုင်": [
    "アジアストア",
    "アジアストア",
    "Ajia Sutoa",
    "https://cdn-icons-png.flaticon.com/512/3257/3257917.png"
  ]
};

final minnaLesson11 = {
  "ရှိသည်။ (ကလေးရှိသည်)": [
    "います [こどもが]",
    "います [子どもが]",
    "imasu [kodomo ga]",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "နေသည်။ (ဂျပန်တွင်)": [
    "います [にほんに]",
    "います [日本に]",
    "imasu [Nihon ni]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကြာသည်။(အချိန်ကြာတယ်)": [
    "かかります",
    "かかります",
    "kakarimasu",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "အနားယူသည် (ကုမ္ပဏီကို)": [
    "やすみます [かいしゃを]",
    "休みます [会社を]",
    "yasumimasu [kaisha o]",
    "https://cdn-icons-png.flaticon.com/512/3069/3069185.png"
  ],
  "တစ်ခု": [
    "ひとつ",
    "１つ",
    "hitotsu",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "နှစ်ခု": [
    "ふたつ",
    "２つ",
    "futatsu",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "သုံးခု": [
    "みっつ",
    "３つ",
    "mittsu",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "လေးခု": [
    "よっつ",
    "４つ",
    "yottsu",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "ငါးခု": [
    "いつつ",
    "５つ",
    "itsutsu",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "ခြောက်ခု": [
    "むっつ",
    "６つ",
    "muttsu",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "ခုနှစ်ခု": [
    "ななつ",
    "７つ",
    "nanatsu",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "ရှစ်ခု": [
    "やっつ",
    "８つ",
    "yattsu",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "ကိုးခု": [
    "ここのつ",
    "９つ",
    "kokonotsu",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "ဆယ်ခု": [
    "とお",
    "１０",
    "tō",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "ဘယ်နှစ်ခု": [
    "いくつ",
    "いくつ",
    "ikutsu",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "တစ်ယောက်": [
    "ひとり",
    "１人",
    "hitori",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "နှစ်ယောက်": [
    "ふたり",
    "２人",
    "futari",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "---ယောက်": [
    "～にん",
    "～人",
    "～ nin",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "---စီး၊--လုံး (ကား၊ တီဗီ၊ ရေခဲ သေတ္တာ၊ ပန်ကာ စသည်များ)": [
    "～だい",
    "～台",
    "～ dai",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "---ရွက် (တံ ဆိပ်ခေါင်း၊ စာရွက်၊ စာအိတ်၊ ဓါတ်ပုံ၊ အင်္ကျီ စသည်များ)": [
    "～まい",
    "～枚",
    "～ mai",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "---ခေါက်(အကြိမ်အရေ)": [
    "～かい",
    "～回",
    "～ kai",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "ပန်းသီး": [
    "りんご",
    "りんご",
    "ringo",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "လိမ္မော်သီး": [
    "みかん",
    "みかん",
    "mikan",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "Sandwich": [
    "サンドイッチ",
    "サンドイッチ",
    "sandoicchi",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ဂျပန်မဆလာဟင်း": [
    "カレー [ライス]",
    "カレー [ライス]",
    "karē [raisu]",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ရေခဲမုန့်": [
    "アイスクリーム",
    "アイスクリーム",
    "aisukurīmu",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "တံဆိပ်ခေါင်း": [
    "きって",
    "切手",
    "kitte",
    "https://cdn-icons-png.flaticon.com/512/3421/3421008.png"
  ],
  "post card": [
    "はがき",
    "はがき",
    "hagaki",
    "https://cdn-icons-png.flaticon.com/512/3421/3421008.png"
  ],
  "စာအိတ်": [
    "ふうとう",
    "封筒",
    "fūtō",
    "https://cdn-icons-png.flaticon.com/512/3421/3421008.png"
  ],
  "မိဘနှစ်ပါး": [
    "りょうしん",
    "両親",
    "ryōshin",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "မောင်နှစ်မ": [
    "きょうだい",
    "兄弟",
    "kyōdai",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "အကို(မိမိ၏အကို)": [
    "あに",
    "兄",
    "ani",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "အကို(သူတစ်ပါး၏အကို)": [
    "おにいさん",
    "お兄さん",
    "oniisan",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "အမ (မိမိ၏အမ)": [
    "あね",
    "姉",
    "ane",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "အမ(သူတစ်ပါး၏အမ)": [
    "おねえさん",
    "お姉さん",
    "oneesan",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "မောင်၊ ညီ(မိမိ၏မောင်၊ ညီ)": [
    "おとうと",
    "弟",
    "otōto",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "သူတစ်ပါး၏မောင်၊ ညီ": [
    "おとうとさん",
    "弟さん",
    "otōtosan",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ညီမ(မိမိ၏ညီမ)": [
    "いもうと",
    "妹",
    "imōto",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "သူတစ်ပါး၏ညီမ": [
    "いもうとさん",
    "妹さん",
    "imōtosan",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "နိုင်ငံခြား": [
    "がいこく",
    "外国",
    "gaikoku",
    "https://cdn-icons-png.flaticon.com/512/1261/1261689.png"
  ],
  "နိုင်ငံခြားပညာတော်သင်ကျောင်းသား": [
    "りゅうがくせい",
    "留学生",
    "ryūgakusei",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "--- (အချိန်ကြာသည်)": [
    "～じかん",
    "～時間",
    "～ jikan",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "---ပတ်(ရက်သတ္တပတ်)": [
    "～しゅうかん",
    "～週間",
    "～ shūkan",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "---လကြာ": [
    "～かげつ",
    "～ヶ月",
    "～ kagetsu",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "---နှစ်": [
    "～ねん",
    "～年",
    "～ nen",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "လောက်(၁ နာရီလောက်)": [
    "ぐらい",
    "ぐらい",
    "gurai",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဘယ်လောက်": [
    "どのぐらい",
    "どのぐらい",
    "dono gurai",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "အားလုံး(အရာဝတ္ထု)": [
    "ぜんぶで",
    "全部で",
    "zenbu de",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အားလုံး(လူ၊ သက်ရှိ)": [
    "みんな",
    "みんな",
    "minna",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "---တည်းဘဲ": [
    "～だけ",
    "～だけ",
    "～ dake",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "နားလည်ပါပြီ": [
    "かしこまりました",
    "かしこまりました",
    "kashikomarimashita",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကောင်းသောရာသီဥတုပါဘဲနော်": [
    "いいおてんきですね",
    "いいお天気ですね",
    "ii otenki desu ne",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အပြင်ထွက်တော့မလို့လား": [
    "おでかけですか",
    "おでかけですか",
    "odekake desu ka",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ခဏ---အထိ": [
    "ちょっと～まで",
    "ちょっと～まで",
    "chotto ~ made",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "သွားပါနော်(နှုတ်ဆက်)": [
    "いってらっしゃい",
    "いってらっしゃい",
    "itterasshai",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "သွားပြီနော်(နှုတ်ဆက်)": [
    "いってきます",
    "行ってきます",
    "ittekimasu",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ရေကြောင်းဖြင့်ပေးပို့": [
    "ふなびん",
    "船便",
    "funabin",
    "https://cdn-icons-png.flaticon.com/512/3421/3421008.png"
  ],
  "လေကြောင်းဖြင့်ပေးပို့": [
    "こうくうびん",
    "航空便",
    "kōkūbin",
    "https://cdn-icons-png.flaticon.com/512/3421/3421008.png"
  ],
  "ကျေးဇူးပြု၍": [
    "おねがいします",
    "お願いします",
    "onegai shimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "Australia": [
    "オーストラリア",
    "オーストラリア",
    "Ōsutoraria",
    "https://cdn-icons-png.flaticon.com/512/197/197576.png"
  ]
};

final minnaLesson12 = {
  "လွယ်သော": [
    "かんたん [な]",
    "簡単 [な]",
    "kantan [na]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "နီးသော": [
    "ちかい",
    "近い",
    "chikai",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဝေးသော": [
    "とおい",
    "遠い",
    "tōi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "မြန်သော(အရှိန်မြန်သော)": [
    "はやい",
    "速い",
    "hayai",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "နှေးသော": [
    "おそい",
    "遅い",
    "osoi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "များသော(လူ)": [
    "おおい [ひとが～]",
    "多い [人が～]",
    "ōi [hito ga ~]",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "နည်းသော(လူ)": [
    "すくない [ひとが～]",
    "少ない [人が～]",
    "sukunai [hito ga ~]",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "နွေးသော": [
    "あたたかい",
    "暖かい",
    "atatakai",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အေးမြသော": [
    "すずしい",
    "涼しい",
    "suzushii",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ချိုသော": [
    "あまい",
    "甘い",
    "amai",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "စပ်သော": [
    "からい",
    "辛い",
    "karai",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "လေးသော": [
    "おもい",
    "重い",
    "omoi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ပေါ့သော": [
    "かるい",
    "軽い",
    "karui",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ရာသီဥတု": [
    "きせつ",
    "季節",
    "kisetsu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "နွေဦးပေါက်": [
    "はる",
    "春",
    "haru",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "နွေရာသီ": [
    "なつ",
    "夏",
    "natsu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဆောင်းဦးပေါက်": [
    "あき",
    "秋",
    "aki",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဆောင်းရာသီ": [
    "ふゆ",
    "冬",
    "fuyu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "မိုးလေဝသ၊ ရာသီဥတု": [
    "てんき",
    "天気",
    "tenki",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "မိုး": [
    "あめ",
    "雨",
    "ame",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "နှင်း": [
    "ゆき",
    "雪",
    "yuki",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "တိမ်ထူသော": [
    "くもり",
    "曇り",
    "kumori",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဟိုတယ်": [
    "ホテル",
    "ホテル",
    "hoteru",
    "https://cdn-icons-png.flaticon.com/512/2528/2528407.png"
  ],
  "လေဆိပ်": [
    "くうこう",
    "空港",
    "kūkō",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ],
  "ပင်လယ်": [
    "うみ",
    "海",
    "umi",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "ကမ္ဘာလောက": [
    "せかい",
    "世界",
    "sekai",
    "https://cdn-icons-png.flaticon.com/512/1261/1261689.png"
  ],
  "ပါတီပွဲ": [
    "パーティー",
    "パーティー",
    "pātī",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "ပွဲတော်": [
    "おまつり",
    "お祭り",
    "omatsuri",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "ဂျပန် အမဲသား hot pot": [
    "すきやき",
    "すき焼き",
    "sukiyaki",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ရှိမိ": [
    "さしみ",
    "刺身",
    "sashimi",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ဆူရှီ": [
    "[お]すし",
    "[お]すし",
    "[o]sushi",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ဂျပန် အကြော်": [
    "てんぷら",
    "天ぷら",
    "tempura",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ဝက်သား": [
    "ぶたにく",
    "豚肉",
    "butaniku",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ကြက်သား": [
    "とりにく",
    "鶏肉",
    "toriniku",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "အမဲသား": [
    "ぎゅうにく",
    "牛肉",
    "gyūniku",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "သံပုရိုသီး": [
    "レモン",
    "レモン",
    "remon",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ဂျပန်ပန်းအလှထိုးခြင်း": [
    "いけばな",
    "生け花",
    "ikebana",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "သစ်ရွက်များအရောင်ပြောင်းခြင်း": [
    "もみじ",
    "紅葉",
    "momiji",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "ဘယ်ဟာ": [
    "どちら",
    "どちら",
    "dochira",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "နှစ်ခုစလုံး(ဘယ်ဟာမဆို)": [
    "どちらも",
    "どちらも",
    "dochira mo",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "~ဆုံး (အကောင်းဆုံး၊ အများဆုံး)": [
    "いちばん",
    "一番",
    "ichiban",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "တောက်လျှောက်၊ အမြဲတမ်း၊ အရမ်း": [
    "ずっと",
    "ずっと",
    "zutto",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ပထမဆုံး": [
    "はじめて",
    "初めて",
    "hajimete",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ပြန်ရောက်ပါပြီ(နှုတ်ဆက်)": [
    "ただいま",
    "ただいま",
    "tadaima",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ပြန်လာပါ(နှုတ်ဆက်)": [
    "おかえりなさい",
    "お帰りなさい",
    "okaerinasai",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "လူတွေအများကြီးဘဲ": [
    "わあ、すごいひとですね",
    "わあ、すごい人ですね",
    "wā, sugoi hito desu ne",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ပင်ပန်းခဲ့တယ်": [
    "つかれました",
    "疲れました",
    "tsukaremashita",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "Gion ပွဲတော်": [
    "ぎおんまつり",
    "祇園祭",
    "Gion Matsuri",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "ဟောင်ကောင်": [
    "ホンコン",
    "ホンコン",
    "Honkon",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ],
  "စင်ကာပူ": [
    "シンガポール",
    "シンガポール",
    "Shingapōru",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ],
  "ABC စတိုးဆိုင်": [
    "ABC ストア",
    "ABC ストア",
    "Ē Bī Shī Sutoa",
    "https://cdn-icons-png.flaticon.com/512/3257/3257917.png"
  ],
  "Japan စူပါမားကတ်": [
    "ジャパン",
    "ジャパン",
    "Japan",
    "https://cdn-icons-png.flaticon.com/512/3257/3257917.png"
  ]
};

final minnaLesson13 = {
  "ကစားသည်။": [
    "あそびます",
    "遊びます",
    "asobimasu",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "ရေကူးသည်။": [
    "およぎます",
    "泳ぎます",
    "oyogimasu",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "ကြိုသည်။ ကြိုဆိုသည်": [
    "むかえます",
    "迎えます",
    "mukaemasu",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ပင်ပန်းသည်။ မောပန်းသည်": [
    "つかれます",
    "疲れます",
    "tsukaremasu",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "အိမ်ထောင်ပြုသည်။": [
    "けっこんします",
    "結婚します",
    "kekkon shimasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "ဈေးဝယ်သည်။": [
    "かいものします",
    "買い物します",
    "kaimono shimasu",
    "https://cdn-icons-png.flaticon.com/512/3257/3257917.png"
  ],
  "ထမင်းစားသည်": [
    "しょくじします",
    "食事します",
    "shokuji shimasu",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "လမ်းလျှောက်သည် (ပန်းခြံမှာ)": [
    "さんぽします [こうえんを]",
    "散歩します [公園を]",
    "sanpo shimasu [kōen o]",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "ပင်ပန်းသော၊ ခက်ခဲသော": [
    "たいへん [な]",
    "大変 [な]",
    "taihen [na]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "လိုချင်သော": [
    "ほしい",
    "欲しい",
    "hoshii",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "ကျယ်သော": [
    "ひろい",
    "広い",
    "hiroi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကျဉ်းသော": [
    "せまい",
    "狭い",
    "semai",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ရေကူးကန်": [
    "プール",
    "プール",
    "pūru",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "မြစ်ချောင်း": [
    "かわ",
    "川",
    "kawa",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "အနုပညာ": [
    "びじゅつ",
    "美術",
    "bijutsu",
    "https://cdn-icons-png.flaticon.com/512/3134/3134812.png"
  ],
  "ငါးမျှားခြင်း": [
    "つり",
    "釣り",
    "tsuri",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "နှင်းလျှောစီးခြင်း": [
    "スキー",
    "スキー",
    "sukī",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "စနေနှင့်တနင်္ဂနွေ(week end)": [
    "しゅうまつ",
    "週末",
    "shūmatsu",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "---လောက်": [
    "～ごろ",
    "～ごろ",
    "～ goro",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "တစ်ခုခု": [
    "なにか",
    "何か",
    "nanika",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "တစ်နေရာရာ": [
    "どこか",
    "どこか",
    "dokoka",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "အာခေါင်ခြောက်တယ်": [
    "のどがかわきます",
    "のどがかわきます",
    "nodo ga kawakimasu",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ဗိုက်ဆာတယ်": [
    "おなかがすきます",
    "おなかがすきます",
    "onaka ga sukimasu",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "အဲဒီလိုလုပ်ရအောင်": [
    "そうしましょう",
    "そうしましょう",
    "sō shimashō",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဘာစားမှာလဲ(စားသောက်ဆိုင်တွင်)": [
    "ごちゅうもんは",
    "ご注文は？",
    "gochūmon wa?",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "သတ်မှတ်ထားသောအစား (Set menu)": [
    "ていしょく",
    "定食",
    "teishoku",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "အမဲသားဟင်းနှင့်ထမင်း": [
    "ぎゅうどん",
    "牛どん",
    "gyūdon",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ခဏလေးစောင့်ပါ": [
    "[しょうしょう]おまちください",
    "[少々]お待ちください",
    "[shōshō] omachi kudasai",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "သီးခြားစီ (ငွေရှင်းသည့်အချိန်တွင်အသုံးများ)": [
    "べつべつに",
    "別々に",
    "betsubetsu ni",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "Ohayo TV အစီအစဉ်": [
    "おはようテレビ",
    "おはようテレビ",
    "Ohayō Terebi",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ]
};

final minnaLesson14 = {
  "မီးဖွင့်၊ အဲယားကွန်း၊ TV ဖွင့်သည်။": [
    "つけます",
    "つけます",
    "tsukemasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "မီးပိတ်၊ အဲယားကွန်း၊ TV ပိတ်သည်။": [
    "けします",
    "消します",
    "keshīmasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "တံခါးဖွင့်သည်။": [
    "あけます",
    "開けます",
    "akemasu",
    "https://cdn-icons-png.flaticon.com/512/2528/2528407.png"
  ],
  "တံခါးပိတ်သည်": [
    "しめます",
    "閉めます",
    "shimemasu",
    "https://cdn-icons-png.flaticon.com/512/2528/2528407.png"
  ],
  "အလျင်လိုသည်။": [
    "いそぎます",
    "急ぎます",
    "isogimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "စောင့်သည်။": [
    "まちます",
    "待ちます",
    "machimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကိုင်သည်။ ယူထားသည်": [
    "もちます",
    "持ちます",
    "mochimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ယူသည်။ လှမ်းယူသည်": [
    "とります",
    "取ります",
    "torimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကူညီသည်။": [
    "てつだいます",
    "手伝います",
    "tetsudaimasu",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ခေါ်သည်။ အော်ခေါ်သည်။": [
    "よびます",
    "呼びます",
    "yobimasu",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ပြောသည်": [
    "はなします",
    "話します",
    "hanashimasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "အသုံးပြုသည်။": [
    "つかいます",
    "使います",
    "tsukaimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ရပ်သည်": [
    "とめます",
    "止めます",
    "tomemasu",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "ပြသည်": [
    "みせます",
    "見せます",
    "misemasu",
    "https://cdn-icons-png.flaticon.com/512/2776/2776008.png"
  ],
  "သင်ကြားသည် (လိပ်စာကို)": [
    "おしえます [じゅうしょを]",
    "教えます [住所を]",
    "oshiemasu [jūsho o]",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "ထိုင်သည်": [
    "すわります",
    "座ります",
    "suwarimasu",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "မတ်တပ်ရပ်သည်": [
    "たちます",
    "立ちます",
    "tachimasu",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ဝင်သည် (လက်ဖက်ရည်ဆိုင်သို့)": [
    "はいります [きっさてんに]",
    "入ります [喫茶店に]",
    "hairimasu [kissaten ni]",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "ထွက်သည် (လက်ဖက်ရည်ဆိုင်မှ)": [
    "でます [きっさてんを]",
    "出ます [喫茶店を]",
    "demasu [kissaten o]",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "မိုးရွာသည်": [
    "ふります [あめが]",
    "降ります [雨が]",
    "furimasu [ame ga]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "မိတ္တူကူးသည်": [
    "コピーします",
    "コピーします",
    "kopī shimasu",
    "https://cdn-icons-png.flaticon.com/512/4762/4762637.png"
  ],
  "လျှပ်စစ်": [
    "でんき",
    "電気",
    "denki",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အဲယားကွန်း": [
    "エアコン",
    "エアコン",
    "eakon",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ပတ်စ်ပို့": [
    "パスポート",
    "パスポート",
    "pasupōto",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "နာမည်": [
    "なまえ",
    "名前",
    "namae",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "လိပ်စာ": [
    "じゅうしょ",
    "住所",
    "jūsho",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "မြေပုံ": [
    "ちず",
    "地図",
    "chizu",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "ဆား": [
    "しお",
    "塩",
    "shio",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "သကြား": [
    "さとう",
    "砂糖",
    "satō",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "မေးခွန်း": [
    "もんだい",
    "問題",
    "mondai",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "အဖြေ": [
    "こたえ",
    "答え",
    "kotae",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "ဖတ်နည်း": [
    "よみかた",
    "読み方",
    "yomikata",
    "https://cdn-icons-png.flaticon.com/512/3069/3069248.png"
  ],
  "---နည်း": [
    "～かた",
    "～方",
    "～ kata",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "တည့်တည့်": [
    "まっすぐ",
    "まっすぐ",
    "massugu",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "ဖြေးဖြေး": [
    "ゆっくり",
    "ゆっくり",
    "yukkuri",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ချက်ချင်း": [
    "すぐ",
    "すぐ",
    "sugu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "နောက်မှ": [
    "また",
    "また",
    "mata",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ပြီးမှ": [
    "あとで",
    "後で",
    "atode",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အနည်းငယ်ထပ်ပြီး": [
    "もうすこし",
    "もう少し",
    "mō sukoshi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "---ထပ်ပြီး": [
    "もう～",
    "もう～",
    "mō ~",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "မီးပွိုင့်ကို ညာဘက်ကွေ့ပါ": [
    "しんごうをみぎへまがってください",
    "信号を右へ曲がってください",
    "shingō o migi e magatte kudasai",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "ဒါနဲယူပါ။ (ပိုက်ဆံပေးသာအခါ)": [
    "こちらでよろしいでしょうか",
    "こちらでよろしいでしょうか",
    "kochira de yoroshī deshō ka",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ပိုက်ဆံအကြွေ၊ ပြန်အမ်းငွေ": [
    "おつり",
    "お釣り",
    "otsuri",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "Midori": [
    "みどりちょう",
    "みどり町",
    "Midori-chō",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ]
};

final minnaLesson15 = {
  "ထားသည်။": [
    "おきます",
    "置きます",
    "okimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ပြုလုပ်သည်။ ထုတ်လုပ်သည်": [
    "つくります",
    "作ります",
    "tsukurimasu",
    "https://cdn-icons-png.flaticon.com/512/4762/4762637.png"
  ],
  "ရောင်းသည်။": [
    "うります",
    "売ります",
    "urimasu",
    "https://cdn-icons-png.flaticon.com/512/3257/3257917.png"
  ],
  "သိသည်။": [
    "しります",
    "知ります",
    "shirimasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "နေသည်။ နေထိုင်သည်": [
    "すみます",
    "住みます",
    "sumimasu",
    "https://cdn-icons-png.flaticon.com/512/2528/2528407.png"
  ],
  "သုသေတနပြုသည်": [
    "けんきゅうします",
    "研究します",
    "kenkyū shimasu",
    "https://cdn-icons-png.flaticon.com/512/4762/4762637.png"
  ],
  "စာရွက်စာတမ်း": [
    "しりょう",
    "資料",
    "shiryō",
    "https://cdn-icons-png.flaticon.com/512/3069/3069248.png"
  ],
  "ကတ်တလောက်": [
    "カタログ",
    "カタログ",
    "katarogu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069248.png"
  ],
  "အချိန်ဇယား": [
    "じこくひょう",
    "時刻表",
    "jikokuhyō",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "အင်္ကျီ": [
    "ふく",
    "服",
    "fuku",
    "https://cdn-icons-png.flaticon.com/512/2851/2851508.png"
  ],
  "ပစ္စည်း": [
    "せいひん",
    "製品",
    "seihin",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "softwear": [
    "ソフト",
    "ソフト",
    "sofuto",
    "https://cdn-icons-png.flaticon.com/512/4762/4762637.png"
  ],
  "လျှပ်စစ်အဘိဓာန်": [
    "でんしじしょ",
    "電子辞書",
    "denshi jisho",
    "https://cdn-icons-png.flaticon.com/512/4762/4762637.png"
  ],
  "စီးပွားရေး": [
    "けいざい",
    "経済",
    "keizai",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "မြို့တော်ခန်းမ/စည်ပင်သာယာရုံး": [
    "しやくしょ",
    "市役所",
    "shiyakusho",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "အထက်တန်းကျောင်း": [
    "こうこう",
    "高校",
    "kōkō",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "သွားဆရာဝန်": [
    "はいしゃ",
    "歯医者",
    "haisha",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "လူပျို၊ လူလွတ်၊ အပျို": [
    "どくしん",
    "独身",
    "dokushin",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "အားလုံး": [
    "みなさん",
    "皆さん",
    "minasan",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "သတိရသည်/အမှတ်ရသည်": [
    "おもいだします",
    "思い出します",
    "omoidashimasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "ရှိသည်(ယဉ်ကျေးသောအသုံး)": [
    "いらっしゃいます",
    "いらっしゃいます",
    "irasshaimasu",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ဂျပန်တံတား (အိုဆာကာ လူစည်ကားသောနေရာ)": [
    "にほんばし",
    "日本橋",
    "Nihonbashi",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "Minna no Interview": [
    "みんなのインタビュー",
    "みんなのインタビュー",
    "Minna no Intabyū",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ]
};

final minnaLesson16 = {
  "ရထားစီးသည်။": [
    "のります [でんしゃに]",
    "乗ります [電車に]",
    "norimasu [densha ni]",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "ရထားမှ ဆင်းသည်။": [
    "おります [でんしゃを]",
    "降ります [電車を]",
    "orimasu [densha o]",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "ပြောင်းစီးသည်။ (ကား၊ ရထား ယာဉ်)": [
    "のりかえます",
    "乗り換えます",
    "norikaemasu",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "ရေချိုးသည်။": [
    "あびます [シャワーを]",
    "浴びます [シャワーを]",
    "abimasu [shawā o]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ထည့်သည်။ သွင်းသည်": [
    "いれます",
    "入れます",
    "iremasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ထုတ်သည်။ တင်သည်(စာ၊ report)": [
    "だします",
    "出します",
    "dashimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ပိုက်ဆံထုတ်သည်။": [
    "おろします [おかねを]",
    "下ろします [お金を]",
    "oroshimasu [okane o]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "တက္ကသိုလ်ဝင်သည်။": [
    "はいります [だいがくに]",
    "入ります [大学に]",
    "hairimasu [daigaku ni]",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "တက္ကသိုလ်မှ ထွက်သည်။": [
    "でます [だいがくを]",
    "出ます [大学を]",
    "demasu [daigaku o]",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "တွန်းသည်၊ ဖိသည်": [
    "おします",
    "押します",
    "oshimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "သောက်သည်။": [
    "のみます",
    "飲みます",
    "nomimasu",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "စတင်သည်။": [
    "はじめます",
    "始めます",
    "hajimemasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "လေ့လာသည်။": [
    "けんがくします",
    "見学します",
    "kengaku shimasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "ဖုန်းဆက်သည်": [
    "でんわします",
    "電話します",
    "denwa shimasu",
    "https://cdn-icons-png.flaticon.com/512/126/126509.png"
  ],
  "ငယ်သော": [
    "わかい",
    "若い",
    "wakai",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ရှည်သော": [
    "ながい",
    "長い",
    "nagai",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "တိုသော": [
    "みじかい",
    "短い",
    "mijikai",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "လင်းသော": [
    "あかるい",
    "明るい",
    "akarui",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "မှောင်သော": [
    "くらい",
    "暗い",
    "kurai",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ခန္ဓာကိုယ်": [
    "からだ",
    "体",
    "karada",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ခေါင်း၊ ဦးခေါင်း": [
    "あたま",
    "頭",
    "atama",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ဆံပင်": [
    "かみ",
    "髪",
    "kami",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "မျက်နှာ": [
    "かお",
    "顔",
    "kao",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "မျက်လုံး": [
    "め",
    "目",
    "me",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "နားရွက်": [
    "みみ",
    "耳",
    "mimi",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "နှာခေါင်း": [
    "はな",
    "鼻",
    "hana",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ပါးစပ်": [
    "くち",
    "口",
    "kuchi",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "သွား": [
    "は",
    "歯",
    "ha",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ဗိုက်": [
    "おなか",
    "お腹",
    "onaka",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ခြေထောက်": [
    "あし",
    "足",
    "ashi",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "အရပ် (ခန္ဓာကိုယ်)": [
    "せ",
    "背",
    "se",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ဝန်ဆောင်မှု": [
    "サービス",
    "サービス",
    "sābisu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အပြေးလေ့ကျင့်ခန်း": [
    "ジョギング",
    "ジョギング",
    "jogingu",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "ရေချိုးသောရေပန်း": [
    "シャワー",
    "シャワー",
    "shawā",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အစိမ်းရောင်": [
    "みどり",
    "緑",
    "midori",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဂျပန်ဘုရားကျောင်း": [
    "おてら",
    "お寺",
    "otera",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "ဂျပန်နတ်ဘုရားကျောင်း": [
    "じんじゃ",
    "神社",
    "jinja",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "---နံပါတ်": [
    "～ばん",
    "～番",
    "～ ban",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "ဘယ်လိုလုပ်ပြီး": [
    "どうやって",
    "どうやって",
    "dō yatte",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "ဘယ်ဟာ": [
    "どの～",
    "どの～",
    "dono ~",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "ဘယ်တစ်ခု": [
    "どれ",
    "どれ",
    "dore",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "တော်လိုက်တာ": [
    "すごいですね",
    "すごいですね",
    "sugoi desu ne",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အဲဒီလောက်မဟုတ်ပါဘူး": [
    "[いいえ、]まだまだです",
    "[いいえ、]まだまだです",
    "[iie,] madamada desu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အရင်ဆုံး": [
    "まず",
    "まず",
    "mazu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "နောက်ပြီး": [
    "つぎに",
    "次に",
    "tsugi ni",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ATM ကဒ်": [
    "キャッシュカード",
    "キャッシュカード",
    "kyasshu kādo",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "လျှို့ဝှက်နံပါတ်": [
    "あんしょうばんごう",
    "暗証番号",
    "anshō bangō",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "ငွေပမာဏ": [
    "きんがく",
    "金額",
    "kingaku",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "အတည်ပြုခြင်း": [
    "かくにん",
    "確認",
    "kakunin",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ခလုတ် button": [
    "ボタン",
    "ボタン",
    "botan",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဂျပန်ရထားလိုင်း Japan Railways": [
    "JR",
    "JR",
    "Jē Āru",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ],
  "နှင်းပွဲတော်": [
    "ゆきまつり",
    "雪まつり",
    "Yuki Matsuri",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "Bandung (in Indonesia)": [
    "バンドン",
    "バンドン",
    "Bandon",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ],
  "Franken (in Germany)": [
    "フランケン",
    "フランケン",
    "Furanken",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ],
  "Veracruz (in Mexico)": [
    "ベラクルス",
    "ベラクルス",
    "Berakurusu",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ],
  "Umeda": [
    "うめだ",
    "梅田",
    "Umeda",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ],
  "တက္ကသိုလ်ရှေ့(ကားမှတ်တိုင်)": [
    "だいがくまえ",
    "大学前",
    "Daigaku-mae",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ]
};

final minnaLesson17 = {
  "မှတ်မိသည်။": [
    "おぼえます",
    "覚えます",
    "oboemasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "မေ့သည်။": [
    "わすれます",
    "忘れます",
    "wasuremasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "ဖျောက်ပစ်သည်။": [
    "なくします",
    "なくします",
    "nakushimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ပေးချေသည်။": [
    "はらいます",
    "払います",
    "haraimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "ပြန်ပေးသည်။": [
    "かえします",
    "返します",
    "kaeshimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အပြင်ထွက်သည်။": [
    "でかけます",
    "出かけます",
    "dekakemasu",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "အင်္ကျီ ချွတ်သည်။": [
    "ぬぎます",
    "脱ぎます",
    "nugimasu",
    "https://cdn-icons-png.flaticon.com/512/2851/2851508.png"
  ],
  "ယူသွားသည်။": [
    "もっていきます",
    "持っていきます",
    "motte ikimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ယူလာသည်။": [
    "もってきます",
    "持ってきます",
    "motte kimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "စိတ်ပူသည်။": [
    "しんぱいします",
    "心配します",
    "shinpai shimasu",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "အလုပ်ပိုလုပ်သည်။": [
    "ざんぎょうします",
    "残業します",
    "zangyō shimasu",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "အလုပ်ခရီးသွားသည်": [
    "しゅっちょうします",
    "出張します",
    "shucchō shimasu",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "ဆေးသောက်သည်။": [
    "のみます [くすりを]",
    "飲みます [薬を]",
    "nomimasu [kusuri o]",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ရေစိမ်/ချိုးကန်ထဲ ဝင်သည်။": [
    "はいります [おふろに]",
    "入ります [おふろに]",
    "hairimasu [ofuro ni]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "တန်ဖိုးထားသော": [
    "たいせつ [な]",
    "大切 [な]",
    "taisetsu [na]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကိစ္စမရှိသော": [
    "だいじょうぶ [な]",
    "大丈夫 [な]",
    "daijōbu [na]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အန္တာရာယ်များသော": [
    "あぶない",
    "危ない",
    "abunai",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဆေးလိပ်မသောက်ရ": [
    "きんえん",
    "禁煙",
    "kin'en",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကျန်းမာရေးအာမခံကဒ်ပြား": [
    "ほけんしょう",
    "[健康]保険書",
    "[kenkō] hokenshō",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကိုယ်ပူခြင်း၊ အဖျားရှိခြင်း": [
    "ねつ",
    "熱",
    "netsu",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ရောဂါ": [
    "びょうき",
    "病気",
    "byōki",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ဆေး": [
    "くすり",
    "薬",
    "kusuri",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ရေစိမ်/ချိုးကန်": [
    "おふろ",
    "おふろ",
    "ofuro",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အနွေးထည်/အပေါ်ထပ်အင်္ကျီ": [
    "うわぎ",
    "上着",
    "uwagi",
    "https://cdn-icons-png.flaticon.com/512/2851/2851508.png"
  ],
  "အတွင်းခံ": [
    "したぎ",
    "下着",
    "shitagi",
    "https://cdn-icons-png.flaticon.com/512/2851/2851508.png"
  ],
  "၂ ရက် ၃ ရက်": [
    "にさんにち",
    "２、３日",
    "nisannichi",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "---အထိ": [
    "～までに",
    "～までに",
    "～ made ni",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "ဖြစ်လို့": [
    "ですから",
    "ですから",
    "desukara",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "လည်ချောင်း": [
    "のど",
    "のど",
    "nodo",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "အအေးမိခြင်း": [
    "かぜ",
    "風邪",
    "kaze",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "နောက်ပြီး": [
    "それから",
    "それから",
    "sorekara",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဂရုစိုက်ပါ (ကျန်းမာရေးကို)။": [
    "おだいじに",
    "お大事に",
    "odaiji ni",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ]
};

final minnaLesson18 = {
  "တတ်သည်။ လုပ်တတ်သည် နိုင်သည်။ လုပ်နိုင်သည်။": [
    "できます",
    "できます",
    "dekimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "လက်ဆေးသည်။ အဝတ်လျှော်သည်။": [
    "あらいます",
    "洗います",
    "araimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ပီယာနိုတီးသည်။": [
    "ひきます [ピアノを]",
    "弾きます [ピアノを]",
    "hikimasu [piano o]",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "သီချင်းဆိုသည်": [
    "うたいます",
    "歌います",
    "utaimasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "စုဆောင်းသည်။": [
    "あつめます",
    "集めます",
    "atsumemasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "စွန့်ပစ်သည်။": [
    "すてます",
    "捨てます",
    "sutemasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "လဲလှယ်သည်": [
    "かえます",
    "換えます",
    "kaemasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကားမောင်းသည်": [
    "うんてんします",
    "運転します",
    "unten shimasu",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "booking လုပ်သည်": [
    "よやくします",
    "予約します",
    "yoyaku shimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ပီယာနို": [
    "ピアノ",
    "ピアノ",
    "piano",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "မီတာ(အကွာအဝေးကိုတိုင်းတာသောမီတာ)": [
    "メートル",
    "メートル",
    "mētoru",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "ငွေသား၊ လက်ငင်းငွေပေးချေခြင်း": [
    "げんきん",
    "現金",
    "genkin",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "ဝါသနာ": [
    "しゅみ",
    "趣味",
    "shumi",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "နေစဉ်မှတ်တမ်း": [
    "にっき",
    "日記",
    "nikki",
    "https://cdn-icons-png.flaticon.com/512/3069/3069248.png"
  ],
  "ဆုတောင်းခြင်း": [
    "おいのり",
    "お祈り",
    "oinori",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဌာနခွဲမှူး": [
    "かちょう",
    "課長",
    "kachō",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "မန်နေဂျာ": [
    "ぶちょう",
    "部長",
    "buchō",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "သူဌေး": [
    "しゃちょう",
    "社長",
    "shachō",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "တိရိစ္ဆန်": [
    "どうぶつ",
    "動物",
    "dōbutsu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "မြင်း": [
    "うま",
    "馬",
    "uma",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "အင်တာနက်": [
    "インターネット",
    "インターネット",
    "intānetto",
    "https://cdn-icons-png.flaticon.com/512/4762/4762637.png"
  ],
  "အထူးသဖြင့်": [
    "とくに",
    "特に",
    "toku ni",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဟယ်": [
    "へえ、",
    "へえ、",
    "hē,",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "တော်တော်နဲ့---": [
    "なかなか",
    "なかなか",
    "nakanaka",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "တကယ်လားဟင်": [
    "ほんとうですか",
    "本当ですか",
    "hontō desu ka",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "ဆက်ဆက်။ ကျိန်းသေ": [
    "ぜひ",
    "ぜひ",
    "zehi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "မွေးရပ်မြေ": [
    "ふるさと",
    "故郷",
    "furusato",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "The Beatles": [
    "ビートルズ",
    "ビートルズ",
    "Bītoruzu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "Akihabara (တိုကျိုမှလူစည်ကားသောနေရာတစ်ခု)": [
    "あきはばら",
    "秋葉原",
    "Akihabara",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ]
};

final minnaLesson19 = {
  "အမြင့်သိုတက်သည်": [
    "のぼります [やまに]",
    "登ります [山に]",
    "noborimasu [yama ni]",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "ညအိပ်တည်းခိုသည် (ဟိုတယ်တွင်)": [
    "とまります [ホテルに]",
    "泊まります [ホテルに]",
    "tomarimasu [hoteru ni]",
    "https://cdn-icons-png.flaticon.com/512/2528/2528407.png"
  ],
  "သန်ရှင်းရေးလုပ်သည်": [
    "そうじします",
    "掃除します",
    "sōji shimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အဝတ်လျှော်သည်": [
    "せんたくします",
    "洗濯します",
    "sentaku shimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဖြစ်လာသည်": [
    "なります",
    "なります",
    "narimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အိပ်ချင်သော": [
    "ねむい",
    "眠い",
    "nemui",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "အားသန်သော": [
    "つよい",
    "強い",
    "tsuyoi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အားလျှော့သော/အားနည်းသော": [
    "よわい",
    "弱い",
    "yowai",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "လေ့ကျင့်ခြင်း": [
    "れんしゅう",
    "練習",
    "renshū",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "Golf": [
    "ゴルフ",
    "ゴルフ",
    "gorufu",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "ဂျပန်နပန်းအားကစား": [
    "すもう",
    "相撲",
    "sumō",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "ဂျပန်ရေနွေးကြမ်း green tea": [
    "おちゃ",
    "お茶",
    "ocha",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "နေ့ရက်": [
    "ひ",
    "日",
    "hi",
    "https://cdn-icons-png.flaticon.com/512/483/483988.png"
  ],
  "အခြေအနေ": [
    "ちょうし",
    "調子",
    "chōshi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "တစ်ကြိမ်၊ တစ်ခေါက်": [
    "いちど",
    "一度",
    "ichido",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "တစ်ကြိမ်မျှ၊ တစ်ခေါက်မျှ": [
    "いちども",
    "一度も",
    "ichido mo",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "တဖြေးဖြေးနဲ့": [
    "だんだん",
    "だんだん",
    "dandan",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အခုချက်ခြင်း": [
    "もうすぐ",
    "もうすぐ",
    "mō sugu",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "ကျေးဇူးတော်ကြောင့်/ပိုသတဲ့မေတ္တာကြောင့်": [
    "おかげさまで",
    "おかげさまで",
    "okagesama de",
    "https://cdn-icons-png.flaticon.com/512/2528/2528577.png"
  ],
  "ဒါပေမဲ့": [
    "でも",
    "でも",
    "demo",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "Cheers": [
    "かんぱい",
    "乾杯",
    "kanpai",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ဝိတ်ချခြင်း": [
    "ダイエット",
    "ダイエット",
    "daietto",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "မဖြစ်နိုင်သော(အလွန်အကျွံဖြစ်သော)": [
    "むり [な]",
    "無理 [な]",
    "muri [na]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ခန္ဓာကိုယ်အတွက်ကောင်းသော": [
    "からだにいい",
    "体にいい",
    "karada ni ii",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "Tokyo Sky Tree": [
    "とうきょうスカイツリー",
    "東京スカイツリー",
    "Tōkyō Sukaitsurī",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ],
  "Katsushika Hokusai (Edoခေတ်တွင် ကျော်ကြားခဲ့သော ပန်းချီးဆရာ)": [
    "かつしかほくさい",
    "葛飾北斎",
    "Katsushika Hokusai",
    "https://cdn-icons-png.flaticon.com/512/3134/3134812.png"
  ]
};

final minnaLesson20 = {
  "လိုသည်။ (ဗီဇာလိုသည်)": [
    "いります [ビザが]",
    "要ります [ビザが]",
    "irimasu [biza ga]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "စုံစမ်းသည်။": [
    "しらべます",
    "調べます",
    "shirabemasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "ပြုပြင်သည်။": [
    "しゅうりします",
    "修理します",
    "shūri shimasu",
    "https://cdn-icons-png.flaticon.com/512/4762/4762637.png"
  ],
  "ကျွန်တော်": [
    "ぼく",
    "僕",
    "boku",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "မင်း": [
    "きみ",
    "君",
    "kimi",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ကို/မောင်---": [
    "～くん",
    "～くん",
    "～ kun",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "အင်း": [
    "うん",
    "うん",
    "un",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဟင့်အင်း": [
    "ううん",
    "ううん",
    "ūun",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "စကား၊ ဝေါဟာရ": [
    "ことば",
    "言葉",
    "kotoba",
    "https://cdn-icons-png.flaticon.com/512/3069/3069248.png"
  ],
  "ဂျပန်ကီမိုနို": [
    "きもの",
    "着物",
    "kimono",
    "https://cdn-icons-png.flaticon.com/512/2851/2851508.png"
  ],
  "Visa": [
    "ビザ",
    "ビザ",
    "biza",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ပထမတော့၊ အစပိုင်း": [
    "はじめ",
    "初め",
    "hajime",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "အဆုံးတော့": [
    "おわり",
    "終わり",
    "owari",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "ဒီဘက်": [
    "こっち",
    "こっち",
    "kocchi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဟိုဘက်": [
    "そっち",
    "そっち",
    "socchi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဟိုးဘက်": [
    "あっち",
    "あっち",
    "acchi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဘယ်ဘက်": [
    "どっち",
    "どっち",
    "docchi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "အားလုံးနဲ့၊ အားလုံးအတူတူ": [
    "みんなで",
    "みんなで",
    "minna de",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ဒါပေမဲ့": [
    "～けど",
    "～けど",
    "～ kedo",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဗိုက်ပြည့်နေပြီ": [
    "おなかがいっぱいです",
    "おなかがいっぱいです",
    "onaka ga ippai desu",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ကြိုက်မယ်ဆိုရင်၊ အဆင်ပြေမယ်ဆိုရင်": [
    "よかったら",
    "よかったら",
    "yokattara",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အမျိုးမျိုး": [
    "いろいろ",
    "いろいろ",
    "iroiro",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ]
};

final minnaLesson21 = {
  "တွေးထင်သည်။": [
    "おもいます",
    "思います",
    "omoimasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "ပြောသည်။": [
    "いいます",
    "言います",
    "iimasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "နိုင်သည်။": [
    "かちます",
    "勝ちます",
    "kachimasu",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "ရှံးသည်": [
    "まけます",
    "負けます",
    "makemasu",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "ရှိသည်။ (ပွဲတော်ရှိသည်)": [
    "あります [おまつりが]",
    "あります [お祭りが]",
    "arimasu [omatsuri ga]",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "အသုံးဝင်သည်": [
    "やくにたちます",
    "役に立ちます",
    "yaku ni tachimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "လှုပ်ရှားသည်": [
    "うごきます",
    "動きます",
    "ugokimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကုမ္ပဏီမှ ထွက်သည်။": [
    "やめます [かいしゃを]",
    "やめます [会社を]",
    "yamemasu [kaisha o]",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "သတိထားသည်။ ဂရုစိုက်သည်။": [
    "きをつけます",
    "気をつけます",
    "ki o tsukemasu",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "အလဟဿဖြစ်သော": [
    "むだ [な]",
    "無駄 [な]",
    "muda [na]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အဆင်မပြေသော": [
    "ふべん [な]",
    "不便 [な]",
    "fuben [na]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အံဩစရာကောင်းသော": [
    "すごい",
    "すごい",
    "sugoi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "တကယ်": [
    "ほんとう",
    "本当",
    "hontō",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အလိမ်၊ အညာ": [
    "うそ",
    "うそ",
    "uso",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "မော်တော်ကား": [
    "じどうしゃ",
    "自動車",
    "jidōsha",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "ယာဉ်သွားလာမှု": [
    "こうつう",
    "交通",
    "kōtsū",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "ကုန်ဈေးနှုန်း": [
    "ぶっか",
    "物価",
    "bukka",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "သတင်းလွှင့်ခြင်း": [
    "ほうそう",
    "放送",
    "hōsō",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "သတင်း": [
    "ニュース",
    "ニュース",
    "nyūsu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "ဂျပန်ကာတွန်းကား": [
    "アニメ",
    "アニメ",
    "anime",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "ကာတွန်း(ရုပ်ပြ)စာအုပ်": [
    "マンガ",
    "マンガ",
    "manga",
    "https://cdn-icons-png.flaticon.com/512/3069/3069255.png"
  ],
  "ဒီဇိုင်း": [
    "デザイン",
    "デザイン",
    "dezain",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အိမ်မက်": [
    "ゆめ",
    "夢",
    "yume",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "ပါရမီရှင်": [
    "てんさい",
    "天才",
    "tensai",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ပြိုင်ပွဲ": [
    "しあい",
    "試合",
    "shiai",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "ထင်မြင်ချက်": [
    "いけん",
    "意見",
    "iken",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "စကား၊ ပုံပြင်": [
    "はなし",
    "話",
    "hanashi",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "ကမ္ဘာမြေ": [
    "ちきゅう",
    "地球",
    "chikyū",
    "https://cdn-icons-png.flaticon.com/512/1261/1261689.png"
  ],
  "အခုတလော": [
    "さいきん",
    "最近",
    "saikin",
    "https://cdn-icons-png.flaticon.com/512/2157/2157070.png"
  ],
  "may be": [
    "たぶん",
    "たぶん",
    "tabun",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကျိန်းသေ": [
    "きっと",
    "きっと",
    "kitto",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "တကယ်": [
    "ほんとうに",
    "本当に",
    "hontō ni",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အဲဒီလောက်(နောက်တွင် အငြင်းလိုက်လေ့ရှိသည်)": [
    "そんなに",
    "そんなに",
    "sonna ni",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "---နဲပက်သက်ပြီး": [
    "～について",
    "～について",
    "～ ni tsuite",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကြာလှပြီနော်": [
    "ひさしぶりですね",
    "久しぶりですね",
    "hisashiburi desu ne",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ဒါပေါ့၊ ဒါဘဲပေါ့။": [
    "もちろん",
    "もちろん",
    "mochiron",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "Albert Einstein": [
    "アインシュタイン",
    "アインシュタイン",
    "Ainshutain",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "Yuri Alekseyevich Gagarin": [
    "ガガーリン",
    "ガガーリン",
    "Gagārin",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "Galileo Galilei": [
    "ガリレオ",
    "ガリレオ",
    "Garireo",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "Martin Luther King, Jr.": [
    "キングぼくし",
    "キング牧師",
    "Kingu Bokushi",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "Benjamin Franklin": [
    "フランクリン",
    "フランクリン",
    "Furankurin",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "Kaguya မင်းသမီး": [
    "かぐやひめ",
    "かぐや姫",
    "Kaguya-hime",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "Tenjin ပွဲတော်": [
    "てんじんまつり",
    "天神祭り",
    "Tenjin Matsuri",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "Yoshino တောင်": [
    "よしのやま",
    "吉野山",
    "Yoshino-yama",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "သားပိုက်ကောင်": [
    "カンガルー",
    "カンガルー",
    "kangarū",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "Captain James Cook": [
    "キャプテン・クック",
    "キャプテン・クック",
    "Kyaputen Kukku",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "yone ကုမ္ပဏီ": [
    "ようねん",
    "ヨーネン",
    "Yōnen",
    "https://cdn-icons-png.flaticon.com/512/4762/4762637.png"
  ]
};

final minnaLesson22 = {
  "ဝတ်သည်။ (အင်္ကျီအပေါ်ပိုင်း)": [
    "きます",
    "着ます",
    "kimasu",
    "https://cdn-icons-png.flaticon.com/512/2851/2851508.png"
  ],
  "ဖိနပ်စီးသည်။ (အောက်ပိုင်း)": [
    "はきます",
    "履きます",
    "hakimasu",
    "https://cdn-icons-png.flaticon.com/512/2851/2851508.png"
  ],
  "ဦးထုပ်ဆောင်းသည်/ခြုံသည်။": [
    "かぶります",
    "かぶります",
    "kaburimasu",
    "https://cdn-icons-png.flaticon.com/512/2851/2851508.png"
  ],
  "မျက်မှန်တပ်သည်။": [
    "かけます [めがねを]",
    "かけます [めがねを]",
    "kakemasu [megane o]",
    "https://cdn-icons-png.flaticon.com/512/2851/2851508.png"
  ],
  "neck tie ပတ်သည်။": [
    "します [ネクタイを]",
    "します [ネクタイを]",
    "shimasu [nekutai o]",
    "https://cdn-icons-png.flaticon.com/512/2851/2851508.png"
  ],
  "မွေးဖွားသည်။": [
    "うまれます",
    "生まれます",
    "umaremasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "အိမ်ငှါးခ": [
    "やちん",
    "家賃",
    "yachin",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "ကျွန်တော်တို့/ကျွန်မတို့": [
    "わたしたち",
    "私たち",
    "watashitachi",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ထမင်းစားခန်းပါသော မီးဖိုဆောင်": [
    "ダイニングキッチン",
    "ダイニングキッチン",
    "dainingu kicchin",
    "https://cdn-icons-png.flaticon.com/512/2528/2528407.png"
  ],
  "အပေါ်ဝတ်အင်္ကျီ": [
    "コート",
    "コート",
    "kōto",
    "https://cdn-icons-png.flaticon.com/512/2851/2851508.png"
  ],
  "ဂျပန်ရိုးရာအခန်း": [
    "わしつ",
    "和室",
    "washitsu",
    "https://cdn-icons-png.flaticon.com/512/2528/2528407.png"
  ],
  "သိုးမွှေးအနွေးထည်": [
    "セーター",
    "セーター",
    "sētā",
    "https://cdn-icons-png.flaticon.com/512/2851/2851508.png"
  ],
  "ဂျပန်စတိုင်ဗီဒို(မွေ့ရာ၊ ခေါင်းအုံးများသိမ်းဆည်းသည့်အခန်း)": [
    "おしいれ",
    "押入れ",
    "oshiire",
    "https://cdn-icons-png.flaticon.com/512/2528/2528407.png"
  ],
  "အနောက်တိုင်းကုတ်အင်္ကျီ": [
    "スーツ",
    "スーツ",
    "sūtsu",
    "https://cdn-icons-png.flaticon.com/512/2851/2851508.png"
  ],
  "ဦးထုပ်": [
    "ぼうし",
    "帽子",
    "bōshi",
    "https://cdn-icons-png.flaticon.com/512/2851/2851508.png"
  ],
  "မွေ့ယာ": [
    "ふとん",
    "布団",
    "futon",
    "https://cdn-icons-png.flaticon.com/512/2528/2528407.png"
  ],
  "မျက်မှန်": [
    "めがね",
    "めがね",
    "megane",
    "https://cdn-icons-png.flaticon.com/512/2851/2851508.png"
  ],
  "ကိတ်မုန့်": [
    "ケーキ",
    "ケーキ",
    "kēki",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ထမင်းဗူး": [
    "おべんとう",
    "お弁当",
    "obentō",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "စက်ရုပ်": [
    "ロボット",
    "ロボット",
    "robotto",
    "https://cdn-icons-png.flaticon.com/512/4762/4762637.png"
  ],
  "ဟာသ": [
    "ユーモア",
    "ユーモア",
    "yūmoa",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "အခြေအနေ": [
    "つごう",
    "都合",
    "tsugō",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ခဏခဏ/မကြာမကြာ/ကောင်းကောင်း": [
    "よく",
    "よく",
    "yoku",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အဲဒါဆိုရင်": [
    "えーと",
    "えーと",
    "ēto",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဂုဏ်ပြုလွှာ": [
    "おめでとう [ございます]",
    "おめでとう [ございます]",
    "omedetō [gozaimasu]",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ],
  "တစ်ခုခုရှာနေပါသလား": [
    "おさがしですか",
    "お探しですか",
    "osagashi desu ka",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "ဒါဆိုရင်-": [
    "では",
    "では",
    "dewa",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဒီဘက်၊ ဒီဟာ": [
    "こちら",
    "こちら",
    "kochira",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "The Great Wall of China": [
    "ばんりのちょうじょう",
    "万里の長城",
    "Banri no Chōjō",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ]
};

final minnaLesson23 = {
  "မေးသည်။ (ဆရာကို)": [
    "ききます [せんせいに]",
    "聞きます [先生に]",
    "kikimasu [sensei ni]",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "လှည့်သည်။": [
    "まわします",
    "回します",
    "mawāshimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ဆွဲသည်။": [
    "ひきます",
    "引きます",
    "hikimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "လဲလှယ်သည်။": [
    "かえます",
    "変えます",
    "kaemasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကိုင်သည်၊ ထိသည်၊ တိုသည်။": [
    "さわります [ドアに]",
    "触ります [ドアに]",
    "sawarimasu [doa ni]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "လမ်းလျှောက်သည်။": [
    "あるきます [みちを]",
    "歩きます [道を]",
    "arukimasu [michi o]",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "ဖြတ်သည်။ (တံတားကို)": [
    "わたります [はしを]",
    "渡ります [橋を]",
    "watarimasu [hashi o]",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "ထွက်သည်။ (ပိုက်ဆံအကြွေထွက်သည်)": [
    "でます [おつりが]",
    "出ます [お釣りが]",
    "demasu [otsuri ga]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "ကွေ့သည်။ (ညာဘက်သို့)": [
    "まがります [みぎへ]",
    "曲がります [右へ]",
    "magarimasu [migi e]",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "အထီးကျန်သော": [
    "さびしい",
    "寂しい",
    "sabishii",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ရေနွေး": [
    "おゆ",
    "お湯",
    "oyu",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "အသံ": [
    "おと",
    "音",
    "oto",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အရွယ်အစား": [
    "サイズ",
    "サイズ",
    "saizu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ပျက်စီးနေခြင်း": [
    "こしょう",
    "故障",
    "koshō",
    "https://cdn-icons-png.flaticon.com/512/4762/4762637.png"
  ],
  "လမ်း": [
    "みち",
    "道",
    "michi",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "လမ်းဆုံ": [
    "こうさてん",
    "交差点",
    "kōsaten",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "မီးပွိုင့်": [
    "しんごう",
    "信号",
    "shingō",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "လမ်းထောင့်": [
    "かど",
    "角",
    "kado",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "တံတား": [
    "はし",
    "橋",
    "hashi",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "ကားရပ်ရန်နေရာ၊ parking": [
    "ちゅうしゃじょう",
    "駐車場",
    "chūshajō",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "အဆောက်အဦး": [
    "たてもの",
    "建物",
    "tatemono",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "အကြိမ်များစွာ": [
    "なんかいも",
    "何回も",
    "nankai mo",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "---မြောက်": [
    "～め",
    "～目",
    "～ me",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "Shotoku မင်းသား": [
    "しょうとくたいし",
    "聖徳太子",
    "Shōtoku Taishi",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "Houryuji ဘုရားကျောင်း": [
    "ほうりゅうじ",
    "法隆寺",
    "Hōryūji",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "ကျန်းမာရေးလက်ဖက်ခြောက်": [
    "げんきちゃ",
    "元気茶",
    "Genkicha",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "Honda ဘူတာ": [
    "ほんだえき",
    "本田駅",
    "Honda Eki",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ],
  "စာကြည့်တိုက်ရှေ့ ဘတ်စ်ကားမှတ်တိုင်": [
    "としょかんまえ",
    "図書館前",
    "Toshokan mae",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ]
};

final minnaLesson24 = {
  "ပေးသည်(တခြားသူက ကိုယ့်ကိုပေးခြင်း)": [
    "くれます",
    "くれます",
    "kuremasu",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ပြုပြင်သည်/အမှားပြင်ဆင်သည်": [
    "なおします",
    "直します",
    "naoshimasu",
    "https://cdn-icons-png.flaticon.com/512/4762/4762637.png"
  ],
  "ခေါ်သွားသည်။": [
    "つれていきます",
    "連れて行きます",
    "tsurete ikimasu",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ခေါ်လာသည်။": [
    "つれてきます",
    "連れてきます",
    "tsurete kimasu",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ပို့ဆောင်သည်။": [
    "おくります [ひとを]",
    "送ります [人を]",
    "okurimasu [hito o]",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "မိတ်ဆက်သည်။": [
    "しょうかいします",
    "紹介します",
    "shōkai shimasu",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "လမ်းပြသည်။": [
    "あんないします",
    "案内します",
    "annai shimasu",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "ရှင်းပြသည်။": [
    "せつめいします",
    "説明します",
    "setsumei shimasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "အဖိုး": [
    "おじいさん/おじいちゃん",
    "おじいさん/おじいちゃん",
    "ojiisan/ojiichan",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "အဖွား": [
    "おばあさん/おばあちゃん",
    "おばあさん/おばあちゃん",
    "obaasan/obaachan",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ကြိုတင်ပြင်ဆင်ခြင်း": [
    "じゅんび",
    "準備",
    "junbi",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အိမ်ပြောင်းခြင်း": [
    "ひっこし",
    "引っ越し",
    "hikkoshi",
    "https://cdn-icons-png.flaticon.com/512/2528/2528407.png"
  ],
  "မုန့်": [
    "おかし",
    "お菓子",
    "okashi",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "Home stay": [
    "ホームステイ",
    "ホームステイ",
    "hōmusutei",
    "https://cdn-icons-png.flaticon.com/512/2528/2528407.png"
  ],
  "အားလုံး": [
    "ぜんぶ",
    "全部",
    "zenbu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကိုယ်တိုင်": [
    "じぶんで",
    "自分で",
    "jibun de",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "အခြား": [
    "ほかに",
    "他に",
    "hoka ni",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အမေနေ့": [
    "ははのひ",
    "母の日",
    "Haha no Hi",
    "https://cdn-icons-png.flaticon.com/512/3069/3069240.png"
  ]
};

final minnaLesson25 = {
  "စဉ်းစားသည်": [
    "かんがえます",
    "考えます",
    "kangaemasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "ဆိုက်ရောက်သည်။": [
    "つきます [えきに]",
    "着きます [駅に]",
    "tsukimasu [eki ni]",
    "https://cdn-icons-png.flaticon.com/512/3389/3389140.png"
  ],
  "နိုင်ငံခြားပညာသင်သွားသည်": [
    "りゅうがくします",
    "留学します",
    "ryūgaku shimasu",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "အသက်ကြီးလာသည်။": [
    "とります [としを]",
    "取ります [年を]",
    "torimasu [toshi o]",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "လုံလောက်သည်": [
    "たります",
    "足ります",
    "tarimasu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "တောရွာ": [
    "いなか",
    "田舎",
    "inaka",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "အခွင့်အရေး": [
    "チャンス",
    "チャンス",
    "chansu",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "သန်း၁၀၀": [
    "おく",
    "億",
    "oku",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "တကယ်လို့---ခဲ့ရင်": [
    "もし [～たら]",
    "もし [～たら]",
    "moshi [~tara]",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "အဓိပ္ပါယ်": [
    "いみ",
    "意味",
    "imi",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "hello (ဖုန်းဆက်သည့်အခါ)": [
    "もしもし",
    "もしもし",
    "moshimoshi",
    "https://cdn-icons-png.flaticon.com/512/126/126509.png"
  ],
  "အလုပ်ပြောင်းခြင်း": [
    "てんきん",
    "転勤",
    "tenkin",
    "https://cdn-icons-png.flaticon.com/512/289/289295.png"
  ],
  "အကြောင်း": [
    "こと",
    "こと",
    "koto",
    "https://cdn-icons-png.flaticon.com/512/3069/3069213.png"
  ],
  "အားလပ်သော": [
    "ひま",
    "暇",
    "hima",
    "https://cdn-icons-png.flaticon.com/512/3421/3421102.png"
  ],
  "ကျေးဇူးအများကြီးရှိခဲ့ပါတယ်": [
    "[いろいろ]おせわになりました",
    "[いろいろ]お世話になりました",
    "[iroiro] osewa ni narimashita",
    "https://cdn-icons-png.flaticon.com/512/2528/2528577.png"
  ],
  "ကြိုးစားပါမယ်": [
    "がんばります",
    "頑張ります",
    "ganbarimasu",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ကျန်းမာစွာနေပါစေ (နှုတ်ဆက်)": [
    "どうぞ、おげんきで",
    "どうぞ、お元気で",
    "dōzo, ogenki de",
    "https://cdn-icons-png.flaticon.com/512/758/758807.png"
  ],
  "ဗီယက်နမ်": [
    "ベトナム",
    "ベトナム",
    "Betonamu",
    "https://cdn-icons-png.flaticon.com/512/197/197473.png"
  ]
};

final List<Map<String, dynamic>> katakanaTable = [
  {
    'consonant': '',
    'katakana': ['ア', 'イ', 'ウ', 'エ', 'オ'],
    'romaji': ['a', 'i', 'u', 'e', 'o'],
  },
  {
    'consonant': 'k',
    'katakana': ['カ', 'キ', 'ク', 'ケ', 'コ'],
    'romaji': ['ka', 'ki', 'ku', 'ke', 'ko'],
  },
  {
    'consonant': 's',
    'katakana': ['サ', 'シ', 'ス', 'セ', 'ソ'],
    'romaji': ['sa', 'shi', 'su', 'se', 'so'],
  },
  {
    'consonant': 't',
    'katakana': ['タ', 'チ', 'ツ', 'テ', 'ト'],
    'romaji': ['ta', 'chi', 'tsu', 'te', 'to'],
  },
  {
    'consonant': 'n',
    'katakana': ['ナ', 'ニ', 'ヌ', 'ネ', 'ノ'],
    'romaji': ['na', 'ni', 'nu', 'ne', 'no'],
  },
  {
    'consonant': 'h',
    'katakana': ['ハ', 'ヒ', 'フ', 'ヘ', 'ホ'],
    'romaji': ['ha', 'hi', 'fu', 'he', 'ho'],
  },
  {
    'consonant': 'm',
    'katakana': ['マ', 'ミ', 'ム', 'メ', 'モ'],
    'romaji': ['ma', 'mi', 'mu', 'me', 'mo'],
  },
  {
    'consonant': 'y',
    'katakana': ['ヤ', '', 'ユ', '', 'ヨ'],
    'romaji': ['ya', '', 'yu', '', 'yo'],
  },
  {
    'consonant': 'r',
    'katakana': ['ラ', 'リ', 'ル', 'レ', 'ロ'],
    'romaji': ['ra', 'ri', 'ru', 're', 'ro'],
  },
  {
    'consonant': 'w',
    'katakana': ['ワ', '', '', '', 'ヲ'],
    'romaji': ['wa', '', '', '', 'wo'],
  },
  {
    'consonant': 'n',
    'katakana': ['ン', '', '', '', ''],
    'romaji': ['n', '', '', '', ''],
  },
];

bool isHiragana(String char) {
  return hiraganaMap.containsKey(char);
}

bool isKatakana(String char) {
  return katakanaMap.containsKey(char);
}

final Map<String, String> katakanaMap = {
  'ア': 'a',
  'イ': 'i',
  'ウ': 'u',
  'エ': 'e',
  'オ': 'o',
  'カ': 'ka',
  'キ': 'ki',
  'ク': 'ku',
  'ケ': 'ke',
  'コ': 'ko',
  'サ': 'sa',
  'シ': 'shi',
  'ス': 'su',
  'セ': 'se',
  'ソ': 'so',
  'タ': 'ta',
  'チ': 'chi',
  'ツ': 'tsu',
  'テ': 'te',
  'ト': 'to',
  'ナ': 'na',
  'ニ': 'ni',
  'ヌ': 'nu',
  'ネ': 'ne',
  'ノ': 'no',
  'ハ': 'ha',
  'ヒ': 'hi',
  'フ': 'fu',
  'ヘ': 'he',
  'ホ': 'ho',
  'マ': 'ma',
  'ミ': 'mi',
  'ム': 'mu',
  'メ': 'me',
  'モ': 'mo',
  'ヤ': 'ya',
  'ユ': 'yu',
  'ヨ': 'yo',
  'ラ': 'ra',
  'リ': 'ri',
  'ル': 'ru',
  'レ': 're',
  'ロ': 'ro',
  'ワ': 'wa',
  'ヲ': 'wo',
  'ン': 'n',
};

final Map<String, String> characterMap = {
  ...hiraganaMap,
  ...katakanaMap,
};
