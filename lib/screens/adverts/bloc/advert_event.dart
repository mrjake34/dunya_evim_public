// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'advert_bloc.dart';

abstract class AdvertEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchAdvertsEvent extends AdvertEvent {}

class FetchAdvertDetailEvent extends AdvertEvent {
  final String? docId;

  FetchAdvertDetailEvent({this.docId});

  @override
  List<Object?> get props => [docId];
}

class AddAdvertsEvet extends AdvertEvent {
  final AdvertModel? advertModel;
  final String? email;
  final AdvertDetailModel? advertDetailModel;
  final List<String>? urlList;

  AddAdvertsEvet({this.advertModel, this.advertDetailModel, this.urlList, this.email});
  @override
  List<Object?> get props => [advertModel, advertDetailModel, urlList, email];
}