part of 'home.dart';

mixin HomeMixin on State<HomePage> {
  PersistentTabController _persistentTabController = PersistentTabController(initialIndex: 0);

  List<Widget> _pageList() => [
        HomePageView(),
        TitleSearchAdvert(),
        MyAdvertList(),
        MyFavoriteListPage(),
        ProfilePage(),
      ];
  List<Widget> _pageListWithoutLogin() => [HomePageView(), TitleSearchAdvert()];
  List<PersistentBottomNavBarItem> navBarsItem() => [
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
  List<PersistentBottomNavBarItem> navBarsItemWithoutLogin() => [
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
}
