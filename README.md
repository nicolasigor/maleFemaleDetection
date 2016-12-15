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

The nest two are the iPython notebooks, that use SciKit-learn and TensorFlow libraries. For these to work, it is necessary to have the labeled databases.

RandomForestIterator.ipynb:
This notebook iterate over the 10 labeled databases generated for the project, each of these with a number of partitions between 1 and 10. It trains and tests with a Random Forest classifier, showing the final results for each set. Also, it implements optionally the feature selection from a random forest model.

ClassificationGender.ipynb:
This notebook is the principal code for the project. It imports the database, and then generate the train, validation and test sets for the MLP classifier. As a optional previous step, it can reduce the dimensionality with PCA or with a feature selection based on a random forest model ranking. The MLP has some parameters to adjust, like the learning rate and momentum for Gradient Descent, the number of hidden neurons, and what kind of cost function and training to use. By default, it uses cross entropy cost function with Adam optimization method and without regularization. Finally, it implements a Random Forest Classifier for general testing purposes, and a LDA classification just for visualization purposes.




