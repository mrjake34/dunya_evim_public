part of '../../detail_page.dart';

class AdvertFloorInConstructionField extends StatelessWidget {
  const AdvertFloorInConstructionField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditAdvertBloc, EditAdvertState>(
      builder: (context, state) {
        if (state.model?.floorInConstruction == null || state.model?.totalFloorInConstruction == null) {
          return Center(
            child: Container(),
          );
        } else {
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
                  initialValue: state.totalFloorInConstruction ?? state.model?.totalFloorInConstruction ?? '',
                  onChanged: (value) {
                    context.read<EditAdvertBloc>().add(EditAdvertDetailEvent(floorInConstruction: value));
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
                  initialValue: state.floorInConstruction ?? state.model?.totalFloorInConstruction ?? '',
                  onChanged: (value) {
                    context.read<EditAdvertBloc>().add(EditAdvertDetailEvent(totalFloorInConstruction: value));
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
        }
      },
    );
  }
}
