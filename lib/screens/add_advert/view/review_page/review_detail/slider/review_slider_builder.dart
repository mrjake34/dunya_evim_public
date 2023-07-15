import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dunya_evim/core/utils/translation/locale_keys.g.dart';
import 'package:dunya_evim/src/text/body_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../bloc/add_advert_bloc.dart';

class ReviewSliderBuilder extends StatefulWidget {
  final String? docId;
  final List<XFile>? files;

  const ReviewSliderBuilder({super.key, this.docId, this.files});

  @override
  State<ReviewSliderBuilder> createState() => _ReviewSliderBuilderState();
}

class _ReviewSliderBuilderState extends State<ReviewSliderBuilder> {
  final CarouselController sliderController = CarouselController();
  @override
  void initState() {
    super.initState();
    context.read<AddAdvertBloc>().clearSliderIndex();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdvertBloc, AddAdvertState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                viewportFraction: 1,
                height: 400,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                pageSnapping: true,
                onPageChanged: (index, reason) {
                  context.read<AddAdvertBloc>().add(
                        SliderIndexEvent(
                          index,
                        ),
                      );
                },
              ),
              itemCount: state.files?.length ?? 0,
              itemBuilder: (context, index, realIndex) {
                final urlImage = state.files?[index];
                if (urlImage != null) {
                  return buildSlider(urlImage, index);
                } else {
                  return Center(
                    child: BodyTitleText(text: LocaleKeys.errors_imageNotFound),
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
                  itemCount: state.files?.length ?? 0,
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
                                .withOpacity(state.sliderIndex == index ? 0.9 : 0.4)),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildSlider(XFile urlImage, int index) {
    return Image.file(
      File(urlImage.path),
      fit: BoxFit.contain,
      width: 1024,
      height: 1024,
      errorBuilder: (context, exception, stackTrace) {
        return const Center(
          child: BodyTitleText(text: LocaleKeys.errors_imageNotFound),
        );
      },
    );
  }
}
