import 'package:async_redux/async_redux.dart';
import 'package:pokedex_async_redux/feature/home_page/home_page.dart';
import 'package:pokedex_async_redux/feature/home_page/home_page_vm.dart';
import 'package:pokedex_async_redux/feature/widgets/pokemon_list_loading_widget.dart';
import 'package:pokedex_async_redux/state/actions/home_page_actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:flutter/material.dart';

class HomePageConnector extends StatelessWidget {
  const HomePageConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomePageVm>(
        vm: () => HomePageVmFactory(),
        onInit: (store) async => store.dispatch(GetPokemonListAction()),
        builder: (context, vm) {
          return vm.homePageState.when(
            (pokemonList) => HomePage(pokemon: pokemonList!),
            loading: () => const PokemonListLoading(),
            error: (err) => Center(child: Text(err!)),
          );
        });
  }
}
