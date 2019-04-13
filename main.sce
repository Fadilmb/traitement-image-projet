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
    image_lbp = [];
    
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


function hist_lbp_image = hist_lbp(image_lbp)
    size_image = size(image_lbp);
    image_length = size_image(1);
    image_width = size_image(2);
    hist_lbp_image = [];
    
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
           hist_lbp_image(indice,:) = histc(x,grid,normalization=%f);
            indice = indice +1;
         end
     end
endfunction


function distance = distance_eucledienne(matrice1, matrice2)
    distance = sqrt(sum((matrice1-matrice2).^2));
endfunction


function database_image = load_database_image()
    f= findfiles('../base_de_donnee','*.png');
    f_max = size(f)(1);
    database_image = list();
    
    for i=1:f_max
        image=string(f(i));
        database_image(i)=imread(image)(:,:,1);
    end
endfunction


function database_lbp = database_imagetolbp(database_image)
        i_max = size(database_image);
        database_lbp = list();
        
        for i=1:i_max
            image_lbp = lbp(database_image(i));
            database_lbp(i)= hist_lbp(image_lbp);
        end
endfunction


function distances = compare_lbp(image,database_lbp)
    image = image(:,:,1);
    image_lbp = lbp (image);
    hist_lbp_img = hist_lbp(image_lbp);
    i_max= size(database_lbp);
    distances = [];
    
    for i=1:i_max
        distances(i)=distance_eucledienne(hist_lbp_img, database_lbp(i))
    end
    disp("compare_lbp terminé");
endfunction


database_image = load_database_image();
database_lbp = database_imagetolbp(database_image);
disp("base de donnée chargé");
