include <./templates/basic-dims.scad>
include <./modifiers/cornerize.scad>
include <./templates/t_simple-segment.scad>

cornerize() {
    simple_segment();
    simple_segment();
}