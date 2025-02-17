{
  lib,
  fetchFromGitHub,
  buildLua,
}:

buildLua {
  pname = "skip-intro";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "rui-ddc";
    repo = "skip-intro";
    rev = "3a7d2e95d5adfa761e1a25097022403f3b8a0cba";
    hash = "sha256-1rxwPiYIj4oxy8piRpiJeWU4b8vCnLCOvxt7uoru5xc=";
  };

  meta = {
    description = "This is a script for skipping episode intros (on mpv media player).";
    homepage = "https://github.com/rui-ddc/skip-intro";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ivandimitrov8080 ];
  };
}
