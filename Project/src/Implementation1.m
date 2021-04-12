number = randi(2);% random number generator to select random image
image = sprintf('../Data/Medium/%d.jpg', number);% string with location of random image
I = imread(image);% reading random image using string above
I1=rgb2gray(I);%transforming the image read to grayscaled

%% Part 1 Thresholding with the mean
[counts_R,binsLocation_R]= imhist(I);%retrieving value of histogram
thresholdValue=sum(counts_R.*binsLocation_R)/sum(counts_R);%dividing histogram values by the sum of all the histogram values 
thresholdValue = thresholdValue - 50;%offset value for threshold value to be accurate
A = I1 < thresholdValue; %Thresholded image

%% Part 2 Restoring binarised image
I2 =~A; %complement image
holes=imfill(I2,'holes');%fill holes of image
se = strel('disk',80);  %Structuring element
open=imopen(holes,se);%opening image to separate two regions of the image

%% Part 3 Extracting and counting fingers on image 
s1=strel('disk',150);%Structuring element
palm=imdilate(open,s1);%dilting image to achieve hand of image

s1=strel('disk',200);%Structuring element
hand=imerode(palm,s1);%Reconstructing dilated hand to have actual hand size

fingers=open-hand;% Achieving fingers by subtracting opened image and the palm
s=strel('disk',30);%Structuring element
img=imerode(fingers,s);%eroding image to not undesired elements on finger image
[labeledImage, numberOf] = bwlabel(img);% connected component labeling
colores = label2rgb (labeledImage, 'hsv', 'k', 'shuffle'); % Using the label of the image so we can assign each finger a random color
Total = sprintf('This image has %d fingers.', numberOf); % Printing the number of fingers presented in the image
%% Part 4 Displaying and saving result 
subplot(6,2,1), imshow(I), title('Original Image');
subplot(6,2,2), imhist(I), title('Histogram of Image');

subplot(6,2,3), imshow(I1), title('Gray scaled image');
subplot(6,2,4), imshow(A), title('Thresholded image');

subplot(6,2,5), imshow(I2), title('Complement of Image');
subplot(6,2,6), imshow(holes), title('Filling holes of Image');

subplot(6,2,7), imshow(open), title('Opening Image');
subplot(6,2,8), imshow(palm), title('Eroding to get Palm of Image');

subplot(6,2,9), imshow(hand), title('Hand of Image restored Image');
subplot(6,2,10), imshow(fingers), title('Fingers');

subplot(6,2,11), imshow(colores), title(Total);
subplot(6,2,12), imshow(image), title(Total);

saveas(gcf,sprintf('../output/Implementation1.png'));