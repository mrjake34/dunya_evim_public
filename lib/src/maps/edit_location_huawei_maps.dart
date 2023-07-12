import 'dart:async';
import 'package:dunya_evim/core/base/extension/app_extension.dart';
import 'package:dunya_evim/screens/edit_advert/bloc/edit_advert_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huawei_map/huawei_map.dart';
import '../../core/utils/translation/locale_keys.g.dart';

class EditLocationHuaweiMaps extends StatefulWidget {
  const EditLocationHuaweiMaps({
    super.key,
  });

  @override
  State<EditLocationHuaweiMaps> createState() => _EditLocationHuaweiMapsState();
}

class _EditLocationHuaweiMapsState extends State<EditLocationHuaweiMaps> {
  final Completer<HuaweiMapController> _controller = Completer<HuaweiMapController>();
  late final CameraPosition userPosition;

  final Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SingleChildScrollView(
        child: BlocConsumer<EditAdvertBloc, EditAdvertState>(
          listenWhen: (previous, current) => previous.latitude != current.latitude,
          listener: (context, state) {
            _markers.add(
              Marker(
                draggable: true,
                flat: true,
                markerId: MarkerId(LocaleKeys.mainText_selectedLocation.tr()),
                position: LatLng(state.latitude ?? state.model?.latitude ?? 0.0, state.longitude ?? state.model?.longitude ?? 0.0),
              ),
            );
          },
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: context.pageSize.height * 0.6,
                  child: HuaweiMap(
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(
                          state.latitude ?? state.model?.latitude ?? 0.0,
                          state.longitude ?? state.model?.longitude ?? 0.0,
                        ),
                        zoom: 10),
                    onMapCreated: (HuaweiMapController controller) {
                      _controller.complete(controller);
                    },
                    markers: _markers,
                    onClick: (position) {
                      _markers.clear();

                      context.read<EditAdvertBloc>().add(GetAddressFromLatLngEvent(latitude: position.lat, longitude: position.lng));
                    },
                  ),
                ),
                Text(
                  '${LocaleKeys.mainText_selectedLocation.tr()} \n ${state.latitude ?? state.model?.latitude ?? 0.0}, ${state.longitude ?? state.model?.latitude ?? 0.0}',
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
