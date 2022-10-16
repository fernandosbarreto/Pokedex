import 'package:flutter_modular/flutter_modular.dart';

import '../../core/interfaces/pokemon_repository_interface.dart';
import '../../core/repositories/pokemon_repository.dart';
import 'main_menu_controller.dart';
import 'main_menu_page.dart';
import 'poke_list/poke_list_module.dart';

class MainMenuModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MainMenuController()),

    //repositories
    Bind<IPokemonRepository>((i) => PokemonRepository(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    // ChildRoute('/', child: (_, args) => const DesignSystemPage()),

    //routes
    ChildRoute('/', child: (_, args) => const MainMenuPage()),

    //modules
    ModuleRoute('/poke-list/', module: PokeListModule()),
  ];
}
