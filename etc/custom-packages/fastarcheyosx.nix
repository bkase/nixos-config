{ stdenv, fetchFromGitHub } :

stdenv.mkDerivation rec {
  version = "0.1.0";

  name = "fast-archey-osx-${version}";

  src = fetchFromGitHub {
    owner = "bkase";
    repo = "archey-osx";
    rev = "836bb88c212d1c0b6fb098b357a0c4570e760975";
    sha256 = "06rs8is9bjahnahj86qqg7vfqcxq66rjhqp38xg4wwvr76wsghk7";
  };

  buildInputs = [ ];

  installPhase = ''
    mkdir -p $out/bin
    cp bin/archey $out/bin/archey
  '';

  meta = {
    description = "Add numbered shortcuts to common git commands";
    homepage = "https://github.com/mroth/scmpuff";
    license = stdenv.lib.licenses.mit;
  };
}


