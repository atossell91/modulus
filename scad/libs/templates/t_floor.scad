include <../basic-dims.scad>

floor_tile_thickness = unit / 50;

module floor() {
    translate([0, 0, -floor_tile_thickness])
    cube([section_width, section_width, floor_tile_thickness]);
}
