function RVD = calRVD(SEG, GT)  
    % SEG, GT are the binary segmentation and ground truth areas, respectively.  
    % ����RVDϵ������RVD  
    RVD = double(sum(uint8(SEG(:))) ) / double(sum(uint8(GT(:)))) - 1;  
end  