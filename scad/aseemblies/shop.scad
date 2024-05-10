include <../templates/basic-dims.scad>
include <../templates/t_simple-segment.scad>
include <../templates/t_simple-wall-corner.scad>
include <../templates/t_simple-door.scad>
include <../templates/t_shop-window.scad>
include <../templates/t_flat-roof.scad>
include <../templates/t_simple-window.scad>
include <../templates/t_door-frame.scad>
include <../templates/t_window-frame.scad>

module wall_with_lwindow() {
    simple_wall_corner();

    translate([0, section_width, 0]) {
        door_piece();
        door_frame();
    }

    translate([0, section_width*2, 0]) {
        shop_window();
        window_bars();
    }


    translate([0, section_width*4, 0])
    simple_wall();

    translate([0, section_width*5, 0])
    rotate([0, 0, 90])
    simple_wall_corner();
}

module wall_with_offset_door() {

    simple_wall_corner();

    translate([0, section_width*5, 0])
    rotate([0, 0, 90])
    simple_wall_corner();

    translate([0, section_width, 0]) {
        door_piece();
        door_frame();
    }

    for (i = [1 : 2]) {
        translate([0, section_width + section_width*i, 0])
        simple_wall();
    }
}

module wall_solid_no_corner() {
    for (i = [1 : 3]) {
        translate([0, section_width*i, 0])
        simple_wall();
    }
}

module wall_solid_with_corner() {
    simple_wall_corner();

    for (i = [1 : 3]) {
        translate([0, section_width*i, 0])
        simple_wall();
    }
}

module wall_with_two_windows() {
    simple_wall_corner();

    translate([0, section_width*1, 0]) {
        simple_window();
        window_frame();
    }

    translate([0, section_width*2, 0])
    simple_wall();

    translate([0, section_width*3, 0]) {
        simple_window();
        window_frame();
    }
}

module roof_edge(len) {
    flat_roof_corner();

    for (i = [1:len]) {
        translate([0, i*section_width, 0])
        flat_roof_straight();
    }
}

module roof_middle() {
    for (x = [0 : 2]) {
        for (y = [0 : 2]) {
            translate([-x*section_width, y*section_width, 0])
            flat_roof_square();
        }
    }
}

module roof() {
    roof_edge(3);

    translate([0, section_width*5, 0])
    rotate([0, 0, 90])
    roof_edge(3);

    translate([-section_width*5, section_width*5, 0])
    rotate([0, 0, 180])
    roof_edge(3);

    translate([-section_width*5, 0, 0])
    rotate([0, 0, -90])
    roof_edge(3);

    translate([-section_width, section_width, 0])
    roof_middle();
}

module ground_floor() {
    color([1.0, 0.0, 0.0])
    wall_with_lwindow();

    color([0.0, 1.0, 0.0]) {
        rotate([0, 0, 90])
        wall_solid_no_corner();

        translate([0, section_width*5, 0])
        rotate([0, 0, 90])
        wall_solid_no_corner();
    }

    color([0.0, 0.0, 1.0])
    translate([-section_width*5, section_width*5, 0])
    rotate([0, 0, 180])
    wall_with_offset_door();
}

module first_floor() {
    color([0.0, 0.0, 1.0])
    wall_with_two_windows();

    color([1.0, 0.0, 0.0])
    translate([-section_width*5, 0, 0])
    rotate([0, 0, -90])
    wall_with_two_windows();

    color([1.0, 0.0, 1.0])
    translate([-section_width*5, section_width*5, 0])
    rotate([0, 0, -180])
    wall_solid_with_corner();

    translate([0, section_width*5, 0])
    rotate([0, 0, 90])
    wall_solid_with_corner();
}

ground_floor();

translate([0, 0, section_height])
first_floor();

translate([0, 0, section_height*2])
roof();
