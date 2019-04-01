function decimal=bintodec(bin)
    size_vector = size(bin)(1);
    decimal = 0;
    for i=1:size_vector
        decimal = decimal + bin(i)*(2^(size_vector-i));
    end
endfunction 


function image_lbp = lbp (image)
    size_image=size(image);
    matrix_arrows = size_image(1);
    matrix_columns = size_image(2);
    
    for i=2:matrix_arrows-1
        for j=2:matrix_columns-1
            m=1;
            for k=-1:1
                for l=-1:1
                    if k==0 && l==0
                    else
                        if image(i+k,j+l) < image(i,j)
                            windows(m) = 0;
                            m = m+1;
                        else
                            windows(m) = 1;
                            m = m+1;
                        end
                    end
                end
            end
            image_lbp(i,j)=bintodec(windows)
         end            
     end
endfunction


function hist_grid(image_lbp)
    grid_size_x = 8;
    grid_size_y = grid_size_x;
    
    
    for i=1
    end
    
    
endfunction



image = imread('Unknown.jpg');
image = image(:,:,2);
image_lbp = lbp (image);


