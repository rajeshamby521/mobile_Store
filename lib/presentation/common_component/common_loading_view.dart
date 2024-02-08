import 'package:flutter/material.dart';

final _tKey = GlobalKey(debugLabel: 'overlay_parent');
OverlayEntry? _loaderEntry;

bool isDarkTheme = false;
bool _loaderShown = false;
var spinKit;

class Loading extends StatelessWidget {
  final Widget? child;
  final bool darkTheme;

  const Loading({Key? key, this.child, this.darkTheme = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    isDarkTheme = darkTheme;
    return SizedBox(
      key: _tKey,
      child: child,
    );
  }
}

OverlayState? get _overlayState {
  final context = _tKey.currentContext;
  if (context == null) return null;

  NavigatorState? navigator;

  void visitor(Element element) {
    if (navigator != null) return;

    if (element.widget is Navigator) {
      navigator = (element as StatefulElement).state as NavigatorState;
    } else {
      element.visitChildElements(visitor);
    }
  }

  context.visitChildElements(visitor);

  assert(navigator != null, '''unable to show overlay''');
  return navigator!.overlay;
}

Future<void> showLoadingIndicator(
    {bool isModal = true, Color? modalColor}) async {
  try {
    debugPrint('Showing loading overlay');
    const child = Center(
      child: CircularProgressIndicator(),
      //CircularProcess(),
    );
    await _showOverlay(
      child: isModal
          ? Stack(
              children: <Widget>[
                ModalBarrier(
                  color: modalColor,
                ),
                child
              ],
            )
          : child,
    );
  } catch (err) {
    debugPrint('Exception showing loading overlay\n${err.toString()}');
    rethrow;
  }
}

Future<void> hideLoadingIndicator() async {
  try {
    debugPrint('Hiding loading overlay');
    await _hideOverlay();
  } catch (err) {
    debugPrint('Exception hiding loading overlay');
    rethrow;
  }
}

Future<void> _showOverlay({required Widget child}) async {
  try {
    final overlay = _overlayState;

    if (_loaderShown) {
      debugPrint('An overlay is already showing');
      // TODO
      return Future.value();
    }

    final overlayEntry = OverlayEntry(
      builder: (context) => child,
    );

    overlay?.insert(overlayEntry);
    _loaderEntry = overlayEntry;
    _loaderShown = true;
  } catch (err) {
    debugPrint('Exception inserting loading overlay\n${err.toString()}');
    rethrow;
  }
}

Future<void> _hideOverlay() async {
  try {
    _loaderEntry?.remove();
    _loaderEntry = null;
    _loaderShown = false;
  } catch (err) {
    debugPrint('Exception removing loading overlay\n${err.toString()}');
    rethrow;
  }
}
