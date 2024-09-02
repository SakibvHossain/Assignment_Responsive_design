enum DeviceType{
  mobile,
  tablet,
  desktop
}

class ScreenUtils{
  static const double mobileMaxSize = 610;
  static const double tableMaxSize = 1008;
  static const double desktopMinSize = 1008;

  static DeviceType getDeviceType(double width){
    if(width < ScreenUtils.mobileMaxSize){
      return DeviceType.mobile;
    }else if(width >= ScreenUtils.mobileMaxSize && width <= ScreenUtils.tableMaxSize){
      return DeviceType.tablet;
    }
    return DeviceType.desktop;
  }
}