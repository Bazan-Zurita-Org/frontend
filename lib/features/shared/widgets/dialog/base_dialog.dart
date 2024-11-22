import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class BaseDialog {
  BaseDialog();

  @protected
  Widget createAcceptButton({required BuildContext context});

  Widget? createCancelButton({required BuildContext context});

  Widget? createImage();

  Widget? createTitle();

  Widget createDescription();
  // Widget createDescription() {
  //   return const SizedBox();
  // }

  bool titleNextCloseIcon() => false;

  bool canCloseDialog() => true;

  bool horizontal() => true;

  bool showButtons() => true;

  double descriptionPaddingRight() => 16.w;

  double descriptionPaddingLeft() => 16.w;

  bool hasSingleChildScrollView() => false;

  EdgeInsets insetPadding =
      EdgeInsets.symmetric(horizontal: 32.w, vertical: 24.h);

  void initialize(BuildContext context) {}

  Widget create(BuildContext context) {
    initialize(context);
    return Dialog(
      insetPadding: insetPadding,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: hasSingleChildScrollView()
          ? SingleChildScrollView(
              child: _getLayout(context),
            )
          : _getLayout(context),
    );
  }

  Widget _getLayout(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 42.h,
          child: Row(
            children: [
              Expanded(
                child: titleNextCloseIcon()
                    ? Container(
                        margin: EdgeInsets.only(left: 16.w),
                        alignment: Alignment.bottomLeft,
                        child: createTitle() ?? const SizedBox(),
                      )
                    : const SizedBox(),
              ),
              canCloseDialog()
                  ? InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        try {
                          //getIt<FluroRouter>().pop(context);
                          Navigator.pop(context);
                        } catch (e) {}
                      },
                      child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 16.w),
                          child: Icon(Icons.close,
                              color: Colors.black, size: 24.r)),
                    )
                  : const SizedBox()
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              createImage() != null
                  ? Container(
                      margin: EdgeInsets.only(bottom: 28.h),
                      child: createImage(),
                    )
                  : const SizedBox(),
              createTitle() != null && !titleNextCloseIcon()
                  ? Container(
                      margin:
                          EdgeInsets.only(bottom: 8.h, left: 16.w, right: 16.w),
                      child: createTitle(),
                    )
                  : SizedBox(height: 8.h),
              Container(
                  padding: EdgeInsets.only(
                      left: descriptionPaddingLeft(),
                      right: descriptionPaddingRight()),
                  child: createDescription()),
              if (showButtons())
                Container(
                  margin: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h),
                  child: horizontal()
                      ? Row(
                          children: [
                            createCancelButton(context: context) != null
                                ? Expanded(
                                    child:
                                        createCancelButton(context: context)!,
                                  )
                                : const SizedBox(),
                            createCancelButton(context: context) != null
                                ? SizedBox(width: 12.w)
                                : const SizedBox(),
                            Expanded(
                              child: createAcceptButton(context: context),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            createAcceptButton(context: context),
                            createCancelButton(context: context) != null
                                ? Container(
                                    margin: EdgeInsets.only(top: 8.h),
                                    child: createCancelButton(context: context),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                )
            ],
          ),
        )
      ],
    );
  }

  Future<Map?> show(BuildContext context) {
    var dialog = create(context);
    return showDialog<Map>(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return PopScope(
              child: dialog,
              onPopInvokedWithResult: (_, __) async => canCloseDialog());
        });
  }
}
