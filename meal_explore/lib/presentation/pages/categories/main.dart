import 'package:core/common/state-enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_explore/presentation/blocs/meal/meal_explore_bloc.dart';
import 'package:meal_explore/presentation/pages/categories/components/category-tile.dart';
import 'package:meal_explore/presentation/pages/categories/components/meal-search-field.dart';
import 'package:meal_explore/presentation/pages/meals/meals-by-query.dart';
import 'package:meal_explore/presentation/pages/meals/meals-favorited.dart';

class MealCategoriesPage extends StatefulWidget {
  const MealCategoriesPage({Key? key}) : super(key: key);

  @override
  _MealCategoriesPageState createState() => _MealCategoriesPageState();
}

class _MealCategoriesPageState extends State<MealCategoriesPage> {

  @override
  void initState() {
    super.initState();

    context.read<MealExploreBloc>().add(MealExploreRequestCategoryEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Hello there, here\'s meals you can explore',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    PopupMenuButton(
                      icon: const Icon(
                        Icons.account_circle,
                      ),
                      itemBuilder: (context) {
                        return [
                          const PopupMenuItem(
                            value: 1,
                            child: ListTile(
                              leading: Icon(
                                Icons.favorite
                              ),
                              title: Text('Favorited'),
                            ),
                          ),
                        ];
                      },
                      onSelected: (value) {
                        switch(value) {
                          case 1:
                            Navigator.push(context, CupertinoPageRoute(builder: (context) {
                              return const MealsFavoritedPage();
                            }));
                        }
                      },
                    ),
                  ],
                ),
              ),
              MealSearchField(onSearch: (query) async {
                await Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                  return MealsByQueryPage(query: query);
                }));
              }),
              Text(
                'Categories',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              BlocBuilder<MealExploreBloc, MealExploreState>(
                buildWhen: (a, b) => a.stateCategories != b.stateCategories ||
                  a.mealCategories != b.mealCategories,
                builder: (context, state) {
                  switch(state.stateCategories) {
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
                            'No Data'
                          ),
                        ),
                      );
                    case RequestState.Loaded:
                      return GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.4,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10
                        ),
                        children: state.mealCategories.map((e) => CategoryTile(
                          category: e,
                        )).toList(),
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
