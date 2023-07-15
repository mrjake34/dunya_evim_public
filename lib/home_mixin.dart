part of 'home.dart';

mixin HomeMixin on State<HomePage> {
  final PersistentTabController _persistentTabController = PersistentTabController(initialIndex: 0);
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<Widget> _pageList() => [
        HomePageView(),
        TitleSearchAdvert(),
        MyAdvertList(),
        MyFavoriteListPage(),
        ProfilePage(),
      ];
  List<Widget> _pageListWithoutLogin() => [HomePageView(), TitleSearchAdvert()];
  List<PersistentBottomNavBarItem> _navBarsItem() => [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_outlined),
          activeColorPrimary: context.colorScheme.primary,
          inactiveColorPrimary: context.colorScheme.primary.withOpacity(0.5),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.search),
          activeColorPrimary: context.colorScheme.primary,
          inactiveColorPrimary: context.colorScheme.primary.withOpacity(0.5),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.list_alt),
          activeColorPrimary: context.colorScheme.primary,
          inactiveColorPrimary: context.colorScheme.primary.withOpacity(0.5),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.favorite_border),
          activeColorPrimary: context.colorScheme.primary,
          inactiveColorPrimary: context.colorScheme.primary.withOpacity(0.5),
        ),
        PersistentBottomNavBarItem(
          icon: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state.userModel?.ppUrl == null) {
                return Icon(Icons.account_circle_outlined);
              } else {
                return CircleAvatar(
                  radius: 15,
                  backgroundColor: context.colorScheme.background,
                  backgroundImage: NetworkImage(
                    state.userModel?.ppUrl ?? '',
                  ),
                );
              }
            },
          ),
          activeColorPrimary: context.colorScheme.primary,
          inactiveColorPrimary: context.colorScheme.primary.withOpacity(0.5),
        ),
      ];
  List<PersistentBottomNavBarItem> _navBarsItemWithoutLogin() => [
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.home_outlined),
          activeColorPrimary: context.colorScheme.primary,
          inactiveColorPrimary: context.colorScheme.primary.withOpacity(0.5),
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Icons.search),
          activeColorPrimary: context.colorScheme.primary,
          inactiveColorPrimary: context.colorScheme.primary.withOpacity(0.5),
        ),
      ];

  @override
  void initState() {
    autoLogin();
    super.initState();
  }

  Future<void> autoLogin() async {
    final preference = await _prefs;

    final userMail = await preference.getString(UserEnums.userMail.value);
    final password = await preference.getString(UserEnums.password.value);
    if (userMail != null && password != null) {
      context.read<LoginBloc>().add(UserLoginEvent(email: userMail, password: password));
    }
  }
}
