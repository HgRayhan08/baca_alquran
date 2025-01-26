import 'package:aplikasi_suara_ilahi/data/data_resource/sqlite_repository.dart';
import 'package:aplikasi_suara_ilahi/data/db/database_helper.dart';
import 'package:aplikasi_suara_ilahi/data/repository/data_al_quran_repository.dart';
import 'package:aplikasi_suara_ilahi/data/repository/data_detail_surat_repository.dart';
import 'package:aplikasi_suara_ilahi/data/repository/data_local_surat_repository.dart';
import 'package:aplikasi_suara_ilahi/domain/repository/al_quran_repository.dart';
import 'package:aplikasi_suara_ilahi/domain/repository/detail_surat_repository.dart';
import 'package:aplikasi_suara_ilahi/domain/repository/local_surat_repository.dart';
import 'package:aplikasi_suara_ilahi/domain/usecase/add_last_surat/add_last_surat.dart';
import 'package:aplikasi_suara_ilahi/domain/usecase/get_detail_surat/get_detail_surat.dart';
import 'package:aplikasi_suara_ilahi/domain/usecase/get_last_surat/get_last_surat.dart';
import 'package:aplikasi_suara_ilahi/domain/usecase/get_surat/get_surat.dart';
import 'package:aplikasi_suara_ilahi/domain/usecase/remove_last_surat/remove_last_surat.dart';
import 'package:aplikasi_suara_ilahi/presentation/bloc/detail_surat/detail_surat_bloc.dart';
import 'package:aplikasi_suara_ilahi/presentation/bloc/last_surat/bloc/last_surat_bloc.dart';
import 'package:aplikasi_suara_ilahi/presentation/bloc/surat/surat_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/data_resource/e_quran_repository.dart';

final locator = GetIt.instance;

void init() {
  // Data Resource
  locator.registerLazySingleton<EquranDataResource>(() => EquranDataResource());
  locator.registerLazySingleton<SqliteRepository>(
      () => SqliteRepository(locator()));

  // Local Database
  locator.registerLazySingleton(() => DatabaseHelper());

  // Repository
  locator.registerLazySingleton<AlQuranRepository>(
      () => DataAlQuranRepository(equranDataResource: locator()));
  locator.registerLazySingleton<DetailSuratRepository>(
      () => DataDetailSuratRepository(equranDataResource: locator()));
  locator.registerLazySingleton<LocalSuratRepository>(
      () => DataLocalSuratRepository(sqliteRepository: locator()));

  // Use Case
  locator.registerLazySingleton(() => GetSurat(locator()));
  locator.registerLazySingleton(() => GetDetailSurat(locator()));
  locator.registerLazySingleton(() => GetLastSurat(locator()));
  locator.registerLazySingleton(() => InsertlastSurat(locator()));
  locator.registerLazySingleton(() => RemoveLastSurat(locator()));

  // BLOC
  locator.registerFactory(() => SuratBloc(locator()));
  locator.registerFactory(() => DetailSuratBloc(locator()));
  // locator.registerFactory(() => LastSuratBloc(locator(), locator(), locator()));
}
