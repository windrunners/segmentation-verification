function DSI = calDSI(SEG, GT)  
    % SEG, GT are the binary segmentation and ground truth areas, respectively.  
    % ¼ÆËãDICEÏµÊý£¬¼´DSI  
    DSI = 2*double(sum(uint8(SEG(:) & GT(:)))) / double(sum(uint8(SEG(:))) + sum(uint8(GT(:))));  
end  