include <../basic-dims.scad>
include <./t_door.scad>

door_frame_frame_thickness = unit / 20;
door_frame_frame_depth = section_thickness + unit/20;

door_frame_frame_inner_width = simple_door_door_width - door_frame_frame_thickness*2;
door_frame_frame_inner_height = simple_door_door_height - door_frame_frame_thickness;

module door_frame_sketch() {
    difference() {
        square([simple_door_door_width, simple_door_door_height]);

        translate([door_frame_frame_thickness, 0, 0])
        square([simple_door_door_width - door_frame_frame_thickness*2, simple_door_door_height - door_frame_frame_thickness]);
    }
}

module door_frame() {
    translate([0, section_width/2-simple_door_door_width/2, 0])
    translate([-door_frame_frame_depth/2, 0, 0])
    rotate([90, 0, 90])
    linear_extrude(door_frame_frame_depth)
    door_frame_sketch();
}

module door_frame_offset() {
    translate([0, 0, 0])
    translate([-door_frame_frame_depth/2, 0, 0])
    rotate([90, 0, 90])
    linear_extrude(door_frame_frame_depth)
    door_frame_sketch();
}
