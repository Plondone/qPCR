# qPCR analysis
Package for qPCR analysis made especially for data obtained with Viia 7 Real-time PCR system.

## UPDATE
* Removed unneccasary functions to simplify analysis

## Install

Install these packages in Rstudio:

  `install.packages(c("devtools", "tidyverse", "Hmisc"))`

Installation of qPCR package

  `devtools::install_github("SCIL-leuven/qPCR")`

## Data file

*Make sure all files are .xlsx files because read_excel has problems with importing .xls files.*

Import all the raw data as an excel file without any selections. We are only interested in the results, that is the third sheet. In the basic template on the Viia7, genes are **Targets** and samples **Samples**. You can find them under the Sample Name and Target Name column.


Well | Well Position |...| Sample Name | Target Name |...| CT | CT Treshold |...| Tm1 | Tm2 | Tm3 
-----|---------------|---|-------------|-------------|---|----|-------------|---|-----|-----|-----
1    | A1            |...| Sample 1    | Gene 1    |...| 21 | 0.4         |...| 79  | ... | ... 
2    | A2            |...| Sample 2    | Gene 1    |...| 24 | 0.4         |...| 79  | ... | ... 
3    | A3            |...| Sample 1    | Gene 2    |...| 18 | 0.4         |...| 70  | 82  | 89  


## Annotation files

Two annotation files need to be created: one for genes and samples.

### Sample file

This annotation file only necessary if you used a blanc sample or if you want to add more annotation to your samples. Here is an example of how it should look:

Sample Name | Blanc |Cell_type  | Condition | Mouse     | Passage   | ...
----------|-------|-----------|-----------|-----------|-----------|------
Sample 1  | N     |iPSC         | healthy   | C57BL6-1  | 33        | ...
Sample 2  | N     |ESC        | healthy   | C57BL6-2  | 45        | ...
Sample 3  | Y     |           |           |           |           |

**IMPORTANT**: Don't put column names with spaces in them, always use an underscore!

### Primer file

This file should have at least two columns: **Target Name**  that resembles the names you gave to the primers and **HKG** that selects the housekeeping genes with a Y and the non-housekeeping genes with a N.

Target Name | HKG
---------|-----
Gene 1 | Y
Gene 2 | Y
Gene 4 | N

## Workflow

### Rmarkdown examples

To check the example analyses run this code in the terminal:
`devtools::build_vignettes()`

You can also run the code chunk by chunk with Rmarkdown. Open an **.Rmd** file in the folder **vignettes** and run the chunks by pressing on the green play button top right.

### Basic workflow in steps

Basic steps of this workflow are:
1. **Read and prepare files**
  * read_qpcr(): load qPCR file
  * list_bad_tech_rep(): make a list of all the bad technical replicates
  * qc_tech_rep(): remove bad technical replicates
2. **Quality control**
  * filter_sample()
  * remove_sample()
  * split_genes()
  * set_min_max_CT(): set a minimum and maximum CT
  * list_double_meltcurves(): make a list of primer with bad meltcurves
  * remove_bad_meltcurves(): remove primers with bad meltcurves
  * qc_hkg(): check quality of your HKG
  * remove_primer(): remove a gene
  * remove_CT()
  * qc_mean_hkg(): check quality on a combination of HKG
  * remove_outlier()
3. **Calculate Delta CT**
  * calculate_DCT(): calculates Delta CT and relative expression to HKG
  * plot_scatter(): plot a scatter plot
4. **Statistics**
  * stat_t_test(): perform t-test
5. **Export**
  * write.xlsx(): export to excel file

## To do
* Simplify quality control on housekeeping genes by implementing split function into qc_hkg()
* Change set_min_max_CT() so that lower CT values will become NA and not 40
* Change irregularities in assign
* Add function that calculates fold change and it's statistics
* Add information to load your files in .Rmd examples
* Add more statistics
* Add more simple analysis without annotation files
