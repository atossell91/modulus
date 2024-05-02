include <./templates/basic-dims.scad>

$fn = 20;

foot_height = unit;
foot_diam = unit /4;
foot_angle = 30;
foot_count = 4;

table_pole_diam = foot_diam + cos(foot_angle) * foot_diam /2;
table_pole_height = unit;

table_surface_thickness = unit /4;
table_surface_diam = unit * 6;

module foot_sketch() {
    translate([0, foot_diam/2, 0]) {
        square([foot_diam/2, foot_height - foot_diam]);
        difference() {
            circle(d = foot_diam);

            square([foot_diam/2, foot_diam/2]);

            translate([-foot_diam, -foot_diam/2, 0])
            square([foot_diam, foot_diam]);
        }
    }
}

module foot_join_sketch() {
    di = table_pole_diam;

    difference() {

        circle(d = di);
        
        translate([-di/2, -di/2, 0])
        square([di/2, di/2]);

        translate([-di/2, 0, 0])
        square([di, di]);
    }
}

module table_pole() {
    cylinder(d = table_pole_diam, table_pole_height);
}

module table_surface() {
    cylinder(d = table_surface_diam, h = table_surface_thickness );
}

module foot() {
    rotate_extrude()
    foot_sketch();
}

module foot_join() {
    rotate_extrude()
    foot_join_sketch();
}

module feet() {
    foot_join();
    angle = 360 / foot_count;
    for (i = [0 : foot_count -1]) {
        rotate([0, foot_angle, i * angle])
        translate([0, 0, -foot_height])
        foot();
    }
}