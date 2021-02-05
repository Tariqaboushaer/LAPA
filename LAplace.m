set(0, 'DefaultFigureWindowStyle','docked')
clc;
clear all;
close all;

nx=100;
ny=100;
iter=1000;
V = zeros(nx,ny);

for i = 1:nx
    V(i,1) = 1;
    V(i,nx) = 0; 
pause(0.01);
end


for n = 1:iter
    for j = 2:ny-1
        for i = 2:nx-1
            left = V(i-1,j);
            top = V(i,j-1);
            right = V(i+1,j);
            bottom = V(i,j+1);
            V(i,j) = (left+right+top+bottom)/4;
        end
    end
    for i = 1:nx
        %part 1 
        %{
        V(1,i) = V(2,i);
        V(ny,i) = V(ny-1,i);
        %}
        
        %part 2 
        %
        V(1,i) = 0;
        V(ny,i) = 0;
        V(1,1) = 1;
        V(1,ny) = 0;
        %}
     
    end

end

[Ex,Ey] = gradient(V);
figure(1)
surf(V)
figure(2)
surf(Ex,Ey);
figure(3)
quiver(Ex,Ey);
