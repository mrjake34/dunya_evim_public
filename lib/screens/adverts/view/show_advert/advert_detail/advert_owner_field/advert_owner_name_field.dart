part of '../detail_builder.dart';

class AdvertOwnerNameField extends StatelessWidget {
  const AdvertOwnerNameField({super.key, this.advertOwnerModel});

  final UserModel? advertOwnerModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: TextButton(
            onPressed: () {
              if (advertOwnerModel != null) {
                NavigationService.instance.navigateToPage(path: RoutersConstants.advertOwnerProfilePage, data: advertOwnerModel);
              }
            },
            child: Text(
              advertOwnerModel?.fullName ?? '',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
