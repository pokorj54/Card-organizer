module card_organizer(
    n_modules, module_length, height, width, thickness, angle
    ){
    whole_length = (module_length+thickness)*n_modules+thickness;
    for(i = [0: module_length+thickness : whole_length])
        translate([0,i,0])
            cube([width+ 2*thickness, thickness, height]);
    cube([width+ 2*thickness, whole_length, thickness]);
    for(i = [0, width+thickness])
        translate([i, 0,0])
            cube([thickness, whole_length, height]);
}

card_organizer(3, 40, 50, 90, 3, 10);