{ stdenv, fetchFromGitHub, rustPlatform, makeWrapper }:

with rustPlatform;

buildRustPackage rec {
  name = "racerd-${version}";
  version = "0.1.1";
  src = fetchFromGitHub {
    owner = "jwilm";
    repo = "racerd";
    rev = "v${version}";
    sha256 = "0kggikin8hyq71hwbapczyvik39wwycvgdxigzhgivlcpss2wmdx";
  };

  depsSha256 = "0i1y57kv2yacw4ndqdc2pp56kvrd76fcwss8vqf2bh9whvdfqjfx";

  buildInputs = [ makeWrapper ];

  # for some reason RUST_SRC_PATH is not defined even if it's in preCheck
  # let's just disable check
  doCheck = false;

  preInstall = ''
    export RUST_SRC_PATH="${rustc.src}/src"
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp -p target/release/racerd $out/bin/
    wrapProgram $out/bin/racerd --set RUST_SRC_PATH "${rustc.src}/src"
  '';

  meta = with stdenv.lib; {
    description = "(the daemon) A utility intended to provide Rust code completion for editors and IDEs";
    homepage = https://github.com/jwilm/racerd;
  };
}
