import 'package:bookly_app/features/Home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/models/BookModel.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push("/bookDetailsView", extra: bookModel);
        },
        child: SizedBox(
          height: 125,
          child: Row(
            children: [
              CustomBookImage(
                  imageUrl: bookModel.volumeInfo.imageLinks!.thumbnail ?? ""),
              const SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bookModel.volumeInfo.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyle20
                          .copyWith(fontFamily: "GT Sectra Fine"),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Flexible(
                    child: Text(
                      (bookModel.volumeInfo.authors != null &&
                              bookModel.volumeInfo.authors!.isNotEmpty)
                          ? bookModel.volumeInfo.authors![0]
                              .split(' ')
                              .take(3)
                              .join(' ')
                          : '',
                      style: Styles.textStyle14,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        "Free",
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 44.3,
                      ),
                      BookRating(
                        rating: bookModel.volumeInfo.averageRating ?? 0,
                        count: bookModel.volumeInfo.ratingsCount ?? 0,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
