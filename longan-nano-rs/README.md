# Build

```bash
$ cargo build --bin <binary name>
$ cargo build --example <example name>
```

# Flash

Flash release image using cargo-flash:
```bash
$ cargo flash --release --chip GD32VF103CBT6 --bin <binary name>
```

Flash debug image using cargo-embed:
```bash
$  cargo embed --bin <binary name> flash
```
