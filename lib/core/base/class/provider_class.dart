// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../screens/add_advert/bloc/add_advert_bloc.dart';
import '../../../screens/advert_list_countries/bloc/advert_list_countries_bloc.dart';
import '../../../screens/adverts/bloc/advert_bloc.dart';
import '../../../screens/auth/forget_password/bloc/pass_reset_bloc.dart';
import '../../../screens/auth/login/bloc/login_bloc.dart';
import '../../../screens/auth/register/bloc/register_bloc.dart';
import '../../../screens/edit_advert/bloc/edit_advert_bloc.dart';
import '../../../screens/home_page/bloc/home_page_bloc.dart';
import '../../../screens/my_adverts/bloc/my_adverts_bloc.dart';
import '../../../screens/profile/bloc/profile_bloc.dart';

class CustomMultiProvider extends StatelessWidget {
  const CustomMultiProvider({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
            create: (context) => LoginBloc(),
          ),
          BlocProvider(
            create: (context) => PassResetBloc(),
          ),
          BlocProvider(
            create: (context) => RegisterBloc(),
          ),
          BlocProvider(
            create: (context) => AdvertBloc(),
          ),
          BlocProvider(
            create: (context) => ProfileBloc(),
          ),
          BlocProvider(
            create: (context) => AddAdvertBloc(),
          ),
          BlocProvider(
            create: (context) => HomePageBloc(),
          ),
          BlocProvider(
            create: (context) => EditAdvertBloc(),
          ),
          BlocProvider(
            create: (context) => MyAdvertsBloc(),
          ),
          BlocProvider(
            create: (context) => AdvertListCountriesBloc(),
          ),
    ], child: child);
  }
}
