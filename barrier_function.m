            %%
            % @Function: barrier_function
            % @parameter: obsacles, x
            % @return: none
            % @brief: This function takes in each obstacle location as
            %         vectore as well as the birds position and returns
            %         barrir funcion result
            % @note:None
            % @assumtion :  obstalce gap is maintained by the caller
            % @Author: Yegeta Zeleke
            % @Revision: None
            %%


function B = barrier_function(obstacles, pose)
   
    B=0;
    
    j =1;
    
    if min(pose(:,2))<0 || max(pose(:,2))>5
        B=1;
    else
        while j<length(pose) && B==0

            for i =1:length(obstacles)
                if(InRect(obstacles(i,:),pose(j,:)))
                    B =1;
                  break
                end

            end
            j = j+1;
        end
    end
   
    
end