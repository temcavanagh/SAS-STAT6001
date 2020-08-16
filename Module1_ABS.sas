* Import dataset;
PROC IMPORT OUT=WORK.locationdata
	DATAFILE= '/folders/myfolders/STAT6001 Data/Module 1 datasets/ABS data/ABS data.csv'
	DBMS=CSV REPLACE;
	GETNAMES=YES;
	DATAROW=2;
RUN;


* Use the CONTENTS procedure to examine the data set properties, and 
  Get a list of the variable names and their types (numeric/string);
PROC CONTENTS DATA=locationdata VARNUM;
RUN;


* Use the PRINT procedure to view the data;
PROC PRINT DATA=locationdata;
RUN;


* create a summary table of the number of persons in each area by indigenous status;
PROC FREQ DATA=locationdata;
	TABLE area*atsi_status /NOCUM NOPERCENT NOCOL;
	WEIGHT count;
RUN;
	