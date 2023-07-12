import 'package:carousel_slider/carousel_slider.dart';
import 'package:dunya_evim/core/base/extension/app_extension.dart';
import 'package:dunya_evim/screens/adverts/bloc/advert_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../../../core/utils/translation/locale_keys.g.dart';

class ShowSliderWidget extends StatefulWidget {
  final String? docId;
  final List<XFile>? files;

  const ShowSliderWidget({super.key, this.docId, this.files});

  @override
  State<ShowSliderWidget> createState() => _ShowSliderWidgetState();
}

class _ShowSliderWidgetState extends State<ShowSliderWidget> {
  CarouselController sliderController = CarouselController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertBloc, AdvertState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                viewportFraction: 1,
                height: context.pageSize.height * 0.5,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                pageSnapping: true,
                onPageChanged: (index, reason) {
                  sliderController.animateToPage(index);
                },
              ),
              itemCount: state.imageList?.length ?? 0,
              itemBuilder: (context, index, pageViewIndex) {
                final urlImage = state.imageList?[index];
                if (urlImage != null) {
                  return BuildSlider(urlImage:urlImage ?? '');
                } else {
                  return Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              },
              carouselController: sliderController,
            ),
            Positioned(
              bottom: 10,
              child: Container(
                height: 20,
                decoration: const BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.imageList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => sliderController.animateToPage(index),
                        child: Container(
                          width: 7.0,
                          height: 7.0,
                          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.white)
                                  .withOpacity(activeIndex == index ? 0.9 : 0.4)),
                        ),
                      );
                    }),
              ),
            ),
          ],
        );
      },
    );
  }

}

class BuildSlider extends StatelessWidget {
  const BuildSlider({
    super.key,
    required this.urlImage
  });

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
