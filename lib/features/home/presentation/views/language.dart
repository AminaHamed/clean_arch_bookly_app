import 'package:clean_arch_bookly_app/core/translation_helper/app_localizations.dart';
import 'package:clean_arch_bookly_app/core/utils/functions/show_snake_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../splash/cubit/locale_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("settings".tr(context)),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocConsumer<LocaleCubit, ChangeLocaleState>(
              listener: (context, state) {
                Navigator.of(context).pop();
              },
              builder: (context, state) {
                return DropdownButton<String>(
                  value: state.locale.languageCode,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: ['ar', 'en'].map((String items) {
                    return DropdownMenuItem<String>(
                      value: items,
                      child: Text(items.tr(context)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      if (newValue != context.read<LocaleCubit>().appLocal) {
                        context.read<LocaleCubit>().changeLanguage(newValue);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            showCustomSnakeBar("current language".tr(context)));
                      }
                    }
                  },
                );
              },
            )),
      ),
    );
  }
}
