function img=generateLCDDigits(digit,FontName)
img=zeros([100 100 3]);



xpos=10;
ypos=4;

img=AddTextToImage(img,digit,[ypos xpos],[255 255 255],FontName,80);

img=im2bw(img);


[row,col] = find(img>0);

l=min(col);
r=max(col);
t=min(row);
b=max(row);
h = b-t;
w = r-l;

img=imcrop(img,[l,t,w,h]);

[nh,nw]=size(img);
    
if nh>nw
    img=[zeros(nh,int8((nh-nw)/2)) img zeros(nh,int8((nh-nw)/2))];
elseif nw>nh
    img=[zeros(nh,int8((nw-nh)/2)) img zeros(nh,int8((nw-nh)/2))];
end

