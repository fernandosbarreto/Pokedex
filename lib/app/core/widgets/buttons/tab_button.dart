import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/core/utils/poke_colors.dart';
import 'package:pokedex/app/core/widgets/animated_widgets/resize_on_tap_widget.dart';

class TabButton extends StatelessWidget {
  final void Function() onTap;
  final String label;
  final bool isSelected;
  final Color? selectedColor;
  const TabButton({
    Key? key,
    required this.onTap,
    required this.label,
    this.isSelected = false,
    this.selectedColor = PokeColors.green2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResizeOnTapWidget(
      runStartAnimation: false,
      child: GestureDetector(
        onTap: onTap,
        child: Material(
          elevation: 5,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          shadowColor: Colors.grey.withOpacity(0.5),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
            child: Center(
              child: Text(
                label,
                style: GoogleFonts.encodeSans(
                  fontSize: 12,
                  color: isSelected ? selectedColor : PokeColors.black1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
