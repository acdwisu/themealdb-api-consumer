import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/common/constants.dart';
import 'package:core/common/state-enum.dart';
import 'package:core/domain/entities/meal-detail.dart';
import 'package:core/domain/entities/meal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_explore/presentation/blocs/meal/meal_explore_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';
class MealDetailPage extends StatefulWidget {
  final Meal meal;

  const MealDetailPage({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  _MealDetailPageState createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  late bool _favorite = widget.meal.favorite;

  @override
  void initState() {
    super.initState();

    context.read<MealExploreBloc>().add(
      MealExploreRequestMealDetailEvent(widget.meal.id)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          widget.meal.name,
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       _favorite? Icons.favorite : Icons.favorite_border
        //     ),
        //     color: _favorite? Colors.red : null,
        //     onPressed: () {
        //       context.read<MealExploreBloc>().add(
        //         _favorite? MealExploreRemoveFavoriteEvent(widget.meal.id) :
        //             MealExploreMakeFavoriteEvent(widget.meal.id)
        //       );
        //
        //       setState(() {
        //         _favorite = !_favorite;
        //       });
        //     },
        //   ),
        // ],
      ),
      body: BlocBuilder<MealExploreBloc, MealExploreState>(
        buildWhen: (a,b) => a.stateMealDetail!=b.stateMealDetail
            || a.mealDetail!=b.mealDetail,
        builder: (context, state) {
          switch(state.stateMeals) {
            case RequestState.Loading:
              return const SizedBox(
                height: 300,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case RequestState.Error:
              return SizedBox(
                height: 300,
                child: Center(
                  child: Text(
                      state.message
                  ),
                ),
              );
            case RequestState.Empty:
              return const SizedBox(
                height: 300,
                child: Center(
                  child: Text(
                    'No Data',
                  ),
                ),
              );
            case RequestState.Loaded:
              if(state.mealDetail == null) {
                return const SizedBox(
                  height: 300,
                  child: Center(
                    child: Text(
                      'No Data',
                    ),
                  ),
                );
              }

              final meal = state.mealDetail!;

              return SizedBox(
                height: MediaQuery.of(context).size.height-30,
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if(meal.youtube!=null)
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  launchUrlString(meal.youtube!);
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.red.withOpacity(0.3),
                                ),
                                child: const Text(
                                  'Watch on Youtube',
                                ),
                              ),
                            ),
                          if(meal.source!=null)
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  launchUrlString(meal.source!);
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.orange.withOpacity(0.3),
                                ),
                                child: const Text(
                                  'Source',
                                ),
                              ),
                            ),
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(80)
                              ),
                              color: Colors.orangeAccent
                            ),
                            margin: const EdgeInsets.only(
                              top: 30,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 40,
                              horizontal: 40
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Ingredients:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                if(meal.ingredients.isEmpty)
                                  const Text('-')
                                else
                                  ...meal.ingredients.map((e) => ListTile(
                                    title: Text(
                                      "${e.stuff}: ${e.measurement}"
                                    ),
                                    leading: CachedNetworkImage(
                                      imageUrl: "${baseUrl}images/ingredients/${e.stuff}.png",
                                      height: 50,
                                      width: 50,
                                    ),
                                  )),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  'Instruction:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                Text(
                                  meal.instructions ?? '-',
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        top: 30,
                        right: -20,
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(100),
                              child: CachedNetworkImage(
                                imageUrl: meal.thumbnail,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
