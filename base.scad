

module base() {
  scale([1, 1.03, 1]) {
    difference() {
      import(file="sources/base.stl");
      scale([0.92, 0.92, 0.92]) {
        import(file="sources/base.stl");
      }
    }
  }

}