# Flake Templates

**Table of Contents**
* [Introduction](#introduction)
* [Usage](#usage)

## Introduction
**Inspired by:**
* [`tgirlcloud/nix-templates`](https://github.com/tgirlcloud/nix-templates)
* [`khaneliman/khanelinix`](https://github.com/khaneliman/khanelinix) (path: `/templates/`)
* [`MordragT/nix-templates`](https://github.com/MordragT/nix-templates)

**Available templates:**
* rust

**Planned templates:**
* c
* deno (with TypeScript)
* deno (with JavaScript)
* gleam
* nix
* shell

## Usage
### Command Line
```sh
# todo: add description
nix flake init -t github:juneb125/ft#<template-name>

# todo: add description
nix flake new -t github:juneb125/ft#<template-name>
```

### Flake Configuration
1. add this repository as an input in your `flake.nix`
    ```nix
    {
      inputs = {
        # ...
        flake-templates.url = "github:juneb125/ft";
      };
    }
    ```
2. add the `templates` attribute to your flake's outputs
    * if you want to use all of these templates, and only these templates, import the whole module:
        ```nix
        {
          # ...
          outputs = { ... }: {
            # ...
            inherit (inputs.flake-templates) templates;
          };
        }
        ```
    * if you only want to use certain templates, or you have templates from other sources, use nix's `inherit` syntax:
        ```nix
        {
          # ...
          outputs = { ... }: {
            # ...
            templates = {
              # example: just use the 'rust' template
              inherit (inputs.flake-templates.templates) rust;
            };
          };
        }
        ```
