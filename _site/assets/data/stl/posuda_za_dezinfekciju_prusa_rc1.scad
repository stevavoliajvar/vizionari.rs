// parametri za podesavanje (u mm)
H = 25;     // dubina posude
gap = 2;    // razmak izmedju nosaca i zida
wall = 2.5; // debljina zida i dna


gap2 = gap*2;
wall2 = wall*2;
$fn=200;

//srednji deo
difference() {
    tear(98.7-gap2, H);
    tear(98.7-gap2-(wall2), H);
}

// izmedju dve trake
difference() {
    translate([0,8,0])
        tear(116-(2*2)-(2*gap), H);
    tear(98.7+(2*1.5)+(2*gap), H+1);
}

//okvir i dno
translate([0,8,0]){
    difference() {
        union() {
            difference () {
                translate([0,0,-wall])
                    tear(116+gap2 + wall2, H + wall);
                translate([-50/2, -78-50-wall, -wall])
                    cube([50,50,H+wall]);
                translate([0,-8,-wall])
                    tear(98.7-gap2-(wall2), wall);
            }

            //donje kacaljke
            translate([57.5,-20,-wall])
                cylinder(d=gap2+5+wall2, h=H+wall);
            translate([-57.5,-20,-wall])
                cylinder(d=gap2+5+wall2, h=H+wall);
            
            //gornje kacaljke
            translate([28.5,53,-wall])
                cylinder(d=gap2+5+wall2, h=H+wall);
            translate([-28.5,53,-wall])
                cylinder(d=gap2+5+wall2, h=H+wall);
            
            //kuka za gumicu
            intersection() {
                union(){
                    translate([17.5,-65,-wall])
                        cylinder(d=gap2+25+wall2, h=H+wall);
                    translate([-17.5,-65,-wall])
                        cylinder(d=gap2+25+wall2, h=H+wall);
                }
                difference() {
                    translate([0,0,-wall])
                        tear(116+gap2+17+wall2, H+wall);
                    translate([0,-8,-wall])
                        tear(98.7-gap2-(wall2), wall);
                }
            }
        }
        union() {
            difference () {
                tear(116+gap2, H);
                translate([-50/2, -78-50, -wall])
                    cube([50,50,H+wall]);
            }
            //donje kacaljke
            translate([57.5,-20,0])
                cylinder(d=gap2+5, h=H);
            translate([-57.5,-20,0])
                cylinder(d=gap2+5, h=H);
            
            //gornje kacaljke
            translate([28.5,53,0])
                cylinder(d=gap2+5, h=H);
            translate([-28.5,53,0])
                cylinder(d=gap2+5, h=H);
            
            //kuka za gumicu
            intersection() {
                union(){
                    translate([17.5,-65,-wall])
                        cylinder(d=gap2+25, h=H+wall);
                    translate([-17.5,-65,-wall])
                        cylinder(d=gap2+25, h=H+wall);
                }
                tear(116+gap2+17, H);
            }
        }
    }
}

// nosac vizira R1 (nije deo modela)
%translate([-613.6,-8.5,0])import("covid19_shield_r1.stl");

// modul suza
module tear(D, H)
{
   cylinder(d=D, h=H);
   rotate([0,0,-135])cube([D/2,D/2,H]);
}