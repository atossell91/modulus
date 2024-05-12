include <../basic-dims.scad>

commercial_window_bottom_offset  = unit/2;

commercial_window_gap_width  = section_width;
commercial_window_gap_height  = section_height - commercial_window_bottom_offset;

commercial_window_frame_depth = unit/25;
commercial_window_frame_thickness = unit/25;

module commercial_window_sketch(section_multiplier=1) {
    difference() {
        square([section_width*section_multiplier, section_height]);
        
        translate([0, commercial_window_bottom_offset, 0])
        square([commercial_window_gap_width*section_multiplier,
            commercial_window_gap_height]);
    }
}

module commercial_window_frame_sketch(section_multiplier=1) {
    difference() {
        square([commercial_window_gap_width*section_multiplier,
            commercial_window_gap_height]);

        translate([commercial_window_frame_thickness, commercial_window_frame_thickness, 0])
        square([(commercial_window_gap_width*section_multiplier) - commercial_window_frame_thickness*2,
            commercial_window_gap_height - commercial_window_frame_thickness*2]);
    }
}

module commercial_window(section_multiplier=1) {
    translate([-section_thickness/2, 0, 0])
    rotate([90, 0, 90])
    linear_extrude(section_thickness)
    commercial_window_sketch(section_multiplier);
}

module commercial_window_frame(section_multiplier=1) {
    translate([-commercial_window_frame_depth/2, 0, commercial_window_bottom_offset])
    rotate([90, 0, 90])
    linear_extrude(commercial_window_frame_depth)
    commercial_window_frame_sketch(section_multiplier);
}
