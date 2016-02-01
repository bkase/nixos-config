{ stdenv, fetchFromGitHub } :

let
  fromGithub = fetchFromGitHub {
    owner = "zsh-users";
    repo = "zsh-syntax-highlighting";
    rev = "c19ee583138ebab416b0d2efafbad7dc9f3f7c4f";
    sha256 = "0awdgdh9swv1as8jb71nda0x32r4lram47m3wqbjpjgsy9a018i7";
  };
in

stdenv.mkDerivation rec {
  name = "zsh-syntax-highlighting-${version}";
  version = "0.4.1";
  src = fromGithub;

  buildInputs = [ ];

  installPhase = ''
    mkdir -p $out/share/zsh/zsh-syntax-highlighting
    cp -r . $out/share/zsh/zsh-syntax-highlighting
  '';

  meta = {
    description = "Fish shell like syntax highlighting for Zsh.";
    homepage = "https://github.com/zsh-users/zsh-syntax-highlighting";
    license = stdenv.lib.licenses.bsd3;
  };
}
