            %%
            % @Function: draw_obstacles
            % @parameter: obsacles(a matrix each row contain [x_position,bottomOfGap])
            % @return: none
            % @brief: This function takes in each obstacle location as vectore 
            %          and draws the obstacle
            % @note:None
            % @assumtion :  obstalce gap is maintained by the caller
            % @Author: Yegeta Zeleke
            % @Revision: None
            %%

function draw_obstacles(obstacles)
    
    %celing

    
    
    
    itteration = size(obstacles);
 
    for i =1:itteration(1)
        this_obstacle = obstacles(i,:);
        x =  this_obstacle(1);
        y =  this_obstacle(2);
        w =  this_obstacle(3);
        h =  this_obstacle(4);
       
        %draw obstacle
         
        rectangle('Position',[x,y,w,h],'Curvature',0.2,'FaceColor',[0 0.6 0],'EdgeColor','r',...
            'LineWidth',3)
        
        
    end
end