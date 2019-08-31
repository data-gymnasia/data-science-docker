
import sys
import pandas as pd
from sklearn.neighbors import KNeighborsClassifier
from joblib import dump

# Get command line arguments
data_directory, model_file = sys.argv[1:]
data_file = data_directory + "iris.csv"

# Read input data
df = pd.read_csv(data_file)

# Prepare data for training
X = df.drop('species',axis=1) # feature matrix 
Y = df['species'] # response column

# Train a model
knn_model = KNeighborsClassifier()
knn_model.fit(X,Y)

# Save the resulting model to disk
dump(knn_model,model_file)