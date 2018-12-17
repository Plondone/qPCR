# qPCR analysis
Package for qPCR analysis made especially for data obtained with Viia 7 Real-time PCR system.

## UPDATE
* Simplified workflow with less functions
* Added calculation of fold change
* Added statistical analysis (wilcox and t.test)

## Install

Install these packages in Rstudio:

  `install.packages(c("devtools", "tidyverse", "Hmisc"))`

Installation of qPCR package

  `devtools::install_github("SCIL-leuven/qPCR")`

## Data file

*Make sure all files are .xlsx files because read_excel has problems with importing .xls files.*

Import all the raw data as an excel file without any selections. We are only interested in the results, that is the third sheet. In the basic template on the Viia7, genes are **Targets** and samples **Samples**. You can find them under the Sample Name and Target Name column.


Well | Well Position | Sample Name | Target Name | CT  
-----|---------------|-------------|-------------|----
1    | A1            | Sample 1    | Gene 1    | 21.23  
2    | A2            | Sample 2    | Gene 1    | 24.48  
3    | A3            | Sample 1    | Gene 2    | 18.98   


## Annotation file

To plot groups, you need to create an annotation file (this is the easiest to do in excel but it can also be a .csv or .txt file). Here is an example of how it should look:

Sample Name | Condition | Mouse | ...
----------|-----------|-----------|------
Sample 1  | healthy   | a  | ...
Sample 2  | healthy | b  | ...
Sample 3  | diseased | a | ...

## Workflow

### Rmarkdown examples

To check the example analyses run this code in the terminal:
`devtools::build_vignettes()`

You can also run the code chunk by chunk with Rmarkdown. Open an **.Rmd** file in the folder **vignettes** and run the chunks by pressing on the green play button top right.

### Basic workflow in steps

Basic steps of this workflow are:
1. Read and prepare files
2. Quality control
3. Normalize to housekeeping genes
4. Fold change
5. Statistics
6. Export

## To do
* Add information to load your files in .Rmd examples
* Add more statistics
