import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/profile_info/user/logged_user.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final Switch? switchWidget;
  final ImageIcon? prefixImageIcon;
  final ImageIcon? suffixImageIcon;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final String? title;
  final TextButton? textButton;

  const ListTileWidget(
      {
        this.textButton,
        this.switchWidget,
        this.prefixImageIcon, this.suffixImageIcon, this.title,
        this.suffixIcon,this.prefixIcon,
        super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: prefixImageIcon ?? prefixIcon ??switchWidget,
          title: Text(title ?? ""),
          trailing: suffixImageIcon ?? suffixIcon ?? textButton,
        ),
      ],
    );
  }
}
