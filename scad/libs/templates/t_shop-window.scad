include <../basic-dims.scad>
include <../modifiers/diagonalize.scad>

shop_window_total_width = section_width * 2;

shop_window_width = shop_window_total_width * 0.9;
shop_window_height = section_height * 0.6;
shop_window_window_offset_bottom = section_height * 0.25;

shop_window_bar_diam = section_thickness * 0.45;
shop_window_window_padding = (shop_window_total_width - shop_window_width)/2;
bar_x_offset = shop_window_window_padding;
shop_window_num_bars = 8;
shop_window_bar_gap = shop_window_width/(shop_window_num_bars + 1);

shop_window_frame_frame_thickness = unit / 20;
shop_window_frame_frame_depth = section_thickness + shop_window_frame_frame_thickness;

shop_window_frame_total_width = shop_window_width;
shop_window_frame_total_height = shop_window_height;

module shop_window_sketch() {

    difference() {
        square([shop_window_total_width, section_height]);

        translate([shop_window_total_width/2 - shop_window_width/2, shop_window_window_offset_bottom, 0])
        square([shop_window_width, shop_window_height]);
    }
}

module shop_window_frame_sketch() {

    pane_width = shop_window_frame_total_width - shop_window_frame_frame_thickness*2;
    pane_height = shop_window_frame_total_height - shop_window_frame_frame_thickness*2;

    pane_horz_trans = shop_window_frame_total_width/2 - pane_width/2;

    difference() {
        square([shop_window_frame_total_width,  shop_window_frame_total_height]);

        translate([pane_horz_trans, shop_window_frame_frame_thickness, 0])
        square([pane_width, pane_height]);
    }
}

module shop_window() {
    rotate([90, 0, 90])
    translate([0, 0, -section_thickness/2])
    linear_extrude(section_thickness)
    shop_window_sketch();
}

module shop_window_bars() {
    rotate([90, 0, 90])
    for (i = [1 : shop_window_num_bars]) {
        translate([0, 0, -section_thickness/2])
        translate([bar_x_offset + shop_window_bar_gap* i, shop_window_window_offset_bottom, section_thickness/2])
        rotate([-90, 0, 0])
        cylinder(d=shop_window_bar_diam, h = shop_window_height);
    }
}

module shop_window_frame() {
    translate([-shop_window_frame_frame_depth/2, section_width-shop_window_frame_total_width/2, shop_window_window_offset_bottom])
    rotate([90, 0, 90])
    linear_extrude(shop_window_frame_frame_depth)
    shop_window_frame_sketch();
}
