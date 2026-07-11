{ config, pkgs, ... }:

{
  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;

    activeOpacity = 0.90;
    inactiveOpacity = 0.75;

    fade = true;
    fadeDelta = 10;
    fadeSteps = [ 0.03 0.03 ];

    shadow = true;
    shadowOffsets = [ (-7) (-7) ];
    shadowExclude = [
      "name = 'Notification'"
      "class_g = 'Conky'"
      "class_g ?= 'Notify-osd'"
      "class_g = 'Cairo-clock'"
      "_GTK_FRAME_EXTENTS@:c"
      "_NET_WM_STATE@:32a *= '_NET_WM_STATE_FULLSCREEN'"
      "window_type = 'fullscreen'"
    ];

    opacityRules = [
      "100:fullscreen"
      "100:_NET_WM_STATE@:32a *= '_NET_WM_STATE_FULLSCREEN'"
      "100:window_type = 'fullscreen'"
      "100:name *?= 'YouTube'"
    ];

    settings = {
      unredir-if-possible = true;
      corner-radius = 7;

      rounded-corners-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
        "_NET_WM_STATE@:32a *= '_NET_WM_STATE_FULLSCREEN'"
        "window_type = 'fullscreen'"
      ];

      blur = {
        method = "dual_kawase";
        strength = 7;
        kern = "3x3box";
      };

      blur-background = true;
      blur-background-exclude = [
        "_NET_WM_STATE@:32a *= '_NET_WM_STATE_FULLSCREEN'"
        "window_type = 'fullscreen'"
      ];
    };
  };
}
