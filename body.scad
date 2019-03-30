include <globals.scad>;

module body(switches) {
  difference() {
    import(file="sources/body.stl");
    // Hollow out
    translate([0, 0.9, 0.35]) {
      scale([hollowRatio, 0.93, 0.90]) {
        difference() {
          import(file="sources/body.stl");
          // Remove keyboard from hollowing reduced body to avoid too thin shells
          translate([-25, -29, -4]) {
            cube([50, 22, 8]);
          }
        }
      }

    }
    // body top opening
    translate([-bodyTopOpeningX/2, 4, 10]) {
      cube([bodyTopOpeningX, bodyTopOpeningY, 3]);
    }

    // bottom opening
    translate([-bodyBotOpeningX/2, -bodyBotOpeningY/2 + 15, -5]) {
      cube([bodyBotOpeningX, bodyBotOpeningY - 15, 4]);
    }

    // Under keyboard: if no keyboard switches
    if(switches < 1) {
      translate([-bodyBotOpeningX/2, -bodyBotOpeningY/2 + 1, -7.4]) {
        rotate(13, [1, 0, 0]) {
          cube([bodyBotOpeningX, 15, 5]);
        }
      }
    } else {
      // Remove key pad: no longer 
      *translate([11.8, -18.9, -8]) {
        rotate(13, [1, 0, 0]) {
          cube([keyPadHoleX, keyPadHoleY, 10]);
        }
      }
      // under key pad, keep thin wall, cut on both sides.
      // after printing, cut top side to have a springy surface on which 
      // the keypad can be stuck and action the switch below it
      translate([11.8, -bodyBotOpeningY/2 + 1, -7.5]) {
        rotate(13, [1, 0, 0]) {
          cube([keyPadHoleX, keyPadHoleY, 5]);
          translate([0, -0.15, 0]) {
            cube([1, keyPadHoleY, 7]);
          }
          translate([keyPadHoleX-1, -0.15, 0]) {
            cube([1, keyPadHoleY, 7]);
          }
        }
      }

    // Remove main keyboard
      translate([-22.5, -15.6, -8]) {
        rotate(13, [1, 0, 0]) {
          cube([keyboardHoleX, keyboardHoleY, 10]);
          // spacebar
          translate([5.6, -3.28, 0]) {
            cube([spaceBarHoleX, spaceBarHoleY, 10]);
          }
        }
      }    
    }
    
    // back left usb
    *translate([-11.5, 3, -1])
      cube([10, 22.5, 5.5]);
    
    // back right usb
    translate([3, 3, -1])
      cube([10, 22.5, 5.5]);
    
    // right side slots
    for (slot = [0 : 8]) {
      translate([21.5, 4 + slot*2, -1]) {
        cube([3, 1, 8]);
      }
    }
    // left side slots
    for (slot = [0 : 8]) {
      translate([-24.5, 4 + slot*2, -1]) {
        cube([3, 1, 8]);
      }
    }
  }
      
  // Under top keyboard needs some reinforcement
  translate([-bodyBotOpeningX/2 - 3, -bodyBotOpeningY/2 + 13, 2.75]) {
    rotate(14, [1, 0, 0]) {
      cube([bodyBotOpeningX + 6, 6.2, 0.5]);
    }
  }
  
}
