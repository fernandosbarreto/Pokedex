import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/core/repositories/pokemon_repository.dart';
import 'package:pokedex/app/modules/menu/poke_list/poke_list_page.dart';
import 'package:pokedex/app/modules/menu/poke_list/poke_list_store.dart';
import 'menu_controller.dart';
import 'menu_page.dart';
import 'poke_info/poke_info_controller.dart';
import 'poke_info/poke_info_page.dart';

class MenuModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MenuController(i.get())),
    Bind.lazySingleton((i) => PokeInfoController(i.get())),
    Bind.factory((i) => PokeListStore(i.get())),

    //repositories
    Bind((i) => PokemonRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    // ChildRoute('/', child: (_, args) => const DesignSystemPage()),
    ChildRoute('/', child: (_, args) => const MenuPage()),
    ChildRoute('/poke-list', child: (_, args) => const NewPokeListPage()),
    ChildRoute('/poke-info', child: (_, args) => PokeInfoPage(pokemon: args.data)),
    // ChildRoute('/poke-moves', child: (_, args) => const MenuPage()),
    // ChildRoute('/poke-habilities', child: (_, args) => const MenuPage()),
    // ChildRoute('/poke-items', child: (_, args) => const MenuPage()),
    // ChildRoute('/poke-locals', child: (_, args) => const MenuPage()),
    // ChildRoute('/poke-types', child: (_, args) => const MenuPage()),
  ];
}
