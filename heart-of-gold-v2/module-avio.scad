
module avio(width, height) {
    rotate([-90, 0, 0])
    translate([0, 0, -50])
    hull() {
        translate([-(width-height)/2, 0, 0])
            cylinder(100, d=height, $fn=50);
        translate([+(width-height)/2, 0, 0])
            cylinder(100, d=height, $fn=50);
        translate([-width/2, 0, 0])
            cube([width, height/2, 100]);
    }
}
