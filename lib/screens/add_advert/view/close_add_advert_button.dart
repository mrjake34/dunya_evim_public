import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/routers/routers.dart';
import '../../../../../core/utils/navigation/navigation_service.dart';
import '../bloc/add_advert_bloc.dart';

class CloseAddAdvertButton extends StatelessWidget {
  const CloseAddAdvertButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        context.read<AddAdvertBloc>().clear();
        NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.home);
      },
      icon: const Icon(Icons.close),
    );
  }
}
