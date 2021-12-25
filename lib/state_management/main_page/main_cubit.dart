import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:omega_test/data_management/main_page/main_repository.dart';
import 'package:omega_test/model/service_data.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  late MainRepository mainRepository;

  MainCubit() : super(MainInitial()) {
    mainRepository = MainRepository();
  }

  Future<void> fetchMainPage() async {
    try {
      emit(MainLoadingState());
      List<ServiceData> services = await mainRepository.fetchServicesMainPage();
      emit(MainLoadedState(services));
    } catch (e) {
      emit(MainErrorState());
    }
  }
}
