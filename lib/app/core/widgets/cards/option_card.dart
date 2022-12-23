import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:pokedex/app/core/utils/poke_colors.dart';
import 'package:pokedex/app/core/widgets/animated_widgets/resize_on_tap_widget.dart';

class OptionCard extends StatelessWidget {
  final String label;
  final Color color;
  final void Function()? onTap;
  const OptionCard({
    Key? key,
    this.label = 'Label',
    this.color = PokeColors.red1,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResizeOnTapWidget(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          height: 70,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: color,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    label,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.encodeSans(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
