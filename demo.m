clc;clear all;close all;
%% step 1������ͼ��  
SEG = imread('1_1.jpg');      % ����ָ�ͼ��
GT  = imread('true.jpg');     % ������ֵͼ��
  
%% step 2���ҶȻ�
if (length(size(SEG))>2 && length(size(GT))>2)
    SEG = im2gray(SEG);        % �ҶȻ��ָ�ͼ��
    GT  = im2gray(GT);         % �ҶȻ���ֵͼ��
end
    
%% step 3����ֵ��
SEG = imbinarize(SEG);         % ��ֵ���ָ�ͼ��
GT  = imbinarize(GT);          % ��ֵ����ֵͼ��

%% step 4����ͼԤ��
figure(1),
subplot(121),imshow(SEG);
title('��ֵ����ķָ�ͼ��');
subplot(122),imshow(GT);
title('��ֵ�������ֵͼ��');

%% step 5�������������ָ��

% (1)����DICEϵ��
DSI = calDSI(SEG, GT);   
fprintf('(1) DICEϵ����        DSI       =  %.4f\n',DSI);

% (2)����VOEϵ��
VOE = calVOE(SEG, GT);   
fprintf('(2) VOEϵ����         VOE       =  %.4f\n',VOE);

% (3)����RVDϵ��
RVD = calRVD(SEG, GT); 
fprintf('(3) RVDϵ����         RVD       =  %.4f\n',RVD);

% (4)����Precisionϵ��
Precision = calPrecision(SEG, GT); 
fprintf('(4) Precisionϵ����   Precision =  %.4f\n',Precision);

%��5������Recallϵ��
Recall = calRecall(SEG, GT); 
fprintf('(5) Recallϵ����      Recall    =  %.4f\n\n\n',Recall);

disp('��������ָ��ļ���');
% (6)��������ָ��ļ���
jaccard     = Jaccard_Index(SEG, GT)
sensitivity = getSensitivity(SEG, GT)
hd          = Hausdorff_Dist(SEG, GT)
apd         = Avg_PerpenDist(SEG, GT)
confm_index = ConformityCoefficient(SEG, GT)