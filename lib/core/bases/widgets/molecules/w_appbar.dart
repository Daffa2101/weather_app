import 'package:flutter/material.dart';
import 'package:weather_app/core/themes/_themes.dart';

class WAppbar extends StatelessWidget {
  const WAppbar({
    required this.title,
    this.bottomContent,
    this.leading,
    super.key,
  });

  final String title;
  final Widget? bottomContent;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      leading: leading,
      title: Text(
        title,
        style: FontTheme.header1.copyWith(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.blue.shade200,
      bottom: bottomContent != null
          ? PreferredSize(
              preferredSize:
                  Size.fromHeight(0.1 * MediaQuery.of(context).size.height),
              child: Column(
                children: [
                  bottomContent!,
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
