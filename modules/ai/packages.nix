{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.ai;
  ollamaPkgs =
    lib.optional config.gpu.nvidia.enable pkgs.ollama-cuda
    ++ lib.optional config.gpu.amd.enable pkgs.ollama-rocm
    ++ lib.optional config.gpu.intel.enable pkgs.ollama-vulkan;
  llamacppPkgs = lib.optional cfg.llama-cpp.enable pkgs.llama-cpp;
  aiPkgs =
    ollamaPkgs
    ++ llamacppPkgs
    ++ lib.optional cfg.opencode.enable pkgs.opencode
    ++ lib.optional cfg.codex.enable pkgs.codex;
in
{
  options.ai = {
    enable = lib.mkEnableOption "enable ai module";
    ollama.enable = lib.mkEnableOption "enable ollama";
    llama-cpp.enable = lib.mkEnableOption "enable llama.cpp";
    opencode.enable = lib.mkEnableOption "enable opencode";
    codex.enable = lib.mkEnableOption "enable openai codex";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = aiPkgs;
  };
}
