import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:p_catapi/src/domain/repository.dart';

import '../../../../core/errors/failures.dart';
import '../../../../services/models/cat.dart';

@injectable
class CatImageProvider with ChangeNotifier {
  final Repository repository;

  List<CatImage> _images = [];
  CatImageProvider({required this.repository});

  List<CatImage> get images => _images;

  void addImage(CatImage image) {
    if (!_images.contains(image)) {
      _images.add(image);
      notifyListeners();
    }
  }

  CatImage? getImageById(String id) {
    try {
      return _images.firstWhere((image) => image.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<void> getCatImage(String id) async {
    final existingImage = getImageById(id);
    if (existingImage != null) {
      return;
    }

    var failureOrSuccess = await repository.getCatImage(id);

    failureOrSuccess.fold((failure) {
      _images = [];
    }, (success) {
      addImage(success);
    });
  }
}
