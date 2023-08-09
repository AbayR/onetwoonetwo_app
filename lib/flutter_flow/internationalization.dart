import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'pt'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? ptText = '',
  }) =>
      [enText, ptText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // OnboardingPage
  {
    't7j2zlfx': {
      'en': 'Log in',
      'pt': 'Conecte-se',
    },
    '5uc2p481': {
      'en': 'Register now',
      'pt': 'Registrar agora',
    },
    'ujmcelv0': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // EmailPage
  {
    'lelu3pee': {
      'en': 'Please, enter your email ',
      'pt': 'Por favor introduza o seu e-mail',
    },
    'b8lnt7n5': {
      'en': 'E-mail',
      'pt': 'E-mail',
    },
    '3ur6cxcq': {
      'en': 'I agree with the ',
      'pt': 'eu concordo com o',
    },
    'otgqi4pw': {
      'en': 'Terms of Use ',
      'pt': 'Termos de uso',
    },
    'lo8qwg94': {
      'en': 'and ',
      'pt': 'e',
    },
    'x6xfjvgv': {
      'en': 'Privacy policy',
      'pt': 'Política de Privacidade',
    },
    'zalh890t': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // PasswordPage
  {
    '290nz1hk': {
      'en': 'Enter verification code',
      'pt': 'Digite o código de verificação',
    },
    'qgzsy5ne': {
      'en': 'We have sent a verification code to the mail',
      'pt': 'Enviamos um código de verificação para o e-mail',
    },
    '75aglfls': {
      'en': 'Verification code',
      'pt': 'Código de verificação',
    },
    'pe0amljz': {
      'en': 'Send again',
      'pt': 'Envie novamente',
    },
    '3b5ir64b': {
      'en': 'Send again in ',
      'pt': 'Enviar novamente em',
    },
    'gs0wnvs3': {
      'en': ' sec',
      'pt': 'segundo',
    },
    '2d9gasor': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // CreateAccountPage
  {
    'ch3v18fz': {
      'en': 'Tell us about\nyourself',
      'pt': 'Conte-nos sobre\nvocê mesmo',
    },
    '479vibo1': {
      'en': 'Name',
      'pt': 'Nome',
    },
    '2pzgiubw': {
      'en': 'Surname',
      'pt': 'Sobrenome',
    },
    'pz0yoicm': {
      'en': 'Option 1',
      'pt': 'Opção 1',
    },
    '23yjqj1b': {
      'en': 'Country',
      'pt': 'País',
    },
    '0hz5u9hd': {
      'en': 'Enter country',
      'pt': 'Digite o país',
    },
    'nglaidvz': {
      'en': 'SC Braga',
      'pt': 'SC Braga',
    },
    'vvzx396y': {
      'en': 'Partner Club',
      'pt': 'clube parceiro',
    },
    'py7mbskr': {
      'en': 'Enter Club',
      'pt': 'entrar no clube',
    },
    '8vunchbq': {
      'en': 'Date of birth',
      'pt': 'Data de nascimento',
    },
    '0uxsvl6d': {
      'en': 'dd.mm.yyyy',
      'pt': 'dd.mm.aaaa',
    },
    'u23vsiwg': {
      'en': 'Start using',
      'pt': 'começar a usar',
    },
    '3tfwhtmk': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    '1hcw1s0t': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Escolha uma opção no menu suspenso',
    },
    'oxhcizgg': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    '4pct0my2': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Escolha uma opção no menu suspenso',
    },
    'iyubpdvp': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'jb2prwbi': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Escolha uma opção no menu suspenso',
    },
    'i1nljsu5': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // SetPinPage
  {
    'syxvzmza': {
      'en': 'Enter your pin',
      'pt': 'Definir um código PIN',
    },
    'm2aa8yoc': {
      'en': 'To quickly enter the mobile application',
      'pt': 'Para entrar rapidamente no aplicativo móvel',
    },
    'te3exo4i': {
      'en': '1',
      'pt': '1',
    },
    '2ezuw106': {
      'en': '2',
      'pt': '2',
    },
    'gb0x1vv4': {
      'en': '3',
      'pt': '3',
    },
    '8yv7ef3l': {
      'en': '4',
      'pt': '4',
    },
    'op5ivuor': {
      'en': '5',
      'pt': '5',
    },
    'rocqpgr4': {
      'en': '6',
      'pt': '6',
    },
    'g1yicrbq': {
      'en': '7',
      'pt': '7',
    },
    '1jfaf68m': {
      'en': '8',
      'pt': '8',
    },
    'c6hfnh9k': {
      'en': '9',
      'pt': '9',
    },
    '1nadfh9k': {
      'en': 'Please authenticate yourself to continue using the app',
      'pt': 'Autentique-se para continuar usando o aplicativo',
    },
    '7j11ohc8': {
      'en': '0',
      'pt': '0',
    },
    '5plzrd3i': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // ChatPage
  {
    'xljft8f1': {
      'en': 'Option 1',
      'pt': '',
    },
    'p6firr8d': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // OnBoarding
  {
    'xqyek3xe': {
      'en': 'Skip',
      'pt': 'Pular',
    },
    'runcc8ss': {
      'en': 'New format',
      'pt': 'Novo formato',
    },
    '9api8b2u': {
      'en':
          'Training in the format of live communication helps to bring the real situation as close \nas possible',
      'pt':
          'O treinamento no formato de comunicação ao vivo ajuda a aproximar o mais possível a situação real\nque possível',
    },
    'kni6976x': {
      'en': 'Skip',
      'pt': 'Pular',
    },
    'p2v6c76e': {
      'en': 'Short courses',
      'pt': 'Cursos de curta duração',
    },
    'gokm7q89': {
      'en': 'You will spend no more than one hour a day on training',
      'pt': 'Você não gastará mais do que uma hora por dia em treinamento',
    },
    'x2p8wka9': {
      'en': 'Skip',
      'pt': 'Pular',
    },
    'kjut4ycy': {
      'en': 'Full immersion',
      'pt': 'Imersão total',
    },
    'yl2zxt45': {
      'en':
          'Incredible realistic learning scenarios will help work out mistakes',
      'pt':
          'Cenários de aprendizagem realistas incríveis ajudarão a resolver erros',
    },
    'kktvpcz7': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // QApage
  {
    'k2265bdl': {
      'en': 'back',
      'pt': 'voltar',
    },
    'iiz2gygn': {
      'en': 'question',
      'pt': 'pergunta',
    },
    'b011jtxc': {
      'en': 'image path',
      'pt': 'caminho da imagem',
    },
    'nqsl5vu5': {
      'en': 'Upload',
      'pt': 'Carregar',
    },
    '4moysh19': {
      'en': 'answer1',
      'pt': 'resposta 1',
    },
    'xjiwkdg3': {
      'en': 'answer2',
      'pt': 'resposta2',
    },
    'dfc85rxo': {
      'en': 'answer3',
      'pt': 'resposta3',
    },
    '5tbqlg9x': {
      'en': 'What is best answer?',
      'pt': 'Qual é a melhor resposta?',
    },
    '5f4igzor': {
      'en': 'create',
      'pt': 'criar',
    },
    'p4doq5bj': {
      'en': 'Finish creating bot',
      'pt': 'Concluir a criação do bot',
    },
    'wjthve55': {
      'en': 'Finish',
      'pt': 'Terminar',
    },
    'lnwbyqvu': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'ajtp8l4i': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Escolha uma opção no menu suspenso',
    },
    'ec7ry42u': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'edvislsd': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Escolha uma opção no menu suspenso',
    },
    'xgexh8wf': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    '381xgm9m': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Escolha uma opção no menu suspenso',
    },
    '2qyyvvvt': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'gh0lt9k2': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Escolha uma opção no menu suspenso',
    },
    'fqub60ob': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    '5hho7qu5': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Escolha uma opção no menu suspenso',
    },
    '33m9gppz': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // createBot
  {
    'p42bepxw': {
      'en': 'Label Name',
      'pt': 'Nome do rótulo',
    },
    'c4rac56b': {
      'en': 'Role',
      'pt': 'Papel',
    },
    'hqdvex2b': {
      'en': 'Upload Bot Photo',
      'pt': 'Carregar foto do bot',
    },
    'xnx9uk6f': {
      'en': 'Create and go',
      'pt': 'Criar e ir',
    },
    '71fmcf0z': {
      'en': 'Access points',
      'pt': 'Pontos de acesso',
    },
    'eta1jg97': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // profilePage
  {
    'vkl668bs': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
    '0cyqm8t3': {
      'en': 'Settings',
      'pt': 'Configurações',
    },
    'doi6a9xb': {
      'en': 'Admin panel',
      'pt': 'painel administrativo',
    },
    'dgli35rj': {
      'en': 'Control your courses',
      'pt': 'Controle seus cursos',
    },
    '4l6h3j4m': {
      'en': 'Language',
      'pt': 'Linguagem',
    },
    '0n2qxvfn': {
      'en': 'Change app language',
      'pt': 'Alterar idioma do aplicativo',
    },
    'w3v5fscj': {
      'en': 'Privacy',
      'pt': 'Privacidade',
    },
    'ddpkzhz4': {
      'en': 'Change your access settings',
      'pt': 'Altere suas configurações de acesso',
    },
    'jiy5vabt': {
      'en': 'Notifications',
      'pt': 'Notificações',
    },
    'hbawedot': {
      'en': 'Change your notification settings',
      'pt': 'Altere suas configurações de notificação',
    },
    'ghmm6vco': {
      'en': 'Contact support',
      'pt': 'Entre em contato com o suporte',
    },
    'rxn5yzs8': {
      'en': 'Get help',
      'pt': 'Obter ajuda',
    },
    '5af08lgq': {
      'en': 'About app',
      'pt': 'Sobre o aplicativo',
    },
    'z3l0xpdg': {
      'en': 'Find our more about us',
      'pt': 'Descubra mais sobre nós',
    },
    'qbn7k6ao': {
      'en': 'Log out',
      'pt': 'Sair',
    },
    '21sulk8d': {
      'en': 'Profile',
      'pt': 'Perfil',
    },
  },
  // MainPage
  {
    'jhifppbx': {
      'en': 'My studies',
      'pt': 'Meus estudos',
    },
    'kcivujjz': {
      'en': 'see all',
      'pt': 'ver tudo',
    },
    'vgy9oz0c': {
      'en': 'Course library',
      'pt': 'Biblioteca de cursos',
    },
    'ihnbadwu': {
      'en': 'All',
      'pt': 'Todos',
    },
    '7jciauc6': {
      'en': 'New',
      'pt': 'Novo',
    },
    'lpcwlwmr': {
      'en': 'Financial & Legal Literacy',
      'pt': 'Alfabetização Financeira e Jurídica',
    },
    'owl8cnft': {
      'en': 'DE & I',
      'pt': 'DE & I',
    },
    'osdc2o26': {
      'en': 'Mental Health',
      'pt': 'Saúde mental',
    },
    'wucd3odt': {
      'en': 'Ethics',
      'pt': 'Ética',
    },
    '25qm5l2w': {
      'en': '45 mins',
      'pt': '45 minutos',
    },
    '96fmgeyq': {
      'en': 'Learn',
      'pt': 'Aprender',
    },
    'dcy409yq': {
      'en': 'Learn',
      'pt': 'Aprender',
    },
    'y3sy0zmk': {
      'en': 'Please authenticate youself',
      'pt': 'Por favor, autentique-se',
    },
  },
  // MyLibraryPage
  {
    'tfi921es': {
      'en': 'Active',
      'pt': 'Ativo',
    },
    'djoq74ew': {
      'en': 'Completed',
      'pt': 'Concluído',
    },
    'pogdh4yf': {
      'en': 'My library',
      'pt': 'Minha biblioteca',
    },
    'ouppvdvk': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // ModulesPage
  {
    'tgzn3c2w': {
      'en': 'Open when the previous module is completed',
      'pt': 'Abrir quando o módulo anterior for concluído',
    },
    'vto2qd7u': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // LessonsPage
  {
    '17bxn7ch': {
      'en': 'Play',
      'pt': 'Jogar',
    },
    'o0ty89f7': {
      'en': 'Tactics',
      'pt': 'táticas',
    },
    'lnvfr5ny': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // TacticsPage
  {
    'tzski9rk': {
      'en': 'Back',
      'pt': 'Voltar',
    },
    'vstejcgl': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // CreateCoursePage
  {
    'wrhg56gb': {
      'en': 'Course name',
      'pt': 'Nome do curso',
    },
    'jxxsxe74': {
      'en': 'Course Description',
      'pt': 'Descrição do Curso',
    },
    'yrdsp45m': {
      'en': 'Hours duration',
      'pt': 'Horas de duração',
    },
    't8ai2m0a': {
      'en': 'Minutes duration',
      'pt': 'Minutos de duração',
    },
    '4sl0l2vl': {
      'en': 'Brand & PR',
      'pt': 'Marca e relações públicas',
    },
    'vgx6l3b1': {
      'en': 'Financial & Legal Literacy',
      'pt': 'Alfabetização Financeira e Jurídica',
    },
    '9ot8etpd': {
      'en': 'DE & I',
      'pt': 'DE & I',
    },
    'mllx9hl6': {
      'en': 'Mental Health',
      'pt': 'Saúde mental',
    },
    '0uussgaq': {
      'en': 'Ethics',
      'pt': 'Ética',
    },
    'q3h12j9x': {
      'en': 'Create',
      'pt': 'Criar',
    },
    'htf6qtpo': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'mozwbpld': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Escolha uma opção no menu suspenso',
    },
    'lyq33o2i': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    'vz1depi0': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Escolha uma opção no menu suspenso',
    },
    'j1gde9e9': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    '2t4qhsws': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Escolha uma opção no menu suspenso',
    },
    'apm4v5xk': {
      'en': 'Field is required',
      'pt': 'Campo é obrigatório',
    },
    '9adeglvt': {
      'en': 'Please choose an option from the dropdown',
      'pt': 'Escolha uma opção no menu suspenso',
    },
    'lqhd61a5': {
      'en': 'Back',
      'pt': 'Voltar',
    },
    '1fnu1zef': {
      'en': 'Create course',
      'pt': 'Criar curso',
    },
  },
  // BotDetailPage
  {
    'gw5swtia': {
      'en': 'Start course',
      'pt': 'Iniciar curso',
    },
    '1cuc0n4n': {
      'en': 'Training time',
      'pt': 'Tempo de treino',
    },
    'l5pit0ot': {
      'en': 'Status',
      'pt': 'Status',
    },
    'lbxkiz39': {
      'en': 'About course',
      'pt': 'Sobre o curso',
    },
    'df6temmm': {
      'en': 'Go to course page',
      'pt': 'Ir para a página do curso',
    },
    '5dikl9zp': {
      'en': 'Back',
      'pt': 'Voltar',
    },
    'ilmdpxrg': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // WantuChat
  {
    '5hy6oukn': {
      'en': 'Wantu',
      'pt': 'Wantu',
    },
    '3qg4t9ek': {
      'en': 'Your helper',
      'pt': 'seu ajudante',
    },
    'q63sn1be': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // WantuPage
  {
    'qt9dl1sb': {
      'en': 'Wantu',
      'pt': 'Wantu',
    },
    '7zdp9hhy': {
      'en': 'Your helper',
      'pt': 'seu ajudante',
    },
    'd64rp1kw': {
      'en': 'Hints requested',
      'pt': 'dicas solicitadas',
    },
    '037i0965': {
      'en': '1',
      'pt': '1',
    },
    'x5eh3gmb': {
      'en': 'About Wantu',
      'pt': 'Sobre Wantu',
    },
    'mx2j9lhx': {
      'en':
          'Smart assistant based on a neural network. Designed to guide you to the right answer. You can ask for advice to reply to the last message received.\nWantu is free for now!',
      'pt':
          'Assistente inteligente baseado em uma rede neural. Projetado para guiá-lo para a resposta certa. Você pode pedir conselhos para responder à última mensagem recebida.\nWantu está livre por enquanto!',
    },
    '6z9s01c9': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // CourseDetailsPage
  {
    'jfedla3c': {
      'en': 'Course details',
      'pt': 'Detalhes do curso',
    },
    'moujrsos': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // SearchPage
  {
    'pda42y0s': {
      'en': 'Enter the name of the course or topic ',
      'pt': 'Digite o nome do curso ou tópico',
    },
    'ttris8zs': {
      'en': 'Example: Social abuse',
      'pt': 'Exemplo: abuso social',
    },
    'r766gicy': {
      'en': '45 mins',
      'pt': '45 minutos',
    },
    '2z26bl41': {
      'en': 'Active',
      'pt': 'Ativo',
    },
    'y811vjae': {
      'en': '45 mins',
      'pt': '45 minutos',
    },
    'rbkdbzyg': {
      'en': 'Active',
      'pt': 'Ativo',
    },
    'meq1vgju': {
      'en': 'Last requests',
      'pt': 'últimos pedidos',
    },
    '8huvmkfr': {
      'en': 'Popular',
      'pt': 'Popular',
    },
    '6xf8ocw2': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // CreateModulePage
  {
    'la886crj': {
      'en': 'Module name',
      'pt': 'Nome do módulo',
    },
    'mt2iu6ud': {
      'en': 'Duration hours',
      'pt': 'horas de duração',
    },
    'ogpfbsal': {
      'en': 'Duration Mins',
      'pt': 'Minutos de Duração',
    },
    '1ym50j3r': {
      'en': 'Index in list',
      'pt': 'Índice na lista',
    },
    'eqnfebey': {
      'en': 'Access points',
      'pt': 'Pontos de acesso',
    },
    'vexrc4yi': {
      'en': 'Create new module',
      'pt': 'Criar novo módulo',
    },
    'lskcmxea': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // ListChatsPage
  {
    'bpeh04as': {
      'en': 'Chats',
      'pt': 'Bate-papo',
    },
    'xv3uqmag': {
      'en': 'Active Chats',
      'pt': 'Bate-papos ativos',
    },
    'bh0qox22': {
      'en':
          'Here will be dialogs generated via learning couses. Get your first course',
      'pt':
          'Aqui serão gerados diálogos por meio de cursos de aprendizagem. Faça seu primeiro curso',
    },
    'g4fj39jg': {
      'en': 'Completed Chats',
      'pt': 'Bate-papos concluídos',
    },
    'kw1sqm0a': {
      'en':
          'Here will be dialogs generated via learning couses. Get your first course',
      'pt':
          'Aqui serão gerados diálogos por meio de cursos de aprendizagem. Faça seu primeiro curso',
    },
    'jop6hys3': {
      'en': 'Chats',
      'pt': 'Bate-papo',
    },
  },
  // AwardsPage
  {
    '6w4bxl3k': {
      'en': 'Awards',
      'pt': 'Prêmios',
    },
    'ne9usfh1': {
      'en': 'All',
      'pt': 'Todos',
    },
    '0yktlrpb': {
      'en': 'Here will be your rewards. Never stop there!',
      'pt': 'Aqui estarão suas recompensas. Nunca pare por aí!',
    },
    'e1wgj2bj': {
      'en': 'Received',
      'pt': 'Recebido',
    },
    '4syr73z7': {
      'en': 'Here will be your rewards. Never stop there!',
      'pt': 'Aqui estarão suas recompensas. Nunca pare por aí!',
    },
    'pl8da7jy': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // ProfileInformationPage
  {
    'pmly9s4i': {
      'en': 'Change profile photo',
      'pt': 'Alterar foto do perfil',
    },
    'nhc85mlw': {
      'en': 'Name',
      'pt': '',
    },
    '927rqdqk': {
      'en': 'Surname',
      'pt': '',
    },
    'vk5shpml': {
      'en': 'Date of birth',
      'pt': '',
    },
    'az643pyc': {
      'en': 'Email',
      'pt': '',
    },
    '8nkcwyaz': {
      'en': 'Country',
      'pt': '',
    },
    'agq1dzv8': {
      'en': 'Option 1',
      'pt': '',
    },
    'hulc9ekj': {
      'en': 'Search for a country...',
      'pt': '',
    },
    'nkpyjpd3': {
      'en': 'Partner club',
      'pt': 'clube parceiro',
    },
    '8qv95q4m': {
      'en': 'SC Braga',
      'pt': 'SC Braga',
    },
    'qv326bp9': {
      'en': 'SC Braga',
      'pt': 'SC Braga',
    },
    'klzcrk1p': {
      'en': 'Search for an item...',
      'pt': 'Procurar um item...',
    },
    'hbc22q1x': {
      'en': 'The partner club confirmed your identity',
      'pt': 'O clube parceiro confirmou sua identidade',
    },
    'm0zzen9d': {
      'en': 'Save',
      'pt': 'Salvar',
    },
    'kjdp6t16': {
      'en': 'Edit',
      'pt': 'Editar',
    },
    '5iqcqdq1': {
      'en': 'Personal data',
      'pt': 'Dados pessoais',
    },
    'x0tt1spg': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // ChangeLanguagePage
  {
    'l8tsrbcd': {
      'en': 'Current language',
      'pt': 'Idioma atual',
    },
    'labfppjr': {
      'en': 'Language',
      'pt': 'Linguagem',
    },
    'exm8rn9d': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // PrivacyPage
  {
    '4e28xqah': {
      'en':
          'You can enable face id or touch id login, or disable additional login protection.',
      'pt':
          'Você pode ativar o login de identificação facial ou de identificação por toque ou desativar a proteção de login adicional.',
    },
    '2qecuteg': {
      'en': 'Biometrics',
      'pt': 'biometria',
    },
    'pn47iknh': {
      'en': 'Login via Face ID, fingerprint',
      'pt': 'Login via Face ID, impressão digital',
    },
    'jbevwjjw': {
      'en': 'Privacy',
      'pt': 'Privacidade',
    },
    'jkylk2oy': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // ConfirmDeleteAccount
  {
    'jmv4l05e': {
      'en':
          'If you delete your account, all your learning progress, chats, rewards, and personal information will be permanently deleted. If your personal details have changed or you have moved to another club, you can change them in your profile settings.',
      'pt':
          'Se você excluir sua conta, todo o seu progresso de aprendizado, bate-papos, recompensas e informações pessoais serão excluídos permanentemente. Se seus dados pessoais foram alterados ou você se mudou para outro clube, você pode alterá-los nas configurações do seu perfil.',
    },
    'yhlbxk9u': {
      'en': 'Are you sure you want to delete your profile permanently?',
      'pt': 'Tem certeza de que deseja excluir seu perfil permanentemente?',
    },
    '1gk47n4t': {
      'en': 'Maybe you want to log out?',
      'pt': 'Talvez você queira sair?',
    },
    '15536n8x': {
      'en': 'Cancel',
      'pt': 'Cancelar',
    },
    '8457nxfx': {
      'en': 'Delete account',
      'pt': 'Deletar conta',
    },
    '7rjt7t4l': {
      'en': 'Delete account',
      'pt': 'Deletar conta',
    },
    '4trvjezi': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // SmsCodeDeleteAccount
  {
    'tuuw8mjc': {
      'en': 'You are going to delete your account',
      'pt': 'Você vai deletar sua conta',
    },
    'tctz8528': {
      'en':
          'We have sent a verification code to your mail. Confirm account deletion by entering this code',
      'pt':
          'Enviamos um código de verificação para o seu e-mail. Confirme a exclusão da conta digitando este código',
    },
    'vafslprf': {
      'en': 'Verification code',
      'pt': 'Código de verificação',
    },
    'pq9urqun': {
      'en': 'Send again',
      'pt': 'Envie novamente',
    },
    'y10us7m9': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // NotificationSettingsPage
  {
    'slbv5yv1': {
      'en': 'Receiving notifications',
      'pt': 'Recebendo notificações',
    },
    '0glh09vw': {
      'en':
          'Choose where you want to receive notifications. One option must be selected',
      'pt':
          'Escolha onde deseja receber as notificações. Uma opção deve ser selecionada',
    },
    'dn3eudhu': {
      'en': 'Push-messages',
      'pt': 'mensagens push',
    },
    '7bivzc62': {
      'en': 'Email',
      'pt': 'E-mail',
    },
    'bs683tci': {
      'en': 'Badges',
      'pt': 'Distintivos',
    },
    'x15go6zf': {
      'en': 'Notification type',
      'pt': 'Tipo de notificação',
    },
    'd89tzpb2': {
      'en':
          'Choose which notifications you want to receive. You can\'t opt ​​out of receiving system notifications',
      'pt':
          'Escolha quais notificações deseja receber. Você não pode optar por não receber notificações do sistema',
    },
    '622k4qtj': {
      'en': 'New messages',
      'pt': 'Novas mensagens',
    },
    'th5r4ndt': {
      'en': 'New courses',
      'pt': 'Novos cursos',
    },
    '1crwy0b3': {
      'en': 'System alerts',
      'pt': 'Alertas do sistema',
    },
    '3zkc1lnh': {
      'en': 'Notifications',
      'pt': 'Notificações',
    },
    'yzc1cp53': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // ContactSupportPage
  {
    '0lhd74ld': {
      'en':
          'If you have any difficulties, suggestions or questions, please contact us by e-mail:',
      'pt':
          'Se você tiver alguma dificuldade, sugestão ou dúvida, entre em contato conosco pelo e-mail:',
    },
    '8d7cd4t9': {
      'en': 'hello@onetwoonetwo.app',
      'pt': 'hello@onetwoonetwo.app',
    },
    '3z6ihlkv': {
      'en': 'We will resolve your issue as soon as possible!',
      'pt': 'Resolveremos seu problema o mais rápido possível!',
    },
    '9b9ars4u': {
      'en': 'Contact support',
      'pt': 'Entre em contato com o suporte',
    },
    '37h0ko6h': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // AboutPage
  {
    'jofz46na': {
      'en': 'Version 1.0',
      'pt': 'Versão 1.0',
    },
    '0uy9mibf': {
      'en': 'Terms of use',
      'pt': 'Termos de uso',
    },
    'g6gk7qsy': {
      'en': 'Privacy Policy',
      'pt': 'política de Privacidade',
    },
    '0diy3ogt': {
      'en': 'Create by awesome people\nOneTwoOneTwo inc',
      'pt': 'Criado por pessoas incríveis\nOneTwoOneTwo inc',
    },
    't1i63xov': {
      'en': 'About us',
      'pt': 'Sobre nós',
    },
    'wmc7ru66': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // AdminPanel
  {
    '26cohstp': {
      'en': 'Back',
      'pt': '',
    },
    '1gem4l6s': {
      'en': 'Players',
      'pt': 'Jogadoras',
    },
    'kii4pk4u': {
      'en': 'Control your players',
      'pt': 'Controle seus jogadores',
    },
    'h0jvzgs3': {
      'en': 'Courses',
      'pt': 'Cursos',
    },
    'u3uljqa3': {
      'en': 'Control your courses',
      'pt': 'Controle seus cursos',
    },
    '1adfguzh': {
      'en': 'Club\'s updates',
      'pt': 'Controle seus cursos',
    },
    'cuu93mbp': {
      'en': 'My players',
      'pt': 'meus jogadores',
    },
    '9sjfbg67': {
      'en': 'Players pending',
      'pt': 'Jogadores pendentes',
    },
    'jtyipt83': {
      'en': 'Create course',
      'pt': '',
    },
    'z6o12fln': {
      'en': 'Coming soon',
      'pt': '',
    },
    't3m3hhql': {
      'en': 'Coming soon',
      'pt': '',
    },
    'dh3xcfz4': {
      'en': 'Players',
      'pt': 'Jogadoras',
    },
    'ohbvkapd': {
      'en': 'Control your players',
      'pt': 'Controle seus jogadores',
    },
    'sb9hnaz5': {
      'en': 'Courses',
      'pt': 'Cursos',
    },
    '0ixoh4n7': {
      'en': 'Control your courses',
      'pt': 'Controle seus cursos',
    },
    '6i5mes92': {
      'en': 'Club\'s updates',
      'pt': 'Controle seus cursos',
    },
    '88bgedku': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // ListOfPlayers
  {
    '2l05kr0h': {
      'en': 'Club\'s players',
      'pt': 'jogadores do clube',
    },
    'vn4sqofl': {
      'en': 'My players',
      'pt': 'meus jogadores',
    },
    '8z1xu7f7': {
      'en': 'Players pending',
      'pt': 'Jogadores pendentes',
    },
    'sua3o2pb': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // ListOfCourses
  {
    'h30l6asq': {
      'en': 'Club\'s courses',
      'pt': 'cursos do clube',
    },
    'tn6oax1u': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // ListOfModules
  {
    'k6bwn7ru': {
      'en': 'Club\'s courses',
      'pt': 'cursos do clube',
    },
    'jnuo31p7': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // ListOfChats
  {
    'f8aao7my': {
      'en': 'Lessons',
      'pt': 'Lições',
    },
    'ejupsh5h': {
      'en': 'Bots',
      'pt': 'robôs',
    },
    'p2e53omg': {
      'en': 'Create bot',
      'pt': 'criar bot',
    },
    '337xdtb7': {
      'en': 'Tactics',
      'pt': 'táticas',
    },
    'btwp0ld8': {
      'en': 'Create tactic',
      'pt': 'Criar tática',
    },
    'ksskwku2': {
      'en': 'Home',
      'pt': 'Lar',
    },
  },
  // EmailReg
  {
    'ezwtcnxk': {
      'en': 'Let’s get started!',
      'pt': '',
    },
    'bftd0qdc': {
      'en': 'Please, enter your email ',
      'pt': 'Por favor introduza o seu e-mail',
    },
    'pg1eqvo8': {
      'en': 'E-mail',
      'pt': 'E-mail',
    },
    'l5ha4aqv': {
      'en': 'I agree with the ',
      'pt': 'eu concordo com o',
    },
    'jyv0416l': {
      'en': 'Terms of Use ',
      'pt': 'Termos de uso',
    },
    'tvmjyfnw': {
      'en': 'and ',
      'pt': 'e',
    },
    'd4ure36t': {
      'en': 'Privacy policy',
      'pt': 'Política de Privacidade',
    },
    'smskg9zw': {
      'en': 'Home',
      'pt': '',
    },
  },
  // BackComponent
  {
    '8phsrsaz': {
      'en': 'Back',
      'pt': 'Voltar',
    },
  },
  // PrivacyPolicy
  {
    '820lntc2': {
      'en': 'Back',
      'pt': 'Voltar',
    },
    'xfqhcceq': {
      'en': 'Terms of Use',
      'pt': 'Termos de uso',
    },
    'f7z5egsj': {
      'en': 'Effective January 1, 2023.',
      'pt': 'A partir de 1º de janeiro de 2023.',
    },
    'r34rh0ig': {
      'en': 'Acceptable Use Policy',
      'pt': 'Política de Utilização Aceitável',
    },
    'dhg6kjbf': {
      'en': 'Copyright and Trademark Policy',
      'pt': 'Política de direitos autorais e marcas registradas',
    },
    'iyo4i2gu': {
      'en': 'Paymants and Refund Policy',
      'pt': 'Pagadores e Política de Reembolso',
    },
    'tvfm42x9': {
      'en': 'Revisions',
      'pt': 'Revisões',
    },
    '90owo165': {
      'en': 'Thank you for using OneTwo!',
      'pt': 'Obrigado por usar o OneTwo!',
    },
    'af0vodmi': {
      'en':
          'These Terms of Use (\"Terms\") govern your use of our website, apps, and other products and services (\"Services\"). As some of our Services may be software that is downloaded to your computer, phone, tablet, or other device, you agree that we may automatically update this software, and that these Terms will apply to such updates. Please read these Terms carefully, and contact us if you have any questions, requests for information, or complaints. By clicking “I accept” (or for those who have not yet created an account, by using our Services), you agree to be bound by these Terms, including the policies referenced in these Terms. By using our Services, you agree to be bound by these Terms, including the policies referenced in these Terms. These Terms of Use (\"Terms\") govern your use of our website, apps, and other products and services (\"Services\"). As some of our Services may be software that is downloaded to your computer, phone, tablet, or other device, you agree that we may automatically update this software, and that these Terms will apply to such updates. Please read these Terms carefully, and contact us if you have any questions, requests for information, or complaints. By clicking “I accept” (or for those who have not yet created an account, by using our Services), you agree to be bound by these Terms, including the policies referenced in these Terms. By using our Services, you agree to be bound by these Terms, including the policies referenced in these Terms.',
      'pt':
          'Estes Termos de Uso (\"Termos\") regem o uso de nosso site, aplicativos e outros produtos e serviços (\"Serviços\"). Como alguns de nossos Serviços podem ser software baixado em seu computador, telefone, tablet ou outro dispositivo, você concorda que podemos atualizar automaticamente esse software e que estes Termos se aplicam a essas atualizações. Por favor, leia estes Termos cuidadosamente e entre em contato conosco se tiver alguma dúvida, solicitação de informação ou reclamação. Ao clicar em “Aceito” (ou para aqueles que ainda não criaram uma conta, ao usar nossos Serviços), você concorda em ficar vinculado a estes Termos, incluindo as políticas mencionadas nestes Termos. Ao usar nossos Serviços, você concorda em estar vinculado a estes Termos, incluindo as políticas mencionadas nestes Termos. Estes Termos de Uso (\"Termos\") regem o uso de nosso site, aplicativos e outros produtos e serviços (\"Serviços\"). Como alguns de nossos Serviços podem ser software baixado em seu computador, telefone, tablet ou outro dispositivo, você concorda que podemos atualizar automaticamente esse software e que estes Termos se aplicam a essas atualizações. Por favor, leia estes Termos cuidadosamente e entre em contato conosco se tiver alguma dúvida, solicitação de informação ou reclamação. Ao clicar em “Aceito” (ou para aqueles que ainda não criaram uma conta, ao usar nossos Serviços), você concorda em ficar vinculado a estes Termos, incluindo as políticas mencionadas nestes Termos. Ao usar nossos Serviços, você concorda em estar vinculado a estes Termos, incluindo as políticas mencionadas nestes Termos.',
    },
  },
  // EnterPin
  {
    't8h13wh6': {
      'en': 'Enter your pin code',
      'pt': 'Digite seu código PIN',
    },
    '9m0srlue': {
      'en': '1',
      'pt': '1',
    },
    'xgt1el95': {
      'en': '2',
      'pt': '2',
    },
    'ld04fzx1': {
      'en': '3',
      'pt': '3',
    },
    'pqcz2wlz': {
      'en': '4',
      'pt': '4',
    },
    '0pposqbz': {
      'en': '5',
      'pt': '5',
    },
    'cmmc16qf': {
      'en': '6',
      'pt': '6',
    },
    'k48tx19j': {
      'en': '7',
      'pt': '7',
    },
    'xi3lm4yu': {
      'en': '8',
      'pt': '8',
    },
    '5fri9l2n': {
      'en': '9',
      'pt': '9',
    },
    'n9046amm': {
      'en': 'Please authenticate yourself to continue using the app',
      'pt': 'Autentique-se para continuar usando o aplicativo',
    },
    'o1yqepko': {
      'en': '0',
      'pt': '0',
    },
  },
  // bubbleMessage
  {
    'bxhne8m4': {
      'en': '18:47',
      'pt': '18:47',
    },
  },
  // CreateTactic
  {
    'dqfjz0co': {
      'en': 'Create Tactic',
      'pt': 'Criar Tática',
    },
    '5ndibs27': {
      'en': 'Upload',
      'pt': 'Carregar',
    },
    'a75lyj33': {
      'en': 'Name tactic',
      'pt': 'Tática de nome',
    },
    'yuqorxtu': {
      'en': 'Description',
      'pt': 'Descrição',
    },
    'clwp2171': {
      'en': 'Points',
      'pt': 'Ponts',
    },
    'mfr0pa2e': {
      'en': 'Create tactic',
      'pt': 'Criar tática',
    },
  },
  // RestartCourseComponent
  {
    '7xp27sou': {
      'en': 'This course will be restarted',
      'pt': 'Este curso será reiniciado',
    },
    'y98p67xa': {
      'en':
          'You can practice communicating with different people and replay chats as many times as you like! Are you sure that you want to restart the course?',
      'pt':
          'Você pode praticar a comunicação com pessoas diferentes e repetir os bate-papos quantas vezes quiser! Tem certeza de que deseja reiniciar o curso?',
    },
    'muljvx99': {
      'en': 'Cancel restart',
      'pt': 'Cancelar reinício',
    },
  },
  // Wantu
  {
    '10iv6ogl': {
      'en': 'Wantu',
      'pt': 'Wantu',
    },
    '7kj9jtdi': {
      'en': 'Your helper',
      'pt': 'seu ajudante',
    },
    'xrr5i0rp': {
      'en':
          'Hi! I am Wantu, your assistant. \nIf you don’t know how to answer correctly, you can call me for help, and I will give you a hint.\n Do you need a hint?',
      'pt':
          'Oi! Eu sou Wantu, seu assistente.\nSe você não souber responder corretamente, pode me chamar pedindo ajuda, que eu dou uma dica.\nVocê precisa de uma dica?',
    },
    'qxd0pme4': {
      'en': 'Not now, thanks',
      'pt': 'Agora não, obrigado',
    },
  },
  // courseInformation
  {
    'sg0e7up1': {
      'en': 'The course included',
      'pt': 'O curso incluiu',
    },
    'gl3d68cx': {
      'en': 'Your mentors in chats',
      'pt': 'Seus mentores em chats',
    },
    'hsjd7orb': {
      'en': 'Close',
      'pt': 'Fechar',
    },
  },
  // confirmRestart
  {
    'ddyvyld1': {
      'en':
          'Are you sure you want to start the course from the beginning? all your success will be erased',
      'pt':
          'Tem certeza de que deseja iniciar o curso desde o início? todo o seu sucesso será apagado',
    },
    'qy42pk5y': {
      'en': 'Close',
      'pt': 'Fechar',
    },
  },
  // moduleDetailPage
  {
    'ymq3ttbr': {
      'en':
          'You can practice communicating with different people and replay chats as many times as you like! Are you sure that you want to restart the course?',
      'pt':
          'Você pode praticar a comunicação com pessoas diferentes e repetir os bate-papos quantas vezes quiser! Tem certeza de que deseja reiniciar o curso?',
    },
    'el14f8hn': {
      'en': 'Close',
      'pt': 'Fechar',
    },
  },
  // confirmModuleRestart
  {
    'eknzvh8c': {
      'en':
          'Are you sure you want to start the module from the beginning? all your success will be erased',
      'pt':
          'Tem certeza de que deseja iniciar o módulo desde o início? todo o seu sucesso será apagado',
    },
    '5mr5gq0h': {
      'en': 'Close',
      'pt': 'Fechar',
    },
  },
  // NoAwards
  {
    'c72gk5y1': {
      'en':
          'Here will be your rewards. Complete the course and earn your first reward!',
      'pt':
          'Aqui estarão suas recompensas. Conclua o curso e ganhe sua primeira recompensa!',
    },
  },
  // AboutPoints
  {
    'gynzmlv8': {
      'en': 'About points',
      'pt': 'Sobre pontos',
    },
    '4vwhv4wb': {
      'en':
          'You earn points for completing courses. The more you do, the more points you get. Now you can store them in your profile but later on we’ll add some great features for you to exchange them. Thanks for waiting!',
      'pt':
          'Você ganha pontos por concluir os cursos. Quanto mais você fizer, mais pontos você ganha. Agora você pode armazená-los em seu perfil, mas mais tarde adicionaremos alguns ótimos recursos para você trocá-los. Obrigado por esperar!',
    },
  },
  // AwardInformation
  {
    '5g6eywxi': {
      'en': 'Sport ethics course',
      'pt': 'Curso de Ética Desportiva',
    },
    'fxtownd4': {
      'en': 'Module 1 ',
      'pt': 'Módulo 1',
    },
    'viw4yjq4': {
      'en':
          'Congratulations! You took a course in business etiquette. Now you are definitely ready to communicate with journalists and agents. ',
      'pt':
          'Parabéns! Você fez um curso de etiqueta empresarial. Agora você está definitivamente pronto para se comunicar com jornalistas e agentes.',
    },
    '0w9j6a2l': {
      'en': 'Close',
      'pt': 'Fechar',
    },
    'er55b4zl': {
      'en': 'Share',
      'pt': 'Compartilhar',
    },
  },
  // successEditComponent
  {
    'rt7975ym': {
      'en': 'Personal data is successfully changed',
      'pt': 'Os dados pessoais foram alterados com sucesso',
    },
  },
  // ConfirmLogout
  {
    '5vt6fwlq': {
      'en': 'Are you sure that you want to log out?',
      'pt': 'Tem certeza de que deseja sair?',
    },
    'n2yrfhkw': {
      'en': 'Cancel',
      'pt': 'Cancelar',
    },
  },
  // TermsOfUse
  {
    'd4stdlww': {
      'en': 'Terms of Use',
      'pt': 'Termos de uso',
    },
    'xoujq3ud': {
      'en': 'Effective January 1, 2023.',
      'pt': 'A partir de 1º de janeiro de 2023.',
    },
    'aa4hv23b': {
      'en': 'Acceptable Use Policy',
      'pt': 'Política de Utilização Aceitável',
    },
    '34p526aq': {
      'en': 'Copyright and Trademark Policy',
      'pt': 'Política de direitos autorais e marcas registradas',
    },
    'vwlebrfk': {
      'en': 'Paymants and Refund Policy',
      'pt': 'Pagadores e Política de Reembolso',
    },
    'hcpl2pof': {
      'en': 'Revisions',
      'pt': 'Revisões',
    },
    '0onfjvly': {
      'en': 'Thank you for using OneTwo!',
      'pt': 'Obrigado por usar o OneTwo!',
    },
    'ujo1p3t9': {
      'en':
          'These Terms of Use (\"Terms\") govern your use of our website, apps, and other products and services (\"Services\"). As some of our Services may be software that is downloaded to your computer, phone, tablet, or other device, you agree that we may automatically update this software, and that these Terms will apply to such updates. Please read these Terms carefully, and contact us if you have any questions, requests for information, or complaints. By clicking “I accept” (or for those who have not yet created an account, by using our Services), you agree to be bound by these Terms, including the policies referenced in these Terms. By using our Services, you agree to be bound by these Terms, including the policies referenced in these Terms. These Terms of Use (\"Terms\") govern your use of our website, apps, and other products and services (\"Services\"). As some of our Services may be software that is downloaded to your computer, phone, tablet, or other device, you agree that we may automatically update this software, and that these Terms will apply to such updates. Please read these Terms carefully, and contact us if you have any questions, requests for information, or complaints. By clicking “I accept” (or for those who have not yet created an account, by using our Services), you agree to be bound by these Terms, including the policies referenced in these Terms. By using our Services, you agree to be bound by these Terms, including the policies referenced in these Terms.',
      'pt':
          'Estes Termos de Uso (\"Termos\") regem o uso de nosso site, aplicativos e outros produtos e serviços (\"Serviços\"). Como alguns de nossos Serviços podem ser software baixado em seu computador, telefone, tablet ou outro dispositivo, você concorda que podemos atualizar automaticamente esse software e que estes Termos se aplicam a essas atualizações. Por favor, leia estes Termos cuidadosamente e entre em contato conosco se tiver alguma dúvida, solicitação de informação ou reclamação. Ao clicar em “Aceito” (ou para aqueles que ainda não criaram uma conta, ao usar nossos Serviços), você concorda em ficar vinculado a estes Termos, incluindo as políticas mencionadas nestes Termos. Ao usar nossos Serviços, você concorda em estar vinculado a estes Termos, incluindo as políticas mencionadas nestes Termos. Estes Termos de Uso (\"Termos\") regem o uso de nosso site, aplicativos e outros produtos e serviços (\"Serviços\"). Como alguns de nossos Serviços podem ser software baixado em seu computador, telefone, tablet ou outro dispositivo, você concorda que podemos atualizar automaticamente esse software e que estes Termos se aplicam a essas atualizações. Por favor, leia estes Termos cuidadosamente e entre em contato conosco se tiver alguma dúvida, solicitação de informação ou reclamação. Ao clicar em “Aceito” (ou para aqueles que ainda não criaram uma conta, ao usar nossos Serviços), você concorda em ficar vinculado a estes Termos, incluindo as políticas mencionadas nestes Termos. Ao usar nossos Serviços, você concorda em estar vinculado a estes Termos, incluindo as políticas mencionadas nestes Termos.',
    },
  },
  // UploadImage
  {
    '6egta6pw': {
      'en': 'Cancel',
      'pt': 'Cancelar',
    },
    '61ggbywu': {
      'en': 'Take a photo',
      'pt': 'Tire uma foto',
    },
    'gv1m3b8h': {
      'en': 'Choose from library',
      'pt': 'Escolha da Biblioteca',
    },
    'vubg5dh5': {
      'en': 'Cancel',
      'pt': 'Cancelar',
    },
  },
  // LanguageBottomSheet
  {
    '4obzeod4': {
      'en': 'Choose app language',
      'pt': '',
    },
    'y23fie3o': {
      'en': 'English',
      'pt': 'Inglês',
    },
    'gug2lsa1': {
      'en': 'Portuguese',
      'pt': 'Português',
    },
    'hxgd7wq3': {
      'en': 'Confirm',
      'pt': 'Confirme',
    },
  },
  // CountryBottomSheet
  {
    '14g8g4fg': {
      'en': 'Choose your country',
      'pt': '',
    },
    'c4havl9i': {
      'en': 'Confirm',
      'pt': 'Confirme',
    },
  },
  // Miscellaneous
  {
    'lyeystjf': {
      'en': 'Label here...',
      'pt': 'Marque aqui...',
    },
    '5zlpv4ya': {
      'en':
          'This app requires permissions to perform a biometric verification.',
      'pt':
          'Este aplicativo requer permissões para realizar uma verificação biométrica.',
    },
    '163gcxt1': {
      'en':
          'In order to take a picture or video, this app requires permission to access the camera.',
      'pt':
          'Para tirar uma foto ou gravar um vídeo, este aplicativo requer permissão para acessar a câmera.',
    },
    'ch3yqrja': {
      'en':
          'In order to upload data, this app requires permission to access the photo library.',
      'pt':
          'Para fazer upload de dados, este aplicativo requer permissão para acessar a biblioteca de fotos.',
    },
    '0zti3km6': {
      'en': '',
      'pt': 'Error',
    },
    'bzyo2m83': {
      'en': 'Password reset email sent!',
      'pt': 'E-mail de redefinição de senha enviado!',
    },
    '9m4fzwgp': {
      'en': 'Email required!',
      'pt': 'Email (obrigatório!',
    },
    'colzdk7g': {
      'en': 'Phone number required and has to start with +',
      'pt': 'Número de telefone obrigatório e deve começar com +',
    },
    'b4irxrri': {
      'en': 'Passswords dont match',
      'pt': 'As senhas não correspondem',
    },
    's6l57hru': {
      'en': 'Enter SMS code',
      'pt': 'Digite o código SMS',
    },
    'gxqycvac': {
      'en':
          'Too long since most recent sign in. Sign in again before deleting your account',
      'pt':
          'Muito tempo desde o login mais recente. Faça login novamente antes de excluir sua conta',
    },
    'qi1407hl': {
      'en': 'Too long since most recent sign in.',
      'pt': 'Muito tempo desde o login mais recente.',
    },
    '83p37da9': {
      'en': 'Email chage confirmation email sent!',
      'pt': 'E-mail de confirmação de alteração de e-mail enviado!',
    },
    'a34vdq4p': {
      'en': 'Invalid file format',
      'pt': 'Formato de arquivo inválido',
    },
    'iqmta15s': {
      'en': 'Uploading...',
      'pt': 'Enviando...',
    },
    'sdhezp8d': {
      'en': 'Success!',
      'pt': 'Sucesso!',
    },
    'oe5774fc': {
      'en': 'Failed!',
      'pt': 'Fracassado!',
    },
    'cejrb3dh': {
      'en': '',
      'pt': '',
    },
    '0lvlzg17': {
      'en': 'Choose source',
      'pt': 'Escolha a fonte',
    },
    'l3hbrsac': {
      'en': 'Gallery',
      'pt': 'Galeria',
    },
    'f4lhsoj0': {
      'en': 'Gallery',
      'pt': 'Galeria',
    },
    'ojqt1tmn': {
      'en': 'Gallery',
      'pt': 'Galeria',
    },
    'mzyhrefx': {
      'en': 'Camera',
      'pt': 'Câmera',
    },
    'vm5kim03': {
      'en': '',
      'pt': '',
    },
    'tva71nbf': {
      'en': '',
      'pt': '',
    },
    'jwwctcq7': {
      'en': '',
      'pt': '',
    },
    'elmuqs5n': {
      'en': '',
      'pt': '',
    },
  },
].reduce((a, b) => a..addAll(b));
