% 이미지 파일 읽기
img = imread('사진1.jpg');

% RGB 채널을 분리하여 특정 조건으로 이진 마스크 생성 (초록색 검출)
r = img(:, :, 1); detect_r = (r < 100); % R 값이 낮은 범위
g = img(:, :, 2); detect_g = (g > 100) & (g < 255); % G 값이 높은 범위
b = img(:, :, 3); detect_b = (b < 100); % B 값이 낮은 범위
green = detect_r & detect_g & detect_b;

% 노이즈 제거를 위해 모폴로지 연산 적용
se = strel('disk', 5); % 구조적 요소
green = imopen(green, se); % 열기 연산으로 작은 객체 제거
green = imclose(green, se); % 닫기 연산으로 구멍 메움

% 구멍을 채움
bw2 = imfill(green, 'holes');

% 구멍을 채우기 전후를 비교하여 값이 일정하면 0, 변했으면 1로 변환
bw2 = bw2 & ~green;

% 작은 객체 제거
bw2 = bwareaopen(bw2, 1000); % 1000 픽셀 이하의 객체 제거

% 컨투어 검출
[B, L] = bwboundaries(bw2, 'noholes');

% 가장 큰 객체 선택
stats = regionprops(L, 'Area', 'Centroid');
[~, maxIdx] = max([stats.Area]);
largestBoundary = B{maxIdx};

% Convex Hull을 사용하여 다각형 근사화
k = convhull(largestBoundary(:, 2), largestBoundary(:, 1));
approxPoly = largestBoundary(k, :);

% 근사 다각형의 중심점 계산
minX = min(approxPoly(:, 2));
maxX = max(approxPoly(:, 2));
minY = min(approxPoly(:, 1));
maxY = max(approxPoly(:, 1));
centroidX = (minX + maxX) / 2;
centroidY = (minY + maxY) / 2;
centroid = [centroidX, centroidY];

% 결과 출력
figure;
imshow(img);
hold on;
plot(approxPoly(:, 2), approxPoly(:, 1), 'g-', 'LineWidth', 1); % 근사 다각형 그리기
plot(centroid(1), centroid(2), 'r*', 'MarkerSize', 10); % 중심점 그리기
title('Detected Shape and Its Centroid');
hold off;

% 중점 좌표 출력
disp('Centroid of detected shape:');
disp(centroid);
