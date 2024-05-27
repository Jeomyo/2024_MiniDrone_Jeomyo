% 드론 객체를 생성 (드론 이름: "TELLO-FE01F2")
droneobj = ryze("TELLO-FE01F2");

% 드론의 카메라 객체를 생성
cameraobj = camera(droneobj);

% 카메라의 실시간 영상을 미리보기 창에 표시
preview(cameraobj);

% 드론 이륙
takeoff(droneobj);
pause(1); % 1초 동안 일시정지

% 드론 왼쪽으로 1미터 이동
moveleft(droneobj,'Distance', 1);
pause(1); % 1초 동안 일시정지

% 드론 제자리에서 360도 회전
turn(droneobj,deg2rad(360));
pause(1); % 1초 동안 일시정지

% 드론 앞으로 1미터 이동
moveforward(droneobj, 'Distance', 1);
pause(1); % 1초 동안 일시정지

% 드론 제자리에서 90도 회전
turn(droneobj,deg2rad(90));
pause(1); % 1초 동안 일시정지

% 드론 앞으로 1미터 이동
moveforward(droneobj, 'Distance', 1);
pause(1); % 1초 동안 일시정지

% 드론의 카메라로 사진 찍고 표시
frame = snapshot(cameraobj);
imshow(frame);

% 드론 제자리에서 360도 회전
turn(droneobj,deg2rad(360));
pause(1); % 1초 동안 일시정지

% 드론 오른쪽으로 1미터 이동
moveright(droneobj,'Distance', 1);
pause(1); % 1초 동안 일시정지

% 드론 착륙
land(droneobj);

% 모든 변수 초기화
clear all;
