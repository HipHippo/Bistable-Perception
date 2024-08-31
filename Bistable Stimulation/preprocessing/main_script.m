%% Main script for preprocessing
% For this script to work, the job scripts must be in the same directory as
% the preprocessing script



%% initialise paths and directories

% Get the path to the currently executing script
%[preprocessing_path, ~, ~] = fileparts(mfilename('fullpath'))

% sub-directories should be named the same 


functional_dir = 'D:\project_nmp\derivatives\sub-006\test_data\func';  
structural_dir = 'D:\project_nmp\derivatives\sub-006\test_data\anat'; 
tpmdir = 'C:\Users\ThinkPad E495\Desktop\Matlab Tools\spm12\tpm';



global functional_dir
global structural_dir
global tpmdir



%% Stepwise execution of job scripts




% steps:
% 1: Realignment
% 2: Coregistration
% 3: Segmentation
% 4: Normalization
% 5: Smoothing

steps_to_run = [5];  

spm('Defaults', 'fMRI');
for step = steps_to_run
    switch step
        case 1
            fprintf('Running Realignment...\n');
            spm_jobman('run', 'realign_job.m');
        case 2
            fprintf('Running Coregistration...\n');
            spm_jobman('run', 'coregister_job.m');
        case 3
            fprintf('Running Segmentation...\n');
            spm_jobman('run', 'segment_job.m');
        case 4
            fprintf('Running Normalization...\n')
            spm_jobman('run', 'normalise_functional_job.m');
            spm_jobman('run', 'normalise_structural_job.m');
        case 5
            fprintf('Running Smoothing...\n')
            spm_jobman('run', 'smooth_job.m');
        otherwise
            fprintf('Unknown step: %d\n', step);
    end
end


