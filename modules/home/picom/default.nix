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
    fadeSteps = [
      0.03
      0.03
    ];
    shadow = true;

    shadowExclude = [
      "name = 'Notification'"
      "class_g = 'Conky'"
      "class_g ?= 'Notify-osd'"
      "class_g = 'Cairo-clock'"
      "_GTK_FRAME_EXTENTS@:c"
    ];

    settings = {
      shadow-radius = 7;
      shadow-offset-x = -7;
      shadow-offset-y = -7;

      corner-radius = 7;
      rounded-corners-exclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
      ];

      blur = {
        method = "dual_kawase";
        strength = 7;
        kern = "3x3box";
      };
      blur-background = true;
      blur-background-exclude = [ ];

      opacity-rule = [
        "100:_NET_WM_STATE@:32a *= '_NET_WM_STATE_FULLSCREEN'"
        "100:window_type = 'fullscreen'"
        "100:name *?= 'YouTube'"
        "100:name *?= 'Netflix'"
        "100:name *?= 'Prime Video'"
        "100:class_g = 'firefox' && _NET_WM_STATE@:32a *= '_NET_WM_STATE_FULLSCREEN'"
        "100:class_g = 'Chromium' && _NET_WM_STATE@:32a *= '_NET_WM_STATE_FULLSCREEN'"
      ];
    };
  };
}
