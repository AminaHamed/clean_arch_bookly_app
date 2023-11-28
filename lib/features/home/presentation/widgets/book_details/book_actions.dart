import 'package:clean_arch_bookly_app/core/utils/app_colors.dart';
import 'package:clean_arch_bookly_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/widgets/custom_buttons.dart';

class BookActions extends StatelessWidget {
  BookActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
            onPressed: () {
              _launchUrl();
            },
            text: "${sharedBook?.price ?? 0.0}",
            textColor: Colors.black,
            backgroundColor: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
          )),
          Expanded(
              child: CustomButton(
            onPressed: () {
              _launchUrl();
            },
            text: 'Free Preview',
            textColor: Colors.white,
            backgroundColor: AppColors.orange,
            fontSize: 16,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          )),
        ],
      ),
    );
  }

  //TODo handel url data layers
  final Uri _url = Uri.parse(sharedBook?.link ?? '');

  Future<void> _launchUrl() async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $sharedBook?.link??' '';
    }
  }
}
