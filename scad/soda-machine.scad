dispenser_width = 10;
dispenser_height = 12;
dispenser_depth = 10;

nozzle_height = 3;
nozzle_top_rad = 3;
nozzle_bottom_rad_offset = 1;

dispenser_arm_length = 10;
dispenser_arm_width = 2;
dispenser_arm_thickness = 0.5;

machine_width = 70;

machine_top_height = 35;
machine_top_depth = 45;

machine_body_height = 45;
machine_body_depth = 30;

module dispenser_box() {
    cube([dispenser_depth, dispenser_width, dispenser_height]);
}

module dispenser_nozzle() {
    nozzle_bottom_rad = nozzle_top_rad - nozzle_bottom_rad_offset;

    rotate_extrude()
    polygon([
        [0, 0],
        [nozzle_bottom_rad, 0],
        [nozzle_top_rad, nozzle_height],
        [0, nozzle_height]
    ]);
}

module dispenser_arm() {
    flick_len = dispenser_arm_length * 0.2;
    flick_angle = 30;
    flick_offset = tan(flick_angle);

    arm_top =  dispenser_arm_length - flick_len;

    translate([-dispenser_arm_thickness*0/2, dispenser_arm_width/2, -arm_top])
    rotate([90, 0, 0])
    linear_extrude(dispenser_arm_width)
    polygon([
        [dispenser_arm_thickness, 0],
        [dispenser_arm_thickness, arm_top],
        [0, arm_top],
        [0, 0],
        [flick_offset, -flick_len],
        [flick_offset + dispenser_arm_thickness, -flick_len]
    ]);
}

module whole_dispenser() {
    translate([0, 0, -dispenser_height]) {
        dispenser_box();

        translate([dispenser_width/2, dispenser_depth/2, -nozzle_height])
        dispenser_nozzle();

        translate([dispenser_depth*0.1, dispenser_width/2, 0])
        dispenser_arm();
    }
}

module dispenser_array(count, sep) {
    for (i = [0: count-1]) {
        translate([0, (dispenser_width + sep) * i, 0])
        whole_dispenser();
    }
}

module machine_top() {
    cube([machine_top_depth, machine_width, machine_top_height]);
}

module machine_body() {
    cube([machine_body_depth, machine_width, machine_body_height]);
}

translate([0, 0, machine_body_height]) {
    color([1.0, 0.7, 0.7])
    machine_top();

    color([0.4, 0.4, 0.4])
    translate([machine_body_depth, 0, 0])
    dispenser_array(5, dispenser_width*0.4);

}

color([0.8, 0.8, 1.0])
machine_body();

