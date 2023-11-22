import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/size_configuration.dart';
import '../../domain/entities/book_entity.dart';
import '../manager/featured_books_cubit/featured_books_cubit.dart';
import 'custom_book_image.dart';

class FeaturedListView extends StatefulWidget {
  const FeaturedListView({Key? key, required this.books}) : super(key: key);
  final List<BookEntity> books;

  @override
  _FeaturedListViewState createState() => _FeaturedListViewState();
}

class _FeaturedListViewState extends State<FeaturedListView> {
  late ScrollController _scrollController;
  int nextPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  Future<void> _onScroll() async {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll >= 0.7 * maxScroll) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<FeaturedBooksCubit>(context)
            .fetchFeaturedBooks(pageNumber: nextPage++);
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: SizeConfig.screenHeight! * .3,
      child: NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollUpdateNotification) {
            _onScroll();
          }
          return false;
        },
        child: ListView.builder(
          controller: _scrollController,
          itemCount: widget.books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) => Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: CustomBookImage(
              imageUlr: widget.books[index].image ??
                  'https://example.com/placeholder.jpg',
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
