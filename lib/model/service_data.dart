class ServiceData {
  int id;
  int serviceId;
  String name;
  String code;
  int price;
  bool isDefault;
  bool transportCostIncluded;
  int qty;
  int minQty;
  int maxQty;
  String description;
  int contractorSharePercent;
  int unitMeasureId;
  String unitMeasureName;
  int superContractorsId;

  ServiceData(
      this.id,
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
