import 'package:aplikasi_suara_ilahi/presentation/bloc/asmaul_husna/asmaul_husna_bloc.dart';
import 'package:aplikasi_suara_ilahi/presentation/bloc/detail_surat/detail_surat_bloc.dart';
import 'package:aplikasi_suara_ilahi/presentation/bloc/last_surat/bloc/last_surat_bloc.dart';
import 'package:aplikasi_suara_ilahi/presentation/bloc/surat/surat_bloc.dart';
import 'package:aplikasi_suara_ilahi/presentation/page/splashscreen_page/splashscreen_page.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_suara_ilahi/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.locator<SuratBloc>(),
        ),
        BlocProvider(
          create: (context) => di.locator<DetailSuratBloc>(),
        ),
        BlocProvider(create: (context) => di.locator<LastSuratBloc>()),
        BlocProvider(create: (context) => di.locator<AsmaulHusnaBloc>()),
      ],
      child: MaterialApp(
        home: SplashscreenPage(),
      ),
      // child: DetailSuratPage(nomor: 110),
    );
  }
}
