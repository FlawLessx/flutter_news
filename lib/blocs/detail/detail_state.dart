part of 'detail_cubit.dart';

@immutable
sealed class DetailState {}

final class DetailInitial extends DetailState {}

final class DetailLoading extends DetailState {}

final class DetailLoaded extends DetailState {
  final News data;
  DetailLoaded(this.data);
}

final class DetailError extends DetailState {}
