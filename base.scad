include <globals.scad>;
                   

module base(switch) {
  scale([1.05, 1.05, 1]) {
    difference() {
      import(file="sources/base.stl");
      scale([0.92, 0.92, 0.92]) {
        import(file="sources/base.stl");
      }
    }
  }
  if(switch == 1) {
    support();
  }

}

module support() {
  supportDiam = kbAxisDiam + 0.2;
  translate([-6.7, -10, 0])
  rotate([90+13, 0, 0])
  rotate([0, 0, 225]) {     
    difference() {
      union() {
        cube([kbAxleSupportSide - kbAxisDiam, kbAxleSupportSide - kbAxisDiam, kbAxleSupportWidth+1]);
        translate([0, 0, kbAxleSupportSpacing + 1.5])
          cube([kbAxleSupportSide - kbAxisDiam, kbAxleSupportSide - kbAxisDiam, kbAxleSupportWidth+1]);
      }
      moveIn =  supportDiam/2 + 0.2;
      translate([moveIn, moveIn, -0.1])
        cylinder(d=supportDiam, h=15, $fn=100);
      
      // Remove top of hole for axle
      translate([-8, -4, -0.1]) {
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
      #translate([0, 8.4, -1]) {
        rotate([0, 0, -45]) {
          rotate([13, 0, 0]) {
            cube([15, 10, 12]);
          }
        }
      }
    }
 }
  
}
