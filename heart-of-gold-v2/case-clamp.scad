use <module-nuthole.scad>;

y_overlap=6;
xy_screw=10;
z_case=39.16;
z_top=3;
wall=3;
b_rad=2;
null=0.001;

difference() {
union() {
    // over case
    minkowski() {
        translate([b_rad/2, b_rad/2,0])
        cube([xy_screw-b_rad,
              y_overlap+wall-b_rad,
              z_case+z_top-b_rad/2]);
        sphere(d=b_rad, $fn=20);
    }

    // left scrw hole
    minkowski() {
        translate([b_rad/2, -xy_screw+b_rad/2, 0])
        cube([xy_screw-b_rad, xy_screw+b_rad, 8-b_rad/2]);
        sphere(d=b_rad, $fn=20);
    }
}

// hole edge
translate([xy_screw/2, -xy_screw/2, -null])
cylinder(z_case, d=4, $fn=25);

translate([xy_screw/2, -xy_screw/2, z_case/2+5-1.5-null])
nuthole(z_case);

// cutout case
translate([-null, wall+null, -null])
cube([xy_screw,
      y_overlap,
      z_case]);

// bottom plate
translate([-500, -500, -100])
cube([1000, 1000, 100]);
}
