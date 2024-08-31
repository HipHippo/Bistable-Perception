%-----------------------------------------------------------------------
% Job saved on 04-May-2024 23:42:42 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
% segmentation = struct;
global tpmdir
global structural_dir

sourceImage = fullfile(structural_dir,'sub-006_T1w.nii');
sourceImage_st = cellstr(sourceImage);
matlabbatch{1}.spm.spatial.preproc.channel.vols = sourceImage_st;
matlabbatch{1}.spm.spatial.preproc.channel.biasreg = 0.001;
matlabbatch{1}.spm.spatial.preproc.channel.biasfwhm = 60;
matlabbatch{1}.spm.spatial.preproc.channel.write = [0 1];

num_tpm = 6;
tpm_files = cell(num_tpm, 1);
for i = 1:num_tpm
    % Select the list of TPM files with a specific prefix and suffix
    tpm_file = spm_select('FPList', tpmdir, '^T.*\.nii');
    
    % Construct the full path with the tissue number appended to indicate the volume
    tpm_files{i} = cellstr(tpm_file);
end


matlabbatch{1}.spm.spatial.preproc.tissue(1).tpm = tpm_files{1};
matlabbatch{1}.spm.spatial.preproc.tissue(1).ngaus = 1;
matlabbatch{1}.spm.spatial.preproc.tissue(1).native = [1 0];
matlabbatch{1}.spm.spatial.preproc.tissue(1).warped = [0 0];

matlabbatch{1}.spm.spatial.preproc.tissue(2).tpm = tpm_files{2};
matlabbatch{1}.spm.spatial.preproc.tissue(2).ngaus = 1;
matlabbatch{1}.spm.spatial.preproc.tissue(2).native = [1 0];
matlabbatch{1}.spm.spatial.preproc.tissue(2).warped = [0 0];

matlabbatch{1}.spm.spatial.preproc.tissue(3).tpm = tpm_files{3};
matlabbatch{1}.spm.spatial.preproc.tissue(3).ngaus = 2;
matlabbatch{1}.spm.spatial.preproc.tissue(3).native = [1 0];
matlabbatch{1}.spm.spatial.preproc.tissue(3).warped = [0 0];

matlabbatch{1}.spm.spatial.preproc.tissue(4).tpm = tpm_files{4};
matlabbatch{1}.spm.spatial.preproc.tissue(4).ngaus = 3;
matlabbatch{1}.spm.spatial.preproc.tissue(4).native = [1 0];
matlabbatch{1}.spm.spatial.preproc.tissue(4).warped = [0 0];

matlabbatch{1}.spm.spatial.preproc.tissue(5).tpm = tpm_files{5};
matlabbatch{1}.spm.spatial.preproc.tissue(5).ngaus = 4;
matlabbatch{1}.spm.spatial.preproc.tissue(5).native = [1 0];
matlabbatch{1}.spm.spatial.preproc.tissue(5).warped = [0 0];

matlabbatch{1}.spm.spatial.preproc.tissue(6).tpm = tpm_files{6};
matlabbatch{1}.spm.spatial.preproc.tissue(6).ngaus = 2;
matlabbatch{1}.spm.spatial.preproc.tissue(6).native = [0 0];
matlabbatch{1}.spm.spatial.preproc.tissue(6).warped = [0 0];

matlabbatch{1}.spm.spatial.preproc.warp.mrf = 1;
matlabbatch{1}.spm.spatial.preproc.warp.cleanup = 1;
matlabbatch{1}.spm.spatial.preproc.warp.reg = [0 0.001 0.5 0.05 0.2];
matlabbatch{1}.spm.spatial.preproc.warp.affreg = 'mni';
matlabbatch{1}.spm.spatial.preproc.warp.fwhm = 0;
matlabbatch{1}.spm.spatial.preproc.warp.samp = 3;
matlabbatch{1}.spm.spatial.preproc.warp.write = [0 1];
matlabbatch{1}.spm.spatial.preproc.warp.vox = NaN;
matlabbatch{1}.spm.spatial.preproc.warp.bb = [NaN NaN NaN
                                              NaN NaN NaN];

spm_jobman('run', matlabbatch);

clear matlabbatch