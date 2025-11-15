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

final vocabLessons = [minnaLesson1, minnaLesson2, minnaLesson3];
final minnaLesson1 = {
  'ကျွန်တော်၊ ကျွန်မ': [
    'わたし',
    '私',
    'https://cdn-icons-png.flaticon.com/512/4140/4140048.png'
  ],
  'ခင်ဗျာ၊ မင်း၊ နင်': [
    'あなた',
    'あなた',
    'https://cdn-icons-png.flaticon.com/512/4140/4140054.png'
  ],
  'ဟိုလူ (ရိုးရိုးအသုံး)': [
    'あのひと',
    'あの人',
    'https://cdn-icons-png.flaticon.com/512/4140/4140037.png'
  ],
  'ဟိုလူ (ယဉ်ကျေးသောအသုံး)': [
    'あのかた',
    'あの方',
    'https://cdn-icons-png.flaticon.com/512/4140/4140061.png'
  ],
  '(နာမည်နောက်က တင်သုံးသည့်ခေါ်နည်း)': [
    '～さん',
    '～さん',
    'https://cdn-icons-png.flaticon.com/512/166/166258.png'
  ],
  '(ကလေးများအတွက် ချစ်စွာခေါ်နည်း)': [
    '～ちゃん',
    '～ちゃん',
    'https://cdn-icons-png.flaticon.com/512/2922/2922510.png'
  ],
  '--လူမျိုး (ဥပမာ アメリカじん = အမေရိကန်လူမျိုး)': [
    '～じん',
    '～人',
    'https://cdn-icons-png.flaticon.com/512/921/921347.png'
  ],
  'အမေရိကန်လူမျိုး': [
    'アメリカじん',
    'アメリカ人',
    'https://cdn-icons-png.flaticon.com/512/197/197484.png'
  ],
  'ဆရာ၊ ဆရာမ': [
    'せんせい',
    '先生',
    'https://cdn-icons-png.flaticon.com/512/2784/2784465.png'
  ],
  'ဆရာ၊ ဆရာမ (အလုပ်အကိုင်)': [
    'きょうし',
    '教師',
    'https://cdn-icons-png.flaticon.com/512/3235/3235043.png'
  ],
  'ကျောင်းသား၊ ကျောင်းသူ': [
    'がくせい',
    '学生',
    'https://cdn-icons-png.flaticon.com/512/3135/3135755.png'
  ],
  'ကုမ္ပဏီဝန်ထမ်း': [
    'かいしゃいん',
    '会社員',
    'https://cdn-icons-png.flaticon.com/512/3135/3135692.png'
  ],
  '(ကုမ္ပဏီအတွင်း ဝန်ထမ်း)': [
    'しゃいん',
    '社員',
    'https://cdn-icons-png.flaticon.com/512/681/681611.png'
  ],
  'ဘဏ်ဝန်ထမ်း': [
    'ぎんこういん',
    '銀行員',
    'https://cdn-icons-png.flaticon.com/512/2830/2830060.png'
  ],
  'ဆရာဝန်': [
    'いしゃ',
    '医者',
    'https://cdn-icons-png.flaticon.com/512/3774/3774299.png'
  ],
  'သုတေသနပညာရှင်': [
    'けんきゅうしゃ',
    '研究者',
    'https://cdn-icons-png.flaticon.com/512/3845/3845837.png'
  ],
  'တက္ကသိုလ်': [
    'だいがく',
    '大学',
    'https://cdn-icons-png.flaticon.com/512/8074/8074800.png'
  ],
  'ဆေးရုံ': [
    'びょういん',
    '病院',
    'https://cdn-icons-png.flaticon.com/512/3004/3004458.png'
  ],
  'ဘယ်သူ (ရိုးရိုး)': [
    'だれ',
    'だれ',
    'https://cdn-icons-png.flaticon.com/512/4140/4140047.png'
  ],
  'ဘယ်သူ (ယဉ်ကျေး)': [
    'どなた',
    'どなた',
    'https://cdn-icons-png.flaticon.com/512/4140/4140044.png'
  ],
  'အသက် -- နှစ်': [
    '～さい',
    '～歳',
    'https://cdn-icons-png.flaticon.com/512/992/992700.png'
  ],
  'အသက်ဘယ်နှစ်နှစ်လဲ': [
    'なんさい',
    '何歳',
    'https://cdn-icons-png.flaticon.com/512/4712/4712108.png'
  ],
  'အသက်ဘယ်နှစ်နှစ်လဲ (ယဉ်ကျေး)': [
    'おいくつ',
    'おいくつ',
    'https://cdn-icons-png.flaticon.com/512/4712/4712108.png'
  ],
  'ဟုတ်တယ်': [
    'はい',
    'はい',
    'https://cdn-icons-png.flaticon.com/512/709/709510.png'
  ],
  'မဟုတ်ဘူး': [
    'いいえ',
    'いいえ',
    'https://cdn-icons-png.flaticon.com/512/753/753345.png'
  ],
  'တွေ့ရတာ၀မ်းသာပါတယ်': [
    'はじめまして',
    '初めまして',
    'https://cdn-icons-png.flaticon.com/512/456/456212.png'
  ],
  '-- ကနေ လာပါတယ်': [
    '～からきました',
    '～から来ました',
    'https://cdn-icons-png.flaticon.com/512/197/197606.png'
  ],
  'ကျေးဇူးပြု၍ ရင်းရင်းနီးနီးဆက်ဆံပါလို့ တောင်းဆိုချင်ပါတယ်': [
    'どうぞ, よろしく おねがいします',
    'どうぞ、よろしく お願いします',
    'https://cdn-icons-png.flaticon.com/512/4712/4712109.png'
  ],
  'တောင်းပန်ပါတယ် (မေးခွန်းမေးချင်သောအခါ)': [
    'しつれいですが',
    '失礼ですが',
    'https://cdn-icons-png.flaticon.com/512/6364/6364087.png'
  ],
  'နာမည်ဘယ်လိုခေါ်ပါသလဲ': [
    'おなまえは？',
    'お名前は？',
    'https://cdn-icons-png.flaticon.com/512/1077/1077063.png'
  ],
  'ဤသူမှာ ～ さん ဖြစ်ပါတယ်': [
    'こちらは～さんです',
    'こちらは～さんです',
    'https://cdn-icons-png.flaticon.com/512/4140/4140039.png'
  ],
  'အမေရိကာ (နိုင်ငံ)': [
    'アメリカ',
    'アメリカ',
    'https://cdn-icons-png.flaticon.com/512/197/197484.png'
  ],
  'အင်္ဂလန် (နိုင်ငံ)': [
    'イギリス',
    'イギリス',
    'https://cdn-icons-png.flaticon.com/512/197/197374.png'
  ],
  'အိန္ဒြိယ (နိုင်ငံ)': [
    'インド',
    'インド',
    'https://cdn-icons-png.flaticon.com/512/197/197419.png'
  ],
  'အင်ဒိုနီးရှား (နိုင်ငံ)': [
    'インドネシア',
    'インドネシア',
    'https://cdn-icons-png.flaticon.com/512/197/197561.png'
  ],
  'တောင်ကိုရီးယား (နိုင်ငံ)': [
    'かんこく',
    '韓国',
    'https://cdn-icons-png.flaticon.com/512/197/197582.png'
  ],
  'ထိုင်း (နိုင်ငံ)': [
    'タイ',
    'タイ',
    'https://cdn-icons-png.flaticon.com/512/197/197452.png'
  ],
  'တရုတ် (နိုင်ငံ)': [
    'ちゅうごく',
    '中国',
    'https://cdn-icons-png.flaticon.com/512/197/197375.png'
  ],
  'ဂျာမနီ (နိုင်ငံ)': [
    'ドイツ',
    'ドイツ',
    'https://cdn-icons-png.flaticon.com/512/197/197571.png'
  ],
  'ဂျပန် (နိုင်ငံ)': [
    'にほん',
    '日本',
    'https://cdn-icons-png.flaticon.com/512/197/197604.png'
  ],
  'ဘရာဇီး (နိုင်ငံ)': [
    'ブラジル',
    'ブラジル',
    'https://cdn-icons-png.flaticon.com/512/197/197386.png'
  ],
};

final minnaLesson2 = {
  // I. ညွှန်းဆိုသောနာမ်စားများ (Demonstratives)
  'ဒါ (ဤဟာ)': ['これ', 'これ'],
  'အဲ့ဒါ (နီးကပ်သူ)': ['それ', 'それ'],
  'ဟိုဟာ (ဝေးသူ)': ['あれ', 'あれ'],
  'ဘယ်ဟာ': ['どれ', 'どれ'],

  'ဤအရာ (နာမ်ရှေ့တွင်)': ['この', 'この'],
  'အဲ့ဒီအရာ (နာမ်ရှေ့တွင်)': ['その', 'その'],
  'ဟိုအရာ (နာမ်ရှေ့တွင်)': ['あの', 'あの'],
  'ဘယ်အရာ (နာမ်ရှေ့တွင်)': ['どの', 'どの'],

  // II. နာမ်များ (Nouns)
  'စာအုပ်': ['ほん', '本'],
  'အဘိဓာန်': ['じしょ', '辞書'],
  'မဂ္ဂဇင်း': ['ざっし', '雑誌'],
  'သတင်းစာ': ['しんぶん', '新聞'],
  'နုတ်စာအုပ်': ['ノート', 'ノート'], // Note book
  'မှတ်စုစာအုပ်': ['てちょう', '手帳'], // Pocket book, diary
  'လုပ်ငန်းကတ်/ နာမည်ကတ်': ['めいし', '名刺'],
  'ကတ်': ['カード', 'カード'],
  'ခဲတံ': ['えんぴつ', '鉛筆'],
  'ဘောပင်': ['ボールペン', 'ボールペン'],
  'စက်ခဲတံ (Sharp Pencil)': ['シャープペンシル', 'シャープペンシル'],
  'သော့': ['かぎ', '鍵'],
  'နာရီ': ['とけい', '時計'],
  'ထီး': ['かさ', '傘'],
  'အိတ်': ['かばん', 'かばん'],
  'စီဒီ': ['CD', 'CD'],
  'တယ်လီဗီးရှင်း': ['テレビ', 'テレビ'],
  'ရေဒီယို': ['ラジオ', 'ラジオ'],
  'ကင်မရာ': ['カメラ', 'カメラ'],
  'ကွန်ပျူတာ': ['コンピューター', 'コンピューター'],
  'ကား': ['くるま', '車'],
  'စားပွဲ': ['つくえ', '机'],
  'ချောကလက်': ['チョコレート', 'チョコレート'],
  'လက်ဆောင် (အမှတ်တရ)': ['おみやげ', 'おみやげ'],

  // III. အခြားစကားလုံးများနှင့် နှုတ်ဆက်စကားများ (Others & Greetings)
  'ဒါဟုတ်လား၊ ဒီလိုလား': ['そうですか', 'そうですか'],
  'မဟုတ်ပါဘူး၊ မမှန်ပါဘူး': ['ちがいます', '違います'],
  'ကျေးဇူးတင်ပါတယ် (အတိုချုပ်)': ['どうも', 'どうも'],
  'ကျေးဇူးအထူးတင်ပါတယ်': ['どうもありがとうございます', 'どうもありがとうございます'],
  'အခုကစပြီး ကျေးဇူးပြုပြီး ကူညီပါ': ['これからおせわになります', 'これからお世話になります'],
  'ကျွန်တော် (ကျွန်မ) နဲ့လည်း ရင်းရင်းနီးနီးဆက်ဆံပါ': [
    'こちらこそよろしく',
    'こちらこそよろしく'
  ],
  'ကျေးဇူးပြု၍ (တောင်းဆိုရာတွင်)': ['おねがいします', 'お願いします'],
  'ဂျပန် (နိုင်ငံ)': ['にほん', '日本'],
  'အင်္ဂလိပ် (ဘာသာစကား)': ['えいご', '英語'],
  'ဂျပန် (ဘာသာစကား)': ['にほんご', '日本語'],
};
final minnaLesson3 = {
  "ဒီမှာ၊ ဒီနေရာ": [
    "ここ",
    "ここ",
    "https://cdn-icons-png.flaticon.com/512/3097/3097204.png"
  ],
  "အဲဒီမှာ၊ အဲဒီနေရာ": [
    "そこ",
    "そこ",
    "https://cdn-icons-png.flaticon.com/512/3097/3097204.png"
  ],
  "ဟိုမှာ၊ ဟိုနေရာ": [
    "あそこ",
    "あそこ",
    "https://cdn-icons-png.flaticon.com/512/3097/3097204.png"
  ],
  "ဘယ်မှာလဲ": [
    "どこ",
    "どこ",
    "https://cdn-icons-png.flaticon.com/512/3097/3097202.png"
  ],
  "ဒီဘက်မှာ (ယဉ်ကျေး)": [
    "こちら",
    "こちら",
    "https://cdn-icons-png.flaticon.com/512/4992/4992743.png"
  ],
  "ဟိုဘက်မှာ (ယဉ်ကျေး)": [
    "そちら",
    "そちら",
    "https://cdn-icons-png.flaticon.com/512/4992/4992743.png"
  ],
  "ဟိုးဘက်မှာ (ယဉ်ကျေး)": [
    "あちら",
    "あちら",
    "https://cdn-icons-png.flaticon.com/512/4992/4992743.png"
  ],
  "ဘယ်ဘက်မှာလဲ (ယဉ်ကျေး)": [
    "どちら",
    "どちら",
    "https://cdn-icons-png.flaticon.com/512/4992/4992745.png"
  ],
  "စာသင်ခန်း": [
    "きょうしつ",
    "教室",
    "https://cdn-icons-png.flaticon.com/512/3447/3447038.png"
  ],
  "ထမင်းစားခန်း/ ထမင်းဆိုင်": [
    "しょくどう",
    "食堂",
    "https://cdn-icons-png.flaticon.com/512/3134/3134857.png"
  ],
  "ရုံးခန်း": [
    "じむしょ",
    "事務所",
    "https://cdn-icons-png.flaticon.com/512/4762/4762637.png"
  ],
  "အစည်းအဝေးခန်း": [
    "かいぎしつ",
    "会議室",
    "https://cdn-icons-png.flaticon.com/512/5110/5110191.png"
  ],
  "စုံစမ်းရန်ကောင်တာ": [
    "うけつけ",
    "受付",
    "https://cdn-icons-png.flaticon.com/512/4603/4603612.png"
  ],
  "ဧည့်ခန်း၊ ဟိုတယ်ဧည့်ခန်း": [
    "ロビー",
    "ロビー",
    "https://cdn-icons-png.flaticon.com/512/2855/2855776.png"
  ],
  "အခန်း": [
    "へや",
    "部屋",
    "https://cdn-icons-png.flaticon.com/512/2528/2528407.png"
  ],
  "အိမ်သာ": [
    "トイレ",
    "トイレ",
    "https://cdn-icons-png.flaticon.com/512/2851/2851508.png"
  ],
  "လှေခါး": [
    "かいだん",
    "階段",
    "https://cdn-icons-png.flaticon.com/512/5193/5193910.png"
  ],
  "ဓါတ်လှေခါး": [
    "エレベーター",
    "エレベーター",
    "https://cdn-icons-png.flaticon.com/512/2855/2855799.png"
  ],
  "စက်လှေခါး": [
    "エスカレーター",
    "エスカレーター",
    "https://cdn-icons-png.flaticon.com/512/5323/5323419.png"
  ],
  "အလိုအလျောက်ဈေးရောင်းသည့်စက်": [
    "じどうはんばいき",
    "自動販売機",
    "https://cdn-icons-png.flaticon.com/512/3757/3757731.png"
  ],
  "တယ်လီဖုန်း": [
    "でんわ",
    "電話",
    "https://cdn-icons-png.flaticon.com/512/126/126509.png"
  ],
  "နိုင်ငံ": [
    "くに",
    "国",
    "https://cdn-icons-png.flaticon.com/512/1261/1261689.png"
  ],
  "ကုမ္ပဏီ": [
    "かいしゃ",
    "会社",
    "https://www.entrepreneur.com/wp-content/uploads/sites/2/2016/06/20150805204041-google-company-building-corporate.jpeg"
  ],
  "အိမ်": [
    "うち",
    "うち",
    "https://www.bhg.com/thmb/H9VV9JNnKl-H1faFXnPlQfNprYw=/1799x0/filters:no_upscale():strip_icc()/white-modern-house-curved-patio-archway-c0a4a3b3-aa51b24d14d0464ea15d36e05aa85ac9.jpg"
  ],
  "ဖိနပ်": ["くつ", "靴", "https://upload.wikimedia.org/wikipedia/commons/d/dc/74892143_f94145facb.jpg"],
  "လည်စည်း (Necktie)": [
    "ネクタイ",
    "ネクタイ",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Krawaty.jpg/250px-Krawaty.jpg"
  ],
  "ဝိုင်": [
    "ワイン",
    "ワイン",
    "https://en.wikipedia.org/wiki/Red_wine"
  ],
  "အရောင်းကောင်တာ": [
    "うりば",
    "売り場",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Cash_Registers.JPG/1200px-Cash_Registers.JPG"
  ],
  "မြေအောက်": [
    "ちか",
    "地下",
    "https://upload.wikimedia.org/wikipedia/commons/2/27/Tenjin_Chikagai%28Tenjin_Underground_City%29_-_02.JPG"
  ],
  "~အထပ်": [
    "～かい",
    "～階",
    "https://cdn-icons-png.flaticon.com/512/569/569947.png"
  ],
  "ဘယ်နှစ်ထပ်": [
    "なんがい",
    "何階",
    "https://i.pinimg.com/736x/d1/4f/fa/d14ffa353b68eca67faaab4db73030f9.jpg"
  ],
  "ဂျပန်ပိုက်ဆံ (ယန်း)": [
    "えん",
    "円",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Series_F_10000_yen_front.jpg/250px-Series_F_10000_yen_front.jpg"
  ],
  "ဘယ်လောက်လဲ": [
    "いくら",
    "いくら",
    "https://cdn-icons-png.flaticon.com/512/3421/3421096.png"
  ],
  "တစ်ရာ": [
    "ひゃく",
    "百",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "တစ်ထောင်": [
    "せん",
    "千",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "တစ်သောင်း": [
    "まん",
    "万",
    "https://cdn-icons-png.flaticon.com/512/2311/2311210.png"
  ],
  "တောင်းပန်ပါတယ်၊ တစ်ဆိတ်လောက်": [
    "すみません",
    "すみません",
    "https://cdn-icons-png.flaticon.com/512/6364/6364087.png"
  ],
  "ကျေးဇူးပါ။": [
    "どうも",
    "どうも",
    "https://cdn-icons-png.flaticon.com/512/2528/2528577.png"
  ],
  "ကြိုဆိုပါတယ်": [
    "いらっしゃいませ",
    "いらっしゃいませ",
    "https://cdn-icons-png.flaticon.com/512/4028/4028308.png"
  ],
  "[~ကို] ပြပါ": [
    "～をみせてください",
    "～を見せてください",
    "https://cdn-icons-png.flaticon.com/512/2776/2776008.png"
  ],
  "ဒါဆိုရင်/ ကဲ": [
    "じゃ",
    "じゃあ",
    "https://cdn-icons-png.flaticon.com/512/412/412852.png"
  ],
  "[~ကို] ပေးပါ": [
    "～をください",
    "～をください",
    "https://cdn-icons-png.flaticon.com/512/1255/1255850.png"
  ],
  "အီတလီ": [
    "イタリア",
    "イタリア",
    "https://cdn-icons-png.flaticon.com/512/197/197626.png"
  ],
  "ဆွစ်ဇာလန်": [
    "スイス",
    "スイス",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Flag_of_Switzerland_%28Pantone%29.svg/1920px-Flag_of_Switzerland_%28Pantone%29.svg.png"
  ],
  "ပြင်သစ်": [
    "フランス",
    "フランス",
    "https://cdn-icons-png.flaticon.com/512/197/197560.png"
  ],
  "ဂျကာတာ": [
    "ジャカルタ",
    "ジャカルタ",
    "https://cdn-icons-png.flaticon.com/512/2157/2157077.png"
  ],
  "ဘန်ကောက်": [
    "バンコク",
    "バンコク",
    "https://cdn-icons-png.flaticon.com/512/2157/2157079.png"
  ],
  "ဘာလင်": [
    "ベルリン",
    "ベルリン",
    "https://cdn-icons-png.flaticon.com/512/2157/2157080.png"
  ],
  "ရှင်းအိုဆာကာ": [
    "しんおおさか",
    "新大阪",
    "https://cdn-icons-png.flaticon.com/512/2157/2157081.png"
  ]
};
