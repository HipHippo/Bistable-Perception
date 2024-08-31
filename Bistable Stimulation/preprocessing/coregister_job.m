
global functional_dir
global structural_dir
refImage = spm_select('FPList',functional_dir,'^m','.nii');
sourceImage = spm_select('FPList',structural_dir,'^s','.nii');
refImage_st = cellstr(refImage);
sourceImage_st = cellstr(sourceImage);

for i = 1:length(refImage_st)
    matlabbatch{1}.spm.spatial.coreg.estimate.source = sourceImage_st;
    matlabbatch{1}.spm.spatial.coreg.estimate.ref = refImage_st;
    matlabbatch{1}.spm.spatial.coreg.estimate.other = {''};
    matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.cost_fun = 'nmi';
    matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.sep = [4 2];
    matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
    matlabbatch{1}.spm.spatial.coreg.estimate.eoptions.fwhm = [7 7];
    spm_jobman('run', matlabbatch);
end
