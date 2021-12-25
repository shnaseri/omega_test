import 'package:omega_test/data_management/main_page/main_networkservice.dart';
import 'package:omega_test/model/service_data.dart';

class MainRepository{
  late MainNetworkService mainNetworkService;
  MainRepository(){
    mainNetworkService = MainNetworkService();
  }
  Future<List<ServiceData>> fetchServicesMainPage() async{
    try{
      Map<String,dynamic>? result = await mainNetworkService.fetchServicesMainPage();
      if(result == null) {
        return [];
      }
      return ServiceData.fromJsonList(result['data'] as List<dynamic>);
    }
    catch(e){
      print(e);
      return [];
    }

  }
}