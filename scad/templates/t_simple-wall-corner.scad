include <./basic-dims.scad>
include <../modifiers/cornerize.scad>

module simple_wall() {
    translate([-section_thickness/2, 0, 0])
    cube([section_thickness, section_width, section_height]);
}

module simple_wall_corner() {
    cornerize() {
        simple_wall();
        simple_wall();
    }
}
