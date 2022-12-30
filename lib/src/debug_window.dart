import 'package:flutter/material.dart';
import 'content_text_styles.dart';

class DebugWindow extends StatefulWidget {
  const DebugWindow({
    required this.child,
    this.debugContent,
    this.backgroundColor,
    this.isBottom = false,
    super.key,
  });

  final Widget child;
  final Widget? debugContent;
  final Color? backgroundColor;
  final bool isBottom;

  @override
  State<DebugWindow> createState() => _DebugWindowState();
}

class _DebugWindowState extends State<DebugWindow> {
  bool isOpen = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
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
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
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
                              onPressed: () => setState(() {
                                isOpen = false;
                              }),
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
                      onPressed: () => setState(() {
                        isOpen = true;
                      }),
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
