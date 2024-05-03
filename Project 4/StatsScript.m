trackPath = struct('radius', 200, 'width', 15, 'l_st', 900); %Define path
simout = sim("P4Model.slx"); %Perform Simulation
car_X = simout.X.Data; %Sim Data
car_Y = simout.Y.Data; %Sim Data
car_time = simout.X.Time; %Sim Data
stats = raceStat(car_X, car_Y, car_time, trackPath,out); %call raceStat function
