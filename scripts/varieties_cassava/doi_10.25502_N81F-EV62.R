# R script for "carob"
# license: GPLv3

carob_script <- function(path) {

"Genomic Selection cycle 4B Advanced Yield Trial (35 clones) evaluated  in Onne 2018/2019 Breeding Season selected from 2017.GS.C3B.PYT60 & 61"
  
	uri <- "doi:10.25502/N81F-EV62"
	group <- "varieties_cassava"
	ff  <- carobiner::get_data(uri, path, group)
		
	meta <- data.frame(
		carobiner::get_metadata(uri, path, group, major=1, minor=3),
		data_institute = "IITA",
		publication = NA,
		project = NA,
		data_type = "experiment",
		treatment_vars = "variety",
		response_vars = "yield", 
		carob_contributor = "Robert Hijmans",
		carob_date = "2024-09-18",
		notes = NA
	)

	process_cassava <- carobiner::get_function("process_cassava", path, group)
	d <- process_cassava(ff)
	carobiner::write_files(path = path, metadata = meta, records = d$records, timerecs=d$timerecs)
}

