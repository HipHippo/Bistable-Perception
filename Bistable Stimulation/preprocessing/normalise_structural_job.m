%-----------------------------------------------------------------------
% Job saved on 04-May-2024 23:58:27 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
global structural_dir
bias_corr_file = spm_select('FPList',structural_dir,'^ms','.nii');
bias_corr_file_norm = cellstr(bias_corr_file);

deform_file = spm_select('FPList',structural_dir,'^y','.nii');
deform_file_norm = cellstr(deform_file);

matlabbatch{1}.spm.spatial.normalise.write.subj.def = deform_file_norm;
%%
matlabbatch{1}.spm.spatial.normalise.write.subj.resample = bias_corr_file_norm;
                                                           
%%
matlabbatch{1}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                          78 76 85];
matlabbatch{1}.spm.spatial.normalise.write.woptions.vox = [1 1 3];
matlabbatch{1}.spm.spatial.normalise.write.woptions.interp = 4;
matlabbatch{1}.spm.spatial.normalise.write.woptions.prefix = 'w';

spm_jobman('run', matlabbatch);

clear matlabbatch