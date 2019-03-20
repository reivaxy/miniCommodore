
use <oledPanel.scad>;

translate([0, 0, 10]) {
  *body();
  *base();
  monitor();
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
      scale([1.1, 1, 1.4]) {
        *import(file="sources/monitor_frame.stl");
        import(file="sources/monitor.stl");
      }
      translate([-15, 3.4, 15])
        cube([30, 8, 27]);
    translate([0, 0.2, 44])
      scale([1.01, 1.01, 1])
        #screen1();
    }
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
