import 'package:clean_architecture_pokemon_app/core/error/failure.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/domain/repository/pokemons_repository.dart';
import 'package:dartz/dartz.dart';

class SearchPokemonUseCase {
  final PokemonsRepository repository;

  SearchPokemonUseCase({required this.repository});

  Future<Either<Failure, Pokemon>> call(int id) {
    return repository.getPokemon(id);
  }
}
