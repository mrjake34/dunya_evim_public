import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/utils/translation/locale_keys.g.dart';
import '../../screens/auth/login/bloc/login_bloc.dart';

class ShowLocationGoogleMaps extends StatelessWidget {
  ShowLocationGoogleMaps({super.key, this.latitude, this.longitude});
  final double? latitude;
  final double? longitude;

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    _markers.add(
      Marker(
        markerId: MarkerId(LocaleKeys.mainText_selectedLocation.tr()),
        position: LatLng(
          latitude ?? 0.0,
          longitude ?? 0.0,
        ),
      ),
    );
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
              target: LatLng(
                latitude ?? 0.0,
                longitude ?? 0.0,
              ),
              zoom: 9),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: _markers,
        );
      },
    );
  }
}
