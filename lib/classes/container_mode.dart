import 'breakpoint.dart';

/// Defines the [ResponsiveContainer] layout mode.
enum ContainerMode {
  /// Uses fixed container widths for each breakpoint.
  container,

  /// Uses full-width layout at each breakpoint.
  containerFluid
}

/// Helpers methods to get info about [ContainerModeHelper]
class ContainerModeHelper {
  /// Returns the width size in pixels for the given [breakpoint].
  static double getContainerWidth(Breakpoint breakpoint) {
    switch (breakpoint) {
      case Breakpoint.xs:
        return double.infinity;
      case Breakpoint.sm:
        return 540.0;
      case Breakpoint.md:
        return 720.0;
      case Breakpoint.lg:
        return 960.0;
      case Breakpoint.xl:
        return 1140.0;
      case Breakpoint.xxl:
        return 1320.0;
    }
  }
}
