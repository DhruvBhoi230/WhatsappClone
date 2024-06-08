class Person {
  final String timestamp;
  final String name;
  final String fatherName;
  final String mother;
  final String height;
  final String gender;
  final String education;
  final String birthTime;
  final String dob;
  final String birthPlace;
  // final String business;
  final String familyDetails;
  final int contact1;
  final int? contact2;
  final String gotra;
  final String gotraMother;
  final String email;

  Person({
    required this.timestamp,
    required this.name,
    required this.fatherName,
    required this.mother,
    required this.height,
    required this.gender,
    required this.education,
    required this.birthTime,
    required this.dob,
    required this.birthPlace,
    // required this.business,
    required this.familyDetails,
    required this.contact1,
    required this.contact2,
    required this.gotra,
    required this.gotraMother,
    required this.email,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      timestamp: json['timestamp'],
      name: json['name'],
      fatherName: json['fathername'],
      mother: json['mother'],
      height: json['height'],
      gender: json['gender'],
      education: json['education'],
      birthTime: json['birthtime'],
      dob: json['dob'],
      birthPlace: json['birthplace'],
      // business: Business.fromJson(json['business']),
      familyDetails: json['familydetails'],
      contact1: json['contact1'],
      contact2: json['contact2'],
      gotra: json['gotra'],
      gotraMother: json['gotra(mother)'],
      email: json['email'],
    );
  }
}

// class Business {
//   static fromJson(json) {}
// }
