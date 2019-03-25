include<globals.scad>;

module body() {
  difference() {
    import(file="sources/body.stl");
    // Hollow out
    translate([0, 0.9, 0.35]) {
      scale([hollowRatio, 0.93, 0.90]) {
        difference() {
          import(file="sources/body.stl");
          // Remove keyboard from hollowing reduced body
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

    // under keyboard bottom opening
    translate([-bodyBotOpeningX/2, -bodyBotOpeningY/2 + 15, -5]) {
      cube([bodyBotOpeningX, bodyBotOpeningY - 15, 4]);
    }

    // Under keyboard
    translate([-bodyBotOpeningX/2, -bodyBotOpeningY/2 + 1, -7.4]) {
      rotate(14, [1, 0, 0]) {
        cube([bodyBotOpeningX, 15, 5]);
      }
    }
    
    // Usb
    translate([-12.7, 3, -1])
      cube([10, 22.5, 5.5]);
    
    // side slots
    for (slot = [0 : 8]) {
      translate([15, 4 + slot*2, -1]) {
        cube([10, 1, 8]);
      }
    }
  }
  
  *translate([5, -10, -5])
    rotate([0, 180, 0])
      rotate([-90, 0, 0])
        import(file="espsx.stl");
  
}
