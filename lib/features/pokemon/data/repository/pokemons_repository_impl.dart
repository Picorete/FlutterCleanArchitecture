import 'package:clean_architecture_pokemon_app/core/error/failure.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/data/datasources/pokemons_local_data_source.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/data/datasources/pokemons_remote_data_source.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/domain/entities/pokemon.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/domain/repository/pokemons_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final PokemonsLocalDataSource pokemonsLocalDataSource;
  final PokemonsRemoteDataSource pokemonsRemoteDataSource;

  PokemonsRepositoryImpl(
      {required this.pokemonsLocalDataSource,
      required this.pokemonsRemoteDataSource});

  @override
  Future<Either<Failure, bool>> capturePokemon(Pokemon pokemon) async {
    try {
      final bool resp = await pokemonsLocalDataSource.capturePokemon(pokemon);
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<Pokemon>>> getCapturedPokemons() async {
    try {
      final List<Pokemon> resp =
          await pokemonsLocalDataSource.getCapturedPokemonsList();
      return Right(resp);
    } on LocalFailure {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, Pokemon>> getPokemon(int id) async {
    try {
      final Pokemon resp = await pokemonsRemoteDataSource.getPokemon(id);
      return Right(resp);
    } on DioException {
      return Left(ServerFailure());
    }
  }
}
