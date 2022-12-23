import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/core/utils/poke_colors.dart';
import 'package:pokedex/app/core/widgets/labels/info_and_label.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'ihsjaiosa ljsakljs aljsakjdkjkfljsaçlf lskfla flkalçfks fksfklakf lfklakf lskf mflsaç fkça ç',
              style: GoogleFonts.encodeSans(
                fontSize: 12,
                color: PokeColors.grey2,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                InfoAndLabel(
                  info: '',
                  label: 'Altura',
                ),
                InfoAndLabel(
                  info: ' lbs',
                  label: 'Peso',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
