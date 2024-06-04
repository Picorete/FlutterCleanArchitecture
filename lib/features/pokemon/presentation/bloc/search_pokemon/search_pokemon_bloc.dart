import 'package:clean_architecture_pokemon_app/core/error/failure.dart';
import 'package:clean_architecture_pokemon_app/core/utils/utils.dart' as utils;
import 'package:clean_architecture_pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/domain/use_cases/capture_pokemon.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/domain/use_cases/get_captured_pokemons.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/domain/use_cases/search_pokemon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_pokemon_event.dart';
part 'search_pokemon_state.dart';

class SearchPokemonBloc extends Bloc<SearchPokemonEvent, SearchPokemonState> {
  final CapturePokemonUseCase _capturePokemonUseCase;
  final GetCapturedsPokemonsUseCase _getCapturedsPokemonsUseCase;
  final SearchPokemonUseCase _searchPokemonUseCase;

  SearchPokemonBloc(this._capturePokemonUseCase,
      this._getCapturedsPokemonsUseCase, this._searchPokemonUseCase)
      : super(SearchPokemonInitial()) {
    on<OnSearchPokemon>((event, emit) async {
      emit(SearchPokemonLoading());

      final resp = await _searchPokemonUseCase(utils.randomPokemonId);

      resp.fold((f) => emit(SearchPokemonFailure(failure: f)),
          (p) => emit(SearchPokemonSuccess(pokemon: p)));
    });
    on<OnCapturePokemon>((event, emit) async {
      final resp = await _capturePokemonUseCase(event.pokemon);

      resp.fold((f) => emit(SearchPokemonFailure(failure: f)), (p) {});
    });

    on<OnGetCapturedPokemons>((event, emit) async {
      final resp = await _getCapturedsPokemonsUseCase();

      resp.fold((f) => emit(SearchPokemonFailure(failure: f)),
          (ps) => emit(SearchPokemonList(pokemons: ps)));
    });
  }
}
