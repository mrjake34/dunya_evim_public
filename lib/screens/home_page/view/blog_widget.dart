import 'package:dunya_evim/core/constants/enums/bloc_enums.dart';
import 'package:dunya_evim/core/utils/translation/locale_keys.g.dart';
import 'package:dunya_evim/screens/home_page/bloc/home_page_bloc.dart';
import 'package:dunya_evim/src/text/body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class BlogWidget extends StatefulWidget {
  const BlogWidget({Key? key}) : super(key: key);

  @override
  State<BlogWidget> createState() => _BlogWidgetState();
}

class _BlogWidgetState extends State<BlogWidget> {
  @override
  Widget build(BuildContext context) {
    context.read<HomePageBloc>().add(FetchBlogsEvent());
    return SizedBox(
      height: 200,
      child: BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
        if (state.status == Status.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (state.blogList == null) {
            return const Center(
              child: BodyText(text: LocaleKeys.errors_failedLoadData),
            );
          }
          return ListView.builder(
              itemCount: state.blogList?.length ?? 0,
              itemBuilder: (context, index) {
                final blogModel = state.blogList?[index];
                return SizedBox(
                  height: 50,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text(
                          blogModel?.title ?? '',
                          style: TextStyle(fontSize: 13),
                          maxLines: 2,
                        ),
                        trailing: IconButton(
                            onPressed: () async {
                              await launchUrl(Uri.parse(blogModel?.url ?? ''));
                            },
                            icon: const Icon(Icons.open_in_new)),
                      ),
                    ),
                  ),
                );
              });
        }
      }),
    );
  }
}
