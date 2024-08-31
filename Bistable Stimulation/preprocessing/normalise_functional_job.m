%-----------------------------------------------------------------------
% Job saved on 04-May-2024 23:56:03 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------

global functional_dir
global structural_dir
fileList = spm_select('FPList',functional_dir,'^rsub','.nii');
fs_norm = cellstr(fileList);

deform_file = spm_select('FPList',structural_dir,'^y','.nii');
deform_file_norm = cellstr(deform_file);

matlabbatch{1}.spm.spatial.normalise.write.subj.def = deform_file_norm;
%%
matlabbatch{1}.spm.spatial.normalise.write.subj.resample = fs_norm;
                                                            
%%
matlabbatch{1}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                          78 76 85];
matlabbatch{1}.spm.spatial.normalise.write.woptions.vox = [3 3 3];
matlabbatch{1}.spm.spatial.normalise.write.woptions.interp = 4;
matlabbatch{1}.spm.spatial.normalise.write.woptions.prefix = 'w';

spm_jobman('run', matlabbatch);

clear matlabbatch
