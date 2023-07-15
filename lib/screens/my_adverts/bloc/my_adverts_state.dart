part of 'my_adverts_bloc.dart';

@immutable
final class MyAdvertsState extends Equatable {
  const MyAdvertsState({
    this.status,
    this.advertListingStatus,
    this.advertRemoveStatus,
  });
  final Status? status;
  final Status? advertListingStatus;
  final Status? advertRemoveStatus;

  @override
  List<Object?> get props => [status, advertListingStatus, advertRemoveStatus];

  MyAdvertsState copyWith({
    Status? status,
    Status? advertListingStatus,
    Status? advertRemoveStatus,
  }) {
    return MyAdvertsState(
      status: status ?? this.status,
      advertListingStatus: advertListingStatus ?? this.advertListingStatus,
      advertRemoveStatus: advertRemoveStatus ?? this.advertRemoveStatus,
    );
  }
}

final class MyAdvertsInitial extends MyAdvertsState {}
