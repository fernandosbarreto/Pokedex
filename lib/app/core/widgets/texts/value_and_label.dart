import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ValueAndLabel extends StatelessWidget {
  final String value;
  final String label;
  const ValueAndLabel({Key? key, required this.value, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: GoogleFonts.encodeSans(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.encodeSans(
            fontSize: 18,
            color: Colors.white54,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
