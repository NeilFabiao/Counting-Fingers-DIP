
i = sprintf('../Data/Easy/%d.png', number); % string with location of random image
I = imread(i); % reading random image using string above

%code avaliable during July 👍🏾
        

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