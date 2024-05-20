droneobj = ryze("TELLO-FE01F2");

cameraobj = camera(droneobj);
preview(cameraobj);

takeoff(droneobj);
pause(1);

moveleft(droneobj,'Distance', 1);
pause(1);

turn(droneobj,deg2rad(360));
pause(1);

moveforward(droneobj, 'Distance', 1);
pause(1);

turn(droneobj,deg2rad(90));
pause(1);

moveforward(droneobj, 'Distance', 1);
pause(1);

frame = snapshot(cameraobj);
imshow(frame);

turn(droneobj,deg2rad(360));
pause(1);

moveright(droneobj,'Distance', 1);
pause(1);

land(droneobj);

clear all;








