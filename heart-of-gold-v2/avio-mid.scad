width=61;
height=23.5;
nuthole=7.3;
nutheight=3.4;


use <module-avio.scad>;


module clamp() {
    difference() {
        cube([width+22, 30, height+8], center=true);

        // bottom
        translate([0, 0, -height])
            cube([2*width, 2*100, height+0.01], center=true);
        // holes
        $fn=30;
        translate([width/2+11/2, -11, -height])
            cylinder(1.4*height, d=4.1);
        translate([width/2+11/2, +11, -height])
            cylinder(1.4*height, d=4.1);
        translate([-width/2-11/2, -11, -height])
            cylinder(1.4*height, d=4.1);
        translate([-width/2-11/2, +11, -height])
            cylinder(1.4*height, d=4.1);
        // nut hole
        translate([-(width+11)/2, 0, -height/2+5])
            cube([nuthole, 60, nutheight], center=true);
        translate([+(width+11)/2, 0, -height/2+5])
            cube([nuthole, 60, nutheight], center=true);

        avio(width, height);
    }
}

rotate([-90,0,0])
    clamp();
