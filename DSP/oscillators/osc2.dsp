import("stdfaust.lib");

cc = library("midi_cc.dsp");

process = os.triangle(cc.freq);
