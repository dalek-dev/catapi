import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../services/models/cat.dart';

@injectable
class SearchProvider with ChangeNotifier {
  final List<Cat> _searchResults = [];
  List<Cat> get searchResults => _searchResults;

  void searchByBreed(String breed, List<Cat>? cats) {
    _searchResults.clear();

    if (cats == null || breed.isEmpty) {
      _searchResults.addAll(cats!);
    } else {
      final searchTerm = breed.toLowerCase();
      for (Cat cat in cats) {
        if (cat.name!.toLowerCase().contains(searchTerm)) {
          _searchResults.add(cat);
        }
      }
    }
    notifyListeners();
  }
}
