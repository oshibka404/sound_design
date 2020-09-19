import("stdfaust.lib");

cc = library("midi_cc.dsp");

process = os.sawtooth(cc.freq);
