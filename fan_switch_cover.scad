
plateWidth = 134;
plateHeight = 113;
width = 1;

sensorWidth = 12;
sensorHeight = 15.5;

difference() {
translate([plateWidth/-2,-1 * width,0]) cube([134, width, 113]);

// Screws
translate([plateWidth/2-34.5,1,plateHeight-27]) rotate([90,0,0]) cylinder(r=7/2, h=width+2);
translate([plateWidth/-2+34.5,1,plateHeight-27]) rotate([90,0,0]) cylinder(r=7/2, h=width+2);
translate([plateWidth/2-34.5,1,27]) rotate([90,0,0]) cylinder(r=7/2, h=width+2);
translate([plateWidth/-2+34.5,1,27]) rotate([90,0,0]) cylinder(r=7/2, h=width+2);

// Light switch
translate([plateWidth/2-29-11,-1 * width -1,45]) cube([11, width+2, 24]);

// Button
translate([plateWidth/-2+34.5,1,27+16/2+10]) rotate([90,0,0]) cylinder(r=16/2, h=width+2);

// Sensor
translate([plateWidth/-2+34.5-6,-1 * width - 1, plateHeight-27-sensorHeight-10]) cube([sensorWidth, width+2, sensorHeight]);
}