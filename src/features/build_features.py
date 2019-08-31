
import sys
import pandas as pd

# Get command line arguments
input_directory, output_directory = sys.argv[1:]
input_file = input_directory + "iris.csv"
output_file = output_directory + "iris.csv"

# Process file by adding products of length and width
df = pd.read_csv(input_file)
df.assign(petal_area = df.petal_length * df.petal_width) \
  .assign(sepal_area = df.sepal_length * df.sepal_width) \
  .to_csv(output_file)