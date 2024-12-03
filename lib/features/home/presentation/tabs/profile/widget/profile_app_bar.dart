// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import 'package:ecommerce_elevate/core/assets/app_colors.dart';
import 'package:ecommerce_elevate/core/assets/app_images.dart';
import 'package:ecommerce_elevate/core/shared_widgets/search_text_field.dart';

class ProfileAppBar extends StatelessWidget {

  const ProfileAppBar(
      { super.key});

  @override
  Widget build(BuildContext context) {
    return
       SafeArea(
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppImages.logo,
              width: MediaQuery.of(context).size.width * 0.25,
              fit: BoxFit.cover,
            ),
            Icon(Icons.notifications_none_sharp,color: AppColors.gray,size: 30,),
               ]),
       );
  }

}
