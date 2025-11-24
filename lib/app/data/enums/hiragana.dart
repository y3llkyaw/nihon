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

final vocabLessons = [minnaLesson1, minnaLesson2, minnaLesson3, minnaLesson4];

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
