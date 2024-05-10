include <./basic-dims.scad>

door_width = section_width * 0.8;
door_height = section_height * 0.75;

module door_piece_sketch() {
    difference() {
        square([section_width, section_height]);

        translate([section_width/2 - door_width/2, 0, 0])
        square([door_width, door_height]);
    }   
}

module door_piece() {
    rotate([90, 0, 90])
    translate([0, 0, -section_thickness/2])
    linear_extrude(section_thickness)
    door_piece_sketch();
}