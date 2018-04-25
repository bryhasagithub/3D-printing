eta=0.01;
$fn=50;

BallDiameter = 15;

sphere(d=BallDiameter);
cylinder(d=8, h=20);

translate([0, 0, 20-eta+1.5])
    cube([15, 2.75+3+3+3+2.75, 3+2*eta], center = true);

translate([0, -2.75-3-1.5, 33])
rotate([-90, 0, 0])
    goprotoaster();

module goprotoaster()
{
    slice(2.75);
    translate([0, 0, 2.75+3])
        slice(3);
    translate([0, 0, 2.75 + 3 + 3 +3]) {
        slice(2.75);

        translate([0, 0, 2.75-eta])
        difference() {
            cylinder(d1=15, d2=12, h=3);
            
            translate([0,0,-eta])
                cylinder(d=9.5, $fn=6, h=3+2*eta);
        }
    }
}

module slice(thickness)
{
    linear_extrude(thickness)
    difference() {
        union() {
            circle(d=15);
            translate([-7.5, 0, 0])
                square([15,10]);
        }
        
        circle(d=5.5);
    }
}
