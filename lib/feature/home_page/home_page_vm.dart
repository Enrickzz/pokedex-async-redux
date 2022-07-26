import 'package:async_redux/async_redux.dart';
import 'package:pokedex_async_redux/api/models/pokemon_model.dart';
import 'package:pokedex_async_redux/feature/home_page/home_page_connector.dart';
import 'package:pokedex_async_redux/models/union_page_state.dart';
import 'package:pokedex_async_redux/state/actions/home_page_actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';

class HomePageVmFactory extends VmFactory<AppState, HomePageConnector> {
  @override
  Vm fromStore() => HomePageVm(homePageState: _getPageState());

  UnionPageState<List<Pokemon>> _getPageState() {
    if (state.wait.isWaitingFor(GetPokemonListAction.key)) {
      return const UnionPageState.loading();
    } else if (state.pokemon.isNotEmpty) {
      return UnionPageState(state.pokemon);
    } else {
      return const UnionPageState.error("Can't load Pokemons");
    }
  }
}

class HomePageVm extends Vm {
  HomePageVm({required this.homePageState}) : super(equals: [homePageState]);

  final UnionPageState<List<Pokemon>> homePageState;
}
