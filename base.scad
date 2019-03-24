

module base() {
  scale([1, 1.03, 1]) {
    difference() {
      import(file="sources/base.stl");
      scale([0.92, 0.92, 0.92]) {
        import(file="sources/base.stl");
      }
    }
  }
  
  // separator for temperature sensor
  difference() {
    translate([7, -21, -5.5]) {
      cube([4, 44, 3.07]);
    }
    translate([7, 10, -5.5]) {
      cube([4, 8, 3.07]);
    }
  }
}