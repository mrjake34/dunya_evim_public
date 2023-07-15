import 'package:dunya_evim/core/constants/enums/bloc_enums.dart';
import 'package:dunya_evim/core/constants/path/image_path.dart';
import 'package:dunya_evim/core/constants/size/paddings.dart';
import 'package:dunya_evim/core/utils/translation/locale_keys.g.dart';
import 'package:dunya_evim/screens/profile/bloc/profile_bloc.dart';
import 'package:dunya_evim/src/text/body_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'my_adverts_card.dart';

class MyAdvertList extends StatelessWidget {
  const MyAdvertList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(FetchMyAdvertsEvent());
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          if (state.status == Status.success) {
            return ListView.builder(
              padding: EdgeInsets.all(AppPadding.pagePadding),
              itemCount: state.myAdvertList?.length ?? 0,
              itemBuilder: (context, index) {
                
                return MyAdvertCard(state.myAdvertList?[index]);
              },
            );
          } else if (state.status == Status.failed) {
            return Center(
              child: BodyTitleText(text: LocaleKeys.errors_failedLoadData),
            );
          } else {
            return Lottie.asset(ImagePath.loadingAnimation);
          }
        },
      ),
    );
  }
}
