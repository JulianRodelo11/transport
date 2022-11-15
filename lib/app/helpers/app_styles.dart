import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kWhite = Color(0xffffffff);
const Color kLightWhite = Color(0xffEFF5F4);
const Color kLighterWhite = Color(0xffFCFCFC);

const Color kGrey = Color(0xff9397A0);
const Color kLightGrey = Color(0xffA7A7A7);

const Color kBlue = Color(0xff5474FD);
const Color kLightBlue = Color(0xff83B1FF);
const Color kLighterBlue = Color(0xffC1D4F9);

const Color kBlack = Colors.black87;

const double kBorderRadius = 16.0;

final kBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(kBorderRadius),
  borderSide: BorderSide.none,
);

final kPoppinsBold = GoogleFonts.poppins(
  color: kBlack,
  fontWeight: FontWeight.w700,
);

final kPoppinsSemibold = GoogleFonts.poppins(
  color: kBlack,
  fontWeight: FontWeight.w600,
);

final kPoppinsMedium = GoogleFonts.poppins(
  color: kBlack,
  fontWeight: FontWeight.w500,
);

final kPoppinsRegular = GoogleFonts.poppins(
  color: kBlack,
  fontWeight: FontWeight.w400,
);
