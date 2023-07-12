enum FireStoreEnums {
  users('users'),
  adverts('adverts'),
  ownerUid('ownerUid'),
  datas('datas'),
  imageList('imageList'),
  data('data'),
  blog('blog'),
  advertDetails('advertDetails'),
  userAdvertList('userAdvertList'),
  favoriteList('myFavoriteList'),
  urlList('urlList'),

  approved('approved');

  final String value;

  const FireStoreEnums(this.value);

  @override
  String toString() => value;
}
