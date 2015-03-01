
plateWidth = 134;
plateHeight = 113;
width = 1;

// DHT11
sensorWidth = 12;
sensorHeight = 15.5;

// DHT22
sensorWidth = 15;
sensorHeight = 20;

leftHolePadding = 20;

difference() {
translate([plateWidth/-2,-1 * width,0]) cube([134, width, 113]);

// Screws
translate([plateWidth/2-35.5,1,plateHeight-7.5]) rotate([90,0,0]) cylinder(r=7/2, h=width+2);
translate([plateWidth/-2+34.5,1,plateHeight-7.5]) rotate([90,0,0]) cylinder(r=7/2, h=width+2);
translate([plateWidth/2-34.5,1,7.5]) rotate([90,0,0]) cylinder(r=7/2, h=width+2);
translate([plateWidth/-2+34.5,1,7.5]) rotate([90,0,0]) cylinder(r=7/2, h=width+2);

// Light switch
translate([plateWidth/2-34.5-39/2,-1 * width -1,22]) cube([39, width+2, 67]);

// Button
translate([plateWidth/-2+34.5,1,leftHolePadding+16/2+10]) rotate([90,0,0]) cylinder(r=16/2, h=width+2);

// Sensor
translate([plateWidth/-2+34.5-sensorWidth/2,-1 * width - 1, plateHeight-leftHolePadding-sensorHeight-10]) cube([sensorWidth, width+2, sensorHeight]);
}