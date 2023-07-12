// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_page_bloc.dart';

class HomePageState extends Equatable {
  const HomePageState({this.blogList, this.status});
  final List<BlogModel>? blogList;
  final Status? status;

  @override
  List<Object?> get props => [blogList, status];

  HomePageState copyWith({
    List<BlogModel>? blogList,
    Status? status,
  }) {
    return HomePageState(
      blogList: blogList ?? this.blogList,
      status: status ?? this.status,
    );
  }
}
