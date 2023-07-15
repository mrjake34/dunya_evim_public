part of 'show_advert.dart';

mixin ShowAdvertMixin on State<ShowAdvert> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<PersistentBottomNavBarItem> _navBarsItem() => [
        PersistentBottomNavBarItem(
          activeColorPrimary: context.colorScheme.primary,
          inactiveColorPrimary: context.colorScheme.primary.withOpacity(0.5),
          icon: Icon(
            Icons.description_outlined,
          ),
        ),
        PersistentBottomNavBarItem(
          activeColorPrimary: context.colorScheme.primary,
          inactiveColorPrimary: context.colorScheme.primary.withOpacity(0.5),
          icon: Icon(
            Icons.notes_outlined,
          ),
        ),
        PersistentBottomNavBarItem(
          activeColorPrimary: context.colorScheme.primary,
          inactiveColorPrimary: context.colorScheme.primary.withOpacity(0.5),
          icon: Icon(
            Icons.place_outlined,
          ),
        ),
      ];
  List<Widget> _screensList() => [
        AdvertDetailPage(
          docId: widget.docId,
        ),
        ShowAdvertNote(),
        ShowAdvertLocation(),
      ];

  @override
  void initState() {
    super.initState();
    context.read<AdvertBloc>().add(FetchAdvertDetailEvent(docId: widget.docId));
  }
}
