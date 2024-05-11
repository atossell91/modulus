include <../basic-dims.scad>

overhang = section_thickness/2;
roof_len = section_width * 2 + overhang;
roof_height = section_width;

module hipped_roof_sketch() {
    polygon([
        [0, 0],
        [section_thickness, 0],
        [roof_len + section_thickness, roof_height],
        [roof_len, roof_height]
    ]);
}

module hipped_roof_straight() {
    translate([0, roof_len, roof_height])
    rotate([-90, 0, -90])
    linear_extrude(section_width)
    roof_sketch();
}