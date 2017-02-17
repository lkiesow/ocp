width=47.6;
height=29;
nuthole=7.3;
nutheight=3.4;


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

        // power adapter
        cube([width, 50, height], center=true);
    }
}

rotate([-90,0,0])
    clamp();

/*
difference() {
    cylinder(4, d=10);
    translate([0,0,1.01])
        nuthole();
    translate([0,0,-.01])
        cylinder(5,d=4,$fn=50);
}
*/
