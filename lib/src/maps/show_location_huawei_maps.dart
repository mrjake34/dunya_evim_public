import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huawei_map/huawei_map.dart';

import '../../core/utils/translation/locale_keys.g.dart';
import '../../screens/auth/login/bloc/login_bloc.dart';

class ShowLocationHuaweiMaps extends StatefulWidget {
  const ShowLocationHuaweiMaps({super.key, this.latitude, this.longitude});
  final double? latitude;
  final double? longitude;

  @override
  State<ShowLocationHuaweiMaps> createState() => _ShowLocationHuaweiMapsState();
}

class _ShowLocationHuaweiMapsState extends State<ShowLocationHuaweiMaps> {
  final Set<Marker> _markers = {};
  final Completer<HuaweiMapController> _controller = Completer<HuaweiMapController>();
  @override
  void initState() {
    HuaweiMapInitializer.initializeMap();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _markers.add(
      Marker(
        markerId: MarkerId(LocaleKeys.mainText_selectedLocation.tr()),
        position: LatLng(
          widget.latitude ?? 0.0,
          widget.longitude ?? 0.0,
        ),
      ),
    );
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return HuaweiMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(target: LatLng(widget.latitude ?? 0.0, widget.longitude ?? 0.0), zoom: 9),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          onMapCreated: (HuaweiMapController controller) {
            _controller.complete(controller);
          },
          markers: _markers,
        );
      },
    );
  }
}
