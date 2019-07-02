%%
%--------------------------------------------------------------------------
%										run.m
%--------------------------------------------------------------------------
%**************************************************************************
% @ Author                   : 		Yegeta Zeleke                                            	        
% @file_name				 : 		 run.m														  
% @ Date                     : 	   11/02/18                                                     
% @ Discription				 :      Motion Planning for flappy bird
% @ Usage					 :      run('x0',[2.65;1.2;0.1;0;0],'ObstacleSetup',3,'horizon',8)    																						  
%@Revision					 :  	11/5/18                                                                                      
%***************************************************************************

function run(X0_,x0,obstacleSetup,pick, horizon_, horizon,simTime_,simTime)


    %global variables
    close all;clc;
    %clc
    global fx fy obstacles  pipe_width ref  Pipe_type TSPAN JSPAN rule options terminate g fyy
    global Tstar

    Tstar = 0.13;
    
    pipe_width = 0.7;
    fx =1.9;
    fy =1.2;
    fyy = 0;
    g = -12;
    terminate =0;
    
    ref =2;

    Pipe_type =[2   2;
                1.5 2.5;
                1   3];
            

    obstacles=chooseObstacle(pick);
    %draw_obstacles(obstacles);
  %%  
    % Initial conditions 
    x1_0 = [2.65 0.8 0.1 4];%0.34;
    x2_0 = [1.2 3 2.2 5];
    x3_0 = [0.1 0.1 0.1 0.1];
    x4_0 = zeros(1,4);
    x5_0= zeros(1,4); %timer
    goal =  10;

    % simulation horizon
    TSPAN=[0 3];
    JSPAN = [0 1000];

    % rule for jumps
    % rule = 1 -> priority for jumps
    % rule = 2 -> priority for flows
    rule = 1;

    options = odeset('RelTol',1e-6,'MaxStep',.5);
    
    %j_tf=1;
   
    k=4;
    %x0= [x1_0(k);x2_0(k);x3_0(k);x4_0(k);x5_0(k)];

    Nx =15;%prediction horizon
    Nu =Nx; %control horizon
    
    total_jumps = 0;
    
    
    %FindUpperBound(x0,goal);
    
    step = horizon;
    %simTime =step*3;
    
    validInput=[];
    %validInput= reachableSet(x0,simTime);
    %validInput=  reachableSetBounds(x0,simTime);
    
    %%
    x0_upper =x0;
    x0_lower =x0;
    ii=0;
    while ii<simTime
        ii=ii+step;
        
        validInput_upper=  FindUpperBound(x0_upper,step);
        temp = PlotReach(x0_upper,validInput_upper);
        x0_upper = [temp'; x0(3);0;1];
        
        validInput_lower=  FindLowerBound(x0_lower,step);
        temp = PlotReach(x0_lower,validInput_lower);
        x0_lower = [temp'; x0(3);0;0];
        
    end
    
    
    

    



end
 


