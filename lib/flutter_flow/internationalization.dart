import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr', 'ar'];

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
    String? frText = '',
    String? arText = '',
  }) =>
      [enText, frText, arText][languageIndex] ?? '';

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
  // Splashscreen
  {
    'd214ugvf': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // Termsandcondition
  {
    'oh3dskc0': {
      'en': 'Terms of Service',
      'ar': '',
      'fr': '',
    },
    'do61y024': {
      'en': 'Terms of Service\n',
      'ar': '',
      'fr': '',
    },
    '8y3iu830': {
      'en':
          '\nThese Terms of Service constitute a legal agreement between Career Paddy  and users (referred to as \"Paddies\" for mentors and \"Buddies\" for mentees) accessing or using the Career Paddy App. By accessing or using the App, Paddies and Buddies agree to comply with these Terms. Failure to adhere to these terms may result in the termination of services \nprovided by the Platform.\n\n',
      'ar': '',
      'fr': '',
    },
    'ls7pxjez': {
      'en': 'For Paddies (Mentors):\n',
      'ar': '',
      'fr': '',
    },
    '5eukjtw0': {
      'en':
          '\n1. Physical Meetings: Paddies may engage in physical meetings with their Buddies, provided that the subject matter of the meeting is unrelated to the Career Paddy App or its objectives. Meetings related to the Career Paddy App or its operation and objectives shall be exclusively conducted through events organized by the Platform.\n\n2. Unauthorized Use: Reproduction, duplication, copying, selling, reselling, or exploitation of any portion of the Career Paddy App or its services without express written permission is strictly prohibited.\n\n3. Illegal or Unauthorized Activities: Paddies must not use the Career Paddy App for any illegal or unauthorized purposes that violate national, international, or jurisdictional laws.\n\n4. Misrepresentation: Providing inaccurate information or purposefully falsifying information about oneself or intentions is prohibited.\n\n5. Transmission of Viruses or Malware: Paddies are prohibited from transmitting viruses or malware through the Career Paddy App, maintaining the platform\'s security and integrity.\n\n6. Violation of Mentorship Agreements: Paddies should not engage in activities that harm or exploit their Buddies or violate any agreements made between mentors and mentees.\n\n7. Violation of Intellectual Property Rights: Respect for the intellectual property rights of third parties, including copyright and trademark, is mandatory. Paddies must not use or distribute copyrighted or trademarked material without proper authorization.\n\n8. Harassment or Infringement of Privacy: Paddies must maintain respectful and professional conduct at all times, refraining from any form of harassment or infringement of privacy towards their Buddies or any other users of the Career Paddy App.\n\n9. Breach of Terms of Service: Violation of the Terms of Service may result in immediate termination of services. Paddies are responsible for familiarizing themselves with the ToS and complying with its provisions.\n\n10. Points accrual, benefits and purpose: Paddies have the option to accrue points on the Career Paddy App, earned through active engagement and session reviews. Accrued points contribute to the advancement of the app, fostering better experiences for Buddies. While the review of sessions is optional, it is strongly recommended as it enhances the overall quality of interactions. Paddies, upon reaching 2000 points or more, have the privilege to withdraw accumulated points. This system encourages Paddies to actively contribute to the growth of the app and ensures a rewarding experience for both mentors and mentees.\n\n11. Withdrawal of Points: Paddies have the privilege to withdraw their accumulated points when the count reaches 2000 points or more. Points accumulation for Paddies is not limited to sessions; Paddies can also earn points through active engagement such as chatting with buddies.\n\n',
      'ar': '',
      'fr': '',
    },
    '9iabhshk': {
      'en': 'For Buddies (Mentees):',
      'ar': '',
      'fr': '',
    },
    '92cz29qr': {
      'en':
          '\n1. Unauthorized Solicitation: Buddies should avoid engaging in unauthorized solicitation or promotion of products, services, or events to Paddies. The platform is intended for mentorship purposes, and commercial activities should be avoided.\n\n2. Misuse of Personal Information: Buddies must respect the confidentiality of personal information shared by Paddies and refrain from any misuse or exploitation of such information.\n\n3. Discrimination or Harassment: Buddies must maintain respectful and inclusive behavior, refraining from any discrimination, harassment, or offensive conduct towards Paddies based on any protected characteristics.\n\n4. Exploitation or Abuse: Buddies should not exploit or abuse their mentoring relationship with Paddies for personal gain or advantage.\n\n5. Violation of Mentorship Boundaries: Buddies must respect established boundaries by Paddies and avoid engaging in activities that exceed the scope of the mentorship relationship.\n\n6. Unauthorized Use of Paddy\'s Content: Buddies must not use, reproduce, or distribute any content shared by Paddies without obtaining necessary permissions, respecting intellectual property rights.\n\n7. Engaging in Illegal Activities: Buddies must use the Career Paddy App solely for professional mentorship purposes, refraining from engaging in any illegal activities or violating laws.\n\n8. Breach of Terms of Service: Violation of the Terms of Service may result in immediate termination of services. Buddies are responsible for familiarizing themselves with the ToS and complying with its provisions.\n\n9. Earning Session Points: Each payment of Five thousand naira grants a buddy 3 session points within the Career Paddy app.  In the event of a Buddy\'s dissatisfaction with a session, the Buddy reserves the right to request a reversal of the session point. This request should be lodged by submitting a formal complaint through the Career Paddy App. The complaint must include detailed information regarding the dissatisfaction, providing all necessary details for the efficient processing of the reversal. Career Paddy will review the complaint and, if deemed justified, initiate the necessary steps to reverse the session point.\n\n',
      'ar': '',
      'fr': '',
    },
    'w1rzmnya': {
      'en':
          'By using the Career Paddy App, both Paddies and Buddies acknowledge and agree to these Terms of Service. Failure to comply with these Terms may result in the suspension or termination of access to the Career Paddy App without notice.',
      'ar': '',
      'fr': '',
    },
    'ohd1hy87': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // forgot_password
  {
    'klzku0j1': {
      'en': 'Forgot Password',
      'ar': '',
      'fr': '',
    },
    'vgr4xxi2': {
      'en':
          'Please enter the email associated with your account and we will send you a link to reset your password.',
      'ar': '',
      'fr': '',
    },
    '6198yz1l': {
      'en': 'Back',
      'ar': '',
      'fr': '',
    },
    'vfaoaou7': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'a71b79af': {
      'en': 'Send Link',
      'ar': '',
      'fr': '',
    },
    'l9a4uwta': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // Lesson_Complete
  {
    'mv2td0dr': {
      'en': 'Lesson Completed!',
      'ar': '',
      'fr': '',
    },
    'xd2v7031': {
      'en': 'Total  Points',
      'ar': '',
      'fr': '',
    },
    'mld231c6': {
      'en': 'Total Time',
      'ar': '',
      'fr': '',
    },
    '8pydlqdp': {
      'en': 'Percentage',
      'ar': '',
      'fr': '',
    },
    'n1xrp9dt': {
      'en': 'Continue Learning',
      'ar': '',
      'fr': '',
    },
    'de2bo02d': {
      'en': 'Download Badge',
      'ar': '',
      'fr': '',
    },
    'g3tbpkng': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // Sign_In_Page
  {
    '5bzxwk60': {
      'en': 'Welcome Back!',
      'ar': '',
      'fr': '',
    },
    'c8weh9kb': {
      'en': 'Enter your details to continue.',
      'ar': '',
      'fr': '',
    },
    'ywmar8uf': {
      'en': 'Email',
      'ar': '',
      'fr': '',
    },
    'csctq6a6': {
      'en': 'Password',
      'ar': '',
      'fr': '',
    },
    'ke59ay1r': {
      'en': 'Forgot password?',
      'ar': '',
      'fr': '',
    },
    'nidwkwr8': {
      'en': 'Login',
      'ar': '',
      'fr': '',
    },
    'jmajlx5a': {
      'en': 'Don\'t have an account?',
      'ar': '',
      'fr': '',
    },
    'a83rftpo': {
      'en': 'Sign up.',
      'ar': '',
      'fr': '',
    },
    'bqih4pwj': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // BuddyAccount
  {
    'zyzh532e': {
      'en': 'Daily streaks',
      'ar': '',
      'fr': '',
    },
    'rb5med9f': {
      'en': 'Courses taken',
      'ar': '',
      'fr': '',
    },
    'oad0qs6k': {
      'en': '--',
      'ar': '',
      'fr': '',
    },
    'kfg3gxfi': {
      'en': 'Total sessions',
      'ar': '',
      'fr': '',
    },
    'dkt9qeaf': {
      'en': 'Reward coins',
      'ar': '',
      'fr': '',
    },
    'y7j9fwml': {
      'en': 'Wallet Balance',
      'ar': '',
      'fr': '',
    },
    '395z7zwj': {
      'en': 'Withdraw',
      'ar': '',
      'fr': '',
    },
    'ugj7hj2b': {
      'en': 'Password',
      'ar': '',
      'fr': '',
    },
    'oxv0q7j0': {
      'en': 'Night',
      'ar': '',
      'fr': '',
    },
    'ewtigfss': {
      'en': 'Share Career Paddy',
      'ar': '',
      'fr': '',
    },
    'aam421sh': {
      'en': 'Help & Support',
      'ar': '',
      'fr': '',
    },
    'q3zmy7vo': {
      'en': 'Edit Profile',
      'ar': '',
      'fr': '',
    },
    'sihm7squ': {
      'en': 'Terms of Service',
      'ar': '',
      'fr': '',
    },
    'gv6c2nji': {
      'en': 'Log out',
      'ar': '',
      'fr': '',
    },
    'cngk3dzb': {
      'en': 'Delete account',
      'ar': '',
      'fr': '',
    },
    '9z1fmrzp': {
      'en': 'Premium plan',
      'ar': '',
      'fr': '',
    },
    '124no2lh': {
      'en': 'Access more features on this plan',
      'ar': '',
      'fr': '',
    },
    'te1p6i1t': {
      'en': 'Upgrade',
      'ar': '',
      'fr': '',
    },
    '41rialx9': {
      'en': 'My Account',
      'ar': '',
      'fr': '',
    },
    '6rtmelqw': {
      'en': 'Profile',
      'ar': '',
      'fr': '',
    },
  },
  // Buddy_Edit_Profile
  {
    '0bvs6cdw': {
      'en': 'Full name',
      'ar': '',
      'fr': '',
    },
    'ajd4qr2g': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'sskkcef8': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '5xs6ycd4': {
      'en': 'Email',
      'ar': '',
      'fr': '',
    },
    'v5uruttd': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'g91njkax': {
      'en': 'Email',
      'ar': '',
      'fr': '',
    },
    'kyqd9ulq': {
      'en': 'Password',
      'ar': '',
      'fr': '',
    },
    '5c0jrrzg': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'pl2uxwtf': {
      'en': 'Password',
      'ar': '',
      'fr': '',
    },
    '91032wzu': {
      'en': 'Location',
      'ar': '',
      'fr': '',
    },
    'ukb05gf6': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'cry7oqa8': {
      'en': 'Location',
      'ar': '',
      'fr': '',
    },
    '9n6aheg5': {
      'en': 'University',
      'ar': '',
      'fr': '',
    },
    'jv051bi4': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'xzj38f09': {
      'en': 'University',
      'ar': '',
      'fr': '',
    },
    '4vt0l4fy': {
      'en': 'Degree',
      'ar': '',
      'fr': '',
    },
    'feurr1wr': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '8d6ccufe': {
      'en': 'Degree',
      'ar': '',
      'fr': '',
    },
    '6wby538m': {
      'en': 'Bio',
      'ar': '',
      'fr': '',
    },
    'hnslaico': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'dfn7683l': {
      'en': 'Bio',
      'ar': '',
      'fr': '',
    },
    'l4s0eai9': {
      'en': 'Save Changes',
      'ar': '',
      'fr': '',
    },
    'ra6do2l5': {
      'en': 'Edit profile',
      'ar': '',
      'fr': '',
    },
    '20ydbgi4': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // PaymentSuccessful
  {
    'brok3eny': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // Leaderboard
  {
    'y2tgu804': {
      'en': 'Here are the top learners for last month',
      'ar': '',
      'fr': '',
    },
    'jmr1bt58': {
      'en': 'Rank',
      'ar': '',
      'fr': '',
    },
    'd298v9k2': {
      'en': 'Name',
      'ar': '',
      'fr': '',
    },
    'udmim9mc': {
      'en': 'Points',
      'ar': '',
      'fr': '',
    },
    '5ozesusx': {
      'en': 'Leaderboard',
      'ar': '',
      'fr': '',
    },
    'c5j2ymdj': {
      'en': 'Leaderboard',
      'ar': '',
      'fr': '',
    },
  },
  // Onboarding_3
  {
    'x5hf5x8e': {
      'en': 'Have fun ',
      'ar': '',
      'fr': '',
    },
    'duq00bjt': {
      'en': 'learning  top skills.',
      'ar': '',
      'fr': '',
    },
    'sp6tvt1o': {
      'en':
          'A way to stand out from the crowd by learning business & employability soft skills.',
      'ar': '',
      'fr': '',
    },
    'cax8a6jg': {
      'en': 'Sign Up',
      'ar': '',
      'fr': '',
    },
    '4m2lxpxz': {
      'en': 'Sign in',
      'ar': '',
      'fr': '',
    },
    '5myka66v': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // Help_Page
  {
    'msw0r79g': {
      'en': 'How can we help you?',
      'ar': '',
      'fr': '',
    },
    '8ot4o472': {
      'en': 'Search',
      'ar': '',
      'fr': '',
    },
    'q7iffzxy': {
      'en': 'Frequently Asked Questions',
      'ar': '',
      'fr': '',
    },
    'vm72ckye': {
      'en': 'Who is a paddy?',
      'ar': '',
      'fr': '',
    },
    'm6xpnbmq': {
      'en':
          'A Paddy is a seasoned professional with extensive experience and knowledge in any industry or job role. He/She is passionate about sharing his/her wisdom and expertise to guide and empower buddies in their career journeys.',
      'ar': '',
      'fr': '',
    },
    'eiwp9yh7': {
      'en': 'Who is a buddy?',
      'ar': '',
      'fr': '',
    },
    'f8jzqoza': {
      'en':
          'A Buddy is any individual looking to switch job roles, embracing innovation and creativity to redefine success and career growth. He/She constantly seeks new ways to challenge norms and push the limits of what is possible in the chosen industry or job role.',
      'ar': '',
      'fr': '',
    },
    'r9dada4i': {
      'en':
          'What types of industries and career fields does Career Paddy cover?',
      'ar': '',
      'fr': '',
    },
    '62zktu4n': {
      'en':
          'Career Paddy caters to a wide range of industries and career fields. Whether you\'re interested in technology, finance, marketing, entertainment or any other industry.',
      'ar': '',
      'fr': '',
    },
    'ga6gen6u': {
      'en': 'How can I benefit from Career Paddy?',
      'ar': '',
      'fr': '',
    },
    'l2utvwzy': {
      'en':
          'Career Paddy provides you with access to a network of industry experts that can provide you with the needed knowledge to accelerate career growth, and make valuable connections in your industry.',
      'ar': '',
      'fr': '',
    },
    'jyx2tsrr': {
      'en': 'Still got questions?',
      'ar': '',
      'fr': '',
    },
    '0l92ecjl': {
      'en': 'Email us',
      'ar': '',
      'fr': '',
    },
    'ikd0xlri': {
      'en': 'Support',
      'ar': '',
      'fr': '',
    },
    '3tda7qhu': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // Get_Started
  {
    'v71n70sx': {
      'en': 'Let\'s get started!',
      'ar': '',
      'fr': '',
    },
    'u5d3wejf': {
      'en': 'Back',
      'ar': '',
      'fr': '',
    },
    'guz6nr93': {
      'en': 'Start your assessment',
      'ar': '',
      'fr': '',
    },
    'rycv3qde': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // Streak_Page
  {
    'zu2pym90': {
      'en': 'Days Streak',
      'ar': '',
      'fr': '',
    },
    'zt8n845y': {
      'en': 'You are doing well!',
      'ar': '',
      'fr': '',
    },
    'wnp4igpv': {
      'en': 'Continue learning',
      'ar': '',
      'fr': '',
    },
    'rwtu1t4g': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // PrivatePolicy
  {
    'b6uty7fk': {
      'en': 'Privacy Policy',
      'ar': '',
      'fr': '',
    },
    'au69lte9': {
      'en': 'Privacy Policy for Career Paddy App',
      'ar': '',
      'fr': '',
    },
    'm0bb3hmi': {
      'en': 'Personal Identification Information:',
      'ar': '',
      'fr': '',
    },
    '3u5yet5b': {
      'en':
          '\nThis Privacy Policy governs the manner in which Career Paddy collects, uses, maintains, and discloses information collected from users (each, a \"User\") of the Career Paddy mobile application (\"App\"). This privacy policy applies to the App and all products and services offered by Career Paddy.\n\n',
      'ar': '',
      'fr': '',
    },
    '3vourk1k': {
      'en':
          '\nWe may collect personal identification information from Users in various ways, including but not limited to when Users visit our app, register on the app, fill out a form, and in connection with other activities, services, features, or resources we make available on our App. Users may be asked for, as appropriate, name, email address, phone number, and other personal information. We will collect personal identification information from Users only if they voluntarily submit such information to us. Users can always refuse to supply personal identification information, except that it may prevent them from engaging in certain App-related activities.\n',
      'ar': '',
      'fr': '',
    },
    'dqt8ft6k': {
      'en': '\nNon-Personal Identification Information:\n',
      'ar': '',
      'fr': '',
    },
    'pobx0blm': {
      'en':
          'We may collect non-personal identification information about Users whenever they interact with our App. Non-personal identification information may include the type of device used to access the App, operating system, the Internet service provider utilized, and other similar information.\n\n',
      'ar': '',
      'fr': '',
    },
    'ccega79b': {
      'en': 'How We Use Collected Information:',
      'ar': '',
      'fr': '',
    },
    'ev7zztn7': {
      'en':
          '\nCareer Paddy may collect and use Users\' personal information for the following purposes:\nTo improve customer service: Information you provide helps us respond to your customer service requests and support needs more efficiently.\nTo personalize user experience: We may use \ninformation in the aggregate to understand how our Users as a group use the services and resources provided on our App.\nTo improve our App: We may use feedback you provide to improve our products and services.\nTo send periodic emails: We may use the email address to send User information and updates pertaining to their order. It may also be used to respond to their inquiries, questions, and/or other requests.\n',
      'ar': '',
      'fr': '',
    },
    'zf4i6y8y': {
      'en': '\nHow We Protect Your Information:',
      'ar': '',
      'fr': '',
    },
    'vmcm0pk6': {
      'en':
          '\nWe adopt appropriate data collection, storage, and processing practices and security measures to protect against unauthorized access, alteration, disclosure, or destruction of your personal information, username, password, transaction information, and data stored on our App.\n',
      'ar': '',
      'fr': '',
    },
    'g7a7emn1': {
      'en': '\n Sharing Your Personal Information:',
      'ar': '',
      'fr': '',
    },
    'wc49sj41': {
      'en':
          'We do not sell, trade, or rent Users\' personal identification information to others. We may share generic aggregated demographic information not linked to any personal identification information regarding visitors and users with our business partners, trusted affiliates, and advertisers for the purposes outlined above.',
      'ar': '',
      'fr': '',
    },
    'jo3li1l4': {
      'en': '\n\nChanges to This Privacy Policy:',
      'ar': '',
      'fr': '',
    },
    'v15bgj00': {
      'en':
          'Career Paddy has the discretion to update this privacy policy at any time. When we do, we will revise the updated date at the bottom of this page. We encourage Users to frequently check this page for any changes to stay informed about how we are helping to protect the personal information we collect. You acknowledge and agree that it is your responsibility to review this privacy policy periodically and become aware of modifications.\n',
      'ar': '',
      'fr': '',
    },
    'dcz8fftv': {
      'en': '\nYour Acceptance of These Terms:',
      'ar': '',
      'fr': '',
    },
    'bs9motvv': {
      'en':
          '\nBy using this App, you signify your acceptance of this policy. If you do not agree to this policy, please do not use our App. Your continued use of the App following the posting of changes to this policy will be deemed your acceptance of those changes.\n',
      'ar': '',
      'fr': '',
    },
    'oyyzao8g': {
      'en': 'Contacting Us:',
      'ar': '',
      'fr': '',
    },
    'etdkzni5': {
      'en':
          '\nIf you have any questions about this Privacy Policy, the practices of this App, or your dealings with this App, please contact us at:\n[communications@careerpaddy.co]\nThis document was last updated on January 30, 2024.',
      'ar': '',
      'fr': '',
    },
    '0njno8x3': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // Email_Password
  {
    '903sukua': {
      'en': 'Enter your login details',
      'ar': '',
      'fr': '',
    },
    'kbndz6au': {
      'en': 'Email',
      'ar': '',
      'fr': '',
    },
    'ngcdwemt': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '21522r20': {
      'en': 'Email',
      'ar': '',
      'fr': '',
    },
    'xltqbqh0': {
      'en': 'Password',
      'ar': '',
      'fr': '',
    },
    'xeq4uwh3': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'idfnv0vj': {
      'en': 'Password',
      'ar': '',
      'fr': '',
    },
    'ae2xd2vv': {
      'en': 'Continue',
      'ar': '',
      'fr': '',
    },
  },
  // Employament_status
  {
    'ibtbt9y2': {
      'en': 'What is your employment status?',
      'ar': '',
      'fr': '',
    },
    'dd0m9mnv': {
      'en': 'Employed',
      'ar': '',
      'fr': '',
    },
    '3vcuq9sh': {
      'en': 'Unemployed',
      'ar': '',
      'fr': '',
    },
    '5nl8vjpn': {
      'en': 'Freelancer',
      'ar': '',
      'fr': '',
    },
    'w3anpn4p': {
      'en': 'Self-employed',
      'ar': '',
      'fr': '',
    },
    'bec907hk': {
      'en': 'Student',
      'ar': '',
      'fr': '',
    },
    'hsp23i2v': {
      'en': 'Next',
      'ar': '',
      'fr': '',
    },
  },
  // ABout_us
  {
    'g2a2tjzb': {
      'en': 'How did you hear about Us?',
      'ar': '',
      'fr': '',
    },
    'ozrw356a': {
      'en': 'X',
      'ar': '',
      'fr': '',
    },
    'q1203pyu': {
      'en': 'Instagram',
      'ar': '',
      'fr': '',
    },
    '435mthyp': {
      'en': 'Word of mouth',
      'ar': '',
      'fr': '',
    },
    'kdukoqp7': {
      'en': 'Others',
      'ar': '',
      'fr': '',
    },
  },
  // Experience
  {
    'o8dwu1co': {
      'en': 'Years of working experience',
      'ar': '',
      'fr': '',
    },
    'vx5mkl7g': {
      'en': '0 - 2 years',
      'ar': '',
      'fr': '',
    },
    'kd6bxxuq': {
      'en': '3 - 6 years',
      'ar': '',
      'fr': '',
    },
    '6wxu9a1d': {
      'en': '7 - 10 years',
      'ar': '',
      'fr': '',
    },
    'vfzz3bjw': {
      'en': '11 years & above ',
      'ar': '',
      'fr': '',
    },
  },
  // Commitment
  {
    'md7t6tcb': {
      'en': 'Commit to growing with Career Paddy',
      'ar': '',
      'fr': '',
    },
    'cxmdym4h': {
      'en': 'Next',
      'ar': '',
      'fr': '',
    },
  },
  // Home_page
  {
    'qyf1tfck': {
      'en': 'What skill will you like to check today?',
      'ar': '',
      'fr': '',
    },
    '44uilx37': {
      'en': 'Skill Check!',
      'ar': '',
      'fr': '',
    },
    'cqc8jwko': {
      'en':
          'Soft skills are general traits not specific to any job but can tremendously help anyone excel in any environment. \n\nHave fun learning, while assessing your skills!',
      'ar': '',
      'fr': '',
    },
    'rzlama8j': {
      'en': 'Learn',
      'ar': '',
      'fr': '',
    },
  },
  // Congrats_challenge
  {
    'hkxnl34h': {
      'en': 'Congratulations! You finished top in this month’s challenge.',
      'ar': '',
      'fr': '',
    },
    'n7zcqhes': {
      'en': 'Convert points to reward',
      'ar': '',
      'fr': '',
    },
    '9jg61y8y': {
      'en': 'Continue learning',
      'ar': '',
      'fr': '',
    },
    '04dwxnus': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // Scenario_questions
  {
    'we9drll5': {
      'en': 'Scenario',
      'ar': '',
      'fr': '',
    },
    '233ktxkd': {
      'en': 'Dialogue',
      'ar': '',
      'fr': '',
    },
    '5wyza02v': {
      'en': 'Question',
      'ar': '',
      'fr': '',
    },
    'ml571dkc': {
      'en': 'Tap to see options',
      'ar': '',
      'fr': '',
    },
    's08kwgvr': {
      'en': 'Tap to see options',
      'ar': '',
      'fr': '',
    },
    'a86py8wb': {
      'en': 'Your answer',
      'ar': '',
      'fr': '',
    },
    'few2bw2h': {
      'en': 'Tap to change answer',
      'ar': '',
      'fr': '',
    },
    'icygc16i': {
      'en': 'Check answer',
      'ar': '',
      'fr': '',
    },
  },
  // Name
  {
    'bqvezlcc': {
      'en': 'What should we call you?',
      'ar': '',
      'fr': '',
    },
    'yyt7tlp8': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'iuix1ele': {
      'en': 'Full Name (Jane West)',
      'ar': '',
      'fr': '',
    },
    'zpeisucy': {
      'en':
          'Note: This is the name that will be used on your badge and certificate',
      'ar': '',
      'fr': '',
    },
    '8o187xss': {
      'en': 'Continue',
      'ar': '',
      'fr': '',
    },
  },
  // Reset_password
  {
    'vllu4ab4': {
      'en': 'Reset password',
      'ar': '',
      'fr': '',
    },
    'j5htzagy': {
      'en': 'Current password',
      'ar': '',
      'fr': '',
    },
    'cto7f0sm': {
      'en': 'New password',
      'ar': '',
      'fr': '',
    },
    'po78t7y5': {
      'en': 'Confirm new password',
      'ar': '',
      'fr': '',
    },
    'vhm4i7pd': {
      'en': 'Change password',
      'ar': '',
      'fr': '',
    },
    'p5uqleqe': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // Comment_1
  {
    'klx6d8d1': {
      'en':
          'Adaptability is about the powerful difference between adapting to cope and adapting to win.',
      'ar': '',
      'fr': '',
    },
    'khypjxxa': {
      'en': '\" — Max McKeown',
      'ar': '',
      'fr': '',
    },
    'h1if0o8y': {
      'en': 'Next',
      'ar': '',
      'fr': '',
    },
  },
  // About_careerpaddy
  {
    'sjguxe8v': {
      'en': 'Soft Skills Check',
      'ar': '',
      'fr': '',
    },
    'jho7injt': {
      'en':
          'Designed to help you assess and develop your soft skills through comprehensive evaluations and personalized analysis reports.\n',
      'ar': '',
      'fr': '',
    },
    'pbnaumee': {
      'en': 'Next',
      'ar': '',
      'fr': '',
    },
  },
  // Quotes
  {
    'f553e8w8': {
      'en': 'Do you agree with the statement below?',
      'ar': '',
      'fr': '',
    },
    '85ca2jz6': {
      'en': 'Soft skills are needed across all industries',
      'ar': '',
      'fr': '',
    },
    '9hsy2m5q': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '4iojj46s': {
      'en': 'Yes',
      'ar': '',
      'fr': '',
    },
    'q3sng0e5': {
      'en': 'No',
      'ar': '',
      'fr': '',
    },
  },
  // Home_pageCopy
  {
    'h7nga4i7': {
      'en': 'What skill will you like to check today?',
      'ar': '',
      'fr': '',
    },
    'ssw1erek': {
      'en': '5',
      'ar': '',
      'fr': '',
    },
    'ln8lkezm': {
      'en': '5',
      'ar': '',
      'fr': '',
    },
    '6aryogca': {
      'en': '5',
      'ar': '',
      'fr': '',
    },
    'o276o8nt': {
      'en': 'Soft skills Check',
      'ar': '',
      'fr': '',
    },
    '5kt214fl': {
      'en':
          'Soft skills are general traits not specific to any job but can tremendously help anyone excel in any environment. \n\nHave fun learning, while assessing your skills!',
      'ar': '',
      'fr': '',
    },
    'ocpvwrxr': {
      'en': 'Interview Skills',
      'ar': '',
      'fr': '',
    },
    's62hjgh1': {
      'en':
          'Assessment of candidates\' ability to communicate effectively and confidently in interview scenarios.',
      'ar': '',
      'fr': '',
    },
    'mbzjopxv': {
      'en': '10mins',
      'ar': '',
      'fr': '',
    },
    '2u7f0vu7': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    'n5kycj6o': {
      'en': 'Critical Thinking',
      'ar': '',
      'fr': '',
    },
    'phn1dtdq': {
      'en':
          'Evaluation of candidates\' ability to analyze and evaluate information objectively and logically.',
      'ar': '',
      'fr': '',
    },
    'au500o2e': {
      'en': '15mins',
      'ar': '',
      'fr': '',
    },
    'ry2mahxq': {
      'en': 'Download badge 90%',
      'ar': '',
      'fr': '',
    },
    's1225pq6': {
      'en': 'Emotional Intelligence',
      'ar': '',
      'fr': '',
    },
    'cururyai': {
      'en':
          'Assessment of candidates\' emotional awareness and ability to manage emotions in oneself and others.',
      'ar': '',
      'fr': '',
    },
    'uh6zjjsj': {
      'en': '15mins',
      'ar': '',
      'fr': '',
    },
    'i0gqvgtl': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    'dtmy471s': {
      'en': 'Business Writing Skills',
      'ar': '',
      'fr': '',
    },
    '7ndq6eop': {
      'en':
          'Evaluation of candidates\' proficiency in writing clear, concise, and professional business documents.',
      'ar': '',
      'fr': '',
    },
    'hasgdi8t': {
      'en': '15mins',
      'ar': '',
      'fr': '',
    },
    '0a4vt6ee': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    'gd0zna9k': {
      'en': 'Creative Thinking',
      'ar': '',
      'fr': '',
    },
    'o5a7yq30': {
      'en':
          'Assessment of candidates\' skills in prioritizing tasks, managing schedules, and optimizing productivity.',
      'ar': '',
      'fr': '',
    },
    '4gtqj3e7': {
      'en': '15mins',
      'ar': '',
      'fr': '',
    },
    'ox98ku21': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    'aqqy3ssc': {
      'en': 'Personal Mastery',
      'ar': '',
      'fr': '',
    },
    '2eyw8tc4': {
      'en':
          'Evaluation of candidates\' ability to self-manage, develop personal effectiveness, and pursue growth.',
      'ar': '',
      'fr': '',
    },
    'uc4n40cw': {
      'en': '15mins',
      'ar': '',
      'fr': '',
    },
    'k2531mfn': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    'orz7sr44': {
      'en': 'Public Speaking',
      'ar': '',
      'fr': '',
    },
    '6b94urwu': {
      'en':
          'Assessment of candidates\' presentation skills and ability to deliver engaging and impactful speeches or presentations.',
      'ar': '',
      'fr': '',
    },
    'zfp6j2gs': {
      'en': '15mins',
      'ar': '',
      'fr': '',
    },
    'pngjpv4o': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    'k2ai2ypp': {
      'en': 'Problem Solving and Decision Making',
      'ar': '',
      'fr': '',
    },
    'hcy2rb7l': {
      'en':
          'Evaluation of candidates\' skills in identifying, analyzing, and resolving complex problems effectively.',
      'ar': '',
      'fr': '',
    },
    'dttsjh44': {
      'en': '15mins',
      'ar': '',
      'fr': '',
    },
    '5q3zp2yb': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    '8ma6ph0e': {
      'en': 'Time Management',
      'ar': '',
      'fr': '',
    },
    'hp9767i9': {
      'en':
          'Assessment of candidates\' skills in prioritizing tasks, managing schedules, and optimizing productivity.',
      'ar': '',
      'fr': '',
    },
    'd6to08we': {
      'en': '15mins',
      'ar': '',
      'fr': '',
    },
    'z50bm7sj': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    'y8b1zl4k': {
      'en': 'Active Listening',
      'ar': '',
      'fr': '',
    },
    'cnxwqft6': {
      'en':
          'Assessment of candidates\' proficiency in actively listening and comprehending spoken information.',
      'ar': '',
      'fr': '',
    },
    'u03ljzk6': {
      'en': '15mins',
      'ar': '',
      'fr': '',
    },
    'i05tso8r': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    'kkfaqywk': {
      'en': 'Corporate Strategic Thinking',
      'ar': '',
      'fr': '',
    },
    'ywf6zuhp': {
      'en':
          'Assessment of candidates\' strategic mindset and ability to develop long-term organizational strategies.',
      'ar': '',
      'fr': '',
    },
    'wfvbaa6y': {
      'en': '15mins',
      'ar': '',
      'fr': '',
    },
    'ukb3rk5v': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    '294lmbaz': {
      'en': 'Goal Setting',
      'ar': '',
      'fr': '',
    },
    '7pet8r0i': {
      'en':
          'Evaluation of candidates\' proficiency in setting SMART (Specific, Measurable, Achievable, Relevant, Time-bound) goals.',
      'ar': '',
      'fr': '',
    },
    'me1x8xjc': {
      'en': '15mins',
      'ar': '',
      'fr': '',
    },
    'poskys10': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    'zvz3x620': {
      'en': 'Nonverbal Communication',
      'ar': '',
      'fr': '',
    },
    '81se06vo': {
      'en':
          'Evaluation of candidates\' use and interpretation of nonverbal cues such as body language and gestures.',
      'ar': '',
      'fr': '',
    },
    'nh81brsk': {
      'en': '15mins',
      'ar': '',
      'fr': '',
    },
    'dxrsdkh0': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    'wepnfgz8': {
      'en': 'Conflict Management',
      'ar': '',
      'fr': '',
    },
    'yydxz7al': {
      'en':
          'Evaluation of candidates\' ability to identify, address, and resolve conflicts within professional environments.',
      'ar': '',
      'fr': '',
    },
    '242eheuf': {
      'en': '15mins',
      'ar': '',
      'fr': '',
    },
    'ghq041lo': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    'bwke236t': {
      'en': 'Interpersonal Skills',
      'ar': '',
      'fr': '',
    },
    '97t0qupg': {
      'en':
          'Assessment of candidates\' ability to communicate, collaborate, and build positive relationships.',
      'ar': '',
      'fr': '',
    },
    'b3zve7dc': {
      'en': '15mins',
      'ar': '',
      'fr': '',
    },
    'tkc8w57k': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    'vypva4be': {
      'en': 'Verbal Communication',
      'ar': '',
      'fr': '',
    },
    'ibhnx5xh': {
      'en':
          'Assessment of candidates\' effectiveness in verbal communication, including clarity and expression.',
      'ar': '',
      'fr': '',
    },
    '2sdcrtqp': {
      'en': '15mins',
      'ar': '',
      'fr': '',
    },
    'zencd9t0': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    't1lrdl97': {
      'en': 'Negotiation',
      'ar': '',
      'fr': '',
    },
    'tittnu9o': {
      'en':
          'Assessment of candidates\' skills in negotiating favorable outcomes in business or interpersonal interactions.',
      'ar': '',
      'fr': '',
    },
    'rdl5xy1y': {
      'en': '15mins',
      'ar': '',
      'fr': '',
    },
    'c9faf5g5': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    '6apjrizp': {
      'en': 'Teamwork and Leadership',
      'ar': '',
      'fr': '',
    },
    'lkkd30ei': {
      'en':
          'Evaluation of candidates\' ability to work collaboratively in teams and demonstrate leadership qualities.',
      'ar': '',
      'fr': '',
    },
    '3odhf29e': {
      'en': '15mins',
      'ar': '',
      'fr': '',
    },
    'c9xarvkb': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    'qwm7aj7g': {
      'en': 'Workplace Ethics',
      'ar': '',
      'fr': '',
    },
    'yj5q3hla': {
      'en':
          'Evaluation of candidates\' understanding and application of ethical principles in a professional setting.',
      'ar': '',
      'fr': '',
    },
    'odfjknb6': {
      'en': '10mins',
      'ar': '',
      'fr': '',
    },
    'bmhsbqy4': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    'cr6a4mkh': {
      'en': 'Customer Service',
      'ar': '',
      'fr': '',
    },
    '95m7ufcs': {
      'en':
          'Evaluation of candidates\' aptitude in delivering exceptional service and support to customers or clients.',
      'ar': '',
      'fr': '',
    },
    'vu8n8wya': {
      'en': '10mins',
      'ar': '',
      'fr': '',
    },
    'lbp79c0h': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    'djabaz7b': {
      'en': 'Self-awareness',
      'ar': '',
      'fr': '',
    },
    '4n7k115c': {
      'en':
          'Assessment of candidates\' understanding of their own emotions, strengths, weaknesses, and behavioral tendencies.',
      'ar': '',
      'fr': '',
    },
    't18zarup': {
      'en': '15mins',
      'ar': '',
      'fr': '',
    },
    'k8fd5wsn': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    'tf5ocpzu': {
      'en': 'DISC Personality',
      'ar': '',
      'fr': '',
    },
    'ys3mf0be': {
      'en':
          'Evaluation of candidates\' behavioral traits and communication styles based on the DISC model (Dominance, Influence, Steadiness, Conscientiousness).',
      'ar': '',
      'fr': '',
    },
    'i3vo38en': {
      'en': '15mins',
      'ar': '',
      'fr': '',
    },
    'xogzh4a5': {
      'en': 'Download badge',
      'ar': '',
      'fr': '',
    },
    'pm88ks8v': {
      'en': 'Learn',
      'ar': '',
      'fr': '',
    },
  },
  // Question_timer_page
  {
    'rnqhq9ni': {
      'en': 'Are you Ready?',
      'ar': '',
      'fr': '',
    },
    'c3do3vnd': {
      'en': 'The following questions will be timed',
      'ar': '',
      'fr': '',
    },
    'brpetlvs': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // Failed_questions_prompter
  {
    'ikzuxpx8': {
      'en': 'Let\'s try out questions you missed',
      'ar': '',
      'fr': '',
    },
    'rrlwdgsc': {
      'en': 'Let\'s start',
      'ar': '',
      'fr': '',
    },
  },
  // Bio
  {
    'mltfp5sx': {
      'en': 'Tell us a bit about yourself',
      'ar': '',
      'fr': '',
    },
    'lpovc7iy': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'hskbzo23': {
      'en': 'I am a freelancer........',
      'ar': '',
      'fr': '',
    },
    'a4gzql5q': {
      'en': 'Continue',
      'ar': '',
      'fr': '',
    },
  },
  // Quiz_1
  {
    'bcwz3bzh': {
      'en': 'Check Answer',
      'ar': '',
      'fr': '',
    },
    'zqr1u8lt': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // Quotes2
  {
    '5tuax3z0': {
      'en': 'Do you agree with the statement below?',
      'ar': '',
      'fr': '',
    },
    'z79g880t': {
      'en': 'I can learn while while taking an assessment',
      'ar': '',
      'fr': '',
    },
    'tgods3b7': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '0yfu5n9z': {
      'en': 'Yes',
      'ar': '',
      'fr': '',
    },
    '4ejbssps': {
      'en': 'No',
      'ar': '',
      'fr': '',
    },
  },
  // Quotes2Copy
  {
    'ml95w3yz': {
      'en':
          '\"Do you believe that improving your communication skills can enhance your professional relationships?\"',
      'ar': '',
      'fr': '',
    },
    'hhms2ejo': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '86izmo1l': {
      'en': 'Yes',
      'ar': '',
      'fr': '',
    },
    'u5x1t5xc': {
      'en': 'No',
      'ar': '',
      'fr': '',
    },
  },
  // Quotes6
  {
    'omynawdz': {
      'en':
          '\"Would you like to work more effectively in team settings and resolve conflicts smoothly?\"',
      'ar': '',
      'fr': '',
    },
    'adlx11ns': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'xmxvh79x': {
      'en': 'Yes',
      'ar': '',
      'fr': '',
    },
    'db8av0v1': {
      'en': 'No',
      'ar': '',
      'fr': '',
    },
  },
  // Quotes7
  {
    'zhpl2x4h': {
      'en':
          '\"Do you want to identify your strengths and areas for improvement to grow personally and professionally?\"',
      'ar': '',
      'fr': '',
    },
    'lpj2q4cn': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '4qwh8m6s': {
      'en': 'Yes',
      'ar': '',
      'fr': '',
    },
    'arkkvfbh': {
      'en': 'No',
      'ar': '',
      'fr': '',
    },
  },
  // Quotes8
  {
    '319gjkuw': {
      'en': '\"Is tracking your progress in soft skills important to you?\"',
      'ar': '',
      'fr': '',
    },
    '66ptr3yy': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'kx329hft': {
      'en': 'Yes',
      'ar': '',
      'fr': '',
    },
    'qywofqz4': {
      'en': 'No',
      'ar': '',
      'fr': '',
    },
  },
  // Quotes3
  {
    'xzb9xhy6': {
      'en': 'Do you agree with the statement below?',
      'ar': '',
      'fr': '',
    },
    'rqfzop58': {
      'en':
          'Success in any job depends more on your soft skills than on your technical skills',
      'ar': '',
      'fr': '',
    },
    '6gb6mqpd': {
      'en': 'Zig Ziglar',
      'ar': '',
      'fr': '',
    },
    'n7vmpr4z': {
      'en': 'Yes',
      'ar': '',
      'fr': '',
    },
    'ing6j1et': {
      'en': 'No',
      'ar': '',
      'fr': '',
    },
  },
  // Quotes4
  {
    '7a7iptf2': {
      'en': 'Do you agree with the statement below?',
      'ar': '',
      'fr': '',
    },
    '57r2y0mu': {
      'en': 'Time management is life management.',
      'ar': '',
      'fr': '',
    },
    '1tfzeuxu': {
      'en': 'Robin Sharma',
      'ar': '',
      'fr': '',
    },
    'qrulgwq2': {
      'en': 'Yes',
      'ar': '',
      'fr': '',
    },
    '32n20g35': {
      'en': 'No',
      'ar': '',
      'fr': '',
    },
  },
  // Quotes5
  {
    'zty5iuqq': {
      'en': 'Do you agree with the statement below?',
      'ar': '',
      'fr': '',
    },
    'gd6ai2d2': {
      'en':
          'The most important thing in communication is hearing what isn\'t said.',
      'ar': '',
      'fr': '',
    },
    'z5fyxomd': {
      'en': 'Peter Drucker',
      'ar': '',
      'fr': '',
    },
    'tppktfie': {
      'en': 'Yes',
      'ar': '',
      'fr': '',
    },
    'lm4vt9u9': {
      'en': 'No',
      'ar': '',
      'fr': '',
    },
  },
  // Quotes9
  {
    '8adwrkxb': {
      'en':
          '\"Do you see value in receiving detailed soft skill analysis reports?\"',
      'ar': '',
      'fr': '',
    },
    'gdm0q9x9': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'k6qjqexz': {
      'en': 'Yes',
      'ar': '',
      'fr': '',
    },
    'tc6gql5m': {
      'en': 'No',
      'ar': '',
      'fr': '',
    },
  },
  // Quiz_2
  {
    '3gprkpji': {
      'en': 'Continue',
      'ar': '',
      'fr': '',
    },
    'iv5jawe6': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // Quiz_3
  {
    'dcbre32q': {
      'en': 'Continue',
      'ar': '',
      'fr': '',
    },
    'jv6ti94i': {
      'en': 'Home',
      'ar': '',
      'fr': '',
    },
  },
  // PaymentSuccess
  {
    'a36gwkwx': {
      'en': 'Payment Confirmed!',
      'ar': '',
      'fr': '',
    },
    'd9kb2526': {
      'en':
          'Your payment has been confirmed. You can now enjoy all premium features',
      'ar': '',
      'fr': '',
    },
    '6hcrksy8': {
      'en': 'Back to home',
      'ar': '',
      'fr': '',
    },
  },
  // Learning_outcome
  {
    'em3flszn': {
      'en': 'Ok, got it!',
      'ar': '',
      'fr': '',
    },
  },
  // Answer_Correct
  {
    '2qfixwup': {
      'en': 'Explanation',
      'ar': '',
      'fr': '',
    },
    'qx1ikt7j': {
      'en': 'Ok, got it!',
      'ar': '',
      'fr': '',
    },
  },
  // Incorrect_answer
  {
    '4o44r3cu': {
      'en': 'Correct answer',
      'ar': '',
      'fr': '',
    },
    'rjv1iz99': {
      'en': 'Ok, got it!',
      'ar': '',
      'fr': '',
    },
  },
  // Withdrawal
  {
    'j7logm29': {
      'en': 'Withdrawal',
      'ar': '',
      'fr': '',
    },
    '7qcpshd5': {
      'en': 'Enter account details to withdraw your funds ',
      'ar': '',
      'fr': '',
    },
    'w5pem9fv': {
      'en': 'Current balance',
      'ar': '',
      'fr': '',
    },
    '5500gnx2': {
      'en': 'Withdrawals this mo...',
      'ar': '',
      'fr': '',
    },
    'pmjp67he': {
      'en': 'Amount to withdraw',
      'ar': '',
      'fr': '',
    },
    '7u24n7zl': {
      'en': 'Account number',
      'ar': '',
      'fr': '',
    },
    'ne4f8ed8': {
      'en': 'Enter account number',
      'ar': '',
      'fr': '',
    },
    'y1s4wz4c': {
      'en': 'Account name',
      'ar': '',
      'fr': '',
    },
    'iwckchws': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'gdzcjwz9': {
      'en': 'Enter account name',
      'ar': '',
      'fr': '',
    },
    '60qk5b84': {
      'en': 'Bank',
      'ar': '',
      'fr': '',
    },
    '6v7d7uaj': {
      'en': 'Select your bank',
      'ar': '',
      'fr': '',
    },
    'oigbvzzz': {
      'en': 'Search for a bank...',
      'ar': '',
      'fr': '',
    },
    'l0l11o3j': {
      'en': 'Save card',
      'ar': '',
      'fr': '',
    },
    'scwke6st': {
      'en': 'Turn on to save this card',
      'ar': '',
      'fr': '',
    },
  },
  // Logout
  {
    'aymur3il': {
      'en': 'Log out',
      'ar': '',
      'fr': '',
    },
    '7abta030': {
      'en': 'Are you sure you want to continue with this process?',
      'ar': '',
      'fr': '',
    },
    'bionz4ev': {
      'en': 'Cancel',
      'ar': '',
      'fr': '',
    },
    '7stmytu1': {
      'en': 'Yes, continue',
      'ar': '',
      'fr': '',
    },
  },
  // Sign_in
  {
    'o1vl0ydw': {
      'en': 'Welcome Back!',
      'ar': '',
      'fr': '',
    },
    'umlzeyqn': {
      'en': 'Enter your details to continue.',
      'ar': '',
      'fr': '',
    },
    'rkeoyh22': {
      'en': 'Email',
      'ar': '',
      'fr': '',
    },
    '5pqcwz46': {
      'en': 'Password',
      'ar': '',
      'fr': '',
    },
    's7sjirga': {
      'en': 'Forgot password?',
      'ar': '',
      'fr': '',
    },
    'ez82xxut': {
      'en': 'Login',
      'ar': '',
      'fr': '',
    },
    'waf5mv6w': {
      'en': 'Don\'t have an account?',
      'ar': '',
      'fr': '',
    },
    'vuing9mu': {
      'en': 'Sign up.',
      'ar': '',
      'fr': '',
    },
    '2gn5a6sv': {
      'en':
          'By clicking continue, you agree with our terms of service and privacy policy.',
      'ar': '',
      'fr': '',
    },
  },
  // Out_of_live
  {
    'siuoz2qa': {
      'en': 'You have run out of lives.',
      'ar': '',
      'fr': '',
    },
    '3aepennq': {
      'en': 'Upgrade now to unlock access and keep the fun going.',
      'ar': '',
      'fr': '',
    },
    '3oo712p2': {
      'en': 'Upgrade Account',
      'ar': '',
      'fr': '',
    },
    'ff9t804r': {
      'en': 'Watch an Ad for extra hearts',
      'ar': '',
      'fr': '',
    },
  },
  // Welldone
  {
    'oxhfws7f': {
      'en': 'Well done!',
      'ar': '',
      'fr': '',
    },
    'y7czqecf': {
      'en': 'Points',
      'ar': '',
      'fr': '',
    },
    'lzyy9uwi': {
      'en': 'Continue learning',
      'ar': '',
      'fr': '',
    },
  },
  // Scenarios
  {
    '9v0fwclx': {
      'en': 'Welcome to Scenarios',
      'ar': '',
      'fr': '',
    },
    '2jhla7kw': {
      'en':
          'Scenario based questions are aimed at understanding how you respond in a corporate setting.',
      'ar': '',
      'fr': '',
    },
    '5jum50li': {
      'en':
          'You are given a scenario in a form of a dialogue and required to answer with the most appropriate answer ',
      'ar': '',
      'fr': '',
    },
    'c425rhnv': {
      'en': 'Okay, got it!',
      'ar': '',
      'fr': '',
    },
  },
  // Homepage_Overlay_course_1
  {
    'gjx64wwq': {
      'en': '[Course name]',
      'ar': '',
      'fr': '',
    },
    'zwwteu22': {
      'en': 'Module 1 of 6',
      'ar': '',
      'fr': '',
    },
    'zwxrh13o': {
      'en': 'Start Now',
      'ar': '',
      'fr': '',
    },
  },
  // Homepage_Overlay_course_2
  {
    '827d0yjk': {
      'en': '[Course name]',
      'ar': '',
      'fr': '',
    },
    'fnpfjbz2': {
      'en': 'Module 1 of 6',
      'ar': '',
      'fr': '',
    },
    'dp0u4r6h': {
      'en': 'Start Now',
      'ar': '',
      'fr': '',
    },
  },
  // Homepage_Overlay_course_3
  {
    '52eojav5': {
      'en': '[Course name]',
      'ar': '',
      'fr': '',
    },
    '4se58mfx': {
      'en': '[Description]',
      'ar': '',
      'fr': '',
    },
    'qqc09i6h': {
      'en': 'Module 1 of 6',
      'ar': '',
      'fr': '',
    },
    '7h8bfsxe': {
      'en': 'Start Now',
      'ar': '',
      'fr': '',
    },
  },
  // Weekly_streak
  {
    'idf7964y': {
      'en': '7-day streak!',
      'ar': '',
      'fr': '',
    },
    'tht9hqd4': {
      'en': 'Keep it up. We are rooting for you!',
      'ar': '',
      'fr': '',
    },
    '4agbq885': {
      'en': 'Continue learning',
      'ar': '',
      'fr': '',
    },
  },
  // scenario_options
  {
    'h51m4m6j': {
      'en': 'Select the correct option',
      'ar': '',
      'fr': '',
    },
    'j4a81obb': {
      'en': 'Close',
      'ar': '',
      'fr': '',
    },
  },
  // new_component
  {
    'x57dq15w': {
      'en': 'New',
      'ar': '',
      'fr': '',
    },
  },
  // Well_done_1
  {
    'nv3d3n37': {
      'en':
          'Don\'t stop learning and assessing your skills. \nWe are rooting for you!',
      'ar': '',
      'fr': '',
    },
    'zctm2fdw': {
      'en': 'Continue learning',
      'ar': '',
      'fr': '',
    },
  },
  // Well_done_2
  {
    'ms4mz3x7': {
      'en': 'Keep Rocking (Name)!',
      'ar': '',
      'fr': '',
    },
    'a3zkq3jm': {
      'en':
          'Don\'t stop learning and assessing your skills. \nWe are rooting for you!',
      'ar': '',
      'fr': '',
    },
    '0yah504p': {
      'en': 'Continue learning',
      'ar': '',
      'fr': '',
    },
  },
  // Well_done_3
  {
    'qo62syrc': {
      'en': 'Keep Rocking (Name)!',
      'ar': '',
      'fr': '',
    },
    '913i9e9u': {
      'en':
          'Don\'t stop learning and assessing your skills. \nWe are rooting for you!',
      'ar': '',
      'fr': '',
    },
    'vskp86o6': {
      'en': 'Continue learning',
      'ar': '',
      'fr': '',
    },
  },
  // Primary_button_component
  {
    '4sjwd3ud': {
      'en': 'Login',
      'ar': '',
      'fr': '',
    },
  },
  // Subscription
  {
    '9ol5x9bx': {
      'en': 'Life-time Access',
      'ar': '',
      'fr': '',
    },
    '0slxjwz9': {
      'en': 'NFT employability badge',
      'ar': '',
      'fr': '',
    },
    'nkq1u3zs': {
      'en': 'Unlimited hearts',
      'ar': '',
      'fr': '',
    },
    '2vkeqvmb': {
      'en': 'Unlimited  digital badge downloads',
      'ar': '',
      'fr': '',
    },
    'ltqni4wb': {
      'en': 'Detailed signed and stamp soft skills analysis report',
      'ar': '',
      'fr': '',
    },
    '6oa9bkqx': {
      'en': 'Access to new assessments',
      'ar': '',
      'fr': '',
    },
    'yce1g821': {
      'en': 'Ability to stop timer',
      'ar': '',
      'fr': '',
    },
    '8x25bv0o': {
      'en': 'Let\'s do this',
      'ar': '',
      'fr': '',
    },
  },
  // SkillGapanalysis
  {
    'pa40so2y': {
      'en': 'Your current skill strength',
      'ar': '',
      'fr': '',
    },
    'ym9ykjre': {
      'en':
          'You can download a detailed skill gap analysis report once you have completed a minimum of 4 courses.',
      'ar': '',
      'fr': '',
    },
    '6zj1ohgj': {
      'en': 'Request Analysis Report',
      'ar': '',
      'fr': '',
    },
    'l2ctubee': {
      'en': 'Close',
      'ar': '',
      'fr': '',
    },
  },
  // TimesUp
  {
    '7m9tfqkw': {
      'en': 'Your time is up',
      'ar': '',
      'fr': '',
    },
    'tckebs70': {
      'en': 'Back to Home',
      'ar': '',
      'fr': '',
    },
    'm5u2bmrn': {
      'en': 'Turn of the timer',
      'ar': '',
      'fr': '',
    },
  },
  // Download_Badge
  {
    'nfui3hmw': {
      'en': 'Your badge is ready!!!',
      'ar': '',
      'fr': '',
    },
    'xm2rtfv7': {
      'en': 'Download',
      'ar': '',
      'fr': '',
    },
  },
  // Review
  {
    '797qiva3': {
      'en': 'Enjoying the App?',
      'ar': '',
      'fr': '',
    },
    'exrsk4up': {
      'en': 'Make a review to help us provide better experiences',
      'ar': '',
      'fr': '',
    },
    'oig8j1vb': {
      'en': 'Review',
      'ar': '',
      'fr': '',
    },
    'ygqfez6c': {
      'en': 'Close',
      'ar': '',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'ogq6u2di': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '4lchgy80': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '57kyh7oq': {
      'en': 'We would like to send you notifications when events happen',
      'ar': '',
      'fr': '',
    },
    '9m56gsmk': {
      'en':
          'In order to give you access to your schedules via your mobile, this app may need access to your calendar.',
      'ar': '',
      'fr': '',
    },
    'mqwey5ho': {
      'en': 'We need access to your microphone to record',
      'ar': '',
      'fr': '',
    },
    'zlqp3g0x': {
      'en': 'We need to access your location to provide accurate results',
      'ar': '',
      'fr': '',
    },
    '9gvbvrgh': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'lhkl1ruk': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'nfzh9nx8': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'eq1p2xvq': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'wru7eb0m': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '4nltlyy7': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '2jpsf6hy': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'kk96qfn1': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'oixondll': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '5cihdxhs': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '075ddfd6': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'mo33xw8d': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'fiuesrqs': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'fai87dce': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'i5pzdl0h': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    't6zy6m16': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '5top4b88': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'uir75qel': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'f3lt0j1w': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'vc3lvh09': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '4o5k524z': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'divddlpa': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    '4rnhm955': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'cmwctwm4': {
      'en': '',
      'ar': '',
      'fr': '',
    },
    'cimi3ncb': {
      'en': '',
      'ar': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
