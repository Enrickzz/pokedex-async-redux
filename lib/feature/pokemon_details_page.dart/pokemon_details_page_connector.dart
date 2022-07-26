import 'package:async_redux/async_redux.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/pokemon_details_page.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/pokemon_details_page_vm.dart';
import 'package:pokedex_async_redux/feature/widgets/pokemon_details_loading_widget.dart';
import 'package:pokedex_async_redux/state/actions/pokemon_details_actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:flutter/material.dart';

class PokemonDetailsConnector extends StatelessWidget {
  const PokemonDetailsConnector({
    required this.id,
    Key? key,
  }) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonDetailsVm>(
        vm: () => PokemonDetailsVmFactory(),
        onInit: (store) async => store.dispatch(GetPokemonDetailsAction(id)),
        builder: (context, vm) {
          return vm.pokemonDetailsState.when(
            (pokemonDetails) => PokemonDetails(pokemon: pokemonDetails!),
            loading: () => const PokemonDetailsLoading(),
            error: (err) => Center(child: Text(err!)),
          );
        });
  }
}
