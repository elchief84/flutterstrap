import 'package:flutter/widgets.dart';

import 'classes/breakpoint.dart';

/// A column that adapts its width based on the active breakpoint.
class ResponsiveColumn extends StatefulWidget {
  /// Creates a responsive column with a child and optional breakpoint overrides.
  const ResponsiveColumn({super.key, required this.child, this.breakpoints});

  /// The widget displayed in this column.
  final Widget child;

  /// Optional breakpoint overrides for this column.
  final Breakpoints? breakpoints;

  /// Returns the number of columns to use for the given [breakpoint].
  int getColumns(Breakpoint breakpoint) {
    Breakpoints breakpoints = this.breakpoints ?? Breakpoints();
    switch (breakpoint) {
      case Breakpoint.xs:
        return breakpoints.colXs;
      case Breakpoint.sm:
        return breakpoints.colSm;
      case Breakpoint.md:
        return breakpoints.colMd;
      case Breakpoint.lg:
        return breakpoints.colLg;
      case Breakpoint.xl:
        return breakpoints.colXl;
      case Breakpoint.xxl:
        return breakpoints.colXxl;
      default:
        return 12;
    }
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
