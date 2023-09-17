part of 'count_bloc.dart';

abstract class CountState extends Equatable {
  const CountState();

  @override
  List<Object> get props => [];
}

class CountInitial extends CountState {}

class CountLoading extends CountState {}

class CountFailed extends CountState {
  final String e;
  const CountFailed(this.e);
  @override
  // TODO: implement props
  List<Object> get props => [e];
}

class CountSuccess extends CountState {
  final bool check;
  const CountSuccess(this.check);
  @override
  // TODO: implement props
  List<Object> get props => [check];
}

class DeleteCountSuccess extends CountState{}