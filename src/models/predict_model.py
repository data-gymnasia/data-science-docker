
import sys
import pandas as pd
from joblib import load
from sklearn.metrics import accuracy_score

# Get command line arguments
data_directory, model_file, report_directory = sys.argv[1:]
data_file = data_directory + 'iris.csv'
accuracy_file = report_directory + "accuracy.txt"

# Read input data
df = pd.read_csv(data_file)

# Get training data
X = df.drop('species', axis=1) # feature matrix (all columns but the last)
Y = df['species'] # response column

# Load model
model = load(model_file)

# Compute accuracy and write it to disk so 
# it can be included in the report
accuracy = accuracy_score(model.predict(X),Y)
with open(accuracy_file,'w') as f:
    f.write(str(round(100*accuracy)) + "\\%")

