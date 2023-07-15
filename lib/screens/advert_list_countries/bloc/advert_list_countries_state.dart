// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'advert_list_countries_bloc.dart';

final class AdvertListCountriesState extends Equatable {
  AdvertListCountriesState({this.advertList, this.model, this.status});
  final List<AdvertModel>? advertList;
  final AdvertDetailModel? model;
  final Status? status;

  @override
  List<Object?> get props => [advertList, model, status];

  AdvertListCountriesState copyWith({
    List<AdvertModel>? advertList,
    AdvertDetailModel? model,
    Status? status,
  }) {
    return AdvertListCountriesState(
      advertList: advertList ?? this.advertList,
      model: model ?? this.model,
      status: status ?? this.status,
    );
  }
}

final class AdvertListCountriesInitial extends AdvertListCountriesState {}
