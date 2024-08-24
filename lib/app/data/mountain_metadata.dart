class MountainMetadata {
  String name;
  int level;
  DateTime? conquerDate;
  bool conquered;

  MountainMetadata(
      {required this.name,
      required this.level,
      required this.conquerDate,
      required this.conquered});

  factory MountainMetadata.fromJson(Map<String, dynamic> json) {
    return MountainMetadata(
      name: json['name'],
      level: json['level'],
      conquerDate: json['conquerDate'] != null ? DateTime.parse(json['conquerDate']) : null,
      conquered: json['conquered'] == true,
    );
  }
}
