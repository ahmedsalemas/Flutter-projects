import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_clone/utils/fonts.dart';

class TextStyles {
  static TextStyle header1(BuildContext context, Color color) {
    return GoogleFonts.alef(
      fontSize: FontSizes.largest,
      textStyle: TextStyle(color: color),
    );
  }
}
