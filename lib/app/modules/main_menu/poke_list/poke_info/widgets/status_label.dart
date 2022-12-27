import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/core/helpers/poketype_helper.dart';
import 'package:pokedex/app/core/utils/poke_colors.dart';

class StatusLabel extends StatelessWidget {
  final String label;
  final String value;
  final String pokemonType;

  const StatusLabel({
    super.key,
    required this.label,
    required this.value,
    required this.pokemonType,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    double statsPercentage =
        double.parse((int.parse(value) / 200).toStringAsFixed(2));

    return Row(
      children: [
        SizedBox(
          width: screenSize.width * 0.35,
          child: Text(
            label,
            style: GoogleFonts.encodeSans(
              fontSize: 16,
              color: PokeColors.grey2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: screenSize.width * 0.05),
        SizedBox(
          width: screenSize.width * 0.1,
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.encodeSans(
              fontSize: 16,
              color: PokeColors.black1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: screenSize.width * 0.05),
        Flexible(
          child: LinearProgressIndicator(
            minHeight: 8,
            value: statsPercentage,
            color: PoketypeHelper.getPokeColorByString(pokemonType),
            backgroundColor: PokeColors.grey1,
          ),
        )
      ],
    );
  }
}
