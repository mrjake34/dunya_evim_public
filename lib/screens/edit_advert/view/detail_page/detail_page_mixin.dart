part of 'detail_page.dart';

mixin DetailPageMixin on State<EditAdvertEditDetailPage> {
  final formKey = GlobalKey<FormBuilderState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController livingAreaController = TextEditingController();
  final TextEditingController consAgeController = TextEditingController();
  final TextEditingController floorPlaceController = TextEditingController();
  final TextEditingController totalFloorController = TextEditingController();
  final TextEditingController heatingController = TextEditingController();
  final TextEditingController advertTypeController = TextEditingController();
  final TextEditingController furnitureController = TextEditingController();
  final TextEditingController hasGarageController = TextEditingController();
  final TextEditingController inSiteController = TextEditingController();
  final TextEditingController canVideoCallController = TextEditingController();
  final TextEditingController citizenshipRightsController = TextEditingController();
  final TextEditingController numberOfRoomsController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    priceController.dispose();
    livingAreaController.dispose();
    consAgeController.dispose();
    floorPlaceController.dispose();
    totalFloorController.dispose();
    heatingController.dispose();
  }
}
