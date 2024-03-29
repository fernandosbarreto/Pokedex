import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/core/utils/poke_colors.dart';

class PoketypeHelper {
  static const _poketypesMap = {
    'bug': 'assets/poketypes/bug.png',
    'dark': 'assets/poketypes/dark.png',
    'dragon': 'assets/poketypes/dragon.png',
    'electric': 'assets/poketypes/eletric.png',
    'fairy': 'assets/poketypes/fairy.png',
    'fighting': 'assets/poketypes/fighting.png',
    'fire': 'assets/poketypes/fire.png',
    'flying': 'assets/poketypes/flying.png',
    'ghost': 'assets/poketypes/ghost.png',
    'grass': 'assets/poketypes/grass.png',
    'ground': 'assets/poketypes/ground.png',
    'ice': 'assets/poketypes/ice.png',
    'normal': 'assets/poketypes/normal.png',
    'poison': 'assets/poketypes/poison.png',
    'psychic': 'assets/poketypes/psychic.png',
    'rock': 'assets/poketypes/rock.png',
    'steel': 'assets/poketypes/steel.png',
    'water': 'assets/poketypes/water.png',
  };

  static const _typeColor = {
    'bug': PokeColors.green2,
    'dark': PokeColors.purple1,
    'dragon': PokeColors.purple2,
    'electric': PokeColors.yellow1,
    'fairy': PokeColors.pink1,
    'fighting': PokeColors.orange1,
    'fire': PokeColors.red1,
    'flying': PokeColors.blue1,
    'ghost': PokeColors.purple1,
    'grass': PokeColors.green1,
    'ground': PokeColors.brown1,
    'ice': PokeColors.blue2,
    'normal': PokeColors.grey2,
    'poison': PokeColors.purple1,
    'psychic': PokeColors.purple1,
    'rock': PokeColors.yellow2,
    'steel': PokeColors.metal1,
    'water': PokeColors.blue1,
  };

  static String getPoketypePngByString(String key) {
    if (!_poketypesMap.containsKey(key)) {
      debugPrint(key);
    }
    return _poketypesMap[key]!;
  }

  static Color getPokeColorByString(String key) {
    if (!_typeColor.containsKey(key)) {
      debugPrint(key);
    }
    return _typeColor[key]!;
  }

  static List<Widget> getTypeIcons(List<String> types) {
    int i = 0;
    List<Widget> icons = [];
    if (types.length > 5) {
      while (i < 5) {
        icons.add(
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: SizedBox(
              height: 25,
              child: Image.asset(
                PoketypeHelper.getPoketypePngByString(types[i]),
              ),
            ),
          ), // jump to next iteration
        );
        i++;
      }
      return [
        ...icons,
        Text(
          '+ ${types.length - 5}',
          style: GoogleFonts.encodeSans(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ];
    } else if (types.length <= 5) {
      return [
        for (var type in types)
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: SizedBox(
              height: 25,
              child: Image.asset(
                PoketypeHelper.getPoketypePngByString(type),
              ),
            ),
          )
      ];
    } else {
      return const [];
    }
  }
}
