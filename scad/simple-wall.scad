include <./templates/basic-dims.scad>

module simple_wall() {
    translate([-section_thickness/2, 0, 0])
    cube([section_thickness, section_width, section_height]);
}

simple_wall();
