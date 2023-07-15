part of 'advert_list_countries_bloc.dart';

sealed class AdvertListCountriesEvent extends Equatable {
  const AdvertListCountriesEvent();

  @override
  List<Object> get props => [];
}

final class FetchAdvertListCountriesEvent extends AdvertListCountriesEvent {
  final String? isoCountryCode;

  FetchAdvertListCountriesEvent(this.isoCountryCode);
}
