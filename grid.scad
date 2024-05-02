include <./templates/basic-dims.scad>

thickness = 5;
length = 1000000;

num_lines = 10;

module vert_line() {
    translate([-thickness/2, -length/2, 0])
    square([thickness, length]);
}

module horz_line() {
    translate([-length/2, -thickness/2, 0])
    square([length, thickness]);
}

module grid() {
    sep = section_width/num_lines;
    for (i = [0 : num_lines]) {
        trans = i * sep;
        translate([trans, 0, 0])
        vert_line();

        translate([0, trans, 0])
        horz_line();
    }
}