import 'package:bloc/bloc.dart';

import '../../../../../core/models/BookModel.dart';
import '../../../data/repo/home_repo.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var response = await homeRepo.fetchSimilarBooks(category: category);
    response.fold((failure) {
      emit(SimilarBooksError(failure.errMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
