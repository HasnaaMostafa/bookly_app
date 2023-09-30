import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/models/BookModel.dart';

class SearchRepoImpl implements SearchRepo {
  ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> searchBooks({
    required String searchWord,
  }) async {
    try {
      var data = await apiService.get(
          endPoint: "volumes?Filtering=free-ebooks&q=$searchWord");

      List<BookModel> books = [];

      for (var item in data["items"]) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }
}
