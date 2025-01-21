import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

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
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

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

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

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

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // login
  {
    '59qc53v0': {
      'en': 'مواكبة',
      'ar': '',
    },
    '4o0sgqrg': {
      'en': 'Create Account',
      'ar': '',
    },
    'e3n01rdj': {
      'en': 'Create Account',
      'ar': '',
    },
    'jowzk1rm': {
      'en': 'Let\'s get started by filling out the form below.',
      'ar': '',
    },
    'bj917c8s': {
      'en': 'Email',
      'ar': '',
    },
    'h472548f': {
      'en': 'Password',
      'ar': '',
    },
    '9mrspdbv': {
      'en': 'Password',
      'ar': '',
    },
    '0hl2mj27': {
      'en': 'Get Started',
      'ar': '',
    },
    'nsj2au1n': {
      'en': 'Log In',
      'ar': '',
    },
    'exjz0md7': {
      'en': 'Welcome Back',
      'ar': '',
    },
    'ui6ins30': {
      'en': 'Fill out the information below in order to access your account.',
      'ar': '',
    },
    'pqtoqw0b': {
      'en': 'Email',
      'ar': '',
    },
    'yfa8fzl7': {
      'en': 'Password',
      'ar': '',
    },
    'cvzvf18n': {
      'en': 'Sign In',
      'ar': '',
    },
    'f3idfc3m': {
      'en': 'Or sign in with',
      'ar': '',
    },
    'p0yrsyk6': {
      'en': 'Continue with Google',
      'ar': '',
    },
    'm97uvnqb': {
      'en': 'Forgot Password?',
      'ar': '',
    },
    'xog18h1d': {
      'en': 'Home',
      'ar': '',
    },
  },
  // profile
  {
    'h1hkun01': {
      'en': 'Your Account',
      'ar': '',
    },
    '0wb2urml': {
      'en': 'Edit Profile',
      'ar': '',
    },
    'u0ksevyz': {
      'en': 'App Settings',
      'ar': '',
    },
    'a0d2lqgi': {
      'en': 'Support',
      'ar': '',
    },
    '93ss06c2': {
      'en': 'Terms of Service',
      'ar': '',
    },
    '0668xrp7': {
      'en': 'Log Out',
      'ar': '',
    },
    '1vkshght': {
      'en': 'Home',
      'ar': '',
    },
  },
  // support
  {
    '3d311amz': {
      'en': 'Welcome to support',
      'ar': '',
    },
    'frmt9bd6': {
      'en': 'How can we help you?',
      'ar': '',
    },
    '9hdmren3': {
      'en': 'Call Us',
      'ar': '',
    },
    'e7h7em3i': {
      'en': 'Email Us',
      'ar': '',
    },
    '8nomgukp': {
      'en': 'Review FAQ\'s below',
      'ar': '',
    },
    '23bq5ii7': {
      'en': 'What is Mowakkaba?',
      'ar': '',
    },
    'd7kpylo9': {
      'en':
          'Mowakkaba is a mobile application designed to connect young graduates, professionals in transition, and mentors/coaches. It provides coaching services, workshops, and tools to help users achieve their career goals.',
      'ar': '',
    },
    'sv689kwm': {
      'en': 'Who can use Mowakkaba?',
      'ar': '',
    },
    'fpdt4i54': {
      'en':
          'Mowakkaba is for:\n\n- Young graduates seeking career guidance.\n\n- Professionals looking to transition to new roles or industries.\n\n- Coaches and mentors who want to share their expertise.',
      'ar': '',
    },
    'w9s4te2y': {
      'en': 'Get support',
      'ar': '',
    },
    'xcpx4zgh': {
      'en': 'Home',
      'ar': '',
    },
  },
  // termsofuse
  {
    'ckt4rwua': {
      'en': 'Terms of Use',
      'ar': '',
    },
    '922z10y7': {
      'en': 'Last Updated: June 15, 2023',
      'ar': '',
    },
    'bg11oicz': {
      'en': 'Welcome to Mowakkaba!',
      'ar': '',
    },
    '4cm4g553': {
      'en':
          'These Terms of Use (\"Terms\") govern your use of the Mowakkaba mobile application (\"App\") and related services (\"Services\"). By using the App, you agree to these Terms. If you disagree, do not use the App.',
      'ar': '',
    },
    'e18nvtv8': {
      'en': '1. Acceptance of Terms',
      'ar': '',
    },
    'nex4vzdf': {
      'en':
          'By accessing or using the App, you confirm you have read, understood, and agree to these Terms.',
      'ar': '',
    },
    'brvi92pn': {
      'en': '2. Eligibility',
      'ar': '',
    },
    'wacea8bi': {
      'en':
          'You must be at least 18 years old or have parental consent to use the App.',
      'ar': '',
    },
    'eukhllxb': {
      'en': '3. Account Registration',
      'ar': '',
    },
    'sg1c94ds': {
      'en':
          '• Create an account to access certain features.\n• Provide accurate information and keep your credentials secure.\n• You are responsible for all activities under your account.',
      'ar': '',
    },
    'ig46qehd': {
      'en': '4. User Responsibilities',
      'ar': '',
    },
    'sk4878fo': {
      'en':
          '• Use the App lawfully.\n• Do not disrupt the App or harass others.\n• Do not share your account credentials.',
      'ar': '',
    },
    '04t2h37t': {
      'en': '5. Coaching and Workshops',
      'ar': '',
    },
    'c0id7w1d': {
      'en':
          '• Mowakkaba connects users with coaches and mentors.\n• Coaches are independent professionals; Mowakkaba does not endorse their services.\n• Verify coach credentials and suitability.',
      'ar': '',
    },
    'x6x4mhb1': {
      'en': '6. Payments and Refunds',
      'ar': '',
    },
    'ugmqvmvv': {
      'en':
          '• Some features require payment.\n• Payments are processed securely.\n• Refunds are subject to our Refund Policy.',
      'ar': '',
    },
    '08de1lyz': {
      'en': '7. Privacy and Security',
      'ar': '',
    },
    'amtfbb9n': {
      'en':
          'Your use of the App is subject to our Privacy Policy. We take appropriate measures to protect your personal information.',
      'ar': '',
    },
    'jmrh5ut0': {
      'en': '8. Contact Us',
      'ar': '',
    },
    'rjtqkz52': {
      'en': 'Email:',
      'ar': '',
    },
    'tm6jwx4z': {
      'en': 'contacter.basseaid@gmail.com',
      'ar': '',
    },
    '4ad50bq6': {
      'en': 'Address:',
      'ar': '',
    },
    'a1p0j0h9': {
      'en': 'INPT Rabat',
      'ar': '',
    },
    '6q4iejpq': {
      'en': 'I Accept Terms',
      'ar': '',
    },
  },
  // editprofile
  {
    'hzqjj90r': {
      'en': 'Edit Profile',
      'ar': '',
    },
    'f6p3osd8': {
      'en': 'Personal Information',
      'ar': '',
    },
    'jz0vng1j': {
      'en': 'Security',
      'ar': '',
    },
    'jlmc54b1': {
      'en': 'Current Password',
      'ar': '',
    },
    '65ps9cye': {
      'en': 'New Password',
      'ar': '',
    },
    'i5mlevre': {
      'en': 'Confirm New Password',
      'ar': '',
    },
    'b8l1q7g5': {
      'en': 'Save Changes',
      'ar': '',
    },
  },
  // login2
  {
    'wluzn2fj': {
      'en': 'Welcome to Mowakkaba!',
      'ar': '',
    },
    '04719pjy': {
      'en':
          'Empower your journey with expert coaching and personalized support.',
      'ar': '',
    },
    '2p0pmyyp': {
      'en': 'Preparing Your Dashboard',
      'ar': '',
    },
    '1roojobw': {
      'en':
          'We’re customizing your profile and finding the best matches for your goals.',
      'ar': '',
    },
    'fdxvkyhs': {
      'en': 'Ready to Dive In',
      'ar': '',
    },
    'z3keurd7': {
      'en':
          'Your coaching experience is ready! Explore workshops, book sessions, and achieve your goals.',
      'ar': '',
    },
    '63hzij76': {
      'en': 'Next',
      'ar': '',
    },
    '9qcl33b3': {
      'en': 'Home',
      'ar': '',
    },
  },
  // chatversin2
  {
    'kjv1cpav': {
      'en': 'Messages',
      'ar': '',
    },
    'mmsflze8': {
      'en': 'Search conversations...',
      'ar': '',
    },
    'vwahrzlj': {
      'en': 'Randie Mcmullens',
      'ar': '',
    },
    'tbplv660': {
      'en': '(123) 456-7890',
      'ar': '',
    },
    '7ee4va4e': {
      'en': 'name@domain.com',
      'ar': '',
    },
    'xlptfg4b': {
      'en': 'Raney Bold',
      'ar': '',
    },
    'mlzjk50y': {
      'en': '(123) 456-7890',
      'ar': '',
    },
    'go5acsd8': {
      'en': 'name@domain.com',
      'ar': '',
    },
    'b9h3zxn1': {
      'en': 'Ragina Smith',
      'ar': '',
    },
    '53ilb2ap': {
      'en': '(123) 456-7890',
      'ar': '',
    },
    'gaaa18mj': {
      'en': 'name@domain.com',
      'ar': '',
    },
    'vjo1z3ym': {
      'en': 'Ra Kuo',
      'ar': '',
    },
    'cfvtxld1': {
      'en': '(123) 456-7890',
      'ar': '',
    },
    'pjm7sxu2': {
      'en': 'name@domain.com',
      'ar': '',
    },
    '5uld24t6': {
      'en': 'Raku Davis',
      'ar': '',
    },
    '9sayvzpw': {
      'en': '(123) 456-7890',
      'ar': '',
    },
    'f476s4gg': {
      'en': 'name@domain.com',
      'ar': '',
    },
  },
  // chatPage
  {
    'po0mga4b': {
      'en': 'Type your message',
      'ar': '',
    },
    'ggxzljg0': {
      'en': 'Home',
      'ar': '',
    },
  },
  // CreateNewChat
  {
    'wccoeskn': {
      'en': 'Select a coach',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    'rowxpoka': {
      'en': '',
      'ar': '',
    },
    'lpvf39nf': {
      'en': '',
      'ar': '',
    },
    'qdghzdae': {
      'en': '',
      'ar': '',
    },
    '8nc8y3d0': {
      'en': '',
      'ar': '',
    },
    'sy7jztrj': {
      'en': '',
      'ar': '',
    },
    'r2a0k62u': {
      'en': '',
      'ar': '',
    },
    'tmrh20db': {
      'en': '',
      'ar': '',
    },
    'zgkcec19': {
      'en': '',
      'ar': '',
    },
    'i3o9ih5v': {
      'en': '',
      'ar': '',
    },
    'hmided4a': {
      'en': '',
      'ar': '',
    },
    'chu7alu1': {
      'en': '',
      'ar': '',
    },
    'pvr211ol': {
      'en': '',
      'ar': '',
    },
    'gr4me9qm': {
      'en': '',
      'ar': '',
    },
    '3gjj16wn': {
      'en': '',
      'ar': '',
    },
    'utpjp7ck': {
      'en': '',
      'ar': '',
    },
    '05irs0oj': {
      'en': '',
      'ar': '',
    },
    'ppyucrq5': {
      'en': '',
      'ar': '',
    },
    's712pheq': {
      'en': '',
      'ar': '',
    },
    'gmfdzl9p': {
      'en': '',
      'ar': '',
    },
    '2xenu9px': {
      'en': '',
      'ar': '',
    },
    '4wpkza84': {
      'en': '',
      'ar': '',
    },
    't0cmythz': {
      'en': '',
      'ar': '',
    },
    '7m6spals': {
      'en': '',
      'ar': '',
    },
    '3gg3ejx6': {
      'en': '',
      'ar': '',
    },
    '8fyxo35f': {
      'en': '',
      'ar': '',
    },
    'gssdubw0': {
      'en': '',
      'ar': '',
    },
    'kpad6n8b': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
