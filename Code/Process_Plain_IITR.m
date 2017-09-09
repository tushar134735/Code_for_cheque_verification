clc;
close all;
FeaTrainDir='D:\8th_SEM\words\CCV\TrainFeature';
FeaTestDir='D:\8th_SEM\words\TestSample1';
LabTrainDir='D:\8th_SEM\words\Labels\Train';
LabTestDir='D:\8th_SEM\words\Labels\Test';

TrainList = 'D:\8th_SEM\words\OutputTxt\TrainList.txt';
HMMsFolder = 'D:\8th_SEM\words\OutputTxt\HMM_CCV';

FileList(FeaTrainDir, TrainList);
File_HMMsList = 'D:\8th_SEM\words\OutputTxt\HMMsList.txt';
File_Phones = 'D:\8th_SEM\words\OutputTxt\Phones.txt';

%HMMsList(LabTrainDir, File_HMMsList);
PhoneTrain(LabTrainDir, File_Phones);

ans = rmdir(HMMsFolder,'s');
FuncTrainHMM(File_HMMsList, File_Phones, HMMsFolder, TrainList);

TestList = 'D:\8th_SEM\words\outputTxt\TestList.txt';
ResultFile = 'D:\8th_SEM\words\OutputTxt\Result.txt';
FileList(FeaTestDir, TestList);
File_Dictionary = 'D:\8th_SEM\words\OutputTxt\Dictionary.txt';
File_Network = 'D:\8th_SEM\words\OutputTxt\Network.txt';

%FuncDictionary(LabTrainDir, File_Dictionary);
FuncNetwork(File_Dictionary, File_Network);

macros = strcat(HMMsFolder, '\hmm_64\macros');
hmmdefs = strcat(HMMsFolder, '\hmm_64\hmmdefs');

parameter = '-A -T 1';
ast = [' ' * ' '];
syscmd = sprintf('HVite %s -H %s -H %s -S %s -l %s -i %s -w %s %s %s', parameter, macros, hmmdefs, TestList, ast, ResultFile, File_Network, File_Dictionary, File_HMMsList);
system(syscmd);
    
GTFile = 'D:\8th_SEM\words\OutputTxt\GT_Data.txt';
syscmd = sprintf('HResults -d 5 -I %s %s %s', GTFile, File_HMMsList, ResultFile);
winopen('D:\8th_SEM\words\OutputTxt\Result.txt');
%fprintf(fid);
%system(syscmd);  %%%84.32

% %%%Alignment
% AlignTrainFile = '/home/rajib/HMM/Project_IBN_SINA/Process/Data/AlignTrain.mlf';
% WordFile = '/home/rajib/HMM/Project_IBN_SINA/Process/Data/Word_Data.txt';
% parameter = '-o SM -a';
% syscmd = sprintf('./HVite %s -n 50 5 -H %s -H %s -i %s -m -I %s -S %s %s %s', parameter, macros, hmmdefs, AlignTrainFile, WordFile, TrainList, File_Dictionary, File_HMMsList);
% unix(syscmd);
% 
% %%%%HTK feature to Plain Feature
% 
% %%%Tandem Feature
% AlignFeatureFile = '/home/rajib/HMM/Project_IBN_SINA/Process/Data/AlignFeature.mlf';
% FeatureFolder = '/home/rajib/HMM/Project_IBN_SINA/Process/Data/Train_DAT_P';
% TandemFeature(AlignTrainFile, AlignFeatureFile, File_HMMsList, FeatureFolder);
% 
