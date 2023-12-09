import 'package:clean_arch_bookly_app/core/translation_helper/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../../core/config/styles.dart';
import 'similar_books_list_view.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Opacity(
          opacity: .6,
          child: Text(
            "youMayLike".tr(context),
            style: Styles.textStyle14
                .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const SimilarBooksListview(),
      ],
    );
  }
}
