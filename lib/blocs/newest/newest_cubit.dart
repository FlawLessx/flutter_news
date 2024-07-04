import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/data/api_provider.dart';
import 'package:myapp/models/news.dart';

part 'newest_state.dart';

class NewestCubit extends Cubit<NewestState> {
  NewestCubit() : super(NewestInitial());

  final _apiProvider = APIProvider();

  Future<void> getNewest({String? category}) async {
    try {
      emit(NewestLoading());
      final data = await _apiProvider.getNewest(category: category);
      emit(NewestLoaded(data));
    } catch (e) {
      emit(NewestError());
    }
  }
}
