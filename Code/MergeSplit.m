
FeaTrainDir='/home/proy/Dataset/IBN_SINA/FeatureMB/Train_D_A_T';
FeaTestDir='/home/proy/Dataset/IBN_SINA/FeatureMB/Test_D_A_T';
LabTrainDir='/home/proy/Dataset/IBN_SINA/Labels-Train';
LabTestDir='/home/proy/Dataset/IBN_SINA/Labels-Test';

SymLabTrainDir = '/home/proy/HMM/MergeSplit/IBNSINA/ExpData/Train-SymLab';
SymLabTestDir = '/home/proy/HMM/MergeSplit/IBNSINA/ExpData/Test-SymLab';

TrainList = '/home/proy/HMM/MergeSplit/IBNSINA/ExpData/TrainList.txt';
TestList = '/home/proy/HMM/MergeSplit/IBNSINA/ExpData/TestList.txt';

ResultFile = '/home/proy/HMM/MergeSplit/IBNSINA/ExpData/Result.txt';
HMMsFolder = '/home/proy/HMM/MergeSplit/IBNSINA/ExpData/HMM_P';

String_to_Label(LabTrainDir, LabTestDir, SymLabTrainDir, SymLabTestDir);

FileList(FeaTrainDir, TrainList);
FileList(FeaTestDir, TestList);

[Res, Success] = runHMM(SymLabTrainDir, SymLabTestDir, HMMsFolder, TrainList, TestList, ResultFile);

WrongSymbolpair(Res);




    

    
