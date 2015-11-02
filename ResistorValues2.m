clc;
clear all;

resistors = [10,11,12,13,14,15,16,17,18,20,22,24,27,30,33,36,39,43,51,56,62,68,75,82,91,100,110,120,130,150,160,180,200,220,240,270,300,330,360,390,430,470,510,560,620,680,750,820,910,1000];
c1 = 1 *10e-6;

for r1=resistors
    for r2=resistors
        for r3=resistors
            wo = 1/(c1*(r1+r2+r3));
            if( (abs(wo-942.5)/wo) <= 0.1 )
                display(r1);
                display(r2);
                display(r3);
            end
        end
    end
end