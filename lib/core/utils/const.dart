import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kPrimary = Color(0xff00AA13);
const Color kWhite = Color(0xffffffff);
const Color kBlack = Colors.black;


TextStyle get NameStyle {
  return GoogleFonts.poppins(
    color: kWhite,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}


TextStyle get alamatStyle{
  return GoogleFonts.poppins(
    color: kWhite,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
}


TextStyle get tanggalStyle {
  return GoogleFonts.poppins(
    color: kWhite,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
}

TextStyle get tbttStyle {
  return GoogleFonts.poppins(
    color: kWhite,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
}
