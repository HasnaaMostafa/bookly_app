import 'package:bookly_app/core/utils/function/launch_url.dart';
import 'package:flutter/material.dart';

import '../../../../../core/models/BookModel.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class BooksActions extends StatelessWidget {
  const BooksActions({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
            backgroundColor: Colors.white,
            borderRadius: bookModel.volumeInfo.previewLink != null
                ? const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12))
                : const BorderRadius.all(Radius.circular(12)),
            text: "Free",
            textStyle: Styles.textStyle18
                .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
          )),
          if (bookModel.volumeInfo.previewLink != null)
            Expanded(
                child: CustomButton(
              onPressed: () {
                launchCustomUrl(context, bookModel.volumeInfo.previewLink!);
              },
              backgroundColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
              text: "Preview",
              textStyle: Styles.textStyle16
                  .copyWith(color: Colors.white, fontWeight: FontWeight.normal),
            )),
        ],
      ),
    );
  }
}
