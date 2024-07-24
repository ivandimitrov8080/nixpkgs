{ stdenv
, lib
, buildNpmPackage
, fetchFromGitHub
, electron
}:

buildNpmPackage rec {
  pname = "unstoppableswap-gui";
  version = "0.6.2";

  src = fetchFromGitHub {
    owner = "UnstoppableSwap";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-ok7q+dkNxnAaEciWRDIXVKJN7vzRw/9ciRgg0V5APzQ=";
  };

  npmFlags = [ "--legacy-peer-deps" "--ignore-scripts" ];

  npmDepsHash = "sha256-5X59VdeqqDyslMJC3/XwGCTH8mQNbTshR+FsfN3ZJj4=";

  ELECTRON_SKIP_BINARY_DOWNLOAD = 1;

  installPhase = ''
    runHook preInstall

    mkdir -p $out

    cp -r ./release $out

    makeWrapper ${lib.getExe electron} $out/bin/${pname} \
      --add-flags $out/release/app/dist/main/main.js \
      --set ELECTRON_FORCE_IS_PACKAGED=1 \

    runHook postInstall
  '';

  meta = with lib; {
    description = "Graphical User Interface (GUI) For Trustless Cross-Chain XMR<>BTC Atomic Swaps";
    homepage = "https://github.com/UnstoppableSwap/unstoppableswap-gui";
    license = licenses.mit;
    maintainers = with maintainers; [ ivandimitrov8080 ];
    mainProgram = "unstoppableswap-gui";
    platforms = platforms.all;
  };
}
