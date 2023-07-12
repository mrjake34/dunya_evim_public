import 'package:dunya_evim/screens/edit_advert/bloc/edit_advert_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/routers/routers.dart';
import '../../../../../core/utils/navigation/navigation_service.dart';

class CloseEditAdvertButton extends StatelessWidget {
  const CloseEditAdvertButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        context.read<EditAdvertBloc>().clear();
        NavigationService.instance.navigateToPageAndRemoveUntil(
          path: RoutersConstants.home,
        );
      },
      icon: const Icon(
        Icons.close,
      ),
    );
  }
}
