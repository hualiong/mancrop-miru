import 'package:isar/isar.dart';

part 'offline_resource.g.dart';

enum ResourceType {
  video,
  manga,
  novel,
}

enum ResourceSource {
  userImport,
  // bitorrentDownload,
  fromExtension,
}

@embedded
class Item {
  bool virtualResource = true;
  late String title;
  late String subPath;
  late String url;
  late String? cover;
}

@embedded
class Ep {
  bool virtualResource = true;
  late String title;
  late List<Item> items;
  late String subPath;
}

@Collection()
class OfflineResource {
  Id id = Isar.autoIncrement;
  @Enumerated(EnumType.name)
  late ResourceSource source;

  @Enumerated(EnumType.name)
  late ResourceType type;

  late String? package;
  late String? url;
  late String title;
  late String? cover;
  @Index(name: 'path')
  late String path;

  late List<Ep> eps;
}