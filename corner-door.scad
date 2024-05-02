include <door-segment.scad>
include <./modifiers/cornerize.scad>

color([0.7, 1.0, 0.7])
translate([-section_width, 0, 0])
square([section_width, section_width]);

cornerize() {
    door_piece();
    door_piece();
}
