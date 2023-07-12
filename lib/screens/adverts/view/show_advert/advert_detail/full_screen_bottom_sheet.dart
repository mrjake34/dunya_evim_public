part of 'detail_builder.dart';

class FullScreenBottomSheet extends StatelessWidget {
  const FullScreenBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertBloc, AdvertState>(builder: (context, state) {
      if (state.imageList != null) {
        return CarouselSlider.builder(
          options: CarouselOptions(
            viewportFraction: 1,
            height: context.pageSize.height / 1,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            pageSnapping: true,
          ),
          itemCount: state.imageList?.length ?? 0,
          itemBuilder: (context, index, realIndex) {
            final urlImage = state.imageList?[index];
            return _FullScreenImageSlider(
              urlImage: urlImage,
            );
          },
        );
      }
      if (state.imageList == null) {
        return Center(
          child: Text(LocaleKeys.errors_failedLoadData.tr()),
        );
      }
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    });
  }
}

class _FullScreenImageSlider extends StatelessWidget {
  const _FullScreenImageSlider({required this.urlImage});
  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return PhotoView(
      backgroundDecoration: BoxDecoration(color: context.colorScheme.background),
      minScale: PhotoViewComputedScale.contained * 1,
      imageProvider: NetworkImage(
        urlImage,
      ),
      loadingBuilder: (context, event) {
        return const CircularProgressIndicator.adaptive();
      },
      errorBuilder: (context, exception, stackTrace) {
        return Center(
          child: Text(LocaleKeys.errors_imageNotFound.tr()),
        );
      },
    );
  }
}
