include <../basic-dims.scad>

module diagonalize_triangle_sketch(t = section_thickness) {
    x = sin(45) * t;
    y = cos(45) * t;

    polygon([
        [0, y],
        [x, 0],
        [0, -y]
    ]);
}

module diagonalize_triangle(t = section_thickness) {
    rotate([0, 0, 90])
    linear_extrude(section_height)
    diagonalize_triangle_sketch(t);
}

module diagonalize2D() {
    thickness = section_thickness / rt;

    trans = (section_thickness/2)*rt/2;
    len_scale = rt - section_thickness / (rt * section_width);

    rotate([0, 0, 45])
    translate([trans, 0, 0])
    scale([len_scale, 1/rt, 1])
    children();
}


module diagonalize3D(w = section_width, t = section_thickness, edges = "trans") {

    trans = (t/2)*rt/2;
    len_scale = rt - t / (rt * w);

    edge_angle = edges == "cis" ? 270 : 180;
    
    diagonalize_triangle(t/rt);

    translate([-w, w, 0])
    rotate([0, 0, edge_angle]) // 180 For continue, -90 (270) for end
    diagonalize_triangle(t/rt);

    rotate([0, 0, 45])
    translate([0, trans, 0])
    scale([1/rt, len_scale, 1])
    children();
}
