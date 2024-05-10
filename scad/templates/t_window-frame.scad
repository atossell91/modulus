include <./basic-dims.scad>
include <./t_simple-window.scad>

window_frame_frame_thickness = unit / 20;
window_frame_frame_depth = section_thickness + window_frame_frame_thickness;

window_frame_total_width = simple_window_width;
window_frame_total_height = simple_window_height;

module window_frame_sketch() {

    pane_width = window_frame_total_width - window_frame_frame_thickness*2;
    pane_height = window_frame_total_height/2 - window_frame_frame_thickness*3/2;

    pane_horz_trans = window_frame_total_width/2 - pane_width/2;

    difference() {
        square([window_frame_total_width,  window_frame_total_height]);

        translate([pane_horz_trans, pane_height + window_frame_frame_thickness*2, 0])
        square([pane_width, pane_height]);

        translate([pane_horz_trans, window_frame_frame_thickness, 0])
        square([pane_width, pane_height]);
    }
}

module window_frame() {
    translate([-window_frame_frame_depth/2, section_width/2-window_frame_total_width/2, simple_window_bottom_offset])
    rotate([90, 0, 90])
    linear_extrude(window_frame_frame_depth)
    window_frame_sketch();
}
