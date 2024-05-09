include <../templates/basic-dims.scad>

window_width = 0.6 * section_width;
window_height = 0.4 * section_height;
bottom_offset = 0.4 * section_height;

module simple_window_sketch() {
    difference() {
        square([section_width, section_height]);

        translate([
            section_width/2 - window_width/2,
            bottom_offset,
            0])
        square([window_width, window_height]);
    }
}

module simple_window() {
    rotate([90, 0, 90])
    translate([0, 0, -section_thickness/2])
    linear_extrude(section_thickness)
    simple_window_sketch();
}
