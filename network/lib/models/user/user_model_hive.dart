import 'package:hive/hive.dart';

part 'user_model_hive.g.dart';

@HiveType()
class UserModelHive extends HiveObject {
  @HiveField(0)
  DateTime id;
  @HiveField(1)
  String giverName;
  @HiveField(2)
  bool darkMode;

  UserModelHive({
    this.id,
    this.giverName,
    this.darkMode,
  });
  // Hive fields go here
}
