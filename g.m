function xplus = g(x)
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Matlab M-file               Author: Torstein Ingebrigtsen Bø
    %
    % Project: Simulation of a hybrid system (bouncing ball)
    %
    % Description: Jump map
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    global fy index u Tstar obstacles
    % state
    x1 = x(1);
    x2 = x(2);
    t = 0; %reset timer
    
    
    
     if(barrier_function(obstacles,[x(1) x(2)] ))
         u(index) = Inf;
         t=Tstar;
     end
     
     if(index<length(u))
        index = index+1;
     else
         t=Tstar; %for now if we use all inputs make it jumps forever
     end
    
     q = u(index);
     
     if q ==1
         x3 = fy;
     else
         x3= x(3);
     end

    xplus = [x1 ;x2;x3;q;t];
end