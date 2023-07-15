part of 'my_adverts_bloc.dart';

sealed class MyAdvertsEvent extends Equatable {
  const MyAdvertsEvent();

  @override
  List<Object> get props => [];
}

final class StopListingEvent extends MyAdvertsEvent {
  final String? docId;

  StopListingEvent({this.docId});
}

final class StartListingEvent extends MyAdvertsEvent {
  final String? docId;

  StartListingEvent({this.docId});
}

final class RemoveAdvertEvent extends MyAdvertsEvent {
  final String? docId;
  final String? uid;

  RemoveAdvertEvent({this.docId, this.uid});
}

