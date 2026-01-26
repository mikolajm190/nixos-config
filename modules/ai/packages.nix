{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    opencode

    (ollama.override {
      acceleration = "cuda";
    })
    # (llama-cpp.override {
    #   cudaSupport = true;
    # })
  ];
}
