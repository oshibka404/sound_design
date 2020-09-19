declare name "Sound Design";
declare author "Andrey Ozornin";
declare copyright "Ozornin Music";
declare version "0.01";
declare license "MIT";
declare options "[midi:on][style:poly][nvoices:12]";

import("stdfaust.lib");

cc = library("midi_cc.dsp");

osc1_level = hslider("osc1 level", 1, 0, 1, .01);
osc1 = component("oscillators/osc1.dsp") * osc1_level;

osc2_level = hslider("osc2 level", 1, 0, 1, .01);
osc2 = component("oscillators/osc2.dsp") * osc2_level;

process = (osc1 + osc2) * cc.gate * cc.gain <: _,_;
