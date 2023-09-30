import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator_widget.dart';
import 'package:bookly_app/features/Home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly_app/features/search/presentation/views_models/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchListView extends StatelessWidget {
  SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBooksCubit, SearchBooksState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (BuildContext context, int index) {
                // return const BookListViewItem();
                return BookListViewItem(bookModel: state.books[index]);
              });
        } else if (state is SearchBooksError) {
          return CustomErrorWidget(errMessage: state.error);
        } else if (state is SearchBooksLoading) {
          return const CustomLoadingIndicator();
        } else {
          return const Scaffold();
        }
      },
    );
  }
}
