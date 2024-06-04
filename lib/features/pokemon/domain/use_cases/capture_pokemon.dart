import 'package:clean_architecture_pokemon_app/core/error/failure.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/domain/repository/pokemons_repository.dart';
import 'package:dartz/dartz.dart';

class CapturePokemonUseCase {
  final PokemonsRepository repository;

  CapturePokemonUseCase({required this.repository});

  Future<Either<Failure, bool>> call(Pokemon pokemon) {
    return repository.capturePokemon(pokemon);
  }
}
