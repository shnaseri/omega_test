class ImageData {
  int id;
  int serviceImageId;
  bool isDefault;
  int serviceId;
  int imageId;
  Map<String, dynamic> image;

  ImageData(this.id, this.serviceImageId, this.isDefault, this.serviceId,
      this.imageId, this.image);

  ImageData.fromjson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        serviceImageId = json['serviceImageId'] ?? 0,
        isDefault = json['isDefault'],
        serviceId = json['serviceId'] ?? 0,
        imageId = json['imageId'] ?? 0,
        image = json['image'];

  static List<ImageData> fromJsonList(List result) {
    List<ImageData> listService = [];
    for (var element in result) {
      listService.add(ImageData.fromjson(element));
    }
    return listService;
  }
}
