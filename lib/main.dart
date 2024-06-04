import 'package:clean_architecture_pokemon_app/di.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/presentation/screens/pokemons_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GetIt.instance.get<SearchPokemonBloc>())
      ],
      child: MaterialApp(
        title: 'Pokemon APP',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const PokemonsScreen(),
      ),
    );
  }
}
