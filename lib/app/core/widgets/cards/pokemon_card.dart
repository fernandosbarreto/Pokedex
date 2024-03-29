import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pokedex/app/core/helpers/poketype_helper.dart';
import 'package:pokedex/app/core/widgets/animated_widgets/resize_on_tap_widget.dart';

class PokemonCard extends StatelessWidget {
  final String? image;
  final String name;
  final String number;
  final List<String> types;
  final void Function()? onTap;
  const PokemonCard({
    Key? key,
    required this.image,
    required this.types,
    this.name = 'Pokémon',
    this.number = '000',
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResizeOnTapWidget(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 5, right: 20),
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: PoketypeHelper.getPokeColorByString(types[0]),
                  boxShadow: [
                    BoxShadow(
                      color: PoketypeHelper.getPokeColorByString(types[0])
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
              ),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Positioned(
                    top: -15,
                    left: -18,
                    child: SizedBox(
                      height: 145,
                      width: 145,
                      child: image != '' && image != null
                          ? Image.network(
                              image!,
                              fit: BoxFit.fill,
                            )
                          : const Padding(
                              padding: EdgeInsets.all(50),
                              child: CircularProgressIndicator(
                                  color: Colors.white),
                            ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(80)),
                        // color: PoketypeHelper.getPokeColorByString(types[0]),
                        gradient: LinearGradient(
                          stops: const [0.1, 0.25],
                          colors: [
                            PoketypeHelper.getPokeColorByString(types.first)
                                .withOpacity(0.1),
                            PoketypeHelper.getPokeColorByString(types.first)
                          ],
                        ),
                      ),
                      height: 100,
                      width: 330,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 5),
                    height: 100,
                    child: Row(
                      children: [
                        const SizedBox(
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 80,
                          width: 235,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.encodeSans(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  ...PoketypeHelper.getTypeIcons(types)
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 4,
                bottom: 0,
                child: Text(
                  '#$number',
                  maxLines: 1,
                  style: GoogleFonts.encodeSans(
                    fontSize: 35,
                    color: Colors.white.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
