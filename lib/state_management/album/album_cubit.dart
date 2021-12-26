import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:omega_test/data_management/album/album_repository.dart';

import '../../model/image.dart';

part 'album_state.dart';

class AlbumCubit extends Cubit<AlbumState> {
  late AlbumRepository albumRepository;

  AlbumCubit() : super(AlbumInitial()) {
    albumRepository = AlbumRepository();
  }

  Future<void> fetchImage(int id) async {
    emit(AlbumLoading());
    try {
      List<ImageData> images = await albumRepository.fetchImageService(id);
      print(images);
      emit(AlbumLoad(images));
    } catch (e) {
      emit(AlbumError());
    }
  }
}
