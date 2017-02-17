f_width= 140;
f_height=45;

cube([f_width, f_height, 4], center=true);

module side() {
    difference() {
        cube([6, f_height, 13], center=true);
        translate([0,0,1])
        rotate([0,90,0])
        cylinder(50, d=4.1, center=true, $fn=30);
        translate([0,-f_height/2-4,0])
        rotate([90,0,0])
        cylinder(f_height/2, d=2, center=true, $fn=30);
    }
}

translate([-(f_width-6)/2,0,13/2])
    side();
translate([+(f_width-6)/2,0,13/2])
    side();
