import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/BookModel.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> searchBooks(
      {required String searchWord});
}
