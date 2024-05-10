include <./templates/basic-dims.scad>
include <./templates/t_simple-door.scad>

frame_thickness = unit / 20;
frame_depth = section_thickness + unit/20;

frame_inner_width = door_width - frame_thickness*2;
frame_inner_height = door_height - frame_thickness;

module door_frame_sketch() {
    difference() {
        square([door_width, door_height]);

        translate([frame_thickness, 0, 0])
        square([door_width - frame_thickness*2, door_height - frame_thickness]);
    }
}

module door_frame() {
    translate([0, section_width/2-door_width/2, 0])
    translate([-frame_depth/2, 0, 0])
    rotate([90, 0, 90])
    linear_extrude(frame_depth)
    door_frame_sketch();
}

//door_piece();
door_frame();
