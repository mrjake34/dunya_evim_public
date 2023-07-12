enum Status { loading, success, failed }

enum FirebaseAuthErrorEnums {
  userNotFound('user-not-found'),
  wrongPassword('wrong-password'),
  manyTried('too-many-requests'),
  emailAlreadyInUse('email-already-in-use'),
  error('error');

  final String value;

  const FirebaseAuthErrorEnums(this.value);

  @override
  String toString() => value;
}
