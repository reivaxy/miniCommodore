include <globals.scad>;
                                      

rowCount = 3;
colCount = 9;
keyInterval = 0.45;
keySide = (keyboardX - (colCount - 1)*keyInterval) / colCount;

module keyboard(switch, print) {
  if(switch == 0) {
    paramKeyboard(4);
  } else {
    paramKeyboard(2.3);
    if(print) {
      translate([-21.8, 0, 0]) {
        switchStuff(4 - 2.5);
      }
    } else {
      translate([-21.8, -17.3, 0]) {
        rotate([180, 0, 0])
        mirror([0, 1, 0]) {
          switchStuff(4 - 2.5);
        }
      }
    }
  } 
}

module paramKeyboard(z) {
  *import(file="sources/keys.stl");
  
  translate([-21.8, -17.3, 0]) {
    difference() {
      pads(z);
      // draw rows
      translate([0, -keyInterval, 0])
      for (row = [0 : rowCount]) {
        translate([-keyInterval, row*(keySide + keyInterval), z-2]) {
          cube([keyboardX + 50, keyInterval, 5]);
        }
      }
  
      // draw columns
      translate([-keyInterval, 0, 0])
      for (col = [1 : colCount + 5]) {
        if(col > colCount) {
          translate([1.7+keySide/2 + col*(keySide + keyInterval), -keySide-1, z-2]) {
            cube([keyInterval, keyboardY + 20, 5]);
          }
        } else {
          translate([col*(keySide + keyInterval), 0, z-2]) {
            cube([keyInterval, keyboardY + 20, 5]);
          }
        }
      }
  
    }
  }
}

module pads(z) {
  union() {
    cube([keyboardX, keyboardY, z]);
    // Space bar
    translate([(keyboardX - spaceBarX)/2, - spaceBarY - keyInterval, 0]) {
      cube([spaceBarX, spaceBarY + keyInterval, z]);
    }
    // Numeric keypad
    translate([keyboardX + 3.7, -keySide - keyInterval + 0.2, 0]) {
      cube([keyPadX, keyPadY, z]);
    }
  }
}

module switchStuff(z) {
  difference() {
    union() {
      pads(z);
      translate([keyboardX + 3.7, -keySide - keyInterval + 0.2, 0]) {
        cube([keyPadX, keyPadY, 4+2]);
      }      
    }
    // 
    translate([keyboardX + 3.7, -keySide - keyInterval + 0.2, 2]) {
      rotate([13, 0, 0])
      cube([keyPadX, keyPadY+2, 4]);
    }
    // Shorter
    translate([keyboardX + 3.7, -keySide - keyInterval + 0.2 + keyPadY - 0.7, 0]) {
      cube([keyPadX, 1, 5]);
    }
    // narrower
    translate([keyboardX + 3.7 + keyPadX - 1.3, -keySide - keyInterval + 1  - 1, 0]) {
      cube([1.3, keyPadY, 5]);
    }      

  }
  translate([keyboardX / 2,  -3, 5.70]) {
    rotate([-90, 0, 0]) {
      difference() {
        rotate([0, 0, 45]) {
          difference() {
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
            // Cut upper half of pivot support
            rotate([0, 0, 45]) {
              translate([5, -7, -3]) {   // z, -x, -y
                  cube([15, 15, 15]);    
              }
            }
          }
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
