import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/core/utils/poke_colors.dart';

class InfoAndLabel extends StatelessWidget {
  final String info;
  final String label;

  const InfoAndLabel({super.key, required this.info, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          info,
          style: GoogleFonts.encodeSans(
            fontSize: 14,
            color: PokeColors.grey3,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.encodeSans(
            fontSize: 16,
            color: PokeColors.grey2,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
