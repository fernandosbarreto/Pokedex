import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pokedex/app/core/utils/poke_colors.dart';

class SearchField extends StatelessWidget {
  final void Function(String)? onChanged;
  const SearchField({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
          color: PokeColors.grey1,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              bottom: 0,
              left: 20,
              child: Icon(FontAwesomeIcons.search, size: 20),
            ),
            TextFormField(
              onChanged: onChanged,
              autofocus: false,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Pesquise por um Pokémon',
                hintStyle: GoogleFonts.encodeSans(fontWeight: FontWeight.w500),
                contentPadding: const EdgeInsets.only(
                  left: 60.0,
                  top: 15.0,
                  right: 20.0,
                  bottom: 15.0,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
