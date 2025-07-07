class QariModel {
  String? name, path, format, arbicName;
  QariModel({this.name, this.path, this.format, this.arbicName});

  factory QariModel.formjson(Map<String, dynamic> json) {
    return QariModel(
      name: json['name'],
      arbicName: json['arabic_name'],
      path: json['relative_path'],
      format: json['file_formats'],
    );
  }
}
