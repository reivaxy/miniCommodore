
use <oledPanel.scad>;

translate([0, 0, 10]) {
  body();
  *base();
  *monitor();
  *import(file="sources/keys.stl");
}

module screen1() {
  translate([-14, 3, 1])
    rotate(-90, [1, 0, 0])
      screen();
}

module base() {
  scale([1, 1.02, 1])
    import(file="sources/base.stl");
}

module monitor() {
  translate([0, -0.5, -4.5])
    difference() {
      scale([1.2, 1, 1.4]) {
        *import(file="sources/monitor_frame.stl");
        import(file="sources/monitor.stl");
      }
      // Oled space
      translate([-15, 3.4, 16])
        cube([30, 7, 27]);

      // sensor space
      translate([-15, 7, 14])
        cube([30, 15, 26]);
      
      // space for screen connection
      translate([-8, 5, 43])
        cube([16, 3, 1.5]);
      
      slit(0);
      slit(2);
      slit(4);
      slit(6);
      slit(8);
      
      // Screen cut on top
      translate([0, -1, 44])
        scale([1.02, 1.2, 1])
          color("red")
          screen1();
    }
    // pillar sensor
    translate([-11.5, 22, 32]) {
      rotate(90, [1, 0, 0]) {
        cylinder(d=2.5, h=5, $fn=50);    
      }
    }
    // pillar sensor
    translate([11.5, 22, 32]) {
      rotate(90, [1, 0, 0]) {
        cylinder(d=2.5, h=5, $fn=50);    
      }
    }
}

module slit(x) {
  translate([-0.3 + x, 18, 30])
    cube([1, 10, 20]);
  translate([-0.3 - x, 18, 30])
    cube([1, 10, 20]);
  
}

module body() {
  difference() {
    import(file="sources/body.stl");
    // top opening
    translate([-13, 3, -4])
      cube([26, 19, 25]);
    // Usb
    translate([-5, 3, -2])
      cube([10, 22.5, 5]);

    translate([-13, -12, -4])
      cube([26, 22, 4]);
    translate([-13, -11, -4])
      rotate(13, [1, 0, 0])
        cube([26, 22, 4]);
    translate([-13, -6, -1])
      rotate(13, [1, 0, 0])
        cube([26, 10, 4]);
  }
}
