import 'package:dunya_evim/core/base/class/base_bloc.dart';
import 'package:dunya_evim/core/constants/enums/bloc_enums.dart';
import 'package:dunya_evim/screens/adverts/model/advert_detail_model.dart';
import 'package:dunya_evim/screens/adverts/model/advert_model.dart';
import 'package:dunya_evim/screens/adverts/service/advert_service.dart';
import 'package:equatable/equatable.dart';

part 'advert_list_countries_event.dart';
part 'advert_list_countries_state.dart';

final class AdvertListCountriesBloc extends BaseBloc<AdvertListCountriesEvent, AdvertListCountriesState> {
  AdvertListCountriesBloc() : super(AdvertListCountriesState()) {
    on<FetchAdvertListCountriesEvent>((event, emit) async {
      if (event.isoCountryCode != null) {
        await fetchAdvertList(event.isoCountryCode!);
      }
    });
  }
  Future<void> fetchAdvertList(String isoCountryCode) async {
    safeEmit(state.copyWith(status: Status.loading));
    final reponse = await AdvertService().fectAdvertModelListCountries(isoCountryCode);
    if (reponse != null) {
      safeEmit(state.copyWith(advertList: reponse, status: Status.success));
    } else {
      safeEmit(state.copyWith(status: Status.failed));
    }
  }
}
