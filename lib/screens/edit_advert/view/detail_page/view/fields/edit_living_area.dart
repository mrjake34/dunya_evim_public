// ignore_for_file: public_member_api_docs, sort_constructors_first
part of '../../detail_page.dart';

class AdvertLivingAreaField extends StatelessWidget {
  const AdvertLivingAreaField({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditAdvertBloc, EditAdvertState>(
      builder: (context, state) {
        if (state.model?.livingArea == null) {
          return Center(
            child: Container(),
          );
        } else {
          return TextFormField(
            maxLength: 5,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            initialValue: state.livingArea ?? state.model?.livingArea ?? '',
            onChanged: (String value) {
              context.read<EditAdvertBloc>().add(EditAdvertDetailEvent(livingArea: value));
            },
            decoration: InputDecoration(
              filled: true,
              label: RequiredText(text: LocaleKeys.advert_livingArea),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: AppRadius.textFieldBorder,
            ),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(errorText: LocaleKeys.errors_dontLeaveEmpty.tr()),
              ],
            ),
          );
        }
      },
    );
  }
}
