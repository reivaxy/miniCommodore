include <globals.scad>;
                                      

module keyboard(switch) {
  *import(file="sources/keys.stl");

  keyInterval = 0.45;
  rowCount = 3;
  colCount = 9;
  
  keySide = (keyboardX - (colCount - 1)*keyInterval) / colCount;
  
  translate([-21.8, -17.3, 0]) {
    difference() {
      union() {
        cube([keyboardX, keyboardY, 4]);
        // Space bar
        translate([(keyboardX - spaceBarX)/2, - spaceBarY - keyInterval, 0]) {
          cube([spaceBarX, spaceBarY + keyInterval, 4]);
        }
        // Numeric keypad
        translate([keyboardX + 3.7, -keySide - keyInterval + 0.2, 0]) {
          tolX = 0.35;
          tolY = 0.5;
          cube([keyPadX, keyPadY, 4]);
          // numeric keypad foot
          translate([(keyPadX - switchFootX - 1 - tolX)/2, 
            (keyPadY - switchFootY - 1.1 - tolY)/2 + 1.4, -3]) {
            difference() {
              cube([switchFootX + 1 + tolX, switchFootY + 1 + tolY, 4]);
              translate([0.5, 0.5, -0.1])
                cube([switchFootX + tolX, switchFootY + tolY, 4.1]);
              translate([(switchFootX + 1 + tolX - 2.4) /2, 0, 0])
                cube([2.4, 10, 4]);
            }
          }
        }
        
      }
  
      // draw rows
      *translate([0, -keyInterval, 0])
      for (row = [0 : rowCount]) {
        translate([-keyInterval, row*(keySide + keyInterval), 2]) {
          cube([keyboardX + 50, keyInterval, 5]);
        }
      }
  
      // draw columns
      *translate([-keyInterval, 0, 0])
      for (col = [1 : colCount + 5]) {
        if(col > colCount) {
          translate([1.7+keySide/2 + col*(keySide + keyInterval), -keySide-1, 2]) {
            cube([keyInterval, keyboardY + 20, 5]);
          }
        } else {
          translate([col*(keySide + keyInterval), 0, 2]) {
            cube([keyInterval, keyboardY + 20, 5]);
          }
        }
      }
  
    }
  
    if(switch == 1) {
      axle();
    }
  }
  
}

module axle() {
    translate([keyboardX / 2,  3 * kbAxleSupportWidth + 2 * kbAxleSupportSpacing - spaceBarY, -4]) {
      rotate([90, 0, 0]) {
        difference() {
          rotate([0, 0, 45]) {
            union() {
            roundedSupport();
            translate([0, 0, kbAxleSupportWidth+ kbAxleSupportSpacing]) {
              roundedSupport();
              translate([0, 0, kbAxleSupportWidth + kbAxleSupportSpacing]) {
                roundedSupport();
              }
            }
            translate([kbAxisDiam/2, kbAxisDiam/2, 0]) {
              cylinder(d=kbAxisDiam, h=(3*kbAxleSupportWidth + 2*kbAxleSupportSpacing), $fn=100);
            }
          }
        }
        translate([-20, 5.8, -10]) {
          cube([40, 40, 40]);    
        }
      }
    }
  }
}

module roundedSupport() {
  translate([kbAxisDiam/2, kbAxisDiam/2, 0])
  minkowski() {
    cube([kbAxleSupportSide - kbAxisDiam, kbAxleSupportSide - kbAxisDiam, kbAxleSupportWidth/2]);
    cylinder(d=kbAxisDiam, h=kbAxleSupportWidth/2, $fn=100);
  }
  
}
