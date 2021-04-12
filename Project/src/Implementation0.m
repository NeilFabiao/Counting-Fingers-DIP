number = randi(6); % random number generator to select random image
i = sprintf('../Data/Easy/%d.png', number); % string with location of random image
I = imread(i); % reading random image using string above

%% Part 1 Thresholding with the mean
[counts_R,binsLocation_R]= imhist(I); %retrieving value of histogram
thresholdValue=sum(counts_R.*binsLocation_R)/sum(counts_R); %dividing histogram values by the sum of all the histogram values 
thresholdValue = thresholdValue + 7; %offset value for threshold value to be accurate
A = I < thresholdValue; %Thresholded image

%% Part 2 Restoring binarised image
I2 =~A; % complement image
holes=imfill(I2,'holes'); %fill holes of image
se = strel('disk',4);  %Structuring element
open=imopen(holes,se); %opening image to separate two regions of the image

%% Part 3 Extracting and counting fingers on image 
s1=strel('disk',6);  %Structuring element
hand=imerode(open,s1); %eroding image to achieve hand of image

s1=strel('disk',6);%Structuring element
palm=imdilate(hand,s1); %Reconstructing eroded hand to have actual hand size

fingers=open-palm; % Achieving fingers by subtracting opened image and the palm
s=strel('disk',3);%Structuring element
image=imerode(fingers,s); %eroding image to not keep undesired elements on finger image
[labeledImage, numberOf] = bwlabel(image); % connected component labeling
colores = label2rgb (labeledImage, 'hsv', 'k', 'shuffle'); % Using the label of the image so we can assign each finger a random color

%if statement to print given a condition presented bellow
if numberOf >= 1
    Total = sprintf('This image has %d fingers.', numberOf); % Printing the number of fingers presented in the image
elseif numberOf == 0
    Total = sprintf('This image has no fingers'); % Printing the no fingers in case there is no fingers
end
        

%% Part 4 Displaying and saving result 
subplot(6,2,1), imshow(I), title('Original Image');
subplot(6,2,2), imhist(I), title('Histogram of Image');

subplot(6,2,3), imshow(A), title('Thresholded image');

subplot(6,2,4), imshow(I2), title('Complement of Image');
subplot(6,2,5), imshow(holes), title('Filling holes of Image');

subplot(6,2,6), imshow(open), title('Opening Image');
subplot(6,2,7), imshow(hand), title('Eroding to get Palm of Image');

subplot(6,2,8), imshow(palm), title('Palm restored achieved');
subplot(6,2,9), imshow(fingers), title('Fingers');
subplot(6,2,10), imshow(image), title('Fingers after erosion');
subplot(6,2,11), imshow(colores), title(Total);
subplot(6,2,12), imshow(I), title(Total);

saveas(gcf,sprintf('../output/Implementation0.png'));