part of 'featured_cubit.dart';

@immutable
sealed class FeaturedState {}

final class FeaturedInitial extends FeaturedState {}

final class FeaturedLoading extends FeaturedState {}

final class FeaturedLoaded extends FeaturedState {
  final List<News> data;

  FeaturedLoaded(this.data);
}

final class FeaturedError extends FeaturedState {}
