part of 'profile_page.dart';

class ChoosePhotoBottomSheet extends StatefulWidget {
  const ChoosePhotoBottomSheet({
    super.key,
  });

  @override
  State<ChoosePhotoBottomSheet> createState() => _ChoosePhotoBottomSheetState();
}

class _ChoosePhotoBottomSheetState extends State<ChoosePhotoBottomSheet> {
  final ImagePicker _imagePicker = ImagePicker();

  Future pickFromGallery() async {
    XFile? result = await _imagePicker.pickImage(source: ImageSource.gallery, maxHeight: 1024, maxWidth: 1024, imageQuality: 60);

    if (result == null) return;

    if (result.path.isNotEmpty) {
      context.read<ProfileBloc>().add(ChooseProfilePhotoEvent(file: result));
    }
  }

  Future pickFromCamera() async {
    XFile? result = await _imagePicker.pickImage(source: ImageSource.camera, maxHeight: 1024, maxWidth: 1024, imageQuality: 60);

    if (result == null) return;

    if (result.path.isNotEmpty) {
      context.read<ProfileBloc>().add(ChooseProfilePhotoEvent(file: result));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: TextButton.icon(
                  onPressed: () async {
                    await pickFromCamera();

                    Navigator.pop(context);
                  },
                  label: const Text('Kamera'),
                  icon: const Icon(Icons.camera),
                ),
              ),
              Expanded(
                child: TextButton.icon(
                  onPressed: () async {
                    await pickFromGallery();
                    Navigator.pop(context);
                  },
                  label: const Text('Gallery'),
                  icon: const Icon(Icons.image),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
