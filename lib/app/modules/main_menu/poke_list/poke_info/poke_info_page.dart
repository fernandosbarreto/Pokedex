import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/app/core/helpers/poketype_helper.dart';
import 'package:pokedex/app/core/utils/poke_colors.dart';
import 'package:pokedex/app/core/widgets/buttons/tab_button.dart';
import 'package:pokedex/app/core/widgets/cards/pokemon_display_card.dart';
import 'package:pokedex/app/modules/main_menu/poke_list/poke_info/blocs/pokemon_detail/pokemon_detail_event.dart';
import 'package:pokedex/app/modules/main_menu/poke_list/poke_info/blocs/pokemon_detail/pokemon_detail_state.dart';
import 'package:pokedex/app/modules/main_menu/poke_list/poke_info/blocs/pokemon_info/pokemon_info_events.dart';
import 'package:pokedex/app/modules/main_menu/poke_list/poke_info/blocs/pokemon_info/pokemon_info_state.dart';
import 'package:pokedex/app/modules/main_menu/poke_list/poke_info/widgets/status_label.dart';
import 'package:pokedex/app/modules/main_menu/poke_list/poke_info/widgets/tabs/about_tab.dart';

import 'poke_info_controller.dart';

class PokeInfoPage extends StatefulWidget {
  const PokeInfoPage({
    Key? key,
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
  void initState() {
    super.initState();
    controller.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: screenSize.height,
        child: DefaultTabController(
          length: 3,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    PokemonDisplayCard(
                      pokemonImage: controller
                              .pokeStore.pokemonInfoModel?.thumbnailImage ??
                          '',
                      pokemonType:
                          controller.pokeStore.pokemonInfoModel?.type.first ??
                              '',
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
                        label: 'About',
                        selectedColor: PoketypeHelper.getPokeColorByString(
                            controller.pokeStore.pokemonInfoModel?.type.first ??
                                ''),
                        onTap: () {
                          setState(() {
                            controller.pokemonInfoBloc.inputPokemonInfo
                                .add(LoadPokemonInfoEvent());
                            tabController.animateTo(
                              0,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          });
                        },
                      ),
                      TabButton(
                        label: 'Stats',
                        isSelected: tabController.index == 1,
                        selectedColor: PoketypeHelper.getPokeColorByString(
                            controller.pokeStore.pokemonInfoModel?.type.first ??
                                ''),
                        onTap: () {
                          controller.pokemonDetailBloc.inputPokemonDetail
                              .add(LoadPokemonDetailEvent());
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
                        label: 'Evolution',
                        isSelected: tabController.index == 2,
                        selectedColor: PoketypeHelper.getPokeColorByString(
                            controller.pokeStore.pokemonInfoModel?.type.first ??
                                ''),
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
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    StreamBuilder<PokemonInfoState>(
                      stream: controller.pokemonInfoBloc.stream,
                      builder:
                          (context, AsyncSnapshot<PokemonInfoState> snapshot) {
                        if (!snapshot.hasData) {
                          return const SizedBox.shrink();
                        }
                        var state = snapshot.data;

                        if (state is PokemonInfoError) {
                          return Center(
                            child: Text(
                              'Cannot load information ${snapshot.error ?? ''}',
                              style: GoogleFonts.encodeSans(
                                fontSize: 16,
                                color: PokeColors.grey2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }
                        if (state is PokemonInfoLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        state = state as PokemonInfoData;
                        var pokeInfo = state.data;

                        return AboutTab(
                          description: pokeInfo.flavorTextEntries
                              .firstWhere(
                                  (element) => element.language.name == 'en')
                              .flavorText
                              .replaceAll('\n', ' '),
                          height:
                              '${controller.pokeStore.pokemonInfoModel?.height ?? ''}',
                          weight:
                              '${controller.pokeStore.pokemonInfoModel?.weight ?? ''}',
                          abilities: controller
                                  .pokeStore.pokemonInfoModel?.abilities ??
                              [],
                          category: pokeInfo.genera[7].genus
                              .replaceAll('Pokémon', ''),
                        );
                      },
                    ),
                    StreamBuilder<PokemonDetailState>(
                      stream: controller.pokemonDetailBloc.stream,
                      builder: (context,
                          AsyncSnapshot<PokemonDetailState> snapshot) {
                        if (!snapshot.hasData) {
                          return const SizedBox.shrink();
                        }
                        var state = snapshot.data;

                        if (state is PokemonInfoError) {
                          return Center(
                            child: Text(
                              'Cannot load information ${snapshot.error ?? ''}',
                              style: GoogleFonts.encodeSans(
                                fontSize: 16,
                                color: PokeColors.grey2,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }
                        if (state is PokemonInfoLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        state = state as PokemonDetailData;
                        var pokeDetail = state.data;

                        return Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var element in pokeDetail.stats)
                                  ...{
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 14),
                                      child: StatusLabel(
                                        pokemonType: controller.pokeStore
                                            .pokemonInfoModel!.type.first,
                                        label: element.stat.name,
                                        value: '${element.baseStat}',
                                      ),
                                    )
                                  }.toList(),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      width: screenSize.width,
                      child: Center(
                        child: Text(
                          'Work in progress',
                          style: GoogleFonts.encodeSans(
                            fontSize: 16,
                            color: PokeColors.grey2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
          '#${controller.pokeStore.pokemonInfoModel?.number ?? ''}',
          maxLines: 1,
          style: GoogleFonts.encodeSans(
            fontSize: 16,
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          controller.pokeStore.pokemonInfoModel?.name ?? '',
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
            ...PoketypeHelper.getTypeIcons(
                controller.pokeStore.pokemonInfoModel?.type ?? [])
          ],
        )
      ],
    );
  }
}
