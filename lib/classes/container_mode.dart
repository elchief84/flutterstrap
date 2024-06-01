import 'breakpoint.dart';

/// Define [ResponsiveContainer] layout mode
/// container         use default layout width sizes (see [getContainerWidth] method)
/// containerFluid    use layout width 100%
enum ContainerMode { container, containerFluid }

/// Helpers methods to get info about [ContainerModeHelper]
class ContainerModeHelper {
  /// Return width size [double] based on [Breakpoint]]
  /// - Require [Breakpoint] to get related size
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
