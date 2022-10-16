import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/models/pokemon_info_model.dart';
import '../../../../core/widgets/scaffolds/custom_scroll_scaffold.dart';
import 'poke_info_controller.dart';

class PokeInfoPage extends StatefulWidget {
  final PokemonInfoModel pokemonInfoModel;
  const PokeInfoPage({
    Key? key,
    required this.pokemonInfoModel,
  }) : super(key: key);

  @override
  State<PokeInfoPage> createState() => _PokeInfoPageState();
}

class _PokeInfoPageState extends State<PokeInfoPage> {
  final controller = Modular.get<PokeInfoController>();

  @override
  Widget build(BuildContext context) {
    return CustomScrollScaffold(
      children: [
        SizedBox(
          height: 145,
          width: 145,
          child: widget.pokemonInfoModel.thumbnailImage != ''
              ? Image.network(
                  widget.pokemonInfoModel.thumbnailImage,
                  fit: BoxFit.fill,
                )
              : const Padding(
                  padding: EdgeInsets.all(50),
                  child: CircularProgressIndicator(color: Colors.white),
                ),
        ),
        Text(widget.pokemonInfoModel.name),
      ],
    );
  }
}
