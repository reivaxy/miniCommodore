include <globals.scad>;
                   

module base(switch) {
  scale([1.05, 1.05, 1]) {
    difference() {
      import(file="sources/base.stl");
      scale([0.89, 0.92, 0.92]) {
        import(file="sources/base.stl");
      }
    }
  }
  if(switch == 1) {
    kbSupport();
  }
}

module kbSupport() {
  supportDiam = kbAxisDiam + 0.2;
  supportSide = kbAxleSupportSide - kbAxisDiam;
  translate([-6.7, -10.05, 0.6])
  rotate([90+13, 0, 0])
  rotate([0, 0, 225]) {
    difference() {
      union() {
        cube([supportSide, supportSide, kbAxleSupportWidth+1]);
        translate([0, 0, kbAxleSupportSpacing + 1.5])
          cube([supportSide, supportSide, kbAxleSupportWidth+1]);
      }
      moveIn =  supportDiam/2 + 0.6;
      translate([moveIn, moveIn, -0.1])
        cylinder(d=supportDiam, h=15, $fn=100);
      
      // Remove top of hole for axle. Adjust y translation for opening height
      translate([-8, -3.7, -0.1]) {
        rotate([0, 0, -45]) {
          cube([10, 10, 10]);
          
        }
      }
      // Remove opposite corner to make it flat
      translate([-1, 6, -0.1]) {
        rotate([0, 0, -45]) {
          cube([10, 10, 10]);
          
        }
      }
    }
    // add a support
    difference() {
      
      translate([-1, 6, -0.1]) {
        rotate([0, 0, -45]) {
          cube([10, 4, 10]);
        }
      }
      // cut support bottom
      translate([0, 8.4, -1]) {
        rotate([0, 0, -45]) {
          rotate([13, 0, 0]) {
            cube([15, 10, 12]);
          }
        }
      }
    }
 }
 
  translate([3, -14.5, -7])  {
    switchSupport(switchDownZ, switchFootZ);
    translate([-24.0, 0, 0])  {
      switchSupport(switchDownZ, switchFootZ);
    }
    translate([11.5, 0, 0])  {
      switchSupport(switchDownZ, switchFootZ - 0.8);
    }
  }
  
}
switchDownZ = 2.1;
switchFootZ = 6;
pinX = 1.8;
railSide = 2;

module switchSupport(depth, height) {
  difference() {
    rotate([13, 0, 0]) {
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