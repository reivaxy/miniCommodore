include <globals.scad>;
                   

module base(switch) {
  scale([1.05, 1.05, 1]) {
    difference() {
      import(file="sources/base.stl");
      scale([0.91, 0.92, 0.89]) {
        import(file="sources/base.stl");
      }
      translate([0, -4.45, -5.6]) {
        screw(1);
      }
    }
  }
  if(switch == 1) {
    kbSupport();
  }
  
  // Center screw pillar
  translate([0-2.5, -6.3, -5.5]) {
    difference() {
      cube([screwPillarX, screwPillarY, 3]);
      translate([screwPillarX/2, screwPillarY/2, 0]) {
        screw(1);
      }
    }    
  }
  
  // esp bottom blocking pillar
  translate([-12.6, 2, -5.5]) {
    espBlocker();
  }
  translate([-12.6, 13, -5.5]) {
    espBlocker();
  }
    
}

module espBlocker() {
  cube([0.7, 5, 8]);
  for (slot = [1 : 8]) {
    translate([0, 0, slot]) {
      rotate([0, 45, 0])
        cube([1, 5, 1]);
    }
  }
}
module kbSupport() {
  translate([3, -15.5, -7])  {

    switchSupport(switchDownZ, switchFootZ, 0);
    translate([-24.0, 0, 0])  {
      switchSupport(switchDownZ, switchFootZ, 0);
    }
    translate([11, 0, 0])  {
      switchSupport(switchDownZ, switchFootZ, 0);
    }
    // middle pivot
    translate([-10, 0, 2])  {
      cube([2, 7, 2.5]);
      translate([1, 0, 2.4]) {         
        rotate([-90, 0, 0]) {
          cylinder(d=2, h=7, $fn=90);
        }
      }
    }    
  }
  
}
switchDownZ = 2.1;
switchFootZ = 4;
pinX = 1.8;
railSide = 2;

module switchSupport(depth, height, angle) {
  difference() {
    rotate([angle, 0, 0]) {
      straightSupport(depth, height);
    }
    // cut bottom
    translate([-10, -10, 0])
      cube([20, 20, 2]);
  }
}

module straightSupport(depth, height) {
  difference() {
    cube([switchFootX, switchFootY, height]);
    // hole for switch
    translate([(switchFootX - switchX) / 2, (switchFootY - switchY) / 2, height - depth]) {
      cube([switchX, switchY, depth + 1]);
    }
    // slots for switch pins
    translate([(switchFootX - pinX) / 2, -0.5, height - depth]){
      cube([pinX, switchFootY + 1, depth + 1]);
    }
  }
}