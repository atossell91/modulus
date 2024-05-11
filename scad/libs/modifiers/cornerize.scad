include <../basic-dims.scad>

trim_depth = 10000;

module cornerize_trim(amount, height = section_height) {
    difference() {
        children();
        translate([-trim_depth/2, 0, 0])
        cube([trim_depth, amount, height]);
    }
}

//  Child 0 is front
//  Child 1 is side
module cornerize(front_width = section_width, front_thickness = section_thickness,
    side_width = section_width, side_thickness = section_thickness) {
    
    new_front_size = front_width - side_thickness/2;
    front_scale_amt = new_front_size / front_width;
    
    new_side_size = side_width - front_thickness/2;
    side_scale_amt = new_side_size / side_width;

    //translate([0, side_thickness/2, 0])
    //scale([1, front_scale_amt, 1])
    cornerize_trim(side_thickness/2)
    children(0);

    rotate([0, 0, 90])
    cornerize_trim(front_thickness/2)
    children(1);

    translate([-front_thickness/2, -side_thickness/2, 0])
    cube([front_thickness, side_thickness, section_height]);
}
