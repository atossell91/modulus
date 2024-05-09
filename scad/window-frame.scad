include <./templates/basic-dims.scad>
include <./templates/t_simple-window.scad>

frame_thickness = unit / 20;
frame_depth = section_thickness + frame_thickness;

total_width = window_width;
total_height = window_height;

module window_frame_sketch() {

    pane_width = total_width - frame_thickness*2;
    pane_height = total_height/2 - frame_thickness*3/2;

    pane_horz_trans = total_width/2 - pane_width/2;

    difference() {
        square([total_width,  total_height]);

        translate([pane_horz_trans, pane_height + frame_thickness*2, 0])
        square([pane_width, pane_height]);

        translate([pane_horz_trans, frame_thickness, 0])
        square([pane_width, pane_height]);
    }
}

module window_frame() {
    translate([-frame_depth/2, section_width/2-total_width/2, bottom_offset])
    rotate([90, 0, 90])
    linear_extrude(frame_depth)
    window_frame_sketch();
}


//window_frame_sketch();
color([0.9, 0.4, 0.25])
simple_window();

color([0.2, 0.0, 0.0])
window_frame();
