import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/Home/data/repo/home_repo.dart';

import '../../../../../core/models/BookModel.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var response = await homeRepo.fetchNewestBooks();
    response.fold((failure) {
      emit(NewestBooksError(failure.errMessage));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
