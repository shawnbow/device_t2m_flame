/* Copyright (C) 2015 Acadine Technologies. All rights reserved. */

#ifdef MOZ_WIDGET_GONK
// This preference indicates the name of GPU device.
pref("device.gpu.nodename", "fdc00000.qcom,kgsl-3d0");

// The preferences for maximal/minimal CPU speed in performance/powersave mode.
// The unit of speed is kHz for CPU speed
pref("device.cpu.performance.maxspeed", 1190400);
pref("device.cpu.performance.minspeed", 1190400);
pref("device.cpu.powersave.maxspeed", 600000);
pref("device.cpu.powersave.minspeed", 300000);

// The preferences for maximal/minimal GPU speed in performance/powersave mode.
// The unit of speed is Hz for GPU speed
pref("device.gpu.performance.maxspeed", 400000000);
pref("device.gpu.performance.minspeed", 400000000);
pref("device.gpu.powersave.maxspeed", 200000000);
pref("device.gpu.powersave.minspeed", 150000000);
#endif
