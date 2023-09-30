import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';

import '../../../../../core/models/BookModel.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());

  final SearchRepo searchRepo;

  Future<void> searchBooks({required String searchWord}) async {
    emit(SearchBooksLoading());

    var response = await searchRepo.searchBooks(searchWord: searchWord);
    response.fold((failure) {
      emit(SearchBooksError(failure.errMessage));
    }, (books) => {emit(SearchBooksSuccess(books))});
  }
}
