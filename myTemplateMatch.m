close all
clear all

%% read a target & template image
target = imread('image1.jpg'); % 108x155x3
template = imread('image2.jpg'); % 26x22x3

figure; 
%subplot(2, 3, 1)
imshow(target)
title('orignal')
%figure; imshow(template)

%% convert images to gray-scale
% matlab function
target1 = rgb2gray(target); % 108x155x1
template1 = rgb2gray(template); % 26x22x1
figure; imshow(target1)
target1 = double(target1);
figure; imshow(target1, 'DisplayRange', [min(template1(:)) max(template1(:))])
%subplot(2, 3, 2)
%imshow(target1, 'DisplayRange', [min(target1(:)) max(target1(:))])
%title('matlab function')
%figure; imshow(template1, 'DisplayRange', [min(template1(:)) max(template1(:))])

% lightness 
%target2 = rgbTograyLightness(target);
%template2 = rgbTograyLightness(template);
%subplot(2, 3, 3)
%imshow(target2, 'DisplayRange', [min(target2(:)) max(target2(:))])
%title('lightness')
%figure; imshow(template2, 'DisplayRange', [min(template2(:)) max(template2(:))])

% average
%target3 = rgbTograyAverage(target);
%template3 = rgbTograyAverage(template);
%subplot(2, 3, 4)
%imshow(target3, 'DisplayRange', [min(target3(:)) max(target3(:))])
%title('average')
%figure; imshow(template3, 'DisplayRange', [min(template3(:)) max(template3(:))])

% luminosity
%target4 = rgbTograyLumi(target);
%template3 = rgbTograyAverage(template);
%subplot(2, 3, 5)
%imshow(target4, 'DisplayRange', [min(target4(:)) max(target4(:))])
%title('luminosity')
%figure; imshow(template3, 'DisplayRange', [min(template3(:)) max(template3(:))])

% matlab weight
%target5 = rgbTograyMat(target);
%template3 = rgbTograyAverage(template);
%subplot(2, 3, 6)
%imshow(target5, 'DisplayRange', [min(target5(:)) max(target5(:))])
%title('matlab weight')
%figure; imshow(template3, 'DisplayRange', [min(template3(:)) max(template3(:))])

%% template matching

% sad
sad(target1, template1)

% ssd
ssd(target1, template1)

