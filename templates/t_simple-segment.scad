include <../templates/basic-dims.scad>

module simple_segment() {
    translate([-section_thickness/2, 0, 0])
    cube([section_thickness, section_width, section_height]);
}
