import 'package:clean_architecture_pokemon_app/features/pokemon/domain/entities/pokemon.dart';

class PokemonModel extends Pokemon {
  PokemonModel({required super.name, required super.image, required super.id});

  factory PokemonModel.fromJson(json) {
    return PokemonModel(
        name: json['name'],
        image: json['sprites']['front_default'],
        id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sprites': {'front_default': image},
      'name': name
    };
  }

  factory PokemonModel.fromEntity(Pokemon pokemon) {
    return PokemonModel(
        name: pokemon.name, id: pokemon.id, image: pokemon.image);
  }
}
