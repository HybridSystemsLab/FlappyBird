function bounds=reachableSetBounds(x0,simTime)

       

        
        %generate all input sequences possible
        input_sequence = dec2bin(2^simTime-1:-1:0)-'0';
        
        %start by assuming all sequences are with collision
        valid_input= Inf*(ones(size(input_sequence)));
        
        bounds =[];
        
        
        
        
        %silly code here
        
        %find upper bound
        ii =1;
        while ii< size(input_sequence,1)
            u= input_sequence(ii,:);
            valid_input(ii,:) = check_collision(x0,u);
            
            %speed up reachability set search
            check = sum(valid_input(ii,:)==Inf);
            if check==0 %check if we find the first safe input
                bounds = [bounds;valid_input(ii,:)];
                break;
            else % if valid_input contain INF
                %find index of Inf
                idx = find(valid_input(ii,:)==Inf);
                temp = ii ; %store which row of input we checked
                for k = ii:size(input_sequence,1)
                    %skip all invalid sequnces
                    if sum(valid_input(temp,1:idx(1))==input_sequence(k,1:idx(1)))==idx(1)-1
                        ii= ii+1;
                    else
                        ii= ii+1;
                        break;
                    end
                end      
            end
            ii=ii+1;
        end
        
        ii =size(input_sequence,1);
        while ii> 1
            u= input_sequence(ii,:);
            valid_input(ii,:) = check_collision(x0,u);
            
             %speed up reachability set search
            check = sum(valid_input(ii,:)==Inf);
            if check==0 %check if we find the first safe input 
                bounds = [bounds;valid_input(ii,:)];
                break;
            else % if valid_input contain INF
                %find index of Inf
                idx = find(valid_input(ii,:)==Inf);
                temp = ii ; %store which row of input we checked
                for k = ii:-1:1
                    %skip all invalid sequnces
                    if sum(valid_input(temp,1:idx(1))==input_sequence(k,1:idx(1)))==idx(1)-1
                        ii= ii-1;
                    else
                        %valid_input(temp,1:idx(1));
                        %input_sequence(j,1:idx(1))
                        ii= ii+1;
                        break;
                    end
                end      
            end
            ii=ii-1;
        end
        
 end
    