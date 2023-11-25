import 'package:clean_arch_bookly_app/core/utils/app_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField(
      {super.key, required this.onTextChanged, required this.onSearchPressed});

  final ValueChanged<String> onTextChanged;
  final VoidCallback onSearchPressed;

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  final TextEditingController _controller = TextEditingController();
  Color _borderColor = Colors.white;

  bool _isValid() {
    return _controller.text.trim().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: AppStrings.search,
        suffixIcon: IconButton(
          onPressed: () {
            if (_isValid()) {
              widget.onTextChanged(_controller.text);
              if (_borderColor == Colors.red) {
                setState(() {
                  _borderColor = Colors.white;
                });
              }
              widget.onSearchPressed();
            } else {
              setState(() {
                _borderColor = Colors.red;
              });
              if (kDebugMode) {
                print("Invalid input");
              }
            }
          },
          icon: const Opacity(
            opacity: .6,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: _borderColor,
      ),
      borderRadius: BorderRadius.circular(
        12,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
