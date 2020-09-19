# Sound design tool
Sound design tool for mobile devices. A flexible subtractive synthesizer with oscillators, white noise generator, LFOs and envelopes.

## Prerequisites
- Flutter SDK
- Faust SDK

## Build instructions
### Build DSP layer:
```sh
$ faust2api -ios -nozip -target ./ios/Runner/DSP ./DSP/main.dsp
```

### Build Flutter project
```sh
$ flutter build ios
```

Start UI:
```sh
$ flutter run
```
