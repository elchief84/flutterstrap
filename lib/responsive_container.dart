import 'package:flutter/material.dart';
import 'classes/breakpoint.dart';
import 'classes/container_mode.dart';
import 'responsive_column.dart';

/// A responsive layout container that arranges [ResponsiveColumn] children.
class ResponsiveContainer extends StatefulWidget {
  /// Creates a responsive container.
  const ResponsiveContainer(
      {super.key,
      required this.children,
      this.mode = ContainerMode.containerFluid,
      this.layoutColumns = 12,
      this.color,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.crossAxisAlignment = CrossAxisAlignment.start});

  /// Layout mode for this container.
  final ContainerMode? mode;

  /// Total number of columns used to calculate sizes.
  final int? layoutColumns;

  /// Child columns to render in the grid.
  final List<ResponsiveColumn> children;

  /// Optional background color.
  final Color? color;

  /// Main axis alignment for each row.
  final MainAxisAlignment? mainAxisAlignment;

  /// Cross axis alignment for each row.
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  State<ResponsiveContainer> createState() => _ResponsiveContainerState();
}

class _ResponsiveContainerState extends State<ResponsiveContainer> {
  @override
  Widget build(BuildContext context) {
    Breakpoint breakpoint = BreakpointHelper.getBreakpoint(context);

    double containerWidth = ContainerModeHelper.getContainerWidth(breakpoint);

    /// Render children in full width for [ContainerMode.containerFluid] or xs.
    if (widget.mode == ContainerMode.containerFluid ||
        breakpoint == Breakpoint.xs) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: buildContent(breakpoint: breakpoint),
          )
        ],
      );
    }

    /// Render children in a boxed container.
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: ContainerModeHelper.getContainerWidth(breakpoint),
            child: buildContent(
                breakpoint: breakpoint, containerWidth: containerWidth)),
      ],
    );
  }

  /// Calculates row layouts for the given [breakpoint] and [containerWidth].
  List<dynamic> buildRows(
      {required Breakpoint breakpoint, required double containerWidth}) {
    final rows = [];
    double rowSize = 0.0;

    var row = [];
    for (var element in widget.children) {
      int cols = element.getColumns(breakpoint);
      if (rowSize == 0) {
        /// Insert without check if first element.
        double widgetWidth =
            ((cols / widget.layoutColumns!) * containerWidth).floorToDouble();
        row.add({'size': widgetWidth, 'child': element});
        rowSize += widgetWidth;
      } else {
        /// Check row width.
        double widgetWidth =
            ((cols / widget.layoutColumns!) * containerWidth).floorToDouble();
        if (rowSize + widgetWidth > containerWidth) {
          /// Create a new row.
          rows.add(row);
          row = [];
          rowSize = 0.0;
        }

        row.add({'size': widgetWidth, 'child': element});
        rowSize += widgetWidth;
      }
    }
    if (row.isNotEmpty) {
      /// Add the last row.
      rows.add(row);
    }

    return rows;
  }

  /// Builds the widget tree for the given [breakpoint].
  Widget buildContent(
      {required Breakpoint breakpoint, double? containerWidth}) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final rows = buildRows(
            breakpoint: breakpoint,
            containerWidth: containerWidth ?? constraints.maxWidth);
        return Container(
          color: widget.color,
          child: Column(
            children: List.generate(
                rows.length,
                (index) => Row(
                      mainAxisAlignment:
                          widget.mainAxisAlignment ?? MainAxisAlignment.start,
                      crossAxisAlignment:
                          widget.crossAxisAlignment ?? CrossAxisAlignment.start,
                      children: List.generate(
                          rows[index].length,
                          (subindex) => SizedBox(
                                width: rows[index][subindex]['size'],
                                child: rows[index][subindex]['child'],
                              )),
                    )),
          ),
        );
      },
    );
  }
}
