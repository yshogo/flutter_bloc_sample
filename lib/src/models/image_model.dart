class ImageModel {
  int _id;
  String _imageUrl;

  ImageModel(Map<String, dynamic> json) {
    _id = json["id"];
    _imageUrl = json["image_url"];
  }

  String get imageUrl => _imageUrl;

  int get id => _id;
}