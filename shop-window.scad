include <./templates/basic-dims.scad>
include <./modifiers/diagonalize.scad>

total_width = section_width * 2;

window_width = total_width * 0.9;
window_height = total_width * 0.6;
window_offset_bottom = section_height * 0.25;

bar_diam = section_thickness * 0.45;
window_padding = (total_width - window_width)/2;
bar_x_offset = window_padding;
num_bars = 8;
bar_gap = window_width/(num_bars + 1);

module wall_sketch() {

    difference() {
        square([total_width, section_height]);

        translate([total_width/2 - window_width/2, window_offset_bottom, 0])
        square([window_width, window_height]);
    }
}

module wall() {
    rotate([90, 0, 90])
    translate([0, 0, -section_thickness/2])
    linear_extrude(section_thickness)
    wall_sketch();
}

module window_bars() {
    rotate([90, 0, 90])
    for (i = [1 : num_bars]) {
        translate([0, 0, -section_thickness/2])
        translate([bar_x_offset + bar_gap* i, window_offset_bottom, section_thickness/2])
        rotate([-90, 0, 0])
        cylinder(d=bar_diam, h = window_height);
    }
}

wall();
window_bars();
