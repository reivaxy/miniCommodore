include<globals.scad>;
 
use <oledPanel.scad>;

module monitor() {
  translate([0, -0.5, -4.5]) {
    difference() {
      scale([1.2, 1, 1.4]) {
        translate([0, -0.2, 0]) {
          monitorFrame();
        }
        // Top screen support
        *translate([-15, 4, 29.9]) {
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
        *difference() {
          import(file="sources/monitor.stl");
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
              translate([-25, -4, 7]) {
                cube([50, 9, 6]);
              }
              
              bottomLowerCorner();
              mirror([1, 0, 0]) {
                bottomLowerCorner();
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
  }
  translate([0, 4, 38.2])
    screenPillars();
  
  *translate([0, 0.2, 39.5])
    screen1();
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
      cylinder(d=1.6, h=3, $fn=50);
      translate([23.5, 0, 0]) {
        cylinder(d=1.6, h=3, $fn=50);
      }
    }
  }
}

module monitorFrame() {
  x = 17.5;
  y = 7.5;
  difference() {
    scale([1, 0.8, 1])
    union() {
      import(file="sources/monitor_frame.stl");
      translate([-13, 0.95, 16.5])
        cube([26, 2.5, 15]);
    }
    translate([-x/2, 6, 20])
      rotate(90, [1, 0, 0])
        minkowski() {
          cube([x, y, 4]);
          cylinder(d=4, h=4, $fn=80);
        }
    *translate([0, 2.5, 22.9])
      rotate(90, [1, 0, 0])
        linear_extrude(height=5, scale=1.7)
        translate([-(x + 0)/2, -y/2 + 0.8, 0])
          minkowski() {
            square([x, y]);
            //polygon([[0, 0], [x + 2, 0], [x + 0.5, y], [1.5, y]]);
            circle(d=4, $fn=80);
          }
  }
}

module screen1() {
  translate([-14, 3, 1])
    rotate(-90, [1, 0, 0])
      screen();
}


module slit(x) {
  translate([-0.3 + x, 18, 30])
    cube([1, 10, 20]);
  translate([-0.3 - x, 18, 30])
    cube([1, 10, 20]);
}