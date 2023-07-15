enum UserEnums {
  userMail('userMail'),
  password('password'),
  userBio('userBio'),
  userPP('.userpp.jpg'),
  profilePhoto('profilePhoto'),
  ppUrl('ppUrl'),
  phone('phone'),
  country('country'),
  dialCode('dialCode'),
  countryCode('countryCode'),
  uid('uid');

  final String value;

  const UserEnums(this.value);

  @override
  String toString() => value;
}