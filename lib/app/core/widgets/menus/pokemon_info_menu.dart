import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/core/widgets/texts/value_and_label.dart';

class PokemonInfoMenu extends StatelessWidget {
  const PokemonInfoMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 8,
          left: 40,
          child: Text(
            'About',
            style: GoogleFonts.encodeSans(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: 8,
          left: MediaQuery.of(context).size.width * 0.45,
          child: Text(
            'Stats',
            style: GoogleFonts.encodeSans(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 20,
          child: Text(
            'Evolution',
            style: GoogleFonts.encodeSans(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 2,
                        width: 80,
                        color: Colors.white38,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              color: Colors.red,
              child: _about(context),
            ),
          ],
        ),
        Positioned(
          top: 8,
          left: 40,
          child: Text(
            'About',
            style: GoogleFonts.encodeSans(
              fontSize: 20,
              color: Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: 8,
          left: MediaQuery.of(context).size.width * 0.45,
          child: Text(
            'Stats',
            style: GoogleFonts.encodeSans(
              fontSize: 20,
              color: Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 20,
          child: Text(
            'Evolution',
            style: GoogleFonts.encodeSans(
              fontSize: 20,
              color: Colors.white.withOpacity(0.5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

Widget _about(BuildContext context) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
        color: Colors.yellow,
        width: double.infinity,
        height: 80,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ValueAndLabel(
                  value: '1\'04"',
                  label: 'Height',
                ),
                SizedBox(height: 10),
                ValueAndLabel(
                  value: 'Mouse',
                  label: 'Category',
                ),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ValueAndLabel(
                  value: '1231 lbs',
                  label: 'Weight',
                ),
                SizedBox(height: 10),
                ValueAndLabel(
                  value: 'Static',
                  label: 'Abilities',
                ),
              ],
            ),
          ),
        ],
      )
    ],
  );
}
