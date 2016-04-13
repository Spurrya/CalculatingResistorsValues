clc;
clear all;

%Resistance at 10 degrees
rt10 = 140.065;

%Resistance at 50 degrees
rt50 = 23.46998;

%All the available resistor values
resistors = [10,11,12,13,14,15,16,17,18,20,22,24,27,30,33,36,39,43,51,56,62,68,75,82,91,100,110,120,130,150,160,180,200,220,240,270,300,330,360,390,430,470,510,560,620,680,750,820,910,1000];
newr = resistors;

%%Finding parallel solutions
for z1 = resistors
   for z2 = resistors
       resistor = z1*z2/(z1+z2);
       newr = [newr resistor];
   end    
end
for r1 = newr
    display(r1);
    rth10 = ((2*r1)*(rt10+r1))/((3*r1)+rt10);
    rth50 = ((2*r1)*(rt50+r1))/((3*r1)+rt50);
    for r2 = newr
        for r3 = newr
            if((r3+r2) >= rth10*25)
                
                %% This is the value of all the Vout for 10 degrees and 50 degrees celcius
                
                Vout10 = -(r3/r2)*5*((rt10/(r1+rt10))-0.5);
                Vout50 = -(r3/r2)*5*((rt50/(r1+rt50))-0.5);
                %% Adding boundary. Vout 10 should be as close to 0 and Vout should be as close to 5
                
                if( (Vout10 <=0.1)&& (Vout10 >= -0.1) && (Vout50 <=5.1)&& (Vout50 >= 4.9))
                    display(r1);
                    display(r2);
                    display(r3);
                    display (Vout10);
                    display (Vout50);
                end
            end       
        end
    end
end
