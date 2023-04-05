import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelloHutAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTrailingPressed;
  final double elevation;
  final double height;

  const HelloHutAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.trailing,
    this.onTrailingPressed,
    this.elevation = 0,
    this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      child: SizedBox(
        height: height,
        child: Row(
          children: [
            if (leading != null) ...[
              SizedBox(width: 8.0),
              leading!,
            ],
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 8.0),
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 8.0),
                      Expanded(
                        child: CupertinoTextField(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 4.0,
                          ),
                          placeholder: 'Search Hello',
                          cursorColor: Colors.grey,
                        ),
                      ),
                      SizedBox(width: 8.0),
                    ],
                  ),
                ),
              ),
            ),
            if (trailing != null) ...[
              SizedBox(width: 8.0),
              GestureDetector(
                onTap: onTrailingPressed,
                child: trailing!,
              ),
              SizedBox(width: 8.0),
            ],
          ],
        ),
      ),
    );
  }
}
