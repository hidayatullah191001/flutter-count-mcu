import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_mcu/models/count_form_model.dart';
import 'package:flutter_mcu/services/services.dart';

part 'count_event.dart';
part 'count_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  CountBloc() : super(CountInitial()) {
    on<CountEvent>((event, emit) async {
      if (event is CountTes) {
        try {
          emit(CountLoading());
          final res = await PesertaServices()
              .saveTesPeserta(event.data, event.pesertaUid);
          emit(CountSuccess(res!));
        } catch (e) {
          emit(CountFailed(e.toString()));
        }
      }

      if (event is DeleteCountTes) {
        try {
          emit(CountLoading());
          await PesertaServices().deleteCountTes(event.uid);
          emit(DeleteCountSuccess());
        } catch (e) {
          emit(CountFailed(e.toString()));
        }
      }
    });
  }
}
