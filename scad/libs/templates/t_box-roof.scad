include <../basic-dims.scad>

include <../modifiers/cornerize.scad>

include <./t_flat-roof.scad>

_box_roof_wall_height = unit/3;

module _roof_wall() {
    translate([-section_thickness/2, 0, 0])
    cube([section_thickness, section_width, _box_roof_wall_height]);
}

module box_roof_square() {
    translate([0, 0, _box_roof_wall_height]) {
        flat_roof_square();
    }
}

module box_roof_straight() {
    translate([0, 0, _box_roof_wall_height])
    flat_roof_straight();

    _roof_wall();
}

module box_roof_corner() {
    translate([0, 0, _box_roof_wall_height])
    flat_roof_corner();

    cornerize(height=_box_roof_wall_height) {
        _roof_wall();
        _roof_wall();
    }
}
