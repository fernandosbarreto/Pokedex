import 'package:flutter_modular/flutter_modular.dart';

import 'blocs/pokemon_list_bloc.dart';
import 'poke_info/blocs/pokemon_detail/pokemon_detail_bloc.dart';
import 'poke_info/blocs/pokemon_info/pokemon_info_bloc.dart';
import 'poke_info/poke_info_controller.dart';
import 'poke_info/poke_info_page.dart';
import 'poke_list_controller.dart';
import 'poke_list_page.dart';
import 'store/poke_store.dart';

class PokeListModule extends Module {
  @override
  final List<Bind> binds = [
    //blocs
    Bind.factory((i) => PokemonListBloc(i.get())),
    Bind.factory((i) => PokemonInfoBloc(i.get(), i.get())),
    Bind.factory((i) => PokemonDetailBloc(i.get(), i.get())),

    //controllers
    Bind.lazySingleton((i) => PokeListController(i.get(), i.get())),
    Bind.lazySingleton((i) => PokeInfoController(i.get(), i.get(), i.get())),

    //stores
    Bind.lazySingleton((i) => PokeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const NewPokeListPage()),
    ChildRoute('/poke-info/', child: (_, args) => const PokeInfoPage()),
  ];
}
