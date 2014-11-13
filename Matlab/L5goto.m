function L5goto(joints, grip, varargin)
    global A B;    
    if(isempty(A) || isempty(B)) % check if A and B have been declared as global
        fprintf('Error: Calibration coefficients have not been specified. Check that they are declared as global.\n');
        return    % end        
    end

    if isempty(varargin)
        flag = 0;
    else
        flag = varargin{1};
    end
    
    joints = joints *180/pi;

    if (flag == 0)
        % establish connection to lynx
        s = serial('/dev/tty.usbserial');
        fopen(s);
        
        for i = 1:4
            p(i) = joints(i)*A(i)+B(i);
        end
        
        toWrite = [255 0 p(1) 255 1 p(2) 255 2 p(3) 255 3 p(4)];
        fwrite(s,toWrite);
        
        fclose(instrfind)   
    elseif (flag == 1)
        L5draw_group5(joints,grip);
    else
        fprintf('Error: Flag argument should be either 0 or 1.\n');
    end
end
