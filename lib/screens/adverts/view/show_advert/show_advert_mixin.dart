part of 'show_advert.dart';

mixin ShowAdvertMixin on State<ShowAdvert> {
  List<PersistentBottomNavBarItem> _navBarsItem() => [
        PersistentBottomNavBarItem(
          activeColorPrimary: context.colorScheme.primary,
          icon: Icon(
            Icons.description_outlined,
            color: context.colorScheme.onBackground,
          ),
        ),
        PersistentBottomNavBarItem(
          activeColorPrimary: context.colorScheme.primary,
          icon: Icon(
            Icons.notes_outlined,
            color: context.colorScheme.onBackground,
          ),
        ),
        PersistentBottomNavBarItem(
          activeColorPrimary: context.colorScheme.primary,
          icon: Icon(
            Icons.place_outlined,
            color: context.colorScheme.onBackground,
          ),
        ),
      ];
  List<Widget> _screensList() => [
        AdvertDetailPage(docId: widget.docId,),
        ShowAdvertNote(),
        ShowAdvertLocation(),
      ];
}
