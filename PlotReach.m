function endpoints= PlotReach(x0,validInput)

        
        global obstacles TSPAN JSPAN rule options u index
        
        
        endpoints=[];
        
        for ii=1:size(validInput,1)
            
             %Find inputs without Inf( collision)
            %validInput(ii,:);
            if(sum(validInput(ii,:)==Inf)>0) % if valid_input contain INF
                continue;
            else
                
                
                u = validInput(ii,:);
                index = 1;
                
                x0(4) = u(1);
                
                [t j x]= HyEQsolver( @f,@g,@C,@D,x0,TSPAN,JSPAN,rule,options);

                 %plot safe recable sets
                 figure(9) % velocity
                 draw_obstacles(obstacles);
                 hold on
                 grid on
                 plot(x(:,1),x(:,2))
                 endpoints= [endpoints;x(end,1) x(end,2)];
                  
                
            end
        end
        
        
    end
    