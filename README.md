# WGPU

Bindings to [wgpu-native](https://github.com/gfx-rs/wgpu-native) in the [Odin programming language](https://odin-lang.org).

WGPU is a Rust implementation of the WebGPU standard, and the WGPU team have provided C headers to make it easy for interfacing.

## Status

**These bindings aren't production-ready.** The triangle example is leaky and the bindings are incomplete.

My goal is to use WGPU as the graphics backend for a [hobby game framework](https://github.com/spindlebink/pink), because either I'm dumb and impatient or Vulkan is a nightmare. Possibly both.

The bindings have only been implemented for my dev system, which is Linux with X11. Wayland support and eventual macOS and Windows support *should* come later. SDL does most of it, anyway.

## Naming Conventions

Per the Odin vendor packages, the bindings here directly employ the naming found in the WGPU headers rather than adapt the headers to Odin's `snake_case`/`Ada_Case` conventions. These bindings also remove the C namespace prefixes from all methods and types. When removing the namespace prefix would result in a member name starting with a numeral, I've put the numeral after the letter (e.g. `Prefix_2D` to `EnumName.D2`).

There are a couple of inconsistent names in the WGPU source where enum members are in `SCREAMING_CASE` instead of the `UpperCamelCase` found elsewhere. I've reproduced even those. The goal is 1-1.

## License

BSD 3-clause.
