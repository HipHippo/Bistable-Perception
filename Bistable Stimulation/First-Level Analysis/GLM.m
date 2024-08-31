%% Specification and Estimation


func_dir = 'D:\project_nmp\derivatives\sub-006\test_data\func';
load D:\project_nmp\code\onsets_cond1.mat
load D:\project_nmp\code\onsets_cond2.mat

runs = spm_select('FPList',func_dir,'^sws.*\.nii$');

regressor_path = 'D:\project_nmp\raw_data\sub-006\raw_data_3D\raw_func_test';
regressorList = dir(fullfile(regressor_path, '*.txt'));

for i = 1:size(runs,1)-1
    run = spm_select('expand',runs(i,:));
    run = cellstr(run);
    onsets_one = onsets_cond1{i+1};
    onsets_two = onsets_cond2{i+1};
    regressor = regressorList(i).name;
    matlabbatch{1}.spm.stats.fmri_spec.dir = {'D:\project_nmp\code\first_level_analysis\test'};
    matlabbatch{1}.spm.stats.fmri_spec.timing.units = 'secs';
    matlabbatch{1}.spm.stats.fmri_spec.timing.RT = 1;
    matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t = 16;
    matlabbatch{1}.spm.stats.fmri_spec.timing.fmri_t0 = 8;
    matlabbatch{1}.spm.stats.fmri_spec.sess(i).scans = run;
    matlabbatch{1}.spm.stats.fmri_spec.sess(i).cond(1).name = 'Cond 1';
    matlabbatch{1}.spm.stats.fmri_spec.sess(i).cond(1).onset = onsets_one;
    matlabbatch{1}.spm.stats.fmri_spec.sess(i).cond(1).duration = 8;
    matlabbatch{1}.spm.stats.fmri_spec.sess(i).cond(1).tmod = 0;
    matlabbatch{1}.spm.stats.fmri_spec.sess(i).cond(1).pmod = struct('name', {}, 'param', {}, 'poly', {});
    matlabbatch{1}.spm.stats.fmri_spec.sess(i).cond(1).orth = 1;
    matlabbatch{1}.spm.stats.fmri_spec.sess(i).cond(2).name = 'Cond 2';
    matlabbatch{1}.spm.stats.fmri_spec.sess(i).cond(2).onset = onsets_two;
    matlabbatch{1}.spm.stats.fmri_spec.sess(i).cond(2).duration = 24;
    matlabbatch{1}.spm.stats.fmri_spec.sess(i).cond(2).tmod = 0;
    matlabbatch{1}.spm.stats.fmri_spec.sess(i).cond(2).pmod = struct('name', {}, 'param', {}, 'poly', {});
    matlabbatch{1}.spm.stats.fmri_spec.sess(i).cond(2).orth = 1;
    matlabbatch{1}.spm.stats.fmri_spec.sess(i).multi = {''};
    matlabbatch{1}.spm.stats.fmri_spec.sess(i).regress = struct('name', {}, 'val', {});
    matlabbatch{1}.spm.stats.fmri_spec.sess(i).multi_reg = {fullfile(regressor_path, regressor)};
    matlabbatch{1}.spm.stats.fmri_spec.sess(i).hpf = 128;
    matlabbatch{1}.spm.stats.fmri_spec.fact = struct('name', {}, 'levels', {});
    matlabbatch{1}.spm.stats.fmri_spec.bases.hrf.derivs = [0 0];
    matlabbatch{1}.spm.stats.fmri_spec.volt = 1;
    matlabbatch{1}.spm.stats.fmri_spec.global = 'None';
    matlabbatch{1}.spm.stats.fmri_spec.mthresh = 0.8;
    matlabbatch{1}.spm.stats.fmri_spec.mask = {''};
    matlabbatch{1}.spm.stats.fmri_spec.cvi = 'AR(1)';
end

spm_jobman('run',matlabbatch);

clear matlabbatch

matlabbatch{1}.spm.stats.fmri_est.spmmat = {'D:\project_nmp\code\first_level_analysis\test\SPM.mat'};
matlabbatch{1}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{1}.spm.stats.fmri_est.method.Classical = 1;

spm_jobman('run',matlabbatch);
