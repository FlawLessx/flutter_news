import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/data/api_provider.dart';
import 'package:myapp/models/news.dart';

part 'featured_state.dart';

class FeaturedCubit extends Cubit<FeaturedState> {
  FeaturedCubit() : super(FeaturedInitial());

  final _apiProvider = APIProvider();

  Future<void> getFeatured() async {
    try {
      emit(FeaturedLoading());
      final data = await _apiProvider.getFeatured();
      emit(FeaturedLoaded(data));
    } catch (e) {
      emit(FeaturedError());
    }
  }
}
