{ stdenv, fetchurl } :

# TODO: support windows/darwin if ever necessary
let
  version = "0.1.1";
  arch = if stdenv.system == "x86_64-linux" then "amd64" else "386";
  src = fetchurl {
    url = "https://github.com/mroth/scmpuff/releases/download/v${version}/scmpuff_${version}_linux_${arch}.tar.gz";
    sha256 = "1n2w7swn9za2iq0c5ma8fr4fj2cnsn13wsjlbd7g4pl0wczgqqz7";
  };
in
stdenv.mkDerivation rec {
  inherit src;
  inherit version;

  name = "scmpuff-${version}";

  buildInputs = [ ];

  installPhase = ''
    mkdir -p $out/bin
    cp scmpuff $out/bin/scmpuff
  '';

  meta = {
    description = "Add numbered shortcuts to common git commands";
    homepage = "https://github.com/mroth/scmpuff";
    license = stdenv.lib.licenses.mit;
  };
}


