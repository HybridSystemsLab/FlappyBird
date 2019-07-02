function bounds=FindUpperBound(x0,simTime)

       

        
        %generate all input sequences possible
        input_sequence = dec2bin(2^simTime-1:-1:0)-'0';
        
        %start by assuming all sequences are with collision
        valid_input= Inf*(ones(1,size(input_sequence,2)));
        
        bounds =[];
        
        
        
        
        %silly code here
        
        %find upper bound
        ii =1;
        
        while ii< size(input_sequence,1)
            u= input_sequence(ii,:);
            valid_input = check_collision(x0,u);
            
            %speed up reachability set search
            check = sum(valid_input==Inf);
            if check==0 %check if we find the first safe input
                bounds = [bounds;valid_input];
                break;
            else % if valid_input contain INF
                %find index of Inf
                idx = find(valid_input==Inf);
                temp = ii ; %store which row of input we checked
                for k = ii:size(input_sequence,1)
                    
                    if(idx(1)==1) %check if the first input make violates the constraint
                       ii = 2^(size(input_sequence,2)-1);
                       % ii = 2^size(input_sequence,2) - 2^(size(input_sequence,2)-idx(1)-1) - 1;
                        
                        
                        break;
                    end
                        
                    %skip all invalid sequnces
                    if sum(valid_input(1:idx(1))==input_sequence(k,1:idx(1)))==idx(1)-1
                        ii= ii+1;
                    else
                        %ii= ii+1;
                        break;
                    end
                end      
            end
            ii=ii+1;
        end
       
       u; 
 end
    