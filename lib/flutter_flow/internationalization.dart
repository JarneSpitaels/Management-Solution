import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations);

  static List<String> languages() => ['en', 'nl'];

  String get languageCode => locale.languageCode;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.languageCode] ?? '';

  String getVariableText({
    String enText = '',
    String nlText = '',
  }) =>
      [enText, nlText][languageIndex] ?? '';
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      FFLocalizations.languages().contains(locale.languageCode);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Splashscreen
  {
    '6pfkexxv': {
      'en': 'Management Solution',
      'nl': '',
    },
    'lcv3pqed': {
      'en': 'Home',
      'nl': '',
    },
  },
  // Login
  {
    'wf261594': {
      'en': 'Welcome To',
      'nl': 'Welkom bij',
    },
    'sgegagl9': {
      'en': 'Login',
      'nl': 'Log in',
    },
    '9zllmc1q': {
      'en': 'Login',
      'nl': 'Log in',
    },
    'cbg99ylj': {
      'en': 'Enter your details to continue.',
      'nl': 'Vul je gegevens in om verder te gaan.',
    },
    'lcfwag04': {
      'en': 'Email Address',
      'nl': 'E-mailadres',
    },
    '6go2n43u': {
      'en': 'Enter your email here...',
      'nl': 'Vul je email hier in...',
    },
    'jwejpc2m': {
      'en': 'Password',
      'nl': 'Wachtwoord',
    },
    'b49ke9go': {
      'en': 'Enter your email here...',
      'nl': 'Vul je email hier in...',
    },
    '94fezzyy': {
      'en': 'Login',
      'nl': 'Log in',
    },
    'cu49p9vk': {
      'en': 'Forgot password?',
      'nl': '',
    },
    '496kq7hq': {
      'en': 'Login as guest',
      'nl': 'Log in als gast',
    },
    'rtyw1ix1': {
      'en': 'Create Account',
      'nl': 'Maak account',
    },
    'tgyasntq': {
      'en': 'Create Account',
      'nl': 'Maak account',
    },
    '6si8tgux': {
      'en': 'Enter the information below to get started.',
      'nl': 'Vul onderstaande gegevens in om aan de slag te gaan.',
    },
    '0ygonttg': {
      'en': 'Email Address',
      'nl': 'E-mailadres',
    },
    'b7do8th8': {
      'en': 'Enter your email here...',
      'nl': 'Vul je email hier in...',
    },
    '3qouv7jw': {
      'en': 'Password',
      'nl': 'Wachtwoord',
    },
    '2rnmtghi': {
      'en': 'Enter your password',
      'nl': 'Voer uw wachtwoord in',
    },
    'wec194tw': {
      'en': 'Confirm Password',
      'nl': 'bevestig wachtwoord',
    },
    'qnhcyxyl': {
      'en': 'Enter the same password as above.',
      'nl': 'Voer hetzelfde wachtwoord in als hierboven.',
    },
    'tp7ywc5w': {
      'en': 'Create Account',
      'nl': 'Maak account',
    },
    '0ibi2696': {
      'en': 'Home',
      'nl': '',
    },
  },
  // home
  {
    'idns1t19': {
      'en': 'Welcome,',
      'nl': 'Welkom,',
    },
    'yiqqaui9': {
      'en': 'Team Quivvy',
      'nl': 'Team Quivvy',
    },
    '1l9887t3': {
      'en': 'This weeks spending',
      'nl': 'Deze week uitgaven',
    },
    'hpncpj04': {
      'en': '€ 130',
      'nl': '€ 130',
    },
    '9lyll4nw': {
      'en': '4 credits',
      'nl': '4 credits',
    },
    '4uyu58wh': {
      'en': 'More details',
      'nl': 'Meer details',
    },
    'ehuw82ag': {
      'en': 'Overview',
      'nl': 'Overzicht',
    },
    'w99szdju': {
      'en': 'Food & Drinks',
      'nl': 'Eten en drinken',
    },
    '4701ed6e': {
      'en': 'Reservations',
      'nl': 'Reserveringen',
    },
    'xctujbwg': {
      'en': 'Events',
      'nl': 'Evenementen',
    },
    '5f26u8d6': {
      'en': 'Recent Spendings',
      'nl': 'Recente uitgaven',
    },
    'v9yf2asg': {
      'en': 'Beer',
      'nl': 'Bier',
    },
    'lwwcux1b': {
      'en': '3 x',
      'nl': '3x',
    },
    'dt2ql7lw': {
      'en': '-€3',
      'nl': '-€ 3',
    },
    'wya1s754': {
      'en': 'Honesty Bar',
      'nl': 'Honesty Bar',
    },
    'dv2j4nbc': {
      'en': 'Coffee',
      'nl': 'Koffie',
    },
    'hmgz3fwy': {
      'en': '1 x',
      'nl': '1 x',
    },
    'ivft90cl': {
      'en': '-€1',
      'nl': '-€ 1',
    },
    'yj0cxjws': {
      'en': 'Kohezie',
      'nl': '',
    },
    'vumw5jm5': {
      'en': 'MR4 Mich',
      'nl': '',
    },
    'kukzd5nz': {
      'en': '1 hour | Room',
      'nl': '1 uur | Kamer',
    },
    '2jum16ro': {
      'en': '-1 credit',
      'nl': '-1 credit',
    },
    'q3ac0yuf': {
      'en': 'Kohezie',
      'nl': 'Kohezie',
    },
    'y1r2ntsx': {
      'en': 'Deliveroo',
      'nl': 'Deliveroo',
    },
    '7gwjdac5': {
      'en': 'Kastard',
      'nl': 'Kastard',
    },
    '014tkv96': {
      'en': '-€25',
      'nl': '-€ 25',
    },
    'ni34n5en': {
      'en': 'Honesty Bar',
      'nl': 'Honesty Bar',
    },
    'uacrnz77': {
      'en': 'Home',
      'nl': '',
    },
  },
  // Drinksandfood
  {
    'pu3j79z4': {
      'en': 'BUY',
      'nl': 'KOPEN',
    },
    '7kfk3kfe': {
      'en': 'Honesty Bar',
      'nl': '',
    },
    'psdh9e34': {
      'en': 'Search food, drinks...',
      'nl': 'Zoek eten, drinken...',
    },
    'wkb2m77d': {
      'en': 'Drinks',
      'nl': 'Drankjes',
    },
  },
  // NotificationSettings
  {
    'qh7zxd1v': {
      'en': 'Notifications settings',
      'nl': 'Instellingen voor meldingen',
    },
    'wfttqt8w': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'nl':
          'Kies hieronder welke meldingen je wilt ontvangen en we zullen de instellingen updaten.',
    },
    'm6j2h737': {
      'en': 'Push Notifications',
      'nl': 'Pushmeldingen',
    },
    'c4lonxmg': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'nl': 'Ontvang semi-regelmatig pushmeldingen van onze applicatie.',
    },
    'dj0i6npt': {
      'en': 'Email Notifications',
      'nl': 'E-mail notificaties',
    },
    's0hp46w6': {
      'en':
          'Receive email notifications from our marketing team about new features.',
      'nl':
          'Ontvang e-mailmeldingen van ons marketingteam over nieuwe functies.',
    },
    'rwxchra7': {
      'en': 'Location Services',
      'nl': 'Locatiediensten',
    },
    '3egvsz1x': {
      'en':
          'Allow us to track your location, this helps keep track of spending and keeps you safe.',
      'nl':
          'Sta ons toe uw locatie te volgen, dit helpt bij het bijhouden van uitgaven en houdt u veilig.',
    },
    'fe1go3m1': {
      'en': 'Settings',
      'nl': 'Instellingen',
    },
  },
  // Item
  {
    'w1ghshwf': {
      'en': 'Cola',
      'nl': 'cola',
    },
    '4b5wu12r': {
      'en': '€1',
      'nl': '€1',
    },
    'ambdnlrh': {
      'en':
          'Coca-Cola, or Coke, is a carbonated soft drink manufactured by The Coca-Cola Company.',
      'nl':
          'Coca-Cola, of Coke, is een koolzuurhoudende frisdrank vervaardigd door The Coca-Cola Company.',
    },
    'pi7yvdvp': {
      'en': 'Myself',
      'nl': 'Mezelf',
    },
    '0uc2v1uo': {
      'en': 'Team',
      'nl': 'Team',
    },
    'baxn0yz3': {
      'en': '1',
      'nl': '1',
    },
    'al8j316a': {
      'en': 'Add to Cart (€1.00)',
      'nl': 'Toevoegen aan winkelwagen (€ 1,00)',
    },
    '4xiinlks': {
      'en': 'Home',
      'nl': '',
    },
  },
  // SettingsPage
  {
    'tq4hat8b': {
      'en': 'Edit Profile',
      'nl': 'Bewerk profiel',
    },
    'wsv8wmev': {
      'en': 'Change Password',
      'nl': 'Wijzig wachtwoord',
    },
    'w7e0uhc9': {
      'en': 'Notification Settings',
      'nl': 'Notificatie instellingen',
    },
    '8kbmnk0e': {
      'en': 'Terms of Services',
      'nl': 'Servicevoorwaarden',
    },
    'kxk8v018': {
      'en': 'Log Out',
      'nl': 'Uitloggen',
    },
    'c5nzmm88': {
      'en': 'Settings',
      'nl': '',
    },
  },
  // ForgotPassword
  {
    'umymqi43': {
      'en': 'Forgot password?',
      'nl': 'Log in als gast',
    },
    '58kdbn2m': {
      'en': 'Reset your password',
      'nl': 'Welkom!',
    },
    '5vsqsjj5': {
      'en': 'Email Address',
      'nl': 'jouw e-mailadres',
    },
    'x5ymdt1p': {
      'en': 'Please enter a valid email',
      'nl': 'Gelieve een geldig e-mailadres in te vullen',
    },
    'bae8yfgm': {
      'en': 'Reset Password',
      'nl': 'Log in als gast',
    },
    '2hxs16bc': {
      'en': 'Home',
      'nl': '',
    },
  },
  // homeAsGuest
  {
    'zpnum5w5': {
      'en': 'Welcome,',
      'nl': 'Welkom,',
    },
    '5dvmww16': {
      'en': 'Team Quivvy',
      'nl': 'Team Quivvy',
    },
    'v53ln2eg': {
      'en': 'Overview',
      'nl': 'Overzicht',
    },
    '8xvr7kl4': {
      'en': 'Food & Drinks',
      'nl': 'Eten en drinken',
    },
    '857ch4ua': {
      'en': 'Reservations',
      'nl': 'Reserveringen',
    },
    'xaqf3s4q': {
      'en': 'Events',
      'nl': 'Evenementen',
    },
    'wbd94n01': {
      'en': 'Home',
      'nl': '',
    },
  },
  // LoginAsGuest
  {
    'bwgo0zcv': {
      'en': 'Login as guest',
      'nl': 'Log in als gast',
    },
    'yo14cv6u': {
      'en': 'Welcome!',
      'nl': 'Welkom!',
    },
    '2yle179c': {
      'en': 'Email Address',
      'nl': 'jouw e-mailadres',
    },
    '6bqa715t': {
      'en': 'Please enter a valid email',
      'nl': 'Gelieve een geldig e-mailadres in te vullen',
    },
    'ba29f0lg': {
      'en': 'Sign in as guest',
      'nl': 'Log in als gast',
    },
    'oshwir3f': {
      'en': 'Home',
      'nl': '',
    },
  },
  // Accomodations
  {
    'ebd7rgb8': {
      'en': 'Accomodation list',
      'nl': '',
    },
    'bmzkgjgi': {
      'en': 'Search accomodations',
      'nl': 'Zoek eten, drinken...',
    },
    'adb6u67g': {
      'en': 'honesty bar',
      'nl': '',
    },
    'csdkmfld': {
      'en': 'meeting room',
      'nl': '',
    },
    'b67f58j1': {
      'en': '...\n',
      'nl': '',
    },
    'wszbax2c': {
      'en': 'Location',
      'nl': '',
    },
    'x3zn8hw6': {
      'en': 'Accomodation name',
      'nl': '',
    },
    'g2rofudp': {
      'en': 'Drinks',
      'nl': 'Drankjes',
    },
  },
  // Miscellaneous
  {
    '2nbuof48': {
      'en': '',
      'nl':
          'Indien u een foto of video wilt maken, heeft deze app toegang nodig tot uw camera',
    },
    'x89g6m5b': {
      'en': '',
      'nl':
          'Indien u media wilt uploaden, heeft deze app toegang nodig tot uw camera',
    },
    'e4mwzhzc': {
      'en': 'Something went wrong',
      'nl': 'Er is iets fout gegaan',
    },
    'l6vikl61': {
      'en': 'Wachtwoord reset email sent!',
      'nl': 'Wachtwoord reset email is verzonden!',
    },
    '8z233e6g': {
      'en': 'Email required!',
      'nl': 'Email verplicht!',
    },
    '696tt51p': {
      'en': '',
      'nl': '',
    },
    'rtlkz4qe': {
      'en': 'Passwords don\'t match',
      'nl': 'Wachtwoorden zijn niet gelijk',
    },
    '0e5k7jl2': {
      'en': '',
      'nl': '',
    },
    'dgqhhoe9': {
      'en': 'Invalid file format',
      'nl': 'Invalide bestands formaat',
    },
    'hrxyhspk': {
      'en': '',
      'nl': 'Opladen bestand...',
    },
    '34dizgkg': {
      'en': 'Succes!',
      'nl': 'Succesvol!',
    },
    'bk5lx1uu': {
      'en': 'Failed to upload media!',
      'nl': 'Er ging iets fout bij het opladen van de media!',
    },
    '8avcgtag': {
      'en': '',
      'nl': '',
    },
    '3v5hgefj': {
      'en': '',
      'nl': '',
    },
    '6sjbmcna': {
      'en': '',
      'nl': '',
    },
    'fnhqwcy3': {
      'en': '',
      'nl': '',
    },
  },
].reduce((a, b) => a..addAll(b));
