{ lib, fetchFromGitHub, rustPlatform }:
rustPlatform.buildRustPackage rec {
  pname = "zr";
  version = "1.1.0";

  src = fetchFromGithub {
    owner = "jedahan";
    repo = pname;
    rev = version;
    hash = lib.fakeHash;
  };

  cargoHash = lib.fakeHash;
  buildInputs = [ pkgs.rustPlatform ];
}
