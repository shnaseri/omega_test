import 'package:omega_test/data_management/base_networkservice.dart';

class AlbumNetworkService extends BaseNetworkService {
  dynamic fetchImageServiceFromServer(int id) async {
    dynamic result = await getTemplate('/Service/item/$id/images');
    return result;
  }
}
