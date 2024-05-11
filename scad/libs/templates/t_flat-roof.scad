include <../basic-dims.scad>

flat_roof_wall_offset = section_thickness/2;

module flat_roof_straight() {
    rotate([0, 0, 90])
    translate([0, -flat_roof_wall_offset, 0])
    union() {
        translate([0, 0, section_thickness])
        cube([section_width, section_thickness, section_thickness]);
        cube([section_width, section_width + flat_roof_wall_offset, section_thickness]);
    }
}

module flat_roof_corner() {
    rotate([0, 0, 90])
    translate([-flat_roof_wall_offset, -flat_roof_wall_offset, 0])
    union() {
        translate([0, 0, section_thickness]) {
            cube([section_width + flat_roof_wall_offset, section_thickness, section_thickness]);
            cube([section_thickness, section_width + flat_roof_wall_offset, section_thickness]);
        }
        cube([
                section_width + flat_roof_wall_offset,
                section_width + flat_roof_wall_offset,
                section_thickness
            ]);
    }
}

module flat_roof_diagonal() {
    corrected_width = section_width + flat_roof_wall_offset;

    rotate([0, 0, 180])
    translate([-flat_roof_wall_offset, -flat_roof_wall_offset - section_width, 0])
    union() {
        linear_extrude(section_thickness)
        polygon([
            [0, corrected_width],
            [corrected_width, corrected_width],
            [corrected_width, 0]
        ]);

        translate([0, 0, section_thickness])
        linear_extrude(section_thickness)
        polygon([
            [0, corrected_width],
            [section_thickness, corrected_width],
            [corrected_width, section_thickness],
            [corrected_width, 0]
        ]);
    }
}

module flat_roof_square() {
    translate([-section_width, 0, 0])
    cube([section_width, section_width, section_thickness]);
}
