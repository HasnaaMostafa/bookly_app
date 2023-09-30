part of 'similar_books_cubit.dart';

abstract class SimilarBooksState {}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksLoading extends SimilarBooksState {}

class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;
  SimilarBooksSuccess(this.books);
}

class SimilarBooksError extends SimilarBooksState {
  final String error;
  SimilarBooksError(this.error);
}
