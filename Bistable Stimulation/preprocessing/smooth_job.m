%-----------------------------------------------------------------------
% Job saved on 05-May-2024 00:02:12 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
%%
global functional_dir
wf_files = spm_select('FPList',functional_dir,'^wr','.nii');
wf_files_s = cellstr(wf_files)
matlabbatch{1}.spm.spatial.smooth.data = wf_files_s;
                                          
%%
matlabbatch{1}.spm.spatial.smooth.fwhm = [6 6 6];
matlabbatch{1}.spm.spatial.smooth.dtype = 0;
matlabbatch{1}.spm.spatial.smooth.im = 0;
matlabbatch{1}.spm.spatial.smooth.prefix = 's';

spm_jobman('run', smooth.matlabbatch);

clear matlabbatch