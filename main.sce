function lbp = lbp(image)
    size_image=size(image);
    matrix_arrows = size_image(1);
    matrix_columns = size_image(2);
    
    for i=1:matrix_arrows
        for j=1:matrix_columns
            for k=-1:1
                for l=-1:1
                    lbp(i+k,j+l)=image(i,j);
                    if k+l =0
                    else
                        if lbp(i+k,j+l) < lbp(i,j)
                            lbp(i+k,j+l) = 0
                        else
                            lbp(i+k,j+l) = 1
                        end
                    end
                end
            end
        end
    end
endfunction
