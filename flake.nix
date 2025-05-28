{
  description = "Flake templates";

  inputs = {};

  outputs = { self }: {
    templates = {
      rust = {
        path = ./rust;
        description = "Rust project flake template";
      };
    };

    templates.default = self.templates.rust;
  };
}
