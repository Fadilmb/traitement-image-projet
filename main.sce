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


function hist_lbp = hist_grid(image_lbp)
    size_image=size(image);
    image_length = size_image(1);
    image_width = size_image(2);
    
    grid_size_x = 8;
    grid_size_y = grid_size_x;
    x=[-0.5:255.5];
    indice=1;
    k_max = int(image_length/grid_size_x);
    l_max = int(image_width/grid_size_y);

    for k=0:k_max-1
        for l=0:l_max-1   
            for i=8*k+1 : 8*k+grid_size_x
                for j=8*l+1 : 8*l+grid_size_y
                    grid(i-8*k,j-8*l)=image_lbp(i,j);
                end
            end
            histgrid(indice,:) = histc(x,grid,normalization=%f);
            indice = indice +1;
         end
     end
     hist_lbp = histc(x,histgrid,normalization=%f);
endfunction


function distance = distance_eucledienne(matrice1, matrice2)
    distance = sqrt(sum((matrice1-matrice2)^2));
endfunction

/*
function count= count_matrice(matrice, number)
    size_image=size(matrice);
    matrix_arrows = size_image(1);
    matrix_columns = size_image(2);
    count = 0;
    
    for i=1:matrix_arrows
       for j=1:matrix_columns
           if matrice(i,j) == number
               count = count +1;
           end
       end
    end
    
endfunction
*/

image = imread('Unknown.jpg');
image = image(:,:,2);
image_lbp = lbp (image);
histgrid = hist_grid(image_lbp);


