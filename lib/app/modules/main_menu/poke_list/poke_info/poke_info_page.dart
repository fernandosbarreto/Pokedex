import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/core/helpers/poketype_helper.dart';
import 'package:pokedex/app/core/utils/poke_colors.dart';
import 'package:pokedex/app/core/widgets/buttons/tab_button.dart';
import 'package:pokedex/app/core/widgets/cards/pokemon_display_card.dart';
import 'package:pokedex/app/core/widgets/labels/info_and_label.dart';

import '../../../../core/models/pokemon_info_model.dart';
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

class _PokeInfoPageState extends State<PokeInfoPage>
    with TickerProviderStateMixin {
  final controller = Modular.get<PokeInfoController>();

  late final tabController = TabController(
    length: 3,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: DefaultTabController(
          length: 3,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    PokemonDisplayCard(
                      pokemonImage: widget.pokemonInfoModel.thumbnailImage,
                      pokemonType: widget.pokemonInfoModel.type.first,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 60),
                      child: _pokemonInfo,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TabButton(
                        isSelected: tabController.index == 0,
                        label: 'Sobre',
                        selectedColor: PoketypeHelper.getPokeColorByString(
                            widget.pokemonInfoModel.type.first),
                        onTap: () {
                          setState(() {
                            tabController.animateTo(
                              0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          });
                        },
                      ),
                      TabButton(
                        label: 'Status',
                        isSelected: tabController.index == 1,
                        selectedColor: PoketypeHelper.getPokeColorByString(
                            widget.pokemonInfoModel.type.first),
                        onTap: () {
                          setState(() {
                            tabController.animateTo(
                              1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          });
                        },
                      ),
                      TabButton(
                        label: 'Evoluções',
                        isSelected: tabController.index == 2,
                        selectedColor: PoketypeHelper.getPokeColorByString(
                            widget.pokemonInfoModel.type.first),
                        onTap: () {
                          setState(() {
                            tabController.animateTo(
                              2,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    _infoTab(context),
                    Container(
                      width: screenSize.width,
                      color: Colors.blue,
                    ),
                    Container(
                      width: screenSize.width,
                      color: Colors.yellow,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget get _pokemonInfo {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '#${widget.pokemonInfoModel.number}',
          maxLines: 1,
          style: GoogleFonts.encodeSans(
            fontSize: 16,
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          widget.pokemonInfoModel.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.encodeSans(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            ...PoketypeHelper.getTypeIcons(widget.pokemonInfoModel.type)
          ],
        )
      ],
    );
  }

  Widget _infoTab(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text(
                'ihsjaiosa ljsakljs aljsakjdkjkfljsaçlf lskfla flkalçfks fksfklakf lfklakf lskf mflsaç fkça ç',
                style: GoogleFonts.encodeSans(
                  fontSize: 12,
                  color: PokeColors.grey2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoAndLabel(
                        info: '${widget.pokemonInfoModel.height}',
                        label: 'Altura',
                      ),
                      const SizedBox(height: 20),
                      const InfoAndLabel(
                        info: '???',
                        label: 'Categoria',
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoAndLabel(
                        info: '${widget.pokemonInfoModel.weight} lbs',
                        label: 'Peso',
                      ),
                      const SizedBox(height: 20),
                      InfoAndLabel(
                        info: widget.pokemonInfoModel.abilities.first,
                        label: 'Habilidade',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
