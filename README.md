<img src="https://user-images.githubusercontent.com/75112184/210074549-a5219bf8-f220-4dc1-9861-b59c33d96619.png" width="30%">

# debug_window

Useful debug window widget for flutter. If you press the close icon, this debug window is minimized.

<img src="https://user-images.githubusercontent.com/75112184/210074555-9524925a-bbef-47d8-bd57-7b85edc1f564.png" width="30%">

## How to use

```dart
DebugWindow(
    debugContent: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
            children: [
                Text(
                    'example: ${streamData}',
                    style: contentTextStyle,
                ),
            ],
        ),
    ),
```

## Arguments

``debugContent``: You give this argument some content you would like to represent on a screen in your flutter app.

``backgroundColor``: This value is a color of debug window. Default value is ``Colors.black.withOpacity(0.2)``.

``isBottom``: In the case that you wouldn't like to put on top, you change this value to ``true``. Then debug window is represented on bottom.

``isEnable``: If you separate environment like dev and prod, this value is essential. When you choose ``false``, this debug window is not visible.

## Remark

The text color in this debug window is black by default. Therefore, I recommend to specify the style of the character, like [``style: contentTextStyle``](https://github.com/Ryotaewamoto/debug_window/blob/main/lib/src/content_text_styles.dart).
