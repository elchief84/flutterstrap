import 'package:flutter/cupertino.dart';

import 'classes/breakpoint.dart';

class ResponsiveColumn extends StatefulWidget {
  final Widget child;
  final Breakpoints? breakpoints;
  const ResponsiveColumn({
    super.key,
    required this.child,
    this.breakpoints
  });

  int getColumns(Breakpoint breakpoint) {
    Breakpoints breakpoints = this.breakpoints ?? Breakpoints();
    switch(breakpoint) {
      case Breakpoint.xs: return breakpoints.colXs;
      case Breakpoint.sm: return breakpoints.colSm;
      case Breakpoint.md: return breakpoints.colMd;
      case Breakpoint.lg: return breakpoints.colLg;
      case Breakpoint.xl: return breakpoints.colXl;
      case Breakpoint.xxl: return breakpoints.colXxl;
      default: 12;
    }
    return 12;
  }

  @override
  State<ResponsiveColumn> createState() => _ResponsiveColumnState();
}

class _ResponsiveColumnState extends State<ResponsiveColumn> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
