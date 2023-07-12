part of 'photo_page.dart';

class _AddPhotoField extends StatefulWidget {
  const _AddPhotoField();

  @override
  State<_AddPhotoField> createState() => _AddPhotoFieldState();
}

class _AddPhotoFieldState extends State<_AddPhotoField> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditAdvertBloc, EditAdvertState>(
      buildWhen: (previous, current) => previous.pathList != current.pathList,
      builder: (context, state) {
        return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: state.pathList?.length ?? 0,
            itemBuilder: (context, index) {
              if (state.pathList != null) {
                return Stack(
                  children: [
                    if (state.pathList![index].toString().startsWith('/data'))
                      Image.file(
                        File(state.pathList![index]),
                        fit: BoxFit.cover,
                        width: 1024,
                        height: 1024,
                      )
                    else if (state.pathList![index].toString().startsWith('https'))
                      Image.network(
                        state.pathList![index],
                        fit: BoxFit.cover,
                        width: 1024,
                        height: 1024,
                      )
                    else
                      Container(),
                    Positioned(
                      child: IconButton(
                        onPressed: () {
                          if (state.pathList != null && state.pathList!.length > 0) {
                            context.read<EditAdvertBloc>().add(RemovePhotoEvent(index: index));
                          }
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
