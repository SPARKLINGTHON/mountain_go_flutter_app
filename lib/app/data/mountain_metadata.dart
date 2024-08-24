class MountainMetadata {
  String name;
  int level;
  DateTime conquerDate;
  bool conquered;

  MountainMetadata(
      {required this.name,
      required this.level,
      required this.conquerDate,
      required this.conquered});

  factory MountainMetadata.fromJson(Map<String, dynamic> json) {
    return MountainMetadata(
      name: json['name'],
      level: int.parse(json['level']),
      conquerDate: DateTime.parse(json['conquerDate']),
      conquered: json['conquered'] == 1,
    );
  }
}
