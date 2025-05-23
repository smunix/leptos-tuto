{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  # https://devenv.sh/basics/
  env.GREET = "leptos-01";
  env.CARGO_TARGET_WASM32_UNKNOWN_UNKNOWN_LINKER = "lld";

  # https://devenv.sh/packages/
  packages = with pkgs;
  with inputs.fenix.packages.${system}; [
    cargo-generate
    cargo-leptos
    (
      # https://jordankaye.dev/posts/rust-wasm-nix/
      combine [
        stable.toolchain
        targets.wasm32-unknown-unknown.stable.rust-std
      ]
    )
    git
    leptosfmt
    llvmPackages.bintools
    nodejs
    rust-analyzer
    trunk
    wasm-pack
  ];

  # https://devenv.sh/languages/
  # languages.rust.enable = true;

  # https://devenv.sh/processes/
  # processes.cargo-watch.exec = "cargo-watch";

  # https://devenv.sh/services/
  # services.postgres.enable = true;

  # https://devenv.sh/scripts/
  scripts.hello.exec = ''
    echo hello from $GREET
  '';

  enterShell = ''
    hello
    git --version
  '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
  '';

  # https://devenv.sh/git-hooks/
  # git-hooks.hooks.shellcheck.enable = true;

  # See full reference at https://devenv.sh/reference/options/
}
