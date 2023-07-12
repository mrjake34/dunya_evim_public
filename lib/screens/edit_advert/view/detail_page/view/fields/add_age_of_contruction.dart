part of '../../detail_page.dart';

class AdvertAgeOfConstructionField extends StatelessWidget {
  const AdvertAgeOfConstructionField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditAdvertBloc, EditAdvertState>(
      builder: (context, state) {
        if (state.model?.ageOfConstruction == null) {
          return Center(
            child: Container(),
          );
        } else {
          return TextFormField(
            maxLength: 3,
            maxLines: 1,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            initialValue: state.ageOfConstruction ?? state.model?.ageOfConstruction ?? '',
            decoration: const InputDecoration(
              filled: true,
              label: RequiredText(text: LocaleKeys.advert_ageOfConstruction),
              border: AppRadius.textFieldBorder,
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
            ]),
          );
        }
      },
    );
  }
}
