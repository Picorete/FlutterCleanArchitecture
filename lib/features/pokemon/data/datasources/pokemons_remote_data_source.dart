import 'package:clean_architecture_pokemon_app/features/pokemon/data/models/pokemon_model.dart';
import 'package:dio/dio.dart';

abstract class PokemonsRemoteDataSource {
  Future<PokemonModel> getPokemon(int id);
}

class PokemonsRemoteDataSourceImpl implements PokemonsRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<PokemonModel> getPokemon(int id) async {
    final resp = await dio.get('https://pokeapi.co/api/v2/pokemon/$id/');

    return PokemonModel.fromJson(resp.data);
  }
}
