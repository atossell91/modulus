include <../templates/basic-dims.scad>
include <../templates/t_simple-segment.scad>
include <../templates/t_simple-wall-corner.scad>
include <../templates/t_simple-door.scad>
include <../templates/t_shop-window.scad>
include <../templates/t_flat-roof.scad>

simple_wall_corner();

translate([0, section_width, 0])
door_piece();

translate([0, section_width*2, 0])
shop_window();


translate([0, section_width*4, 0])
simple_wall();

translate([0, section_width*5, 0])
rotate([0, 0, 90])
simple_wall_corner();

for (i = [0 : 3]) {
    translate([-section_width*i, 0, 0])
    rotate([0, 0, 90])
    simple_wall();

    translate([-section_width*i, section_width*5, 0])
    rotate([0, 0, 90])
    simple_wall();
}

translate([-section_width*5, 0, 0])
rotate([0, 0, -90])
simple_wall_corner();

translate([-section_width*5, section_width*5, 0])
rotate([0, 0, -180])
simple_wall_corner();

translate([-section_width*5, section_width*3, 0]) 
door_piece();

for (i = [0 : 1]) {
    translate([-section_width*5, section_width + section_width*i, 0])
    simple_wall();
}

translate([0, 0, section_height]) {
    flat_roof_corner();

    translate([0, 5 * section_width, 0])
    rotate([0, 0, 90])
    flat_roof_corner();

    translate([-section_width*5, 5 * section_width, 0])
    rotate([0, 0, 180])
    flat_roof_corner();

    translate([-section_width*5, 0, 0])
    rotate([0, 0, -90])
    flat_roof_corner();
}
