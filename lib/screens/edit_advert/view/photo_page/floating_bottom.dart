part of 'photo_page.dart';

class _FloatingButton extends StatelessWidget {
  const _FloatingButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditAdvertBloc, EditAdvertState>(
      builder: (context, state) {
        return FloatingActionButton(
          shape: CircleBorder(),
          onPressed: (state.pathList?.length ?? 0) <= 4
              ? () async => FixedSizeModalBottomSheet().openCustomModalSheet(context: context, widget: _ImagePickerMethodSelector())
              : null,
          child: Icon(
            Icons.photo_outlined,
          ),
        );
      },
    );
  }
}
