import 'package:clean_arch_bookly_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/space_widget.dart';

class NewestBooksListViewItemIndicator extends StatelessWidget {
  const NewestBooksListViewItemIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 130,
          child: AspectRatio(
              aspectRatio: 2.7 / 4,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: AppColors.fading,
                  ))),
        ),
        const HorizontalSpace(3),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    color: AppColors.fading,
                    child: const SizedBox(
                      height: 40,
                      width: 50,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Opacity(
                opacity: .6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    color: AppColors.fading,
                    child: const SizedBox(
                      height: 20,
                      width: 100,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      color: AppColors.fading,
                      child: const SizedBox(
                        height: 25,
                        width: 50,
                      ),
                    ),
                  ),
                  const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      color: AppColors.fading,
                      child: const SizedBox(
                        height: 30,
                        width: 90,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
