import 'package:bookly_app/features/Home/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/features/Home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/BookModel.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    List<String>? categories = widget.bookModel.volumeInfo.categories;

    if (categories != null && categories.isNotEmpty) {
      for (String category in categories) {
        String firstTwoWords = category.split(' ').take(2).join(' ');
        BlocProvider.of<SimilarBooksCubit>(context)
            .fetchSimilarBooks(category: firstTwoWords);
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BookDetailsViewBody(
          bookModel: widget.bookModel,
        ),
      ),
    );
  }
}
