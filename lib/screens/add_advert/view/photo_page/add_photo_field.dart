part of 'photo_page.dart';

class AddPhotoField extends StatelessWidget {
  const AddPhotoField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdvertBloc, AddAdvertState>(
      buildWhen: (previous, current) => previous.files != current.files,
      builder: (context, state) {
        return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: state.files?.length ?? 0,
            itemBuilder: (context, index) {
              if (state.files != null) {
                final path = state.files?[index].path;
                return Stack(
                  children: [
                    Image.file(
                      File(path!),
                      fit: BoxFit.cover,
                      width: 1024,
                      height: 1024,
                    ),
                    Positioned(
                      child: IconButton(
                        onPressed: () {
                          context.read<AddAdvertBloc>().add(RemovePhotoEvent(index: index));
                        },
                        icon: Container(
                            width: 35,
                            height: 35,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.delete,
                              color: Theme.of(context).colorScheme.error,
                              size: 20,
                            )),
                      ),
                    ),
                  ],
                );
              } else {
                return Container();
              }
            });
      },
    );
  }
}
