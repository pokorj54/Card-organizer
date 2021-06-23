module card_organizer(
    n_modules,          // number of slots for cards
    module_length,      // lenght of the module in the direction in which it will be stacked
    height,             // height of the whole card organizer
    width,              // width of the whole card organizer
    thickness,          // thickness of every wall 
    angle               // angle by which the card organizer will be sheared
    ){
// shear matrix
multmatrix(
m = [
        [1, 0,0,0],
        [0,1,tan(angle),0],
        [0,0,1,0],
        [0,0,0,1]
    ])
    {
        whole_length = (module_length+thickness)*n_modules+thickness;
        // spacers
        for(i = [0: module_length+thickness : whole_length])
            translate([0,i,0])
                cube([width+ 2*thickness, thickness, height]);
        // base
        cube([width+ 2*thickness, whole_length, thickness]);
        // walls
        for(i = [0, width+thickness])
            translate([i, 0,0])
                cube([thickness, whole_length, height]);
    }
}

card_organizer(3, 40, 40, 92, 2, 20);