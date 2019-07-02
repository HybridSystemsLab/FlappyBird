function xdot = f(x)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Matlab M-file                Author: Torstein Ingebrigtsen Bø
%
% Project: Simulation of a hybrid system (bouncing ball)
%
% Description: Flow map
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    global fx fy g
    % state
    x1 = x(1);
    x2 = x(2);
    x3= x(3);
    q = x(4);
  
    
    
        
    

     %xdot = [fx; fy;g;q;0,t];
    % differential equations
    if q==1
        xdot = [fx ; fy;0;0;1];
    else
        xdot = [fx ; x3;g;0;1];
    end


end