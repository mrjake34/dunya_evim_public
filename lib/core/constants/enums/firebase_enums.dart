enum FirebaseEnums {
  users('users'),
  adverts('adverts'),
  ownerUid('ownerUid'),
  imageList('imageList'),
  data('data'),
  blog('blog'),
  advertDetails('advertDetails'),
  userAdvertList('userAdvertList'),
  favoriteList('myFavoriteList'),
  stoppedByOwner('stoppedByOwner'),
  urlList('urlList'),
  approved('approved'),
  isoCountryCode('isoCountryCode');

  final String value;

  const FirebaseEnums(this.value);

  @override
  String toString() => value;
}
