include <../basic-dims.scad>

simple_window_width = 0.6 * section_width;
simple_window_height = 0.4 * section_height;
simple_window_bottom_offset = 0.4 * section_height;

module simple_window_sketch() {
    difference() {
        square([section_width, section_height]);

        translate([
            section_width/2 - simple_window_width/2,
            simple_window_bottom_offset,
            0])
        square([simple_window_width, simple_window_height]);
    }
}

module window() {
    rotate([90, 0, 90])
    translate([0, 0, -section_thickness/2])
    linear_extrude(section_thickness)
    simple_window_sketch();
}
