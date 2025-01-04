class Datamodel {
  String? name;
  String? phone;
  String? group;
  String? location;
  String? gender;
  String? age;

  Datamodel({required this.group, required this.name, required this.phone,required this.location,required this.gender,required this.age});
  factory Datamodel.fromJson(Map<String, dynamic> json) {
    return Datamodel(
      age: json['age'],
      gender: json['gender'],location: json['location'],
        group: json['group'], name: json['name'], phone: json['phone']);
  }

  Map<String,dynamic> toJson(){
    return {
      'age':age,
      'location':location,
      'gender':gender,
       'name':name,
       'phone':phone,
       'group':group,
    };
  }
}
