part of 'newest_cubit.dart';

@immutable
sealed class NewestState {}

final class NewestInitial extends NewestState {}

final class NewestLoading extends NewestState {}

final class NewestLoaded extends NewestState {
  final List<News> data;

  NewestLoaded(this.data);
}

final class NewestError extends NewestState {}
