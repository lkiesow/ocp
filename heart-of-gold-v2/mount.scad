nuthole=7.3;
nutheight=3.4;
height=39;

slider=false; // true | false
side=1;       //    1 | -1

difference() {
    cube([height, 11, 11], center=true);
    translate([-(height-nutheight)/2+3, 0, 0])
        cube([nutheight, nuthole, 12], center=true);
    translate([+(height-nutheight)/2-3, 0, 0])
        cube([nutheight, nuthole, 12], center=true);
    rotate([0, 90, 0])
        cylinder(height+1, d=4, $fn=30, center=true);
}

if (slider)
color("red")
rotate([90-90*side,0,0])
difference() {
    translate([0,-(11+7)/2,0])
        cube([height, 7, 11], center=true);
    translate([0,-(11+4)/2,side*7])
        cube([height+1, 4, 11], center=true);
}
