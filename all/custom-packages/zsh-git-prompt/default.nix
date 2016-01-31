{ stdenv, fetchFromGitHub, cabal2nix, haskellPackages, which } :

let
  rev = "b662ac2fc6ad6e0226a0cb535738db721d7945d4";

  fromGithub = fetchFromGitHub {
    rev = rev;
    owner = "olivierverdier";
    repo = "zsh-git-prompt";
    sha256 = "0zc36rhqnv8kgsi06vb3ql70gzdm0gwgva1glj4nq21j89vykh5g";
  };

  gitstatus = haskellPackages.callPackage ({ mkDerivation, base, HUnit, parsec, process, QuickCheck, stdenv }:
    mkDerivation {
    pname = "git-prompt";
    version = "0.1.0.0";
    src = fromGithub;
    isLibrary = true;
    isExecutable = true;
    libraryHaskellDepends = [ base parsec process QuickCheck ];
    executableHaskellDepends = [ base parsec process QuickCheck ];
    testHaskellDepends = [ base HUnit parsec process QuickCheck ];
    homepage = "http://github.com/olivierverdier/zsh-git-prompt#readme";
    description = "Informative git prompt for zsh";
    license = stdenv.lib.licenses.mit;
# HACK: we need to run the haskell install from the `fromGithub`/src directory
#       I can't figure out a better way to get into `src` before the cabal setup
    postPatch = ''
      cd src
    '';
    }) {};
in
stdenv.mkDerivation rec {
  name = "zsh-git-prompt-${rev}";
  version = rev;
  src = fromGithub;

  buildInputs = [ cabal2nix gitstatus ];

  patches = [ ./zsh-git-prompt.patch ];

  installPhase = ''
    mkdir -p $out/share/zsh/zsh-git-prompt
    cp -r . $out/share/zsh/zsh-git-prompt
  '';

  meta = {
    description = "Fish shell like syntax highlighting for Zsh.";
    homepage = "https://github.com/zsh-users/zsh-syntax-highlighting";
    license = stdenv.lib.licenses.mit;
  };
}




