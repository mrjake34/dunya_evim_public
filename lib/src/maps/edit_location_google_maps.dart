import 'package:dunya_evim/core/base/extension/app_extension.dart';
import 'package:dunya_evim/screens/edit_advert/bloc/edit_advert_bloc.dart';
import 'package:dunya_evim/src/animations/loading_linear.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/constants/enums/bloc_enums.dart';
import '../../core/utils/translation/locale_keys.g.dart';

class EditLocationGoogleMaps extends StatefulWidget {
  const EditLocationGoogleMaps({super.key});

  @override
  State<EditLocationGoogleMaps> createState() => _EditLocationGoogleMapsState();
}

class _EditLocationGoogleMapsState extends State<EditLocationGoogleMaps> {
  final Set<Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocConsumer<EditAdvertBloc, EditAdvertState>(
              listenWhen: (previous, current) => previous.latitude != current.latitude,
              listener: (context, state) {
                markers.add(
                  Marker(
                    draggable: true,
                    flat: true,
                    markerId: MarkerId(LocaleKeys.mainText_selectedLocation.tr()),
                    position: LatLng(state.latitude ?? state.model?.latitude ?? 0.0, state.longitude ?? state.model?.longitude ?? 0.0),
                  ),
                );
              },
              builder: (context, state) {
                if (state.model?.latitude != null) {
                  markers.add(
                    Marker(
                      draggable: true,
                      flat: true,
                      markerId: MarkerId(LocaleKeys.mainText_selectedLocation.tr()),
                      position: LatLng(state.latitude ?? state.model?.latitude ?? 0.0, state.longitude ?? state.model?.longitude ?? 0.0),
                    ),
                  );
                }
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
                            state.latitude ?? state.model?.latitude ?? 0.0,
                            state.longitude ?? state.model?.longitude ?? 0.0,
                          ),
                          zoom: 10,
                        ),
                        markers: markers,
                        onTap: (position) {
                          markers.clear();

                          context.read<EditAdvertBloc>().add(GetAddressFromLatLngEvent(latitude: position.latitude, longitude: position.longitude));
                        },
                      ),
                    ),
                    Text(
                      '${LocaleKeys.mainText_selectedLocation.tr()} \n ${state.latitude ?? state.model?.latitude ?? 0.0}, ${state.longitude ?? state.model?.longitude ?? 0.0}',
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
