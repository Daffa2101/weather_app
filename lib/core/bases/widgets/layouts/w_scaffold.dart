import 'package:flutter/material.dart';

class WScaffold extends StatelessWidget {
  final Widget body;
  final Color backgroundColor;
  final bool resizeToAvoidBottomInset;
  final bool safeArea;
  final bool padding;
  final Widget? appBar;
  final double? appBarHeight;
  const WScaffold({
    required this.body,
    this.backgroundColor = Colors.white,
    this.resizeToAvoidBottomInset = false,
    this.appBarHeight,
    this.appBar,
    this.safeArea = true,
    this.padding = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar != null
          ? PreferredSize(
              preferredSize: Size.fromHeight(
                appBarHeight ?? 200,
              ),
              child: appBar!,
            )
          : null,
      body: safeArea == true
          ? SafeArea(
              bottom: false,
              child: padding == true
                  ? Padding(
                      padding: const EdgeInsets.all(20),
                      child: body,
                    )
                  : body,
            )
          : padding == true
              ? Padding(
                  padding: const EdgeInsets.all(20),
                  child: body,
                )
              : body,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}
