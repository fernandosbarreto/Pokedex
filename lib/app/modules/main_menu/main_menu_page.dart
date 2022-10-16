import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/core/utils/poke_colors.dart';
import 'package:pokedex/app/core/widgets/cards/option_card.dart';
import 'package:pokedex/app/core/widgets/fields/search_field.dart';
import 'package:pokedex/app/core/widgets/scaffolds/custom_scroll_scaffold.dart';
import 'main_menu_controller.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({Key? key}) : super(key: key);

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  final controller = Modular.get<MainMenuController>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollScaffold(
      backgroundColor: PokeColors.grey1,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Qual Pokémon você está procurando?',
                  style: GoogleFonts.encodeSans(
                    color: Colors.black87,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const SearchField(),
              const SizedBox(height: 20),
              GridView.builder(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 5 / 2,
                  crossAxisCount: 2,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return OptionCard(
                    label: controller.cardLabels[index],
                    color: controller.cardColors[index],
                    onTap: controller.cardRoutes[index],
                  );
                },
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ],
    );
  }
}
