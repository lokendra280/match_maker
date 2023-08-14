class UserModel {
  String name;
  String email;
  String bio;
  String marriage;
  String city;
  String diet;
  String height;
  String religious;
  String profilePic;
  String docfilePic;
  String createdAt;
  String phoneNumber;
  String gender;
  String hobby;
  String age;
  String id;
  String qulafication;
  String employe;
  String jobtypes;
  String salaryrange;

  UserModel({
    required this.name,
    required this.docfilePic,
    required this.salaryrange,
    required this.jobtypes,
    required this.email,
    required this.qulafication,
    required this.bio,
    required this.city,
    required this.gender,
    required this.hobby,
    required this.diet,
    required this.height,
    required this.marriage,
    required this.profilePic,
    required this.createdAt,
    required this.phoneNumber,
    required this.id,
    required this.religious,
    required this.age,
    required this.employe,
  });

  // from map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      bio: map['bio'] ?? '',
      id: map['id'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      createdAt: map['createdAt'] ?? '',
      profilePic: map['profilePic'] ?? '',
      city: map['city'] ?? '',
      marriage: map['marriage'] ?? '',
      diet: map['diet'] ?? '',
      height: map['height'] ?? '',
      gender: map['gender'] ?? '',
      hobby: map['hobby'] ?? '',
      age: map['age'] ?? '',
      qulafication: map['qulafication'] ?? '',
      religious: map['religious'] ?? '',
      employe: map['employe'] ?? '',
      jobtypes: map['jobtypes'] ?? '',
      salaryrange: map['salaryrange'] ?? '',
      docfilePic: map['docfilePic'] ?? '',
    );
  }

  // to map
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "city": city,
      "marriage": marriage,
      "qulafication": qulafication,
      "diet": diet,
      "height": height,
      "id": id,
      'age': age,
      "bio": bio,
      "gender": gender,
      "hobby": hobby,
      "profilePic": profilePic,
      "phoneNumber": phoneNumber,
      "createdAt": createdAt,
      "religious": religious,
      "employe": employe,
      "jobtypes": jobtypes,
      "salaryrange": salaryrange,
      "docfilePic": docfilePic,
    };
  }
}
