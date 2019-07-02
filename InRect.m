function value = InRect(rect,pose)
  
    x=pose(1);
    y=pose(2);
    if (x>= rect(1)&& x<= rect(1)+rect(3) && y>=rect(2) &&  y<=rect(2)+rect(4))
        value= 1;
    else 
        value= 0;
    end
end