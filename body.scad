include<globals.scad>;

module body() {
  difference() {
    import(file="sources/body.stl");
    // Hollow out
    translate([0, 0, 0.2]) {
      scale(hollowRatio) {
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

    // body bottom opening
    translate([-bodyBotOpeningX/2, -bodyBotOpeningY/2 + 1, -5]) {
      cube([bodyBotOpeningX, bodyBotOpeningY, 3]);
    }

    // Under keyboard
    translate([-bodyBotOpeningX/2, -bodyBotOpeningY/2 + 1, -7.4]) {
      rotate(14, [1, 0, 0]) {
        cube([bodyBotOpeningX, 15, 5]);
      }
    }
    
  }
  *translate([5, -10, -5])
  rotate([0, 180, 0])
  rotate([-90, 0, 0])
  import(file="esp.stl");
  
}
