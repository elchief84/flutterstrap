import 'package:flutter/material.dart';
import 'dart:math';

/// [Breakpoint] Define layout breakpoints
/// extraSmall        <576px
/// small             ≥576px
/// medium            ≥768px
/// large             ≥992px
/// extraLarge        ≥1200px
/// extraExtraLarge   ≥1400px
enum Breakpoint {
  xs,
  sm,
  md,
  lg,
  xl,
  xxl
}

/// Helpers methods to get info about [Breakpoint]
class BreakpointHelper {

  /// List of [Breakpoint] width ranges
  static const List<BreakpointSize> _range = [
    BreakpointSize(min: 0, max: 575),
    BreakpointSize(min: 576, max: 767),
    BreakpointSize(min: 768, max: 991),
    BreakpointSize(min: 992, max: 1199),
    BreakpointSize(min: 1200, max: 1399),
    BreakpointSize(min: 1400, max: double.infinity)
  ];

  /// Return [Breakpoint] based on layout width
  /// - Require [BuildContext] to access layout size
  static Breakpoint getBreakpoint(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    var index = 0;
    for (var element in _range) {
      if(screenSize.width >= element.min && screenSize.width <= element.max) {
        break;
      }
      index ++;
    }
    switch(index) {
      case 0: return Breakpoint.xs;
      case 1: return Breakpoint.sm;
      case 2: return Breakpoint.md;
      case 3: return Breakpoint.lg;
      case 4: return Breakpoint.xl;
      case 5: return Breakpoint.xxl;
      default: Breakpoint.md;
    }

    return Breakpoint.md; // as fallback
  }

  static int getBreakpointIndex(Breakpoint breakpoint) {
    switch(breakpoint) {
      case Breakpoint.xs: 0;
      case Breakpoint.sm: 1;
      case Breakpoint.md: 2;
      case Breakpoint.lg: 3;
      case Breakpoint.xl: 4;
      case Breakpoint.xxl: 5;
      default: 0;
    }
    return 0;
  }
}

/// Model [BreakpointSize] define the Breakpoint width range
/// - Required double [min] is the minumum width of Breakpoint
/// - Required double [max] is the maximum width of Breakpoint
class BreakpointSize {
  final double min;
  final double max;

  const BreakpointSize({required this.min, required this.max});
}

/// Model [Breakpoints] is used to define a Columns configuration
/// in a ResponsiveColumn widget.
/// - Optional [colXs] default 12 columns
/// - Optional [colSm] default 12 columns
/// - Optional [colMd] default 6 columns
/// - Optional [colLg] default 6 columns
/// - Optional [colXl] default 3 columns
/// - Optional [colXxl] default 3 columns
class Breakpoints {
  int? _colXs; int? _colSm; int? _colMd; int? _colLg; int? _colXl; int? _colXxl;

  Breakpoints({int? colXs, int? colSm, int? colMd, int? colLg, int? colXl, int? colXxl,}) {
    _colXs = colXs;
    _colSm = colSm;
    _colMd = colMd;
    _colLg = colLg;
    _colXl = colXl;
    _colXxl = colXxl;
  }

  int get colXs { return _colXs ?? _getMinCols(Breakpoint.xs) ?? 12; }
  int get colSm { return _colXs ?? _getMinCols(Breakpoint.sm) ?? 12; }
  int get colMd { return _colXs ?? _getMinCols(Breakpoint.md) ?? 6; }
  int get colLg { return _colXs ?? _getMinCols(Breakpoint.lg) ?? 6; }
  int get colXl { return _colXs ?? _getMinCols(Breakpoint.xl) ?? 3; }
  int get colXxl { return _colXs ?? _getMinCols(Breakpoint.xxl) ?? 3; }

  int? _getMinCols(Breakpoint ref) {
    int breakpointIndex = BreakpointHelper.getBreakpointIndex(ref);
    final list = [_colXs, _colSm, _colMd, _colLg, _colXl, _colXxl]
        .whereType<int>()
        .toList();

    if(list.isNotEmpty){
      list.removeRange(breakpointIndex, list.length);
      return list.reduce((curr, next) => curr > next? curr: next);
    }

    return null;
  }
}