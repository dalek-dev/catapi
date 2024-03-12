import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:p_catapi/core/errors/failures.dart';
import 'package:p_catapi/services/clients/api_client.dart';

import '../../services/models/cat.dart';

abstract class Repository {
  Future<Either<Failure, List<Cat>>> getCatBreeds();
  Future<Either<Failure, CatImage>> getCatImage(String id);
}

@Injectable(as: Repository)
class RepositoryImpl implements Repository {
  final ApiClient client;
  RepositoryImpl({required this.client});

  @override
  Future<Either<Failure, List<Cat>>> getCatBreeds() async {
    try {
      var result = await client.getCatBreeds();
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure());
    }
  }

  @override
  Future<Either<Failure, CatImage>> getCatImage(String id) async {
    try {
      var result = await client.getCatImage(id);
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure());
    }
  }
}
