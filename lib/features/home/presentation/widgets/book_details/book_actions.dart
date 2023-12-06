import 'package:clean_arch_bookly_app/core/utils/app_colors.dart';
import 'package:clean_arch_bookly_app/core/utils/constants.dart';
import 'package:clean_arch_bookly_app/features/home/presentation/manager/launch_url_cubit/launch_url_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_buttons.dart';
import '../../../../splash/cubit/locale_cubit.dart';

class BookActions extends StatelessWidget {
  const BookActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LaunchUrlCubit>();

    return BlocBuilder<LocaleCubit, ChangeLocaleState>(
      builder: (context, state) {
        final lang = context.read<LocaleCubit>().appLocal;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                  child: CustomButton(
                      onPressed: () {
                        cubit.launchUrl(sharedBook!.link ?? '');
                      },
                      text: "${sharedBook?.price ?? 0.0}",
                      textColor: Colors.black,
                      backgroundColor: Colors.white,
                      borderRadius: lang == 'en'
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              bottomLeft: Radius.circular(16))
                          : const BorderRadius.only(
                              topRight: Radius.circular(16),
                              bottomRight: Radius.circular(16)))),
              Expanded(
                  child: CustomButton(
                onPressed: () {
                  cubit.launchUrl(sharedBook!.link ?? '');
                },
                text: 'Free Preview',
                textColor: Colors.white,
                backgroundColor: AppColors.orange,
                fontSize: 16,
                borderRadius: lang == 'en'
                    ? const BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16))
                    : const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16)),
              )),
            ],
          ),
        );
      },
    );
  }

}
