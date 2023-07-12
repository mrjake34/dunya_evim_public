part of '../review_detail.dart';

class ReviewSliderField extends StatelessWidget {
  const ReviewSliderField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ReviewSliderBuilder(),
        Positioned(
          top: 10.0,
          left: 30.0,
          child: IconButton(
            onPressed: null,
            icon: Container(
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black87, offset: Offset(-0.5, 1.5), spreadRadius: 0.3, blurRadius: 2.5)]),
                child: const Icon(
                  Icons.favorite_border,
                  fill: 0.1,
                  color: Colors.red,
                  size: 20,
                )),
          ),
        ),
      ],
    );
  }
}
