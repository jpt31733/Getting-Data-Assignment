---
title: "README"
author: "Jean Pierre Turgeon"
date: "Monday, March 07, 2016"
output: html_document
---

# Getting and Cleaning Data Course Project

The project consists in calculating the means of a subset of the variables contained in the Smartphone-Based Recognition of Human Activities and Postural Transitions Data Set ([link](http://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions#)).  

The script **run_analysis.R** performs the whole job of aggregating and tidying the data and generating the data frame that contains the summary information.  

To accomplish its task, **run_analysis.R** relies on three scripts:  

1. **get_data.R** loads the data files in R data frames;
2. **merge_dataframes.R** merges the *train* and *test* data frames into one single data frame;
3. **extract_meas.R** assigns meaningful names to the data frame columns, selects the columns that contain means or standard deviations of measurements and generates a summary data frame that contains the average of each variable for each activity and each subject.  

Output : data frame **summary_df**.

This repository contains also a code book that describes the input data to script **run_analysis.R**.