clc;clear all;close all;
%% step 1：读入图像  
SEG = imread('1_1.jpg');      % 读入分割图像
GT  = imread('true.jpg');     % 读入真值图像
  
%% step 2：灰度化
if (length(size(SEG))>2 && length(size(GT))>2)
    SEG = im2gray(SEG);        % 灰度化分割图像
    GT  = im2gray(GT);         % 灰度化真值图像
end
    
%% step 3：二值化
SEG = imbinarize(SEG);         % 二值化分割图像
GT  = imbinarize(GT);          % 二值化真值图像

%% step 4：画图预览
figure(1),
subplot(121),imshow(SEG);
title('二值化后的分割图像');
subplot(122),imshow(GT);
title('二值化后的真值图像');

%% step 5：计算各个评价指标

% (1)计算DICE系数
DSI = calDSI(SEG, GT);   
fprintf('(1) DICE系数：        DSI       =  %.4f\n',DSI);

% (2)计算VOE系数
VOE = calVOE(SEG, GT);   
fprintf('(2) VOE系数：         VOE       =  %.4f\n',VOE);

% (3)计算RVD系数
RVD = calRVD(SEG, GT); 
fprintf('(3) RVD系数：         RVD       =  %.4f\n',RVD);

% (4)计算Precision系数
Precision = calPrecision(SEG, GT); 
fprintf('(4) Precision系数：   Precision =  %.4f\n',Precision);

%（5）计算Recall系数
Recall = calRecall(SEG, GT); 
fprintf('(5) Recall系数：      Recall    =  %.4f\n\n\n',Recall);

disp('其他评价指标的计算');
% (6)其他评价指标的计算
jaccard     = Jaccard_Index(SEG, GT)
sensitivity = getSensitivity(SEG, GT)
hd          = Hausdorff_Dist(SEG, GT)
apd         = Avg_PerpenDist(SEG, GT)
confm_index = ConformityCoefficient(SEG, GT)