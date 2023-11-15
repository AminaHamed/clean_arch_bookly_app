import 'package:clean_arch_bookly_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
                image: AssetImage(AppAssets.test), fit: BoxFit.fill)),
      ),
    );
  }
}
