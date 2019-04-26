%% This script has been written in Matlab
% The main goal is to understand eventual links between soil data (texture, soil water, organic carbon, soil depth)
% and geophysical data (GPR and EMI) and elevation


% Stepwise multiple linear regression starting from a contast up to a full linear model
mdl_clay1 = stepwiselm(LCsoilGPREMI,'constant','Upper','linear','ResponseVar','ClayG1','PredictorVars',{'Elev','HCP32','HCP71','HCP118','VCP32','VCP71','VCP118','GPRCO500D1','GPRCO500D2','GPRCO1000D1','GPRCO1000D2','GPRCO1000D3','GPRCO1000D4'})
mdl_clay2 = stepwiselm(LCsoilGPREMI,'constant','Upper','linear','ResponseVar','ClayG2','PredictorVars',{'Elev','HCP32','HCP71','HCP118','VCP32','VCP71','VCP118','GPRCO500D1','GPRCO500D2','GPRCO1000D1','GPRCO1000D2','GPRCO1000D3','GPRCO1000D4'})
mdl_sand1 = stepwiselm(LCsoilGPREMI,'constant','Upper','linear','ResponseVar','SandG1','PredictorVars',{'Elev','HCP32','HCP71','HCP118','VCP32','VCP71','VCP118','GPRCO500D1','GPRCO500D2','GPRCO1000D1','GPRCO1000D2','GPRCO1000D3','GPRCO1000D4'})
mdl_sand2 = stepwiselm(LCsoilGPREMI,'constant','Upper','linear','ResponseVar','SandG2','PredictorVars',{'Elev','HCP32','HCP71','HCP118','VCP32','VCP71','VCP118','GPRCO500D1','GPRCO500D2','GPRCO1000D1','GPRCO1000D2','GPRCO1000D3','GPRCO1000D4'})
mdl_silt1 = stepwiselm(LCsoilGPREMI,'constant','Upper','linear','ResponseVar','SiltG1','PredictorVars',{'Elev','HCP32','HCP71','HCP118','VCP32','VCP71','VCP118','GPRCO500D1','GPRCO500D2','GPRCO1000D1','GPRCO1000D2','GPRCO1000D3','GPRCO1000D4'})
mdl_silt2 = stepwiselm(LCsoilGPREMI,'constant','Upper','linear','ResponseVar','SiltG2','PredictorVars',{'Elev','HCP32','HCP71','HCP118','VCP32','VCP71','VCP118','GPRCO500D1','GPRCO500D2','GPRCO1000D1','GPRCO1000D2','GPRCO1000D3','GPRCO1000D4'})
mdl_gravel1 = stepwiselm(LCsoilGPREMI,'constant','Upper','linear','ResponseVar','Gravel1','PredictorVars',{'Elev','HCP32','HCP71','HCP118','VCP32','VCP71','VCP118','GPRCO500D1','GPRCO500D2','GPRCO1000D1','GPRCO1000D2','GPRCO1000D3','GPRCO1000D4'})
mdl_gravel2 = stepwiselm(LCsoilGPREMI,'constant','Upper','linear','ResponseVar','Gravel2','PredictorVars',{'Elev','HCP32','HCP71','HCP118','VCP32','VCP71','VCP118','GPRCO500D1','GPRCO500D2','GPRCO1000D1','GPRCO1000D2','GPRCO1000D3','GPRCO1000D4'})
mdl_swc1 = stepwiselm(LCsoilGPREMI,'constant','Upper','linear','ResponseVar','SWC1','PredictorVars',{'Elev','HCP32','HCP71','HCP118','VCP32','VCP71','VCP118','GPRCO500D1','GPRCO500D2','GPRCO1000D1','GPRCO1000D2','GPRCO1000D3','GPRCO1000D4'})
mdl_swc2 = stepwiselm(LCsoilGPREMI,'constant','Upper','linear','ResponseVar','SWC2','PredictorVars',{'Elev','HCP32','HCP71','HCP118','VCP32','VCP71','VCP118','GPRCO500D1','GPRCO500D2','GPRCO1000D1','GPRCO1000D2','GPRCO1000D3','GPRCO1000D4'})
mdl_corg1 = stepwiselm(LCsoilGPREMI,'constant','Upper','linear','ResponseVar','Corg1','PredictorVars',{'Elev','HCP32','HCP71','HCP118','VCP32','VCP71','VCP118','GPRCO500D1','GPRCO500D2','GPRCO1000D1','GPRCO1000D2','GPRCO1000D3','GPRCO1000D4'})
mdl_corg2 = stepwiselm(LCsoilGPREMI,'constant','Upper','linear','ResponseVar','Corg2','PredictorVars',{'Elev','HCP32','HCP71','HCP118','VCP32','VCP71','VCP118','GPRCO500D1','GPRCO500D2','GPRCO1000D1','GPRCO1000D2','GPRCO1000D3','GPRCO1000D4'})
mdl_sd1 = stepwiselm(LCsoilGPREMI,'constant','Upper','linear','ResponseVar','SD1','PredictorVars',{'Elev','HCP32','HCP71','HCP118','VCP32','VCP71','VCP118','GPRCO500D1','GPRCO500D2','GPRCO1000D1','GPRCO1000D2','GPRCO1000D3','GPRCO1000D4'})
mdl_sd2 = stepwiselm(LCsoilGPREMI,'constant','Upper','linear','ResponseVar','SD2','PredictorVars',{'Elev','HCP32','HCP71','HCP118','VCP32','VCP71','VCP118','GPRCO500D1','GPRCO500D2','GPRCO1000D1','GPRCO1000D2','GPRCO1000D3','GPRCO1000D4'})