{ ... }:

{
  xdg.configFile = {
    "ranger/commands.py".source = ./commands.py;
    "ranger/rc.conf".source = ./rc.conf;
    "ranger/rifle.conf".source = ./rifle.conf;
    "ranger/scope.sh".source = ./scope.sh;
    # devicons plugin from https://github.com/alexanderjeurissen/ranger_devicons
    "ranger/plugins/ranger_devicons/__init__.py".source = ./__init__.py;
    "ranger/plugins/ranger_devicons/devicons.py".source = ./devicons.py;
  };
}
