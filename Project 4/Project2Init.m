point = 2; % Starting point is 2 since 0 is point 1
Speed = 280; % mph

x = [0]; % Initialize x coordinate array for waypoints
y = [0]; % Initialize y coordinate array for waypoints
psi = [0]; % Initialize yaw angle array for waypoints


%%% 200*pi is r*pi which is half a circumfrence %%%

a1 = linspace(-90, 90, 200*pi()); % angles for right curve
a2 = linspace(90, -90, 200*pi()); % angles for left curve

% Create Track points using while loop and if statements
% 1800 + 400*pi is total track length (900 + 900 + 200*pi + 200*pi)

while point <= 1800 + 400*pi() % while less than total track length 
    
    if point <= 900 % straightaway 1
        x(end+1) = point;
        y(end+1) = 0;

    elseif point <= 900 + (200*pi()) % curve 1

        %{
         (point-900) starts you with point=1 for the
         curve, which gets the corresponding angle from a1.
         cosd() and sind() get x & y components of the angle multiplied
         by 200 which is the raidus. 900 is added from the first
         straightaway to x, 200 is added to y.
        %}
        x(end+1) = 900 + (200*cosd(a1(point - 900))); % x coordinate of curve
        y(end+1) = 200 + 200*sind(a1(point - 900)); % y coordinate of curve
        
    elseif point <= 1800 + (200*pi()) % straightaway 2

        %{
          (point - (900 + (200*pi())) starts you with point=1 for the 
          straightaway. 900 - (point - (900 + (200*pi()))) starts plotting
          the straightaway from right to left.
        %}
        x(end+1) = 900 - (point - (900 + (200*pi())));
        y(end+1) = 400;

    elseif point <= 1800 + (400*pi()) % curve 2

        %{
        (point-2428) starts you with point = 1 for the curve,
        which gets the corrsponding angle from a2. cosd() and sind()
        get x and y component multiplied by radius. 200 is added
        to y.
        %}
        x(end+1) = -200 * cosd(a2(point - 2428)); % x coordinate of curve
        y(end+1) = 200 + 200*sind(a2(point - 2428)); % y coordinate of curve
        
    end

    % Calculate the angle based on the change in coordinates
    dx = x(end) - x(end-1); % change in x coordinate
    dy = y(end) - y(end-1); % change in y coordinate 
    psi(end+1) = atan2(dy, dx) * (180/pi); % angle in degrees using arctan

    point = point + 1; % increment point
end