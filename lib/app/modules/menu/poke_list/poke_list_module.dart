import 'package:flutter_modular/flutter_modular.dart';

import 'blocs/pokemon_list_bloc.dart';
import 'poke_info/poke_info_controller.dart';
import 'poke_info/poke_info_page.dart';
import 'poke_list_controller.dart';
import 'poke_list_page.dart';

class PokeListModule extends Module {
  @override
  final List<Bind> binds = [
    //blocs
    Bind.factory((i) => PokemonListBloc(i.get())),

    //controllers
    Bind.lazySingleton((i) => PokeListController(i.get())),
    Bind.lazySingleton((i) => PokeInfoController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const NewPokeListPage()),
    ChildRoute('/poke-info/',
        child: (_, args) => PokeInfoPage(pokemon: args.data)),
  ];
}
