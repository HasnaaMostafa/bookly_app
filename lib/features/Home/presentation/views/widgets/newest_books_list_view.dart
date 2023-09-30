import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator_widget.dart';
import 'package:bookly_app/features/Home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'book_list_view_item.dart';



class NewestBookListView extends StatelessWidget {
  const NewestBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.books.length,
              itemBuilder: (BuildContext context, int index) {
                return BookListViewItem(
                  bookModel: state.books[index],
                );
              });
        } else if (state is NewestBooksError) {
          return CustomErrorWidget(errMessage: state.error);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
