import 'package:aplikasi_suara_ilahi/domain/entitas/surat_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'last_surat_event.dart';
part 'last_surat_state.dart';

class LastSuratBloc extends Bloc<LastSuratEvent, LastSuratState> {
  LastSuratBloc() : super(LastSuratInitial());

  // @override
  // Stream<LastSuratState> getLastSurat(LastSuratEvent event) async {
  //   yield*;
  // }

}
