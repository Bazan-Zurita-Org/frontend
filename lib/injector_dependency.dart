import 'package:app_gym/core/api/api_client.dart';
import 'package:app_gym/core/api/api_client_repository.dart';
import 'package:app_gym/core/helper/app_constants.dart';
import 'package:app_gym/core/routes/bloc/routes_bloc.dart';
import 'package:app_gym/features/auth/data/datasources/auth_datasource_remote.dart';
import 'package:app_gym/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:app_gym/features/auth/domain/repositories/auth_repository_interface.dart';
import 'package:app_gym/features/auth/domain/usecases/authstatus/get_save_auth_status_use_case.dart';
import 'package:app_gym/features/auth/domain/usecases/authstatus/save_auth_status_use_case.dart';
import 'package:app_gym/features/auth/domain/usecases/token/get_id_user_use_case.dart';
import 'package:app_gym/features/auth/domain/usecases/token/get_save_token_use_case.dart';
import 'package:app_gym/features/auth/domain/usecases/token/save_token_use_case.dart';
import 'package:app_gym/features/auth/domain/usecases/user/get_list_user_id_use_case.dart';
import 'package:app_gym/features/auth/domain/usecases/user/get_save_user_use_case.dart';
import 'package:app_gym/features/auth/domain/usecases/user/save_user_use_case.dart';
import 'package:app_gym/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:app_gym/features/home/data/datasources/challenges_datasource_remote.dart';
import 'package:app_gym/features/home/data/datasources/ranking_datasource_remote.dart';
import 'package:app_gym/features/home/data/datasources/rutine_datasource_remote.dart';
import 'package:app_gym/features/home/data/repositories/challenges_repository_impl.dart';
import 'package:app_gym/features/home/data/repositories/ranking_repository_impl.dart';
import 'package:app_gym/features/home/data/repositories/rutine_repository_impl.dart';
import 'package:app_gym/features/home/domain/repositories/challenges_repository_interface.dart';
import 'package:app_gym/features/home/domain/repositories/ranking_repository_interface.dart';
import 'package:app_gym/features/home/domain/repositories/rutine_repository_interface.dart';
import 'package:app_gym/features/home/domain/usecases/challenges/assign_challenges_by_type_use_case.dart';
import 'package:app_gym/features/home/domain/usecases/challenges/get_save_list_challenges_use_case.dart';
import 'package:app_gym/features/home/domain/usecases/rankig/get_save_list_ranking_use_case.dart';
import 'package:app_gym/features/home/domain/usecases/rutine/get_save_list_rutine_use_case.dart';
import 'package:app_gym/features/home/presentation/bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> injectorDependenCy() async {
  //services
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<ApiClientRepository>(
    () => ApiClient(
      sharedPreferences: sharedPreferences,
      baseUrl: AppConstants.baseUrl,
    ),
  );
  sl.registerLazySingleton<AuthDatasourceRemote>(
    () => AuthDatasourceRemoteImpl(
      apiClientRepository: sl(),
    ),
  );
  sl.registerLazySingleton<RutineDatasourceRemote>(
    () => RutineDatasourceRemoteImpl(
      apiClientRepository: sl(),
      sharedPreferences: sharedPreferences,
    ),
  );
  sl.registerLazySingleton<RankingDatasourceRemote>(
    () => RankingDatasourceRemoteImpl(
      apiClientRepository: sl(),
      sharedPreferences: sharedPreferences,
    ),
  );
  sl.registerLazySingleton<ChallengesDatasourceRemote>(
    () => ChallengesDatasourceRemoteImpl(
      apiClientRepository: sl(),
      sharedPreferences: sharedPreferences,
    ),
  );

  //repository
  sl.registerLazySingleton<AuthRepositoryInterface>(
    () => AuthRepositoryImpl(
      sl(),
      sharedPreferences,
    ),
  );
  sl.registerLazySingleton<RutineRepositoryInterface>(
    () => RutineRepositoryImpl(
      rutineDatasourceRemote: sl(),
    ),
  );
  sl.registerLazySingleton<RankingRepositoryInterface>(
    () => RankingRepositoryImpl(
      rankingDatasourceRemote: sl(),
    ),
  );
  sl.registerLazySingleton<ChallengesRepositoryInterface>(
    () => ChallengesRepositoryImpl(
      challengesDatasourceRemote: sl(),
    ),
  );

  //usecase
  /// -----> Token
  sl.registerLazySingleton<SaveTokenUseCase>(
    () => SaveTokenUseCase(
      authRepositoryInterface: sl(),
    ),
  );
  sl.registerLazySingleton<GetSaveTokenUseCase>(
    () => GetSaveTokenUseCase(
      authRepositoryInterface: sl(),
    ),
  );
  sl.registerLazySingleton<GetIdUserUseCase>(
    () => GetIdUserUseCase(
      authRepositoryInterface: sl(),
    ),
  );

  ///
  ///-------> user
  sl.registerLazySingleton<GetSaveUserUseCase>(
    () => GetSaveUserUseCase(),
  );
  sl.registerLazySingleton<SaveUserUseCase>(
    () => SaveUserUseCase(
      authRepositoryInterface: sl(),
    ),
  );
  sl.registerLazySingleton<GetListUserIdUseCase>(
    () => GetListUserIdUseCase(
      authRepositoryInterface: sl(),
    ),
  );

  ///
  ///--------> authstatus
  sl.registerLazySingleton<GetSaveAuthStatusUseCase>(
    () => GetSaveAuthStatusUseCase(
      authRepositoryInterface: sl(),
    ),
  );
  sl.registerLazySingleton<SaveAuthStatusUseCase>(
    () => SaveAuthStatusUseCase(
      authRepositoryInterface: sl(),
    ),
  );

  ///
  ///-------> rutine
  sl.registerLazySingleton(
    () => GetSaveListRutineUseCase(
      rutineRepositoryInterface: sl(),
    ),
  );

  ///
  ///------> ranking
  sl.registerLazySingleton<GetSaveListRankingUseCase>(
    () => GetSaveListRankingUseCase(
      rankingRepositoryInterface: sl(),
    ),
  );

  ///
  ///--------> challenges
  sl.registerLazySingleton<GetSaveListChallengesUseCase>(
    () => GetSaveListChallengesUseCase(
      challengesRepositoryInterface: sl(),
    ),
  );
  sl.registerLazySingleton<AssignChallengesByTypeUseCase>(
    () => AssignChallengesByTypeUseCase(
      challengesRepositoryInterface: sl(),
    ),
  );

  ///

  //bloc
  sl.registerFactory<RoutesBloc>(
    () => RoutesBloc(
      sl(),
    ),
  );
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(
      sl(),
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );
  sl.registerFactory<HomeBloc>(
    () => HomeBloc(
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );
}
