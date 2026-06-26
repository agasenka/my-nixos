{ config, pkgs, ... }:

{
  programs.i3status-rust.enable = false;

  home.packages = with pkgs; [
    (polybar.override {
      i3Support = true;
      pulseSupport = true;
    })
  ];

  home.file.".config/polybar/launch.sh" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash
      killall -q polybar
      while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

      # Semua monitor kedetect otomatis!
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload top 2>&1 | tee -a /tmp/polybar-$m.log &
      done
    '';
  };

  home.file.".config/polybar/config.ini".text = ''
    [colors]
    background = #CC1e1e2e
    background-alt = #CC313244
    foreground = #cdd6f4
    primary = #89b4fa
    secondary = #cba6f7
    alert = #f38ba8
    green = #a6e3a1
    yellow = #f9e2af
    surface0 = #CC45475a

    [bar/top]
    monitor = ''${env:MONITOR:}
    width = 100%
    height = 28pt
    radius = 0
    background = ''${colors.background}
    foreground = ''${colors.foreground}

    padding-left = 2
    padding-right = 2
    module-margin = 1

    separator = |
    separator-foreground = ''${colors.background-alt}

    font-0 = JetBrainsMono Nerd Font:style=Regular:size=11;3
    font-1 = Symbols Nerd Font:style=Regular:size=14;3

    modules-left = launcher i3
    modules-center = music
    modules-right = pulseaudio memory cpu temperature date

    cursor-click = pointer
    enable-ipc = true

    wm-restack = i3
    override-redirect = false

    [module/launcher]
    type = custom/text
    format = "  󱄅  "
    format-foreground = ''${colors.primary}
    click-left = rofi -show drun

    [module/i3]
    type = internal/i3
    pin-workspaces = true
    show-urgent = true
    strip-wsnumbers = true
    index-sort = true

    label-focused = %name%
    label-focused-background = ''${colors.primary}
    label-focused-foreground = #1e1e2e
    label-focused-padding = 2
    label-focused-font = 1

    label-unfocused = %name%
    label-unfocused-foreground = ''${colors.foreground}
    label-unfocused-padding = 2

    label-urgent = %name%
    label-urgent-background = ''${colors.alert}
    label-urgent-foreground = #1e1e2e
    label-urgent-padding = 2

    label-visible = %name%
    label-visible-padding = 2

    [module/music]
    type = custom/script
    exec = ${pkgs.playerctl}/bin/playerctl metadata --format '{{artist}} - {{title}}' 2>/dev/null || echo ""
    exec-if = ${pkgs.playerctl}/bin/playerctl status 2>/dev/null | grep -q "Playing\|Paused"
    interval = 2
    format = " 󰝚  <label>"
    format-foreground = ''${colors.green}
    label-maxlen = 40

    [module/pulseaudio]
    type = internal/pulseaudio
    use-ui-max = false
    interval = 2

    format-volume = <ramp-volume> <label-volume>
    format-volume-foreground = ''${colors.secondary}
    label-volume = %percentage%%

    format-muted = 󰖁 muted
    format-muted-foreground = ''${colors.alert}

    ramp-volume-0 = 󰕿
    ramp-volume-1 = 󰖀
    ramp-volume-2 = 󰕾

    click-right = pavucontrol &

    [module/memory]
    type = internal/memory
    interval = 3
    format-prefix = "󰍛 "
    format-prefix-foreground = ''${colors.yellow}
    label = %percentage_used%%
    warn-percentage = 80
    format-warn-foreground = ''${colors.alert}
    label-warn = 󰍛 %percentage_used%%

    [module/cpu]
    type = internal/cpu
    interval = 2
    format-prefix = "󰻠 "
    format-prefix-foreground = ''${colors.primary}
    label = %percentage:2%%
    warn-percentage = 80
    format-warn-foreground = ''${colors.alert}
    label-warn = 󰻠 %percentage:2%%

    [module/temperature]
    type = internal/temperature
    interval = 2
    thermal-zone = 0
    warn-temperature = 70

    format = <ramp> <label>
    format-foreground = ''${colors.green}
    format-warn = <ramp> <label-warn>
    format-warn-foreground = ''${colors.alert}

    label = %temperature-c%
    label-warn = %temperature-c%

    ramp-0 = 
    ramp-1 = 
    ramp-2 = 

    [module/date]
    type = internal/date
    interval = 1
    date = %a, %d %b
    time = %H:%M
    label = 󰃭 %date%  󰥔 %time%
    format-foreground = ''${colors.primary}
  '';
}
