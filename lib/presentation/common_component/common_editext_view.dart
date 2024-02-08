import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputField extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController? textController;
  final Widget? icons;
  final String errorText;
  final bool? passwordVisibility;
  final bool readOnly;
  final bool isEnable;
  final String hintText;
  final VoidCallback? onTap;
  final Function(String?)? onChanged;
  final String? calledFrom;
  final TextInputType textInputType;
  final int inputValue;
  final bool isMaxNeeded;
  final bool isEventScreen;
  final Function(String)? onFieldSubmitted;
  final Function()? onPassWordHideShowPressed;
  final bool isSearched;
  final bool? isPasswordField;

  const TextInputField(
      {super.key,
       this.focusNode,
      this.textController,
      this.onFieldSubmitted,
      this.icons,
      this.passwordVisibility,
      required this.errorText,
      this.readOnly = false,
      required this.hintText,
      this.onTap,
      this.isSearched = false,
      this.isEventScreen = false,
      this.onChanged,
      this.calledFrom,
      this.onPassWordHideShowPressed,
      this.isEnable = true,
      this.textInputType = TextInputType.text,
      this.inputValue = 5000,
      this.isMaxNeeded = false,
      this.isPasswordField = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(60.0)),
          child: SizedBox(
            height: 50,
            child: TextFormField(
              readOnly: readOnly,
              onTap: onTap,
              inputFormatters: textInputType == TextInputType.number
                  ? [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]+')),
                      LengthLimitingTextInputFormatter(inputValue),
                    ]
                  : [
                      LengthLimitingTextInputFormatter(inputValue),
                    ],
              keyboardType: textInputType,
              obscureText: isPasswordInvisible(isPasswordField!),
              controller: textController,
              autofocus: false,
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(focusNode);
              },
              decoration: InputDecoration(
                  // errorText: errorText.isEmpty ? null : errorText,
                  // errorStyle: const TextStyle(color: Colors.red),
                  // errorMaxLines: 2,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  border: InputBorder.none,
                  filled: true,

                  hintText: hintText,
                  prefixIcon: icons,
                 ),
              onChanged: onChanged,
            ),
          ),
        ),
        Visibility(
          visible: errorText.isNotEmpty,
          child: Container(
            margin: const EdgeInsets.only(left: 20, top: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              errorText,
              style: TextStyle(

                  color: Colors.red),

            ),
          ),
        ),
      ],
    );
  }

  bool isPasswordInvisible(bool isPasswordField) {
    if (isPasswordField) {
      return passwordVisibility ?? true;
    }
    return false;
  }
}
