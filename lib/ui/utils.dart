import 'package:flutter/material.dart';

Route<void> pageRoute(BuildContext context, Widget widget) {
  return MaterialPageRoute(builder: (context) => widget);
}

EdgeInsets calculateDefaultPadding(BuildContext context) {
  if (MediaQuery.of(context).size.width > 810) {
    double padding = (MediaQuery.of(context).size.width - 810) / 2;
    return EdgeInsets.symmetric(horizontal: padding);
  } else {
    return const EdgeInsets.symmetric(vertical: 0);
  }
}

Function(BuildContext) globalKeyListener(GlobalKey globalKey) => (context) {
  GestureDetector? detector;
  void findGestureDetector(Element element) {
    if (element.widget is GestureDetector) {
      detector = element.widget as GestureDetector;
      return;
    }
    element.visitChildren(findGestureDetector);
  }

  final dropdownElement = globalKey.currentContext as Element?;

  dropdownElement?.visitChildren(findGestureDetector);
  detector?.onTap?.call();
};
