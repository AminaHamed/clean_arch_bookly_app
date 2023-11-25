import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/config/routes.dart';
import '../../../../../core/config/size_configuration.dart';
import '../../../../../core/config/styles.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/space_widget.dart';
import '../../../domain/entities/book_entity.dart';
import '../book_rating.dart';

class NewestBooksListViewItem extends StatelessWidget {
  const NewestBooksListViewItem({Key? key, required this.book})
      : super(key: key);
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.detailsPageRoute, arguments: book);
        // GoRouter.of(context).push(AppRouter.bookDetailsView);
      },
      child: Row(
        children: [
          SizedBox(
            height: 130,
            child: AspectRatio(
                aspectRatio: 2.7 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: book.image ?? '',
                    fit: BoxFit.fill,
                  ),
                )),
          ),
          const HorizontalSpace(3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: SizeConfig.screenWidth! * .5,
                  child: Text(
                    book.title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20.copyWith(
                      fontFamily: kGtSectraFine,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Opacity(
                  opacity: .6,
                  child: Text(
                    book.authorName ?? '',
                    style: Styles.textStyle14.copyWith(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    Text(
                      "${book.price}",
                      style: Styles.textStyle20.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    const BookRating(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
