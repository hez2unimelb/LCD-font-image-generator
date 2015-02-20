function generateLCDImg()


chars='0123456789';
charImgSet=cell(length(chars),1);


fontNames={'LCD2','Liquid Crystal','DS-Digital','WW Digital','DS-Point'...
    'Pixel LCD7','LCDDot TR','LCD2 Bold Italic', ...
    'DisplayOTF','LED Display7'};



for j=1:length(chars)
     fontSet=cell(size(fontNames,1),2);
     for i=1:size(fontNames,2)
        fontName=fontNames(i);
        fontName=fontName{1};
        
        
        charImg=generateLCDDigits(chars(j),fontName);
        
        affinedImgs=allAffineTransformAllAngles(charImg,0,15);
        
        fontSet{i}=affinedImgs;
     end
     charImgSet{j}=fontSet;
     disp(chars(j));
end
save('lcd_img_set_affine_all','charImgSet');
%save('cen_feature_6','features');
% save('images.mat','images');
% save('labels.mat','labels')