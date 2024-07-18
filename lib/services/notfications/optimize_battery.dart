
import 'package:optimize_battery/optimize_battery.dart';


class OptimizeBatteryy{
  requestOptimizeBattery()async{
    OptimizeBattery.isIgnoringBatteryOptimizations().then((onValue) {
        if (onValue) {} else {OptimizeBattery.stopOptimizingBatteryUsage();}
    });
  }
}