# maleFemaleDetection
Gender Detection Project

Description: This project is aimed to classify gender from face images using LBP feature extractor and MLP classifier. This is the final project of the course EL7007 Introduction to Digital Image Processing at University of Chile.

The codes and their description are listed below:

DataBaseCreator.m:
This is the Matlab code which takes the original FERET data base and returns the faces cropped and histogram-equalized for the project.

DataBaseCreatorEjec.m:
This Matlab code just implements an example use of DataBaseCreator.m.

The new data base of cropped face images is obtained, and an example of it is in BaseDeDatos.zip

lbpFeatureExtractor.m:
This is the Matlab function which implements the LBP operator. It has the possibility of using the Uniform LBP version, which is the one used in this project. It takes a grey scale image as an input and returns the corresponding LBP image and the concatenated normalized histograms in a raw vector.

LBPdemo.m:
This Matlab code just implements an example use of the LBP operator in a particular image from de data base.

DataBaseVectors.m
This code generate the labelded data base of faces with their LBP features. It is necessary to have available the data base of face images for the use of this code. The output obtained is a csv file. Examples of these files are in BasesEtiquetadas.zip. These files are the ones used for the classification step.



