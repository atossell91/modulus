include <../../libs/templates/t_commercial_window.scad>
include <../../libs/templates/t_door.scad>
include <../../libs/templates/t_door-frame.scad>
include <../../libs/templates/t_wall.scad>
include <../../libs/templates/t_box-roof.scad>
include <../../libs/templates/t_floor.scad>
include <../../libs/basic-dims.scad>

module front() {
    translate([0, section_width*0, 0]) {
        wall_corner();
    }

    translate([0, section_width, 0]) {
        commercial_window_frame(1);
        commercial_window(1);
    }

    translate([0, section_width*2, 0]) {
        door_offset();
        door_frame_offset();
    }

    translate([0, section_width*3, 0]) {
        commercial_window_frame(2);
        commercial_window(2);
    }

    translate([0, section_width*5, 0]) {
        translate([0, section_width, 0])
        rotate([0, 0, 90])
        wall_corner();
    }
}

module roof() {
    translate([0, section_width*0, 0]) {
        box_roof_corner();
        floor();
    }

    for (i = [1: 5]) {
        translate([0, section_width*i, 0]) {
            box_roof_straight();
            floor();
        }
    }

    translate([0, section_width*5, 0]) {
        translate([0, section_width, 0])
        rotate([0, 0, 90])
        box_roof_corner();
        floor();
    }
}

color([0.8, 0.8, 0.8])
front();

color([1.0, 0.8, 0.6])
translate([section_width*0, -section_width*0, section_height])
roof();
