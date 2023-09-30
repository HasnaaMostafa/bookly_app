import 'package:bookly_app/core/models/BookModel.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  SearchViewBody({super.key});

  BookModel? bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          const Text(
            "Search result",
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(child: SearchListView()),
        ],
      ),
    );
  }
}
