use <module-nuthole.scad>;

y_overlap=6;
y_channel=25;
x_outer=6;
x_channel=40;
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
        cube([x_outer+xy_screw+wall-b_rad,
              y_overlap+wall-b_rad,
              z_case+z_top-b_rad/2]);
        sphere(d=b_rad, $fn=20);
    }

    // border
    minkowski() {
        union() {
            translate([xy_screw+b_rad/2, b_rad/2-y_channel, 0])
            cube([x_outer+x_channel-xy_screw-b_rad,
                  wall-b_rad,
                  z_case-b_rad/2]);
            // edge
            translate([xy_screw+b_rad/2+x_outer+x_channel-xy_screw-wall,
                       b_rad/2-y_channel, 0])
            cube([xy_screw+wall-b_rad,
                  wall+xy_screw-b_rad,
                  8-b_rad/2]);
            // edge wall left
            translate([xy_screw+b_rad/2+x_outer+x_channel-xy_screw-wall,
                       b_rad/2-y_channel, 0])
            cube([wall-b_rad,
                  wall+xy_screw-b_rad,
                  z_case-b_rad/2]);
            // edge wall
            translate([xy_screw+b_rad/2+x_outer+x_channel-xy_screw-wall,
                       b_rad/2-y_channel+xy_screw, 0])
            cube([xy_screw+wall-b_rad,
                  wall-b_rad,
                  z_case-b_rad/2]);
            // back plate
            translate([xy_screw+b_rad/2+x_outer+x_channel-wall,
                       b_rad/2-y_channel+xy_screw, 0])
            cube([wall-b_rad,
                  y_channel+y_overlap-xy_screw-b_rad,
                  z_case-b_rad/2]);
        }
        sphere(d=b_rad, $fn=20);
    }

    // left scrw hole
    minkowski() {
        translate([b_rad/2, -xy_screw+b_rad/2, 0])
        cube([xy_screw-b_rad, xy_screw+b_rad, 8-b_rad/2]);
        sphere(d=b_rad, $fn=20);
    }

    // bottom plate
    minkowski() {
        translate([b_rad/2, -y_channel+b_rad/2, 0])
        cube([x_channel+x_outer+xy_screw-b_rad,
              y_channel+y_overlap-b_rad,
              3-b_rad/2]);
        sphere(d=b_rad, $fn=20);
    }
}

// cutout case
translate([-null, wall+null, -null])
cube([x_outer+xy_screw,
      y_overlap,
      z_case]);

// hole edge
translate([xy_screw/2+x_outer+x_channel,
           xy_screw/2-y_channel-null, -null])
cylinder(z_case, d=4, $fn=25);

translate([xy_screw/2+x_outer+x_channel,
           xy_screw/2-y_channel-null, z_case/2+5-1.5-null])
nuthole(z_case);

// hole inner
translate([xy_screw/2, -xy_screw/2, -null])
cylinder(z_case, d=4, $fn=25);

translate([xy_screw/2, -xy_screw/2, z_case/2+5-1.5-null])
nuthole(z_case);

// bottom plate
translate([-500, -500, -100])
cube([1000, 1000, 100]);
}
