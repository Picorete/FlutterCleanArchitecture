import 'package:clean_architecture_pokemon_app/features/pokemon/data/datasources/pokemons_local_data_source.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/data/datasources/pokemons_remote_data_source.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/data/repository/pokemons_repository_impl.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/domain/repository/pokemons_repository.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/domain/use_cases/capture_pokemon.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/domain/use_cases/get_captured_pokemons.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/domain/use_cases/search_pokemon.dart';
import 'package:clean_architecture_pokemon_app/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => SearchPokemonBloc(
      sl(),
      sl(),
      sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => CapturePokemonUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetCapturedsPokemonsUseCase(repository: sl()));
  sl.registerLazySingleton(() => SearchPokemonUseCase(repository: sl()));

  // Repository
  sl.registerLazySingleton<PokemonsRepository>(
    () => PokemonsRepositoryImpl(
      pokemonsLocalDataSource: sl(),
      pokemonsRemoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<PokemonsLocalDataSource>(
    () => HivePokemonsLocalDataSource(),
  );

  sl.registerLazySingleton<PokemonsRemoteDataSource>(
    () => PokemonsRemoteDataSourceImpl(),
  );
}
