// 🐦 Flutter imports:
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final Function? onPress;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final String? title;

  const ListTileWidget(
      {this.onPress,
      this.prefixWidget,
      this.suffixWidget,
      this.title,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPress != null) {
          onPress!();
        }
      },
      child: ListTile(
        leading: prefixWidget,
        title: Text(title ?? ""),
        trailing: suffixWidget,
      ),
    );
  }
}
