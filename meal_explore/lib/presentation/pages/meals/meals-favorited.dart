import 'package:core/common/state-enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/meal/meal_explore_bloc.dart';
import 'components/meal-list.dart';

class MealsFavoritedPage extends StatefulWidget {
  const MealsFavoritedPage({Key? key}) : super(key: key);

  @override
  _MealsFavoritedPageState createState() => _MealsFavoritedPageState();
}

class _MealsFavoritedPageState extends State<MealsFavoritedPage> {
  @override
  void initState() {
    super.initState();

    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
            'Meal List - Favorite'
        ),
      ),
      body: ListView(
        children: [
          Text(
            'Meal List',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          BlocBuilder<MealExploreBloc, MealExploreState>(
            buildWhen: (a,b) =>
              a.stateFavoriteMeals!=b.stateFavoriteMeals ||
                  a.favoriteMeals!=b.favoriteMeals ||
                  a.stateUpdateFavorite!=b.stateUpdateFavorite,
            builder: (context, state) {
              switch(state.stateFavoriteMeals) {
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
                  if(state.favoriteMeals.isEmpty) {
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
                    meals: state.favoriteMeals,
                    onAfterDetail: _fetchData,
                  );
              }
            },
          )
        ],
      ),
    );
  }

  void _fetchData() {
    context.read<MealExploreBloc>().add(
        MealExploreRequestMealsByFavorited()
    );
  }
}
