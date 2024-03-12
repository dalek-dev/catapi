import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:p_catapi/src/domain/repository.dart';

import '../../../../core/errors/failures.dart';
import '../../../../services/models/cat.dart';

@injectable
class LandingProvider with ChangeNotifier {
  final Repository repository;
  List<Cat> _cats = [];
  LandingProvider({required this.repository});

  List<Cat> get cats => _cats;

  Future<void> getCatBreeds() async {
    var failureOrSuccess = await repository.getCatBreeds();

    failureOrSuccess.fold((failure) {
      _cats = [];
      notifyListeners();
      //return (failure as GeneralFailure).message;
    }, (success) {
      _cats = success.where((cat) => !_cats.contains(cat)).toList();
      notifyListeners();
    });
  }
}
