import 'package:dunya_evim/core/base/extension/app_extension.dart';
import 'package:dunya_evim/src/animations/loading_linear.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/constants/enums/bloc_enums.dart';
import '../../core/utils/translation/locale_keys.g.dart';
import '../../screens/add_advert/bloc/add_advert_bloc.dart';

class AddLocationGoogleMaps extends StatefulWidget {
  const AddLocationGoogleMaps({super.key, this.position});
  final Position? position;
  @override
  State<AddLocationGoogleMaps> createState() => _AddLocationGoogleMapsState();
}

class _AddLocationGoogleMapsState extends State<AddLocationGoogleMaps> {
  final Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    // context.read<AddAdvertBloc>().add(GetUserCurrentPositionEvent());
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocConsumer<AddAdvertBloc, AddAdvertState>(
              listenWhen: (previous, current) => previous.latitude != current.latitude,
              listener: (context, state) {
                markers.add(
                  Marker(
                    draggable: true,
                    flat: true,
                    markerId: MarkerId(LocaleKeys.mainText_selectedLocation.tr()),
                    position: LatLng(
                        state.latitude ?? state.userCurrentPosition?.latitude ?? 0.0, state.longitude ?? state.userCurrentPosition?.longitude ?? 0.0),
                  ),
                );
              },
              buildWhen: (previous, current) => previous.status != current.status,
              builder: (context, state) {
                return Column(
                  children: [
                    if (state.status == Status.loading) LoadingLinear() else Container(),
                    SizedBox(
                      height: context.pageSize.height * 0.6,
                      child: GoogleMap(
                        myLocationButtonEnabled: true,
                        myLocationEnabled: true,
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                            target: LatLng(
                              state.latitude ?? widget.position?.latitude ?? 0.0,
                              state.longitude ?? widget.position?.longitude ?? 0.0,
                            ),
                            zoom: widget.position?.altitude ?? 10),
                        markers: markers,
                        onTap: (position) {
                          markers.clear();

                          context.read<AddAdvertBloc>().add(GetAddressFromLatLngEvent(latitude: position.latitude, longitude: position.longitude));
                        },
                      ),
                    ),
                    Text(
                      '${LocaleKeys.mainText_selectedLocation.tr()} \n ${state.latitude ?? 0.0}, ${state.longitude ?? 0.0}',
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
