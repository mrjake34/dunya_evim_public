part of 'photo_page.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdvertBloc, AddAdvertState>(
      builder: (context, state) {
        return FloatingActionButton(
          shape: CircleBorder(),
          onPressed: (state.files?.length ?? 0) <= 4
              ? () async => FixedSizeModalBottomSheet().openCustomModalSheet(context: context, widget: ImagePickerMethodSelector())
              : null,
          child: Icon(
            Icons.photo_outlined,
          ),
        );
      },
    );
  }
}