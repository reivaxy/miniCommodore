include<globals.scad>;
 
use <oledPanel.scad>;

module monitor() {
  translate([0, -0.5, -4.5]) {
    difference() {
      scale([1.2, 1, 1.4]) {
        *translate([0, -0.2, 0])
          *monitorFrame();
        difference() {
          import(file="sources/monitor.stl");
          translate([0, 0.5, 1.3]) {
            difference() {
              scale(hollowRatio) {
                import(file = "sources/monitor.stl");
              }
              translate([-25, -6.5, 7]) {
                cube([50, 10, 30]);
              }
            }
          }
        }
      }
        
      // Oled space
      translate([-15, 3.4, 22]) {
        cube([30, 7, 21]);
      }
      
      // bottom opening
      translate([-monitorBotOpeningX/2, 4.5, 15]) {
        cube([monitorBotOpeningX, monitorBotOpeningY, 3]);
      }
        
      
        /*
        // sensor space
        translate([-15, 7, 14])
          cube([30, 15, 26]);
        
        // space for screen connection
        translate([-8, 5, 43])
          cube([16, 3, 1.5]);
  
              
        // Screen cut on top
        translate([0, -1, 44])
          scale([1.02, 1.2, 1])
            color("red")
            screen1();
        */
        
      slit(0);
      slit(2);
      slit(4);
      slit(6);
      slit(8);

    }
/*    // pillar sensor
    *translate([-11.5, 22, 32]) {
      rotate(90, [1, 0, 0]) {
        cylinder(d=2.5, h=5, $fn=50);    
      }
    }
    // pillar sensor
    *translate([11.5, 22, 32]) {
      rotate(90, [1, 0, 0]) {
        cylinder(d=2.5, h=5, $fn=50);    
      }
    }*/
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