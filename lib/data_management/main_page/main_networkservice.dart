import 'package:omega_test/data_management/base_networkservice.dart';

class MainNetworkService extends BaseNetworkService{
  
  Future<dynamic> fetchServicesMainPage() async {
    try {
      dynamic result = await getTemplate('/Service/GetAllItems');
      print(result);
      if (result == null) {
        return null;
      }
      return result;
    }
    catch(e){
      return;
    }
    
    
  }


}