import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/domain/entities/category-detail.dart';
import 'package:core/domain/entities/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_explore/presentation/pages/meals/meals-by-category.dart';

class CategoryTile extends StatelessWidget {
  final CategoryDetail category;

  const CategoryTile({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(10);

    return Material(
      borderRadius: borderRadius,
      elevation: 5,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () {
          Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
            return MealsByCategory(category: category);
          }));
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                category.thumbnail,
              ),
              fit: BoxFit.cover
            )
          ),
          position: DecorationPosition.background,
          child: SizedBox(
            height: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: Container()),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: borderRadius.copyWith(
                      topLeft: Radius.zero,
                      topRight: Radius.zero,
                    )
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    category.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
