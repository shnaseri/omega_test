import 'package:hive/hive.dart';

part 'service_data.g.dart';

@HiveType(typeId: 0)
class ServiceData {
  @HiveField(0)
  int id;
  @HiveField(1)
  int serviceId;
  @HiveField(2)
  String name;
  @HiveField(3)
  String code;
  @HiveField(4)
  int price;
  @HiveField(5)
  bool isDefault;
  @HiveField(6)
  bool transportCostIncluded;
  @HiveField(7)
  int qty;
  @HiveField(8)
  int minQty;
  @HiveField(9)
  int maxQty;
  @HiveField(10)
  String description;
  @HiveField(11)
  int contractorSharePercent;
  @HiveField(12)
  int unitMeasureId;
  @HiveField(13)
  String unitMeasureName;
  @HiveField(14)
  int superContractorsId;

  ServiceData(this.id,
      this.serviceId,
      this.name,
      this.code,
      this.price,
      this.isDefault,
      this.transportCostIncluded,
      this.qty,
      this.minQty,
      this.maxQty,
      this.description,
      this.contractorSharePercent,
      this.unitMeasureId,
      this.unitMeasureName,
      this.superContractorsId);

  ServiceData.fromjson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        serviceId = json['serviceId'] ?? 0,
        name = json['name'],
        code = json['code'] ?? "",
        price = json['price'] ?? 0,
        isDefault = json['isDefault'],
        transportCostIncluded = json['transportCostIncluded'],
        qty = json['qty'] ?? 0,
        minQty = json['minQty'] ?? 0,
        maxQty = json['maxQty'] ?? 0,
        description = json['description'] ?? "",
        contractorSharePercent = json['contractorSharePercent'] ?? 0,
        unitMeasureId = json['unitMeasureId'] ?? "",
        unitMeasureName = json['unitMeasureName'] ?? "",
        superContractorsId = json['superContractorsId'] ?? 0;

  static List<ServiceData> fromJsonList(List result) {
    List<ServiceData> listService = [];
    for (var element in result) {
      listService.add(ServiceData.fromjson(element));
    }
    return listService;
  }

}
