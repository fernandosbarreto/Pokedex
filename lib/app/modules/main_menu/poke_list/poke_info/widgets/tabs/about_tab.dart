import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/core/utils/poke_colors.dart';
import 'package:pokedex/app/core/widgets/labels/info_and_label.dart';

class AboutTab extends StatelessWidget {
  final String description;
  final String height;
  final String weight;
  final List<String> abilities;
  final String category;
  const AboutTab({
    super.key,
    required this.description,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: GoogleFonts.encodeSans(
                fontSize: 16,
                color: PokeColors.grey2,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoAndLabel(
                      info: height,
                      label: 'Altura',
                    ),
                    const SizedBox(height: 20),
                    InfoAndLabel(
                      info: category,
                      label: 'Categoria',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoAndLabel(
                      info: weight,
                      label: 'Peso',
                    ),
                    const SizedBox(height: 20),
                    InfoAndLabel(
                      info: abilities.join('\n'),
                      label: 'Habilidades',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
