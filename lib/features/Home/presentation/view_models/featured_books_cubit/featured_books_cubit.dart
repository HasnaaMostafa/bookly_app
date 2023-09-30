import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/Home/data/repo/home_repo.dart';

import '../../../../../core/models/BookModel.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());

    var response = await homeRepo.fetchFeaturedBooks();

    response.fold((failure) {
      emit(FeaturedBooksError(failure.errMessage));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
