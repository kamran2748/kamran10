function edgeImage = hysteresisThresholding(edgeImage, lowThreshold, highThreshold)
img = imread('1.jpg');
    figure;
    imshow(img);
    title('Original Image');

    [rows, cols] = size(edgeImage);
    
    for i = 1:rows
        for j = 1:cols
            if edgeImage(i, j) > highThreshold
                edgeImage(i, j) = 1;
            elseif edgeImage(i, j) < lowThreshold
                edgeImage(i, j) = 0;
            else
                if any(any(edgeImage(max(1,i-1):min(rows,i+1), max(1,j-1):min(cols,j+1)) > highThreshold))
                    edgeImage(i, j) = 1;
                else
                    edgeImage(i, j) = 0;
                end
            end
        end
    end

function edgeImage = hysteresisThresholding(edgeImage, lowThreshold, highThreshold)
    edgeSobel = edge(edgeImage, 'Sobel', lowThreshold);

    edgePrewitt = edge(edgeImage, 'Prewitt', lowThreshold);

    edgeImage = edgeSobel | edgePrewitt;

    edgeImage(edgeImage < highThreshold) = 0;
    edgeImage(edgeImage >= highThreshold) = 1;
end

    figure;
    imshow(edgeImage);
    title('Edge Image');
end