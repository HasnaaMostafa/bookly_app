import 'package:flutter/material.dart';

import '../../../../../core/models/BookModel.dart';
import '../../../../../core/utils/styles.dart';
import 'book_actions.dart';
import 'book_rating.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const CustomBookDetailsAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.32),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks!.thumbnail ?? "",
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          "${bookModel.volumeInfo.title}",
          style: Styles.textStyle30.copyWith(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          (bookModel.volumeInfo.authors != null &&
                  bookModel.volumeInfo.authors!.isNotEmpty)
              ? bookModel.volumeInfo.authors![0].split(' ').take(2).join(' ')
              : ' ',
          style: Styles.textStyle18.copyWith(color: const Color(0xff707070)),
        ),
        const SizedBox(
          height: 14,
        ),
        BookRating(
          rating: bookModel.volumeInfo.averageRating ?? 0,
          count: bookModel.volumeInfo.ratingsCount ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
        BooksActions(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
