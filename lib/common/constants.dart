import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kMeteorite = Color(0xff3B1E77);
const Color kLightSalmon = Color(0xffF9B091);
const Color kBlueViolet = Color(0xff863ED5);
const Color kOsloGrey = Color(0xff8789A3);
const Color kWhite = Color(0xffFFFFFF);
const Color kBlack = Color(0xff240F4F);
const Color kGrey = Color(0xffF3EFF4);

final TextStyle kHeading4 = GoogleFonts.poppins(
  fontSize: 28,
  fontWeight: FontWeight.w700,
);
final TextStyle kHeading5 = GoogleFonts.poppins(
  fontSize: 24,
  fontWeight: FontWeight.w600,
);
final TextStyle kHeading6 = GoogleFonts.poppins(
  fontSize: 18,
  fontWeight: FontWeight.w400,
);
final TextStyle kTitle = GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);
final TextStyle kSubtitle = GoogleFonts.poppins(
  fontSize: 14,
  fontWeight: FontWeight.w500,
);
final TextStyle kBodyText = GoogleFonts.poppins(
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

final kTextTheme = TextTheme(
  headline4: kHeading4,
  headline5: kHeading5,
  headline6: kHeading6,
  subtitle1: kTitle,
  subtitle2: kSubtitle,
  bodyText2: kBodyText,
);

ColorScheme kColorScheme = const ColorScheme(
  primary: kMeteorite,
  primaryContainer: kBlueViolet,
  secondary: kLightSalmon,
  secondaryContainer: kLightSalmon,
  surface: kWhite,
  background: kWhite,
  error: Colors.red,
  onPrimary: kBlueViolet,
  onSecondary: Colors.white,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.white,
  brightness: Brightness.dark,
);
