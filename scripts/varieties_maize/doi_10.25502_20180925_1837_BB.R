# R script for "carob"



carob_script <- function(path) {
"This is an international study that contains data on Grain Yield and other Agronomic Traits of Extra-Early, Early Maturing Variety (White & Yellow) under Stress (Drought, Striga) in Africa. The study was carried out by the International Institute of Tropical Agriculture between 2008 and 2016 in twelve African countries."


	uri <- "doi:10.25502/20180925/1837/BB"
	group <- "varieties_maize"	
	ff <- carobiner::get_data(uri, path, group)

	meta <- data.frame(
		carobiner::get_metadata(uri, path, major=2, minor=1, group),
 	    publication="doi:10.1016/j.jenvman.2017.06.058",
		carob_contributor = "Robert Hijmans",
		carob_date="2023-07-03",
		data_type = "experiment",
		response_vars = "yield",
		treatment_vars = "variety",
		project="International Maize Trials",
		data_institute="IITA"
	)

	mzfun <- carobiner::get_function("intmztrial_striga", path, group)
	d <- mzfun(ff, sf="Mali.csv")	
	
	i <- d$location == "Sapu"
	d$country[i] <- "Gambia"

	i <- d$location == "N'tarla"
	d$longitude[i] <- -5.69
	d$latitude[i] <- 12.621
	
	carobiner::write_files(meta, d, path=path)
}
