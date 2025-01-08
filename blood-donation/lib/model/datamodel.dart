class Datamodel {
  String? name;
  String? phone;
  String? group;
  String? location;
  String? gender;
  String? age;
  String? image;

  Datamodel({required this.group, required this.name, required this.phone,required this.location,required this.gender,required this.age,required this.image});
  factory Datamodel.fromJson(Map<String, dynamic> json) {
    return Datamodel(
      image: json['image'],
      age: json['age'],
      gender: json['gender'],location: json['location'],
        group: json['group'], name: json['name'], phone: json['phone']);
  }

  Map<String,dynamic> toJson(){
    return {
      'image':image,
      'age':age,
      'location':location,
      'gender':gender,
       'name':name,
       'phone':phone,
       'group':group,
    };
  }
}
