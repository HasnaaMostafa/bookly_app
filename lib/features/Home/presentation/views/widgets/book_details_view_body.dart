import 'package:bookly_app/features/Home/presentation/views/widgets/similar_books_details_section.dart';
import 'package:flutter/material.dart';
import '../../../../../core/models/BookModel.dart';
import 'book_details_section.dart';



class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              BookDetailsSection(
                bookModel: bookModel,
              ),
              const Expanded(
                child: SizedBox(
                  height: 50,
                ),
              ),
              if (bookModel.volumeInfo.categories != null &&
                  bookModel.volumeInfo.categories!.isNotEmpty)
                const SimilarBooksSection(),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        )
      ],
    );
  }
}
