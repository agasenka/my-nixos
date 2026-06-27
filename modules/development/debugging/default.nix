{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gdb
    lldb
    ltrace
    perf
    strace
    valgrind
  ];
}
