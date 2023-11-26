import 'package:clean_arch_bookly_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../../../core/config/size_configuration.dart';
import '../../../../../core/config/styles.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../book_rating.dart';
import '../custom_book_image.dart';
import 'book_actions.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: SizeConfig.screenHeight! * .3,
            child: CustomBookImage(imageUlr: sharedBook?.image ?? '')),
        const VerticalSpace(4),
        Text(
          sharedBook?.title ?? '',
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .6,
          child: Text(
            sharedBook?.authorName ?? '',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const VerticalSpace(2),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const VerticalSpace(4),
        const BookActions(),
      ],
    );
  }
}
