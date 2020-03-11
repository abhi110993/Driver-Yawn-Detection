README File

Objective
	Developed an application that alerts the driver in case the driver feels drowsy.

Proposed Method:

	Object Model Classifier
	On the basis of positive and negative data feeds we are training our classifier. These two sets of images will be send as a feed to the classifier for labelling each other distinctly.

	Feature Classifier
	Extracted features(Eyes and mouth regions) using Viola Jones algorithm.
	Histogram of K bins is computed based on the extracted features. 
	This histogram is used as a feature vector which can be used aas a second outlier rejector.

	Steps:
	1. Check subject within frame.
	2. Wait until the subject comes to the frame.
	3. When subject in the frame, extract the eyes and mouth regions.
	4. If eyes is closed and mouth is open then send the feature to the trained classifier.
	5. Trained classifier finalizes that the person is drowsy or not.
	6. Ring the alarm if the it is detected drowsy.