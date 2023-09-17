part of 'count_bloc.dart';

abstract class CountEvent extends Equatable {
  const CountEvent();

  @override
  List<Object> get props => [];
}

class CountTes extends CountEvent {
  final CountFormModel data;
  final String pesertaUid;
  const CountTes(this.data, this.pesertaUid);
  @override
  // TODO: implement props
  List<Object> get props => [data, pesertaUid];
}

class DeleteCountTes extends CountEvent {
  final String uid;
  const DeleteCountTes(this.uid);
  @override
  // TODO: implement props
  List<Object> get props => [uid];
}
