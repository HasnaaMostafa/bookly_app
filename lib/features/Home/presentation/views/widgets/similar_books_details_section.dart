import 'package:bookly_app/features/Home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text("You can also like",
            style: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.w600
            ),),
        ),
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 30),
          child: SimilarBooksListView(),
        ),
      ],
    );
  }
}