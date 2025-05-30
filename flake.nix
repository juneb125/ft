{
  description = "Flake templates";

  inputs = {};

  outputs = _: {
    templates = rec {
      default = rust;

      rust = {
        path = ./rust;
        description = "Rust project flake template";
      };
    };
  };
}
