import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/cateogry/Categories.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  final List<Categories>? entity;
  final int index;
  const CategoriesWidget({required this.entity,required this.index,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
            fit: BoxFit.cover,
            width:131 ,
            height: 151,
            imageUrl: entity?[index].image??""),
        Text(entity![index].name??"")


      ],
    );
  }
}
