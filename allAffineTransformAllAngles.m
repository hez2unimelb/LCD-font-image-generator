function imgs=allAffineTransformAllAngles(img,rs,re)


imgs=cell(4*(re-rs),1);

count=1;

for j=rs:re

    
    theta=j;
    
    tforms=cell(4,1);

    tforms{1}=affine2d([cosd(theta) -sind(theta) 0;...
        -sind(theta) cosd(theta) 0;...
        0 0 1]);


    tforms{2}=affine2d([cosd(theta) -sind(theta) 0;...
        sind(theta) cosd(theta) 0;...
        0 0 1]);

    tforms{3}=affine2d([cosd(-theta) -sind(-theta) 0;...
        sind(-theta) cosd(-theta) 0;...
        0 0 1]);

    tforms{4}=affine2d([cosd(theta) sind(theta) 0;...
        sind(theta) cosd(theta) 0;...
        0 0 1]);








    for i=1:size(tforms,1)

        outputImage = imwarp(img,tforms{i});
        imgs{count}=outputImage;
        count=count+1;
    end
end
