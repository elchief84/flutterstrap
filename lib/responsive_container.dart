import 'package:flutter/material.dart';
import 'classes/breakpoint.dart';
import 'classes/container_mode.dart';
import 'responsive_column.dart';

/// [ResponsiveContainer] Wrapper widget
/// - Optional [ContainerMode] mode - default [ContainerMode.containerFluid]
/// - Optional [int] layoutColumns - default 12
/// - Optional [Color] color is the background color
/// - Optional [MainAxisAlignment] mainAxisAlignment
/// - Optional [CrossAxisAlignment] crossAxisAlignment
/// - Required [List] children is the list of widget to render into layout
class ResponsiveContainer extends StatefulWidget {
  final ContainerMode? mode;
  final int? layoutColumns;
  final List<ResponsiveColumn> children;
  final Color? color;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  const ResponsiveContainer(
      {super.key,
      required this.children,
      this.mode = ContainerMode.containerFluid,
      this.layoutColumns = 12,
      this.color,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.crossAxisAlignment = CrossAxisAlignment.start});

  @override
  State<ResponsiveContainer> createState() => _ResponsiveContainerState();
}

class _ResponsiveContainerState extends State<ResponsiveContainer> {
  @override
  Widget build(BuildContext context) {
    Breakpoint breakpoint = BreakpointHelper.getBreakpoint(context);

    double containerWidth = ContainerModeHelper.getContainerWidth(breakpoint);

    /// Render children widgets in 100% width in case of [ContainerMode.containerFluid] or [Breakpoint.extraSmall]
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

    /// Render children widgets in boxed container
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

  /// Calculate needed rows to render children widgets
  /// Required [Breakpoint] breakpoint
  /// Required [double] containerWidth (as layout width size)
  List<dynamic> buildRows(
      {required Breakpoint breakpoint, required double containerWidth}) {
    final rows = [];
    double rowSize = 0.0;

    var row = [];
    for (var element in widget.children) {
      int cols = element.getColumns(breakpoint);
      if (rowSize == 0) {
        /// insert without check if first element
        double widgetWidth =
            ((cols / widget.layoutColumns!) * containerWidth).floorToDouble();
        row.add({'size': widgetWidth, 'child': element});
        rowSize += widgetWidth;
      } else {
        /// check row with
        double widgetWidth =
            ((cols / widget.layoutColumns!) * containerWidth).floorToDouble();
        if (rowSize + widgetWidth > containerWidth) {
          /// create a new row
          rows.add(row);
          row = [];
          rowSize = 0.0;
        }

        row.add({'size': widgetWidth, 'child': element});
        rowSize += widgetWidth;
      }
    }
    if (row.isNotEmpty) {
      /// add not completed row
      rows.add(row);
    }

    return rows;
  }

  /// Render children widgets
  /// - Required [Breakpoint] breakpoint
  /// - Optional [double] containerWidth (as layout width size) - if null use 100% layout width
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
