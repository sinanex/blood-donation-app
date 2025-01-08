class RequstDatamodel {
  String? name;
  String? phone;
  String? unit;
  String? Hospital;
  String? date;
  String? blood;
  String? gender;

  RequstDatamodel(
      {required this.Hospital,
      required this.blood,
      required this.date,
      required this.gender,
      required this.name,
      required this.phone,
      required this.unit});

  factory RequstDatamodel.fromJson(Map<String, dynamic> json) {
    return RequstDatamodel(
        Hospital: json['hospital'],
        blood: json['group'],
        date: json['date'],
        gender: json['gender'],
        name: json['name'],
        phone: json['phone'],
        unit: json['unit']);
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'group': blood,
      'gender': gender,
      'phone': phone,
      'date': date,
      'hospital': Hospital,
      'unit': unit
    };
  }
}
