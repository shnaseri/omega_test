import 'package:omega_test/data_management/album/album_networkservice.dart';

import '../../model/image.dart';

class AlbumRepository {
  late AlbumNetworkService albumNetworkService;

  AlbumRepository() {
    albumNetworkService = AlbumNetworkService();
  }

  Future<List<ImageData>> fetchImageService(int id) async {
    try {
      dynamic result =
          await albumNetworkService.fetchImageServiceFromServer(id);
      return ImageData.fromJsonList(result['data']);
    } catch (e) {
      print(e);
      return [];
    }
  }
}
