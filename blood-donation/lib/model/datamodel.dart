class Datamodel {
  String? name;
  String? phone;
  String? group;

  Datamodel({required this.group, required this.name, required this.phone});
  factory Datamodel.fromJson(Map<String, dynamic> json) {
    return Datamodel(
        group: json['group'], name: json['name'], phone: json['phone']);
  }
}
