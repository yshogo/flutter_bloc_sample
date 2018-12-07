import 'package:flutter_app_bloc_sample_app/src/models/image_model.dart';

import 'scenery_image_provider.dart';

class Repository {
  final provider = new SceneryImageProvider();

  Future<List<ImageModel>> fetchAllProvider() => provider.fetchImageList();
}
