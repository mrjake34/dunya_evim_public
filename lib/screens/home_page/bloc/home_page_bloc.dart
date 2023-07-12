import 'package:dunya_evim/core/base/class/base_bloc.dart';
import 'package:dunya_evim/core/base/firebase/firebase_service.dart';
import 'package:dunya_evim/core/constants/enums/firebase_enums.dart';
import 'package:equatable/equatable.dart';

import '../../../core/constants/enums/bloc_enums.dart';
import '../model/blog_model.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

final class HomePageBloc extends BaseBloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageState()) {
    on<FetchBlogsEvent>((event, emit) async {
      safeEmit(state.copyWith(status: Status.loading));
      final blogs = await FirebaseService.instance.blogCollection.where(FireStoreEnums.approved.value, isEqualTo: true).get();
      if (blogs.docs.isNotEmpty) {
        final blocList = blogs.docs;
        List<BlogModel> newList = [];
        for (var bloc in blocList) {
          newList.add(BlogModel.fromJson(bloc.data() as Map<String, dynamic>));
        }
        if (newList.isNotEmpty) {
          safeEmit(state.copyWith(blogList: newList, status: Status.success));
        }
      } else {
        safeEmit(state.copyWith(status: Status.failed));
      }
    });
  }
}
