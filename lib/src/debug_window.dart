import 'package:flutter/material.dart';

import 'content_text_styles.dart';

/// [DebugWindow] is a useful widget to represent some data on the device. If
/// you use this widget, a ancestor of this needs to have [MaterialApp] and
/// [Scaffold]. Without these, you will take Runtime-Error.
///
class DebugWindow extends StatefulWidget {
  const DebugWindow({
    required this.child,
    this.debugContent,
    this.backgroundColor,
    this.isBottom = false,
    this.isEnable = true,
    super.key,
  });

  final Widget child;

  /// [debugContent] is a debug content you would like to represent on a
  /// screen in your flutter app.
  ///
  final Widget? debugContent;

  /// [backgroundColor] is debug window color. Default value is
  /// Colors.black.withOpacity(0.2).
  ///
  final Color? backgroundColor;

  /// [isBottom] is used in the case that you wouldn't like to put on top.
  ///
  final bool isBottom;

  /// If [isEnable] is false, you cannot look at this debug window.
  ///
  final bool isEnable;

  @override
  State<DebugWindow> createState() => _DebugWindowState();
}

class _DebugWindowState extends State<DebugWindow> {
  // First, this debug window is open.
  bool isOpen = true;

  // close window when a close icon is tapped.
  void _closeWindow() {
    setState(() {
      isOpen = false;
    });
  }

  // open window when a close icon is tapped.
  void _openWindow() {
    setState(() {
      isOpen = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (widget.isEnable)
          Align(
            alignment:
                widget.isBottom ? Alignment.bottomCenter : Alignment.topCenter,
            child: isOpen
                ? Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: widget.backgroundColor ??
                            Colors.black.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  'Debug Window',
                                  style: contentTextStyle,
                                ),
                              ),
                              IconButton(
                                onPressed: _closeWindow,
                                icon: const Icon(Icons.close),
                              ),
                            ],
                          ),
                          Center(
                            child: widget.debugContent ??
                                const Text(
                                  'No Data',
                                  style: contentTextStyle,
                                ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  )
                : Align(
                    alignment: widget.isBottom
                        ? Alignment.bottomRight
                        : Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: IconButton(
                        onPressed: _openWindow,
                        icon: DecoratedBox(
                          decoration: BoxDecoration(
                            color: widget.backgroundColor ??
                                Colors.black.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4),
                            child: Icon(Icons.close),
                          ),
                        ),
                      ),
                    ),
                  ),
          )
      ],
    );
  }
}
