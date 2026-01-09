import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

import "../base/resizer/constant.dart";
import "../base/resizer/fetch_pixels.dart";
import "../base/resizer/widget_utils.dart";
import "../resources/resources.dart";

class MyListTile extends StatefulWidget {
  final String titleText;
  final String? titleIconPath;
  final String? trailingText;
  final Widget? trailingWidget;
  final GestureTapCallback? onTap;

  const MyListTile({
    super.key,
    required this.titleText,
    this.titleIconPath,
    this.trailingText,
    this.trailingWidget,
    this.onTap,
  });

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  bool _isPressed = false;

  void changeElevation() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      child: GestureDetector(
        onTapDown: (details) async {
          await Future.delayed(Duration(milliseconds: 100), () {
            changeElevation();
          });
        },
        onTapUp: (details) async {
          await Future.delayed(Duration(milliseconds: 200), () {
            changeElevation();
          });
        },
        child: Card(
          shadowColor: R.colors.blackColor.withValues(
            alpha: Constant.getOpacityValues(20),
          ),
          elevation: (_isPressed) ? 0 : 5,
          color: R.colors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(10)),
          ),
          child: ListTile(
            title: simpleText(widget.titleText),
            leading: (widget.titleIconPath != null)
                ? SvgPicture.asset(widget.titleIconPath!)
                : null,
            trailing:
                (widget.trailingWidget) ??
                ((widget.trailingText != null)
                    ? simpleText(widget.trailingText!)
                    : null),
          ),
        ),
      ),
    );
  }
}
