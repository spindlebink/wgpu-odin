# WGPU

Bindings to [wgpu-native](https://github.com/gfx-rs/wgpu-native) in the [Odin programming language](https://odin-lang.org).

WGPU is a Rust implementation of the WebGPU standard, and the WGPU team have provided C headers to make it easy for interfacing.

## Status

**These bindings aren't production-ready.** I'm working on them concurrently with a project that depends on them, my creative coding/game framework [Pink](https://github.com/spindlebink/pink).

## Naming Conventions

Per the Odin vendor packages, the bindings here directly employ the naming found in the WGPU headers rather than adapt the headers to Odin's `snake_case`/`Ada_Case` conventions. These bindings also remove the C namespace prefixes from all methods and types. When removing the namespace prefix would result in a member name starting with a numeral, I've put the numeral after the letter (e.g. `Prefix_2D` to `EnumName.D2`).

There are a couple of inconsistent names in the WGPU source where enum members are in `SCREAMING_CASE` instead of the `UpperCamelCase` found elsewhere. I've reproduced even those. The goal is 1-1.

## License

BSD 3-clause.
