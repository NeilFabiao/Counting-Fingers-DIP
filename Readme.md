# Basics of Counting Fingers #

This project was done using Matlab, and in the Project folder there are 3 other subsequent folders namely:

* Data - where all the images used in each implementation are located.
* src - or source code where each implementation counts fingers in their own different way. 
* output - where the output files are located when the projects are built. 

To run any of the implementations located in src simply select a file, load the program in matlab and press run or build project. 
With that said Implementation0 has the principles followed for the majority of the project and it follows implementation 1 where a sample image of my own hand was use to test the the ideas for this project. Lastly Implementation2 uses color image to test another version of implementation 0. 

*Note:* The complete report for this project can only be will be made avaliable upon request altought sample summary is presented bellow.

### Understanding the Process ###

To count the number of fingers given an image, first one needs to understand the principles of segmentation and connected component labelling. These are needed to be applied in a precise manner that allows the hand present in the image to once processed not leave undesired noise, an examople of steps is as follows:

1. Read image and analyse pixel values in the histogram.
2. Given that the image is already in black and white with two distinct pixel regions, a threshold with the mean of the histogram is applied.
3. Complement the image, this is to make the hand or foreground white and the background pixels black this is done to easily see missing pixel values for the following step.
4. Fill holes and open the resulting image, this is done such that pixel values in the hand are not lost after the threshold.
5. Erode the image to achieve the palm of the hand and dilate the image to have restoration of palm to the original size of the original hand for the next step.
6. After achieving the palm of the hand we can apply subtraction of the opened image in step 4 with palm image in step 5.
7. When subtracting two images we now achieve the fingers of the image but since we still have some unwanted pixels from the subtraction erosion is applied to the resulting image.
8. Once the image is eroded and only the fingers are left to identify the distinct regions with different pixel values the process of connected component labelling is done. This is to count pixels in the same region, which once found are labelled as fingers.

*Note:* On implementation3(not included in this repo), it was possible to achieve the same results with the use Kmeans or GMM (gaussian mixture model), clustering the image data with higher degree of efficiency (the type of image is always a factor to consider).

### Visualization of Steps ###

![alt-text-1](/Project/output/Implementation0.png) ![alt-text-2](/Project/output/Implementation2.png)

### References###

1. Gonzalez, R. C. Woods, R. E. (2018), Digital image processing.

2. Github and google

3. https://github.com/black-shadows

### Who do I talk to? ###

* Repo owner Neil Fabião -> @neilfabiao 
