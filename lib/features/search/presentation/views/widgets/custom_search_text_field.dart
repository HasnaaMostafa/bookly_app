import 'package:bookly_app/core/models/BookModel.dart';
import 'package:bookly_app/features/search/presentation/views_models/search_books_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/cache_helper.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key});

  var searchController = TextEditingController();
  BookModel? bookModel;
  void saveBookModel() {
    CacheHelper.saveBookModelToSharedPreferences(bookModel!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBooksCubit, SearchBooksState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: TextField(
            onSubmitted: (data) {
              BlocProvider.of<SearchBooksCubit>(context)
                  .searchBooks(searchWord: data);
              searchController.clear();
            },
            controller: searchController,
            decoration: InputDecoration(
                hintText: "search",
                suffixIcon: Opacity(
                    opacity: 0.6,
                    child: IconButton(
                      onPressed: () {
                        saveBookModel();
                        BlocProvider.of<SearchBooksCubit>(context)
                            .searchBooks(searchWord: searchController.text);
                        searchController.clear();
                      },
                      icon: const Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        size: 18,
                        color: Colors.white,
                      ),
                    )),
                enabledBorder: buildOutlineInputBorder(),
                focusedBorder: buildOutlineInputBorder()),
          ),
        );
      },
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
