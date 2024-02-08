import 'package:flutter/material.dart';

import '../../resource/colors_manager.dart';
import '../../resource/strings_manager.dart';

class CommonWelcomeTitleView extends StatelessWidget {
  final String title;
  const CommonWelcomeTitleView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: StringManager.welcomeTo,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: ColorManager.colorBlack),
        children: [
          const TextSpan(
            text: ' ',
          ),
          TextSpan(
            text: title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorManager.primary),
          ),
        ],
      ),
    );
  }
}
