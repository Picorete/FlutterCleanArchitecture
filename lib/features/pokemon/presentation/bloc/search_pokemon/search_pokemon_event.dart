part of 'search_pokemon_bloc.dart';

sealed class SearchPokemonEvent {}

class OnSearchPokemon extends SearchPokemonEvent {}

class OnCapturePokemon extends SearchPokemonEvent {
  final Pokemon pokemon;

  OnCapturePokemon({required this.pokemon});
}

class OnGetCapturedPokemons extends SearchPokemonEvent {
  OnGetCapturedPokemons();
}
