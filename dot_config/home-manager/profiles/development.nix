{ config, pkgs, ... }:

{
  imports = [ ./standard.nix ];

  home.packages = [
    pkgs.aws-iam-authenticator
    pkgs.aws-vault
    pkgs.awscli2
    pkgs.azure-cli
    pkgs.circleci-cli
    pkgs.clickhouse
    pkgs.codex
    pkgs.commitizen
    pkgs.credstash
    pkgs.delve
    pkgs.fluxcd
    pkgs.gh
    pkgs.go
    pkgs.google-cloud-sdk
    pkgs.gopls
    pkgs.gradle
    pkgs.istioctl
    pkgs.jdt-language-server
    pkgs.k9s
    pkgs.kind
    pkgs.krew
    pkgs.kubectl
    pkgs.kubergrunt
    pkgs.kubernetes-helm
    pkgs.kubie
    pkgs.kustomize
    pkgs.maven
    pkgs.nodejs
    pkgs.postgresql
    pkgs.pre-commit
    pkgs.rclone
    pkgs.shfmt
    pkgs.snyk
    pkgs.tektoncd-cli
    pkgs.tenv
    pkgs.terraform-ls
    pkgs.typescript-language-server
    pkgs.valkey
    pkgs.yaml-language-server

    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.pip
      python-pkgs.python-lsp-server
      python-pkgs.setuptools
    ]))

    (pkgs.zulu17.override {
      enableJavaFX = true;
    })
  ];
}
