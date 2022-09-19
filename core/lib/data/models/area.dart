import 'package:core/data/models/model.dart';
import 'package:core/domain/entities/area.dart';

class AreaModel extends Model<Area> {
  final String name;

  AreaModel({required this.name});
  
  factory AreaModel.fromJsonRemote(Map m) => AreaModel(
    name: m['strArea'],
  );

  @override
  Area get toEntity => Area(name: name);
}