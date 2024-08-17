// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color border;
  late Color backgroundComponents;
  late Color primary50;
  late Color primary100;
  late Color primary200;
  late Color primary300;
  late Color primary400;
  late Color primary500;
  late Color primary600;
  late Color primary700;
  late Color primary800;
  late Color primary900;
  late Color primary950;
  late Color successBackground;
  late Color successText;
  late Color errorBackground;
  late Color errorText;
  late Color warningBG;
  late Color warningText;
  late Color gray900;
  late Color gray800;
  late Color gray700;
  late Color gray600;
  late Color gray500;
  late Color gray400;
  late Color gray300;
  late Color gray200;
  late Color gray100;
  late Color gray50;
  late Color gray25;
  late Color white;
  late Color black;
  late Color challenge1;
  late Color challenge2;
  late Color challenge3;
  late Color challenge4;
  late Color courseShadow1;
  late Color courseShadow2;
  late Color courseShadow3;
  late Color courseShadow4;
  late Color lockedCourseShadow;
  late Color buttonDropShadow;
  late Color accent2Button;
  late Color accent3Button;
  late Color accent4Button;
  late Color courseRingShadow;
  late Color comment;
  late Color commentShadow;
  late Color pricingTopBorder;
  late Color pricingBottomBorder;
  late Color pricingContainer;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF1771DF);
  late Color secondary = const Color(0xFFFF00B2);
  late Color tertiary = const Color(0xFF344053);
  late Color alternate = const Color(0xFF667085);
  late Color primaryText = const Color(0xFF101728);
  late Color secondaryText = const Color(0xFF475467);
  late Color primaryBackground = const Color(0xFFFFFFFF);
  late Color secondaryBackground = const Color(0xFFF2F4F7);
  late Color accent1 = const Color(0xFFFFDBBF);
  late Color accent2 = const Color(0xFFBDD2FC);
  late Color accent3 = const Color(0xFFBDFCDC);
  late Color accent4 = const Color(0xFFDBBFFF);
  late Color success = const Color(0xFF249689);
  late Color warning = const Color(0xFFFFDD00);
  late Color error = const Color(0xFFFF5963);
  late Color info = const Color(0xFFFFFFFF);

  late Color border = Color(0xFFEAECF0);
  late Color backgroundComponents = Color(0xFFFFFFFF);
  late Color primary50 = Color(0xFFEBF6FF);
  late Color primary100 = Color(0xFFD1ECFF);
  late Color primary200 = Color(0xFFAEDFFF);
  late Color primary300 = Color(0xFF76CDFF);
  late Color primary400 = Color(0xFF35B0FF);
  late Color primary500 = Color(0xFF0787FF);
  late Color primary600 = Color(0xFF0061FF);
  late Color primary700 = Color(0xFF0048FF);
  late Color primary800 = Color(0xFF003BD7);
  late Color primary900 = Color(0xFF003399);
  late Color primary950 = Color(0xFF062365);
  late Color successBackground = Color(0xFFD1FBE0);
  late Color successText = Color(0xFF039855);
  late Color errorBackground = Color(0xFFFFE4E2);
  late Color errorText = Color(0xFFDA2C20);
  late Color warningBG = Color(0xFFFFF0C7);
  late Color warningText = Color(0xFF792E0D);
  late Color gray900 = Color(0xFF101828);
  late Color gray800 = Color(0xFF1D2939);
  late Color gray700 = Color(0xFF344054);
  late Color gray600 = Color(0xFF475467);
  late Color gray500 = Color(0xFF667085);
  late Color gray400 = Color(0xFF98A2B3);
  late Color gray300 = Color(0xFFD0D5DD);
  late Color gray200 = Color(0xFFEAECF0);
  late Color gray100 = Color(0xFFF2F4F7);
  late Color gray50 = Color(0xFFF9FAFB);
  late Color gray25 = Color(0xFFFCFCFD);
  late Color white = Color(0xFFFFFFFF);
  late Color black = Color(0xFF000000);
  late Color challenge1 = Color(0xFF094747);
  late Color challenge2 = Color(0xFF0D1540);
  late Color challenge3 = Color(0xFF2B0D41);
  late Color challenge4 = Color(0xFF0D2F40);
  late Color courseShadow1 = Color(0xFF244307);
  late Color courseShadow2 = Color(0xFF759E00);
  late Color courseShadow3 = Color(0xFFDA979D);
  late Color courseShadow4 = Color(0xFF81E1DC);
  late Color lockedCourseShadow = Color(0xFFE7EDF7);
  late Color buttonDropShadow = Color(0xFF0B61CB);
  late Color accent2Button = Color(0xFF4C80F4);
  late Color accent3Button = Color(0xFF0EA95C);
  late Color accent4Button = Color(0xFF9345F8);
  late Color courseRingShadow = Color(0xFFD0D5DD);
  late Color comment = Color(0xFFB7DBFF);
  late Color commentShadow = Color(0xFFADD6FF);
  late Color pricingTopBorder = Color(0xFFE5EEFF);
  late Color pricingBottomBorder = Color(0xFFFAFCFF);
  late Color pricingContainer = Color(0xFFFFFFFF);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Recolta Alt';
  TextStyle get displayLarge => TextStyle(
        fontFamily: 'Recolta Alt',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 44.0,
        fontStyle: FontStyle.normal,
      );
  String get displayMediumFamily => 'Recolta Alt';
  TextStyle get displayMedium => TextStyle(
        fontFamily: 'Recolta Alt',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'Recolta Alt';
  TextStyle get displaySmall => TextStyle(
        fontFamily: 'Recolta Alt',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Recolta Alt';
  TextStyle get headlineLarge => TextStyle(
        fontFamily: 'Recolta Alt',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Recolta Alt';
  TextStyle get headlineMedium => TextStyle(
        fontFamily: 'Recolta Alt',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
      );
  String get headlineSmallFamily => 'Recolta Alt';
  TextStyle get headlineSmall => TextStyle(
        fontFamily: 'Recolta Alt',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'Recolta Alt';
  TextStyle get titleLarge => TextStyle(
        fontFamily: 'Recolta Alt',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Recolta Alt';
  TextStyle get titleMedium => TextStyle(
        fontFamily: 'Recolta Alt',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Recolta Alt';
  TextStyle get titleSmall => TextStyle(
        fontFamily: 'Recolta Alt',
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'Recolta Alt';
  TextStyle get labelLarge => TextStyle(
        fontFamily: 'Recolta Alt',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Recolta Alt';
  TextStyle get labelMedium => TextStyle(
        fontFamily: 'Recolta Alt',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'Recolta Alt';
  TextStyle get labelSmall => TextStyle(
        fontFamily: 'Recolta Alt',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'Recolta Alt';
  TextStyle get bodyLarge => TextStyle(
        fontFamily: 'Recolta Alt',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Recolta Alt';
  TextStyle get bodyMedium => TextStyle(
        fontFamily: 'Recolta Alt',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Recolta Alt';
  TextStyle get bodySmall => TextStyle(
        fontFamily: 'Recolta Alt',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF4273F6);
  late Color secondary = const Color(0xFF0787FF);
  late Color tertiary = const Color(0xFF344053);
  late Color alternate = const Color(0xFFE0E3E7);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFFFFFFFF);
  late Color primaryBackground = const Color(0xFF040D17);
  late Color secondaryBackground = const Color(0xFF212227);
  late Color accent1 = const Color(0xFFFFDBBF);
  late Color accent2 = const Color(0xFFBDD2FC);
  late Color accent3 = const Color(0xFFBDFCDC);
  late Color accent4 = const Color(0xFFDBBFFF);
  late Color success = const Color(0xFF11DF58);
  late Color warning = const Color(0xFFF9CF58);
  late Color error = const Color(0xFFFF5252);
  late Color info = const Color(0xFFFFFFFF);

  late Color border = Color(0xFF2C2D33);
  late Color backgroundComponents = Color(0xFF1D2428);
  late Color primary50 = Color(0xFF39393C);
  late Color primary100 = Color(0xFF021427);
  late Color primary200 = Color(0xFF672A07);
  late Color primary300 = Color(0xFFD11AA6);
  late Color primary400 = Color(0xFF41C0CA);
  late Color primary500 = Color(0xFF0130E0);
  late Color primary600 = Color(0xFF7E60E7);
  late Color primary700 = Color(0xFFCFD269);
  late Color primary800 = Color(0xFF0048FF);
  late Color primary900 = Color(0xFF303034);
  late Color primary950 = Color(0xFF062365);
  late Color successBackground = Color(0xFF11DF58);
  late Color successText = Color(0xFF3CF29D);
  late Color errorBackground = Color(0xFFE46962);
  late Color errorText = Color(0xFFFFFFFF);
  late Color warningBG = Color(0xFFFFE763);
  late Color warningText = Color(0xFF4C4106);
  late Color gray900 = Color(0xFFF5F3F7);
  late Color gray800 = Color(0xFFF2F0F4);
  late Color gray700 = Color(0xFFEFEDF1);
  late Color gray600 = Color(0xFFE4E2E6);
  late Color gray500 = Color(0xFFC8C6CA);
  late Color gray400 = Color(0xFF919094);
  late Color gray300 = Color(0xFF373D43);
  late Color gray200 = Color(0xFF39393C);
  late Color gray100 = Color(0xFF1F2327);
  late Color gray50 = Color(0xFF212227);
  late Color gray25 = Color(0xFF131316);
  late Color white = Color(0xFFFFFFFF);
  late Color black = Color(0xFF000000);
  late Color challenge1 = Color(0xFF094747);
  late Color challenge2 = Color(0xFF0D1540);
  late Color challenge3 = Color(0xFF2B0D41);
  late Color challenge4 = Color(0xFF0D2F40);
  late Color courseShadow1 = Color(0xFF244307);
  late Color courseShadow2 = Color(0xFF759E00);
  late Color courseShadow3 = Color(0xFFDA979D);
  late Color courseShadow4 = Color(0xFF81E1DC);
  late Color lockedCourseShadow = Color(0xFF181818);
  late Color buttonDropShadow = Color(0xFF1361BF);
  late Color accent2Button = Color(0xFF4C80F4);
  late Color accent3Button = Color(0xFF0EA95C);
  late Color accent4Button = Color(0xFF9345F8);
  late Color courseRingShadow = Color(0xFF03060D);
  late Color comment = Color(0xFF041628);
  late Color commentShadow = Color(0xFF062748);
  late Color pricingTopBorder = Color(0xFF28292A);
  late Color pricingBottomBorder = Color(0xFF212227);
  late Color pricingContainer = Color(0xFF212227);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
              shadows: shadows,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
              shadows: shadows,
            );
}
