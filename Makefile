
.PHONY: features train predict figures reports all

all: reports

features: src/features/build_features.py
	python src/features/build_features.py data/raw/ data/processed/

train: features src/models/train_model.py
	python src/models/train_model.py data/processed/ models/trained_model.joblib

predict: train src/models/predict_model.py
	python src/models/predict_model.py data/processed/ models/trained_model.joblib reports/

figures: src/visualization/visualize.R
	Rscript src/visualization/visualize.R data/processed/ reports/figures/

reports: reports/report.tex predict figures
	cd reports && \
	pdflatex report.tex && \
	pdflatex report.tex
