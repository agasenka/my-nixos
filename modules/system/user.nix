{
  config,
  pkgs,
  username,
  ...
}:
{
  programs.fish.enable = true;

  users.users."${username}" = {
    isNormalUser = true;
    description = username;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
    ];
    shell = pkgs.fish;
    packages = with pkgs; [ ];
  };
}
