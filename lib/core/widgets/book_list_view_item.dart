import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_arch_bookly_app/core/config/routes.dart';
import 'package:clean_arch_bookly_app/core/widgets/space_widget.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/widgets/book_rating.dart';
import '../config/size_configuration.dart';
import '../config/styles.dart';
import '../utils/constants.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({Key? key, required this.book}) : super(key: key);
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.detailsPageRoute);
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
              ),
            ),
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
