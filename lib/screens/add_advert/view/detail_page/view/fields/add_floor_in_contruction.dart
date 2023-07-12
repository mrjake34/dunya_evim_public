part of '../../detail_page.dart';

class AdvertFloorInConstructionField extends StatelessWidget {
  const AdvertFloorInConstructionField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdvertBloc, AddAdvertState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              flex: 9,
              child: TextFormField(
                maxLength: 3,
                maxLines: 1,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                initialValue: state.floorInConstruction,
                onChanged: (value) {
                  context.read<AddAdvertBloc>().add(AddNewAdvertDetailEvent(floorInConstruction: value));
                },
                decoration: const InputDecoration(
                  filled: true,
                  label: RequiredText(text: LocaleKeys.advert_floorInConstruction),
                  border: AppRadius.textFieldBorder,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
                ]),
              ),
            ),
            Spacer(),
            Expanded(
              flex: 9,
              child: TextFormField(
                autofocus: true,
                maxLength: 4,
                maxLines: 1,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                initialValue: state.totalFloorInConstruction,
                onChanged: (value) {
                  context.read<AddAdvertBloc>().add(AddNewAdvertDetailEvent(totalFloorInConstruction: value));
                },
                decoration: const InputDecoration(
                  filled: true,
                  label: RequiredText(text: LocaleKeys.advert_constructionTotalFloor),
                  border: AppRadius.textFieldBorder,
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
                ]),
              ),
            ),
          ],
        );
      },
    );
  }
}
