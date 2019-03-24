

use <body.scad>;
use <base.scad>;
use <monitor.scad>;

translate([0, 0, 10]) {
  monitor();
  *import(file="sources/keys.stl");
  *body();
  *base();
}




