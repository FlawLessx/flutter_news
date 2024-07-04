import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:myapp/data/api_provider.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  final _apiProvider = APIProvider();

  Future<void> getCategory() async {
    try {
      emit(CategoryLoading());
      List<String> datas = ['All Category'];
      final data = await _apiProvider.getCategory();
      datas.addAll(data);
      emit(CategoryLoaded(datas));
    } catch (e) {
      emit(CategoryError());
    }
  }
}
