include <../basic-dims.scad>
include <../modifiers/cornerize.scad>

module wall() {
    translate([-section_thickness/2, 0, 0])
    cube([section_thickness, section_width, section_height]);
}

module wall_corner() {
    cornerize() {
        wall();
        wall();
    }
}
