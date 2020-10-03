pkg load image

img = imread('polygon.png');
img=img(:,:,2);
img=double(img)/255.;
#f=fspecial('gaussian',31,2);
#img=imfilter(img,f);
imgdg=edge(img,'Canny');        #edge image
[H,theta,dist]=HoughSpace(imgdg,1);        # H accumulator array , theta degrees ,
                                            # dist distance of lines from origin
peaks=HoughPeaks(H);                      # return the strongest peaks                                           
                                            
                                            
pcolor(theta,dist,H)
shading flat;
colormap('ocean')
hold on;
plot(peaks(:,2),peaks(:,1),'xr')
figure;



[q v]=size(peaks);          # we will need q for the lines
[ix iy]=size(img);

imshow(img)
hold on;

x=linspace(0,ix,ix);
for i=1:q
m=peaks(i,2);
z=sqrt((ix^2)+(iy^2));  
y=(peaks(i,1)/sin(deg2rad(m)-deg2rad(1))) - (cos(deg2rad(m)-deg2rad(1))/sin(deg2rad(m)-deg2rad(1)))*x;
hold on;
plot(y,x);
hold on;
endfor


