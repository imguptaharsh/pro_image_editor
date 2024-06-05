import 'package:flutter/material.dart';
import 'package:pro_image_editor/models/editor_configs/pro_image_editor_configs.dart';

// import 'utils/whatsapp_appbar_button_style.dart';

/// Represents the app bar for the WhatsApp theme.
class WhatsAppAppBar extends StatefulWidget {
  /// The configuration for the image editor.
  final ProImageEditorConfigs configs;

  /// Indicates whether the undo action is available.
  final bool canUndo;

  /// Indicates whether the editor is open.
  final bool openEditor;

  /// Callback function for closing the editor.
  final Function() onClose;

  /// Callback function for undoing an action.
  final Function() onTapUndo;

  /// Callback function for tapping the crop/rotate editor button.
  final Function() onTapCropRotateEditor;

  /// Callback function for tapping the sticker editor button.
  final Function() onTapStickerEditor;

  /// Callback function for tapping the text editor button.
  final Function() onTapTextEditor;

  /// Callback function for tapping the paint editor button.
  final Function() onTapPaintEditor;

  /// Constructs a WhatsAppAppBar widget with the specified parameters.
  const WhatsAppAppBar({
    super.key,
    required this.canUndo,
    required this.openEditor,
    required this.configs,
    required this.onClose,
    required this.onTapUndo,
    required this.onTapCropRotateEditor,
    required this.onTapStickerEditor,
    required this.onTapTextEditor,
    required this.onTapPaintEditor,
  });

  @override
  State<WhatsAppAppBar> createState() => _WhatsAppAppBarState();
}

class _WhatsAppAppBarState extends State<WhatsAppAppBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      right: 10,
      child: LayoutBuilder(builder: (context, constraints) {
        double screenW = constraints.maxWidth;
        final double space = screenW < 300 ? 5 : 10;
        var gap = SizedBox(width: space);

        return widget.openEditor
            ? const SizedBox.shrink()
            : Row(
                children: [
                  GestureDetector(
                    onTap: widget.onClose,
                    child: Icon(widget.configs.icons.closeEditor, size: 35),
                  ),

                  const Spacer(),
                  gap,
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 150),
                    transitionBuilder: (child, animation) => ScaleTransition(
                      scale: animation,
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    ),
                    child: widget.canUndo
                        ? GestureDetector(
                            onTap: widget.onTapUndo,
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Icon(widget.configs.icons.undoAction,
                                  size: 22),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: widget.onTapCropRotateEditor,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(
                        Icons.crop,
                        // weight: 200,
                        color: Colors.white,
                        size: 22,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: widget.onTapStickerEditor,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                          widget.configs.icons.stickerEditor.bottomNavBar,
                          size: 22),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  GestureDetector(
                    onTap: widget.onTapTextEditor,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(widget.configs.icons.textEditor.bottomNavBar,
                          size: 22),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  // gap,
                  GestureDetector(
                    onTap: widget.onTapPaintEditor,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                          widget.configs.icons.paintingEditor.bottomNavBar,
                          size: 22),
                    ),
                  ),
                ],
              );
      }),
    );
  }
}
