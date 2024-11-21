import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_elevate/features/home/domain/entities/occasions/occasions.dart';
import 'package:flutter/material.dart';

class OccasionsWidget extends StatelessWidget {
  final List<Occasions>? entity;
  final int index;
   const OccasionsWidget({required this.entity,required this.index,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          fit: BoxFit.cover,
            width:131 ,
            height: 151,
            imageUrl: entity![index].image??""),
        Row(

          children: [
            Text(entity![index].name??"",style: Theme.of(context).textTheme.bodyMedium,),
          ],
        )

      ],
    );
  }
}
