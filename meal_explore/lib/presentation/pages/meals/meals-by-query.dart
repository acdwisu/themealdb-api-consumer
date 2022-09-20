import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/common/state-enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_explore/presentation/blocs/meal/meal_explore_bloc.dart';
import 'package:meal_explore/presentation/pages/meals/components/meal-list.dart';

class MealsByQueryPage extends StatefulWidget {
  final String query;

  const MealsByQueryPage({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  _MealsByQueryPageState createState() => _MealsByQueryPageState();
}

class _MealsByQueryPageState extends State<MealsByQueryPage> {
  @override
  void initState() {
    super.initState();

    context.read<MealExploreBloc>().add(
      MealExploreRequestMealsByQueryEvent(widget.query)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
            'Meal List - ${widget.query}'
        ),
      ),
      body: ListView(
        children: [
          Text(
            'Meal List',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          BlocBuilder<MealExploreBloc, MealExploreState>(
            buildWhen: (a,b) => a.stateMeals!=b.stateMeals || a.meals!=b.meals,
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
                  if(state.meals.isEmpty) {
                    return const SizedBox(
                      height: 300,
                      child: Center(
                        child: Text(
                          'No Data',
                        ),
                      ),
                    );
                  }

                  return MealList(
                    meals: state.meals,
                  );
              }
            },
          )
        ],
      ),
    );
  }
}
