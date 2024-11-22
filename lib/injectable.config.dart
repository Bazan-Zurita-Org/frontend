// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;

import 'core/di/logger_module.dart' as _i194;
import 'core/di/network_module.dart' as _i177;
import 'features/shared/bloc/dropdown_open/dropdown_open_cubit.dart' as _i461;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final loggerModule = _$LoggerModule();
    final networkModule = _$NetworkModule();
    gh.factory<_i461.DropdownOpenCubit>(() => _i461.DropdownOpenCubit());
    gh.lazySingleton<_i974.Logger>(() => loggerModule.logger);
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.dioNonInterceptor(),
      instanceName: 'dio_non_interceptor',
    );
    gh.lazySingleton<_i361.Interceptor>(
        () => networkModule.interceptor(gh<_i974.Logger>()));
    gh.factory<String>(
      () => networkModule.loginDomain(),
      instanceName: 'api_domain',
    );
    gh.factory<String>(
      () => networkModule.otherDomain(),
      instanceName: 'other_domain',
    );
    gh.lazySingleton<_i361.Dio>(
        () => networkModule.dio(gh<_i361.Interceptor>()));
    return this;
  }
}

class _$LoggerModule extends _i194.LoggerModule {}

class _$NetworkModule extends _i177.NetworkModule {}
