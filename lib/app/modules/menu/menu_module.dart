import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/core/interfaces/pokemon_repository_interface.dart';

import '../../core/repositories/pokemon_repository.dart';
import 'menu_controller.dart';
import 'menu_page.dart';
import 'poke_list/poke_list_module.dart';

class MenuModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MenuController(i.get())),

    //repositories
    Bind<IPokemonRepository>((i) => PokemonRepository(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    // ChildRoute('/', child: (_, args) => const DesignSystemPage()),

    //routes
    ChildRoute('/', child: (_, args) => const MenuPage()),

    //modules
    ModuleRoute('/poke-list/', module: PokeListModule()),
  ];
}
