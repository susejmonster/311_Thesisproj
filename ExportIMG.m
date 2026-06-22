classdef ExportIMG
    properties
        DataDir string
        ImageFolder string
        ImageDatastore
    end
    
    methods
        % 1. Constructor: Initializes paths and sets up the datastore
        function obj = ExportIMG(customPath)
            if nargin == 1
                obj.DataDir = customPath;
            else
                % Default fallback path
                obj.DataDir = 'C:\Users\user\.cache\kagglehub\competitions\open-images-object-detection-rvc-2020';
            end
            
            obj.ImageFolder = fullfile(obj.DataDir, 'test');
            
            % Check if the folder exists, then build the image datastore
            if isfolder(obj.ImageFolder) 
                obj.ImageDatastore = imageDatastore(obj.ImageFolder, 'FileExtensions', '.jpg');
            else
                error('The specified image folder does not exist: %s', obj.ImageFolder);
            end
        end
        
        % 2. Method to read and return a specific image by index
        function img = LoadImage(obj, index)
            if index > 0 && index <= length(obj.ImageDatastore.Files)
                img = readimage(obj.ImageDatastore, index);
            else
                error('Index out of bounds. Total images: %d', length(obj.ImageDatastore.Files));
            end
        end
        
        % 3. Method to load, display, and title an image automatically
        function Preview(obj, index)
            img = obj.LoadImage(index);
            figure;
            imshow(img);
            title(sprintf('Test Image #%d', index));
        end
        
        % 4. Method to count total available images
        function total = GetTotalCount(obj)
            total = length(obj.ImageDatastore.Files);
        end
    end
end