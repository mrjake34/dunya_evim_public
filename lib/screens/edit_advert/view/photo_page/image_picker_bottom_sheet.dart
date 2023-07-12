part of 'photo_page.dart';

class _ImagePickerMethodSelector extends StatelessWidget {
  const _ImagePickerMethodSelector();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: TextButton.icon(
                onPressed: () => context.read<EditAdvertBloc>().add(AddPhotosFromCameraEvent()),
                label: const ButtonText(text: LocaleKeys.mainText_camera),
                icon: const Icon(Icons.camera),
              ),
            ),
            Expanded(
              child: TextButton.icon(
                onPressed: () => context.read<EditAdvertBloc>().add(AddPhotosFromGalleryEvent()),
                label: const ButtonText(text: LocaleKeys.mainText_gallery),
                icon: const Icon(Icons.image),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}