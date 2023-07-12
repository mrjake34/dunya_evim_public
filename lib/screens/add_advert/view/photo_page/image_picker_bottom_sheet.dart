part of 'photo_page.dart';

class ImagePickerMethodSelector extends StatelessWidget {
  const ImagePickerMethodSelector({
    super.key,
  });

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
                onPressed: () => context.read<AddAdvertBloc>().add(AddPhotosFromCameraEvent()),
                label: const ButtonText(text: LocaleKeys.mainText_camera),
                icon: const Icon(Icons.camera),
              ),
            ),
            Expanded(
              child: TextButton.icon(
                onPressed: () => context.read<AddAdvertBloc>().add(AddPhotosFromGalleryEvent()),
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