include <./templates/basic-dims.scad>
include <./templates/t_simple-window.scad>

frame_thickness = unit / 20;
frame_depth = section_thickness + frame_thickness;

total_width = window_width + frame_thickness*1;
total_height = window_height + frame_thickness*1;

module window_frame_sketch() {

    pane_width = window_width;
    pane_height = window_height/2 - frame_thickness/2;

    difference() {
        square([total_width,  total_height]);

        translate([frame_thickness, pane_height + frame_thickness*2, 0])
        square([pane_width, pane_height]);

        translate([frame_thickness, frame_thickness, 0])
        square([pane_width, pane_height]);
    }
}

module window_frame() {
    translate([-frame_depth/2, section_width/2-total_width/2, bottom_offset])
    rotate([90, 0, 90])
    linear_extrude(frame_depth)
    window_frame_sketch();
}


window_frame_sketch();
//simple_window();
//window_frame();
