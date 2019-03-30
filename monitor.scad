include<globals.scad>;
 
use <oledPanel.scad>;

// @param frame 0: no frame, 1: frame only, 2: all
module monitor(frame) {
  translate([0, -0.7, -4.5]) {
    difference() {
      scale([1.2, 1, 1.4]) {
          cube(0); // for frame == 1, need a node 
          // Top screen support
          if(frame != 1) {
            translate([-15, 5.5, 29.9]) {
              difference() {
                cube([30, 14, 2.2]);
                // wire passage
                translate([(30-14)/2, -1, -1]) {
                  cube([14, 18, 5]);
                }
                // Cut top
                translate([-1, 2, 2.2]) {
                  rotate([-11, 0, 0])
                    cube([32, 14, 3]);
                }
              }
            }
          }
          // Monitor hollowed out
          if(frame != 1) {
            difference() {
              import(file="sources/monitor.stl");
              // Scaled down monitor to subtract
              translate([0, -1, 1.3]) {
                difference() {
                  scale([hollowRatio, 1.01, hollowRatio]) {
                    import(file = "sources/monitor.stl");
                  }
                  // Remove front of scaled down monitor
                  translate([-25, -5, 7]) {
                    cube([50, 9, 30]);
                  }
                  // Bottom front removal
                  translate([-25, -4.5, 7]) {
                    cube([50, 9, 6]);
                  }
                  
                  // bottom corners to hold frame
                  bottomLowerCorner();
                  mirror([1, 0, 0]) {
                    bottomLowerCorner();
                  }
    
                }
              }
            }
          }
        }
      // bottom opening
      translate([-monitorBotOpeningX/2, 13 - monitorBotOpeningY/2, 15]) {
        cube([monitorBotOpeningX, monitorBotOpeningY, 3]);
      }
               
      slit(0);
      slit(2);
      slit(4);
      slit(6);
      slit(8);

    }
    if(frame > 0) {
      translate([0, -0.2, 0]) {
        monitorFrame();
      }
    }
  }
  
  // Pillars must not be scaled !
  if(frame != 1) {
    translate([0, 5, 38.5])
      screenPillars();
  }
  
  *screen1();
  
  // lower bottom open hinge to hold to body
  translate([-15, 19.7, 9.5]) {
    difference() {
      cube([30, 2.5, 3]);
      translate([0, 1, 1]) {
        cube([30, 2.5, 1.1]);
      }
    }
  }
}

module bottomLowerCorner() {
  translate([-22, -2, 12.7]) {
    rotate([0, 0, 30])
      cube([10, 16, 4.5]);
  }
}
module screenPillars() {
  translate([-11.5, 0, 0]) {
    rotate(90, [1, 0, 0]) {
      cylinder(d=1.6, h=4, $fn=50);
      translate([23, 0, 0]) {
        cylinder(d=1.6, h=4, $fn=50);
      }
    }
  }
}

module monitorFrame() {
  oledX = 26.4;
  oledY = 12.5;
  diam = 4;
  
  difference() {
    scale([1.2, 1, 1.4]) {
      difference() {
        union() {
          import(file="sources/monitor_frame.stl");
          translate([-13, 0.95, 16.5])
          cube([26, 2.5, 15]);
        }
        // hollow out center screen space
        translate([-14, 2.6, 10]) {
          cube([28, 4, 20]);
        }
      }
    }
    
    // Oled opening must not be scaled
    translate([-(oledX -diam)/2, 6, 29]) {
      rotate(90, [1, 0, 0]) {
        minkowski() {
          cube([oledX - diam, oledY - diam, 4]);
          cylinder(d=diam, h=4, $fn=80);
        }
      }
    }
    // inner chamfer for better viewinf from above
    translate([0, 2.5, 29])
      rotate(90, [1, 0, 0]) {
        linear_extrude(height=4.5, scale=1.7) {
        translate([-(oledX-diam)/2, -(oledY-diam)/2 + 4, 0]) {
          minkowski() {
            square([oledX-diam, oledY-diam]);
            //polygon([[0, 0], [oledX + 2, 0], [oledX + 0.5, oledY], [1.5,oledY]]);
            circle(d=diam, $fn=80);
          }
        }
      }
    }     
  }
}

module screen1() {
  translate([-13.6, 15, 40.7]) {
    rotate(180, [1, 0, 0]) {
      import(file="oled.stl");
    }
  }
}

module slit(x) {
  translate([-0.3 + x, 18, 30])
    cube([1, 10, 20]);
  translate([-0.3 - x, 18, 30])
    cube([1, 10, 20]);
}