import 'package:aplikasi_suara_ilahi/domain/entitas/surat_model.dart';
import 'package:aplikasi_suara_ilahi/domain/usecase/add_last_surat/add_last_surat.dart';
import 'package:aplikasi_suara_ilahi/domain/usecase/get_last_surat/get_last_surat.dart';
import 'package:aplikasi_suara_ilahi/domain/usecase/remove_last_surat/remove_last_surat.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'last_surat_event.dart';
part 'last_surat_state.dart';

// class LastSuratBloc extends Bloc<LastSuratEvent, LastSuratState> {
//   final InsertlastSurat insertlastSurat;
//   final GetLastSurat getLastSurat;
//   final RemoveLastSurat removeLastSurat;
//   LastSuratBloc(
//     this.insertlastSurat,
//     this.getLastSurat,
//     this.removeLastSurat,
//   ) : super(LastSuratInitial()) {
//     on<OnAddLastSurat>((event, emit) async {
//       final surat = event.surat;
//       final result = await insertlastSurat.excecute(surat);
//       result.fold(
//         (failure) => emit(
//           LastSuratError(failure.message),
//         ),
//         (message) async {
//           emit(LastSuratSuccses(message));

//           final updatedSurat = await getLastSurat.excecute();
//           if (emit.isDone) return;

//           updatedSurat.fold(
//             (failure) => emit(LastSuratError(failure.message)),
//             (data) => emit(LastSuratHasData(data)),
//           );
//         },
//       );
//     });

//     on<OnRemoveLastSurat>((event, emit) async {
//       final surat = event.surat;
//       final result = await removeLastSurat.excecute(surat);
//       result.fold(
//         (failure) => emit(
//           LastSuratError(failure.message),
//         ),
//         (message) {
//           emit(LastSuratSuccses(message));
//         },
//       );
//     });

//     on<OnGetLastSurat>(
//       (event, emit) async {
//         emit(LastSuratLoading());
//         final result = await getLastSurat.excecute();
//         result.fold(
//           (failure) {
//             emit(LastSuratError(failure.message));
//           },
//           (data) {
//             if (data == {}) {
//               emit(LastSuratHasData({}));
//             } else {
//               emit(LastSuratHasData(data));
//             }
//           },
//         );
//       },
//     );
//   }
// }

class LastSuratBloc extends Bloc<LastSuratEvent, LastSuratState> {
  final InsertlastSurat insertlastSurat;
  final GetLastSurat getLastSurat;
  final RemoveLastSurat removeLastSurat;
  LastSuratBloc(
    this.insertlastSurat,
    this.getLastSurat,
    this.removeLastSurat,
  ) : super(LastSuratInitial()) {
    on<OnGetLastSurat>(_getLastSurat);
    on<OnAddLastSurat>(_addLstSurat);
  }

  Future<void> _getLastSurat(
      OnGetLastSurat event, Emitter<LastSuratState> emit) async {
    emit(LastSuratLoading());
    final result = await getLastSurat.excecute();
    result.fold(
      (failure) {
        emit(LastSuratError(failure.message));
      },
      (data) {
        if (data == {}) {
          emit(LastSuratHasData({}));
        } else {
          emit(LastSuratHasData(data));
        }
      },
    );
  }

  Future<void> _addLstSurat(
      OnAddLastSurat event, Emitter<LastSuratState> emit) async {
    final surat = event.surat;
    final result = await insertlastSurat.excecute(surat);
    result.fold(
      (failure) => emit(
        LastSuratError(failure.message),
      ),
      (message) async {
        emit(LastSuratSuccses(message));

        final updatedSurat = await getLastSurat.excecute();
        if (emit.isDone) return;

        updatedSurat.fold(
          (failure) => emit(LastSuratError(failure.message)),
          (data) => emit(LastSuratHasData(data)),
        );
      },
    );
  }
}
