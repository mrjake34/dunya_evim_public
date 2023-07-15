import 'package:equatable/equatable.dart';
import '../../../core/base/class/base_bloc.dart';
import '../../../core/constants/enums/bloc_enums.dart';
import '../../../core/constants/enums/firebase_enums.dart';
import '../../profile/model/user_model.dart';
import '../model/advert_detail_model.dart';
import '../model/advert_model.dart';
import '../service/advert_service.dart';

part 'advert_event.dart';
part 'advert_state.dart';

final class AdvertBloc extends BaseBloc<AdvertEvent, AdvertState> {
  AdvertBloc() : super(AdvertState(sliderIndex: 0)) {
    on<FetchAdvertsEvent>((event, emit) async {
      await fetchAdvertsEvent();
    });
    on<FetchAdvertDetailEvent>((event, emit) async {
      await fetchAdvertDetailEvent(event);
    });
    on<AddAdvertsEvet>((event, emit) async {
      await addAdvertsEvent(event);
    });
    on<SliderIndexEvent>((event, emit) {
      if (event.index != null) {
        safeEmit(
          state.copyWith(
            sliderIndex: event.index,
          ),
        );
      }
    });
  }

  Future<void> fetchAdvertsEvent() async {
    safeEmit(state.copyWith(status: Status.loading));
    final response = await AdvertService().fectAdvertModelList();
    if (response.isNotEmpty) {
      safeEmit(state.copyWith(status: Status.success, advertList: response));
    } else {
      safeEmit(state.copyWith(status: Status.failed));
    }
  }

  Future<void> addAdvertsEvent(AddAdvertsEvet event) async {
    safeEmit(state.copyWith(status: Status.loading));
    if (event.advertModel != null && event.advertDetailModel != null && event.urlList != null && event.email != null) {
      final response = await AdvertService()
          .addAdvertModel(advertModel: event.advertModel!, advertDetailModel: event.advertDetailModel!, urlList: event.urlList!, email: event.email!);
      if (response == true) {
        safeEmit(state.copyWith(status: Status.success));
      } else {
        safeEmit(state.copyWith(status: Status.failed));
      }
    }
  }

  Future<void> fetchAdvertDetailEvent(FetchAdvertDetailEvent event) async {
    safeEmit(state.copyWith(status: Status.loading));
    if (event.docId != null) {
      final response = await AdvertService().fectAdvertDetailModel(docId: event.docId!);
      final responseImage = await AdvertService().fectAdvertDetailImageList(docId: event.docId!);
      if (response?.data() != null && responseImage?.data() != null) {
        final advert = await AdvertDetailModel.fromJson(response!.data()!);
        final user = await AdvertService().fetchAdvertOwnerProfile(userID: advert.ownerId);
        final userModel = await user.get().then((value) => value.data());
        final images = await responseImage?.data()?[FirebaseEnums.urlList.value];
        safeEmit(state.copyWith(status: Status.success, advertDetailModel: advert, imageList: images, advertOwnerModel: userModel));
      } else {
        safeEmit(state.copyWith(status: Status.failed));
      }
    }
  }

  void clearSliderIndex() {
    safeEmit(state.copyWith(sliderIndex: 0));
  }
}
