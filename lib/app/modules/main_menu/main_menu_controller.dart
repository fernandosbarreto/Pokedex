import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/utils/poke_colors.dart';

class MainMenuController {
  final cardColors = [
    PokeColors.green1,
    PokeColors.red1,
    PokeColors.blue1,
    PokeColors.yellow1,
    PokeColors.purple1,
    PokeColors.brown1,
  ];
  final cardLabels = [
    'Pokedex',
    'Movimentos',
    'Habilidades',
    'Items',
    'Locais',
    'Type charts',
  ];

  final cardRoutes = [
    () => Modular.to.pushNamed('/poke-list/'),
    // () => Modular.to.pushNamed('/movements/'),
    // () => Modular.to.pushNamed('/skills/'),
    // () => Modular.to.pushNamed('/items/'),
    // () => Modular.to.pushNamed('/locations/'),
    // () => Modular.to.pushNamed('/type-charts/'),
    () => debugPrint('b'),
    () => debugPrint('c'),
    () => debugPrint('d'),
    () => debugPrint('e'),
    () => debugPrint('f'),
  ];
}
