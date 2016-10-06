% Call: ProjA1.m
% Downsample an image by 2x2 using 
% the nearest neighbor algorithm.
% For class EE5353, UTSA Fall 2016
% Alex Torres (rkc870), 09/15/2016

% Read thresholded images 
s_dir = pwd;
cd Images;

Y = imread('5.03.02.bmp'); 
%Y = Y(:,:,1);
X = imread('target_A1v.bmp');
%X = X(:,:,1);
cd (s_dir);
%Y = imread('5.3.02.tiff', 'tiff'); 
%Y = Y(:,:,1);
%X = imread('target_A1v.tiff', 'tiff');
%X = X(:,:,1);
% Y = original, X = target
cd(s_dir);

[N1, M1] = size(Y);
[N2, M2] = size(X);

% display the images
%subplot(2, 2, 1);
%imshow(X);

%subplot(2, 2, 2);
%imshow(Y);

% get cropped image from big image
Y1 = Y(1:1:N2, 1:1:M2);
%subplot(2,2,3);
%imshow(Y1);

% Y = original, X = target, N1 = sizeY, N2 = sizeX
vertical = floor(N1 / N2);
horizontal = floor((M1 / M2) / 2);
max_corr = 0;
Max_tile = Y1;
matches = cell(20);
match_dimensions = cell(20);
m = 1; % match counter
d = 1; % dims counter

% for x = 1:vertical
%     for z = 1:horizontal
%         Y1 = Y((N2*(x - 1) + 1):1:(N2*x), (M2*(z - 1) + 1):1:(M2*z));
%         for k = 45:45:360
%            %TMP = imrotate(X, k, 'bilinear', 'crop'); 
%            %corr = corr2(double(Y1), double(TMP));
%            TMP = imrotate(Y1, k, 'bilinear', 'crop'); 
%            corr = corr2(double(X), double(TMP)); % 0.127
%            if (corr > 0.252)
%                if (corr > max_corr)
%                 max_corr = corr;
%                 Max_tile = Y1;
%                end
%                1
%                match_dims{d} = [(M2*(z - 1)) (N2*(x - 1)) M2 N2];
%                matches{m} = Y1;
%                d = d + 1;
%                m = m + 1;
%                break;
%            end
%         end    
%     end
% end

X1 = imresize(X,0.85);
[N2, M2] = size(X1);
vertical = floor(N1 / N2);
horizontal = floor(5*(M1 / M2) / 12);
Y1 = Y(1:1:N2, 1:1:M2);
% for x = 1:vertical
%     for z = 1:horizontal
%     Y1 = Y((N2*(x - 1) + 1):1:(N2*x), (M2*(z - 1) + 1):1:(M2*z));
%       for k = 45:45:360
%          %TMP = imrotate(X, k, 'bilinear', 'crop'); 
%          %corr = corr2(double(Y1), double(TMP));
%          TMP = imrotate(Y1, k, 'bilinear', 'crop'); 
%          corr = corr2(double(X1), double(TMP));
%          if (corr > 0.275)
%              if (corr > max_corr)
%               max_corr = corr;
%               Max_tile = Y1;
%              end
%              2
%              match_dims{d} = [(M2*(z - 1)) (N2*(x - 1)) M2 N2];
%              matches{m} = Y1;
%              d = d + 1;
%              m = m + 1;
%              break;
%         end
%       end
%     end
% end

X1 = imresize(X,0.75);
[N2, M2] = size(X1);
vertical = floor(N1 / N2);
horizontal = floor(5*(M1 / M2) / 12);
Y1 = Y(1:1:N2, 1:1:M2);
% for x = 7:vertical
%     for z = 1:horizontal
%     Y1 = Y((N2*(x - 1) + 1):1:(N2*x), (M2*(z - 1) + 1):1:(M2*z));
%       for k = 45:45:360
%          %TMP = imrotate(X, k, 'bilinear', 'crop'); 
%          %corr = corr2(double(Y1), double(TMP));
%          TMP = imrotate(Y1, k, 'bilinear', 'crop'); 
%          corr = corr2(double(X1), double(TMP));
%          if (corr > 0.3)
%              if (corr > max_corr)
%               max_corr = corr;
%               Max_tile = Y1;
%              end
%              3
%              match_dims{d} = [(M2*(z - 1)) (N2*(x - 1)) M2 N2];
%              matches{m} = Y1;
%              d = d + 1;
%              m = m + 1;
%              break;
%         end
%       end
%     end
% end

X1 = imresize(X,0.6);
[N2, M2] = size(X1);
vertical = floor(N1 / N2);
horizontal = floor(5*(M1 / M2) / 12);
Y1 = Y(1:1:N2, 1:1:M2);
% for x = 7:vertical
%     for z = 1:horizontal
%     Y1 = Y((N2*(x - 1) + 1):1:(N2*x), (M2*(z - 1) + 1):1:(M2*z));
%       for k = 45:45:360
%          %TMP = imrotate(X, k, 'bilinear', 'crop'); 
%          %corr = corr2(double(Y1), double(TMP));
%          TMP = imrotate(Y1, k, 'bilinear', 'crop'); 
%          corr = corr2(double(X1), double(TMP));
%          if (corr > 0.26)
%              if (corr > max_corr)
%               max_corr = corr;
%               Max_tile = Y1;
%              end
%              4
%              match_dims{d} = [(M2*(z - 1)) (N2*(x - 1)) M2 N2];
%              matches{m} = Y1;
%              d = d + 1;
%              m = m + 1;
%              break;
%         end
%       end
%     end
% end

X1 = imresize(X,0.525);
[N2, M2] = size(X1);
vertical = floor((N1 / N2) / 2);
horizontal = floor(5*(M1 / M2) / 12);
Y1 = Y(1:1:N2, 1:1:M2);
% for x = 2:vertical
%     for z = 1:horizontal
%     Y1 = Y((N2*(x - 1) + 1):1:(N2*x), (M2*(z - 1) + 1):1:(M2*z));
%       for k = 45:45:360
%          %TMP = imrotate(X, k, 'bilinear', 'crop'); 
%          %corr = corr2(double(Y1), double(TMP));
%          TMP = imrotate(Y1, k, 'bilinear', 'crop'); 
%          corr = corr2(double(X1), double(TMP));
%          if (corr > 0.35)
%              if (corr > max_corr)
%               max_corr = corr;
%               Max_tile = Y1;
%              end
%              6
%              match_dims{d} = [(M2*(z - 1)) (N2*(x - 1)) M2 N2];
%              matches{m} = Y1;
%              d = d + 1;
%              m = m + 1;
%              break;
%         end
%       end
%     end
% end

X1 = imresize(X,0.525);
[N2, M2] = size(X1);
vertical = floor((N1 / N2) / 2);
horizontal = floor(5*(M1 / M2) / 12);
Y1 = Y(1:1:N2, 1:1:M2);
% for x = 2:vertical
%     for z = 1:horizontal
%     Y1 = Y((N2*(x - 1) + 1):1:(N2*x), (M2*(z - 1) + 1):1:(M2*z));
%       for k = 45:45:360
%          %TMP = imrotate(X, k, 'bilinear', 'crop'); 
%          %corr = corr2(double(Y1), double(TMP));
%          TMP = imrotate(Y1, k, 'bilinear', 'crop'); 
%          corr = corr2(double(X1), double(TMP));
%          if (corr > 0.35)
%              if (corr > max_corr)
%               max_corr = corr;
%               Max_tile = Y1;
%              end
%              6
%              match_dims{d} = [(M2*(z - 1)) (N2*(x - 1)) M2 N2];
%              matches{m} = Y1;
%              d = d + 1;
%              m = m + 1;
%              break;
%         end
%       end
%     end
% end

X1 = imresize(X,0.6);
[N2, M2] = size(X1);
vertical = floor((N1 / N2) / 3);
horizontal = floor((M1 / M2) / 2);
Y1 = Y(1:1:N2, 1:1:M2);
for x = 2:vertical
    for z = 1:horizontal
    Y1 = Y((N2*(x - 1) + 21):1:((N2*x)+20), (M2*(z - 1) + 1):1:(M2*z));
      for k = 45:45:360
         %TMP = imrotate(X, k, 'bilinear', 'crop'); 
         %corr = corr2(double(Y1), double(TMP));
         TMP = imrotate(Y1, k, 'bilinear', 'crop'); 
         corr = corr2(double(X1), double(TMP));
         if (corr > 0.3)
             if (corr > max_corr)
              max_corr = corr;
              Max_tile = Y1;
             end
             7
             match_dims{d} = [(M2*(z - 1)) (N2*(x - 1)) M2 N2];
             matches{m} = Y1;
             d = d + 1;
             m = m + 1;
             break;
        end
      end
    end
end

m
max_corr
% display results
for n = 1:m
   subplot(5, 3, n);
   imshow(matches{n});
end

subplot(5,3,15);
imshow(Y);
d
match_dims
figure, imshow(Y);
for i = 1:(d-1)
    rectangle('position',[match_dims{i}(1,1) match_dims{i}(1,2) match_dims{i}(1,3) match_dims{i}(1,4)],...
        'EdgeColor', 'r',...
        'LineWidth', 1,...         
        'LineStyle','-')
end
%rectangle('position',[0 100 M2 N2],...
%        'EdgeColor', 'r',...
%        'LineWidth', 1,...
%        'LineStyle','-')

%subplot(2, 4, 8);
%imshow(Max_tile);
%max_corr
%m

% compute correlation between cropped image and target image
%rxy = corr2(double(X),double(Y1));
%rxy
%rxx = corr2(double(X),double(X));
%rxx
