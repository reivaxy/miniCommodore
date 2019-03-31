

use <body.scad>;
use <base.scad>;
use <monitor.scad>;
use <keyboard.scad>;

difference() {
  translate([0, 0, 10]) {
    frame = 0;  // 0: no frame, 1: frame only, 2: all
    switches = 1; // 0: no keyboard switches, 1: keyboard switches
    print = 1;
    
    
    monitor(frame);     
    *body(switches);
    *base(switches);
    *translate([-0, 0, 4.8])
      rotate([13, 0, 0])
        !keyboard(switches, print);
    
    *translate([-11.3, 23, 2.7])
        rotate([90, 180, 90])
          import(file="esp.stl");
  }
  
  // Bottom cut view
  *translate([-50, 10, 0])
    cube([100, 100, 100]);
  
  // right cut view
  *translate([0, -50, 0])
    cube([100, 100, 100]);
}

*screw();




