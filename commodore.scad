

use <body.scad>;
use <base.scad>;
use <monitor.scad>;

translate([0, 0, 10]) {
  
  frame = 1;  // 0: no frame, 1: frame only, 2: all
  *monitor(frame);
  *import(file="sources/keys.stl");
  body();
  *base();
}




