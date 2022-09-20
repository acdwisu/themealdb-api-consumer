import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/domain/entities/meal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_explore/presentation/blocs/meal/meal_explore_bloc.dart';
import 'package:meal_explore/presentation/pages/meal-detail/main.dart';

class MealTile extends StatefulWidget {
  final Meal meal;
  final VoidCallback? onAfterDetail;

  const MealTile({
    Key? key,
    required this.meal,
    this.onAfterDetail,
  }) : super(key: key);

  @override
  _MealTileState createState() => _MealTileState();
}

class _MealTileState extends State<MealTile> {
  late bool _favorite = widget.meal.favorite;

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
            return MealDetailPage(
              meal: widget.meal,
            );
          })).then((value) {
            widget.onAfterDetail?.call();
          });
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: borderRadius.topRight
                  ),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      widget.meal.thumbnail,
                    ),
                    fit: BoxFit.cover
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Material(
                        color: Colors.black45,
                        borderRadius: borderRadius,
                        child: InkWell(
                          borderRadius: borderRadius,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              _favorite? Icons.favorite : Icons.favorite_border,
                              color: _favorite? Colors.red : Colors.white,
                              size: 30,
                            ),
                          ),
                          onTap: () {
                            if(!_favorite) {
                              context.read<MealExploreBloc>().add(
                                MealExploreMakeFavoriteEvent(widget.meal.id)
                              );
                            } else {
                              context.read<MealExploreBloc>().add(
                                MealExploreRemoveFavoriteEvent(widget.meal.id)
                              );
                            }

                            setState(() {
                              _favorite = !_favorite;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.meal.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
