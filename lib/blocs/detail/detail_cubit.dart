import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/data/api_provider.dart';
import 'package:myapp/models/news.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit() : super(DetailInitial());

  final _apiProvider = APIProvider();

  Future<void> getDetail(int id) async {
    try {
      emit(DetailLoading());
      final data = await _apiProvider.getDetail(id);
      emit(DetailLoaded(data));
    } catch (e) {
      emit(DetailError());
    }
  }
}
