// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final Function onTextButtonPress;

  const TitleWidget(
      {required this.title,
      required this.buttonTitle,
      required this.onTextButtonPress,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          TextButton(
              onPressed: () {
                onTextButtonPress();
              },
              child: Text(buttonTitle))
        ],
      ),
    );
  }
}
