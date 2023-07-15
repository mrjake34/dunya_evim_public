part of 'my_adverts_card.dart';

mixin _ActionButtonBottomSheetMixin on State<_ActionButtonBottomSheet> {
    void _startListingFunc() {
    try {
      context.read<MyAdvertsBloc>().add(
            StartListingEvent(docId: widget.model.docId),
          );
    } finally {
      NavigationService.instance.navigateToBack();
      context.read<ProfileBloc>().add(FetchMyAdvertsEvent());
    }
  }

  void _editAdvertDetail() {
    if (widget.model.docId?.isNotEmpty ?? false) {
      try {
        context.read<EditAdvertBloc>().add(FetchAdvertDetailEvent(docId: widget.model.docId));
      } finally {
        NavigationService.instance.navigateToPageAndRemoveUntil(path: RoutersConstants.editAdvertDetailPage);
      }
    }
  }

  void _stopListingFunc() {
    try {
      context.read<MyAdvertsBloc>().add(
            StopListingEvent(
              docId: widget.model.docId,
            ),
          );
    } finally {
      NavigationService.instance.navigateToBack();
      context.read<ProfileBloc>().add(FetchMyAdvertsEvent());
    }
  }

  void _removeAdvertFunc() {
    try {
      context.read<MyAdvertsBloc>().add(
            RemoveAdvertEvent(
              docId: widget.model.docId,
              uid: widget.model.ownerUid,
            ),
          );
    } finally {
      NavigationService.instance.navigateToBack();
      context.read<ProfileBloc>().add(FetchMyAdvertsEvent());
    }
  }
}