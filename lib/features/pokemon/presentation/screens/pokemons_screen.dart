import 'package:clean_architecture_pokemon_app/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/presentation/widgets/pokemon_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SearchPokemonBloc, SearchPokemonState>(
        builder: (context, state) {
          switch (state) {
            case SearchPokemonLoading():
              return const Center(child: CircularProgressIndicator());
            case SearchPokemonInitial():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () =>
                            BlocProvider.of<SearchPokemonBloc>(context)
                                .add(OnSearchPokemon()),
                        child: const Text('Generar pokemon aleatorio')),
                    TextButton(
                        onPressed: () =>
                            BlocProvider.of<SearchPokemonBloc>(context)
                                .add(OnGetCapturedPokemons()),
                        child: const Text('Ver mis pokemones capturados'))
                  ],
                ),
              );
            case SearchPokemonSuccess():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PokemonCard(pokemon: state.pokemon),
                    TextButton(
                        onPressed: () =>
                            BlocProvider.of<SearchPokemonBloc>(context)
                                .add(OnSearchPokemon()),
                        child: const Text('Generar otro pokemon aleatorio')),
                    TextButton(
                        onPressed: () =>
                            BlocProvider.of<SearchPokemonBloc>(context)
                                .add(OnGetCapturedPokemons()),
                        child: const Text('Ver mis pokemones capturados')),
                    TextButton(
                        onPressed: () =>
                            BlocProvider.of<SearchPokemonBloc>(context)
                                .add(OnCapturePokemon(pokemon: state.pokemon)),
                        child: Text('Capturar a ${state.pokemon.name}'))
                  ],
                ),
              );
            case SearchPokemonList():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: state.pokemons
                            .map((p) => PokemonCard(pokemon: p))
                            .toList(),
                      ),
                    ),
                    TextButton(
                        onPressed: () =>
                            BlocProvider.of<SearchPokemonBloc>(context)
                                .add(OnSearchPokemon()),
                        child: const Text('Volver y generar pokemon')),
                  ],
                ),
              );
            case SearchPokemonFailure():
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                        'Ah ocurrido un error, que te parece si lo intentamos de nuevo?'),
                    TextButton(
                        onPressed: () =>
                            BlocProvider.of<SearchPokemonBloc>(context)
                                .add(OnSearchPokemon()),
                        child: const Text('Volver y generar pokemon'))
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
