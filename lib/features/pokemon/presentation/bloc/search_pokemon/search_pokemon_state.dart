part of 'search_pokemon_bloc.dart';

sealed class SearchPokemonState {}

final class SearchPokemonInitial extends SearchPokemonState {}

final class SearchPokemonLoading extends SearchPokemonState {}

final class SearchPokemonSuccess extends SearchPokemonState {
  final Pokemon pokemon;

  SearchPokemonSuccess({required this.pokemon});
}

final class SearchPokemonList extends SearchPokemonState {
  final List<Pokemon> pokemons;

  SearchPokemonList({required this.pokemons});
}

final class SearchPokemonFailure extends SearchPokemonState {
  final Failure failure;

  SearchPokemonFailure({required this.failure});
}
