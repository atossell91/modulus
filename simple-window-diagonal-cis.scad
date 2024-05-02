include <./templates/t_simple-window.scad>
include <./modifiers/diagonalize.scad>

diagonalize3D(edges="cis")
simple_window();
