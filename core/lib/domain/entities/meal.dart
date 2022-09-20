import 'package:equatable/equatable.dart';

import 'category.dart';

class Meal extends Equatable {
  final String id;
  final String name;
  final String thumbnail;
  final bool favorite;
  final Category category;

  const Meal({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.favorite,
    required this.category,
  });

  @override
  List<Object?> get props => [
    id, favorite
  ];
}