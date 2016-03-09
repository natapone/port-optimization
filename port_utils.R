read_data <- function(data_folder="data", file_name="TMBAM_hist") {
    hist_file = paste(file_name, "csv", sep = "." )
    hist_path = paste(data_folder, hist_file, sep = "/")
    cat("Read: ", hist_path, "\n")

    hist_data = read.csv(hist_path, header = F,stringsAsFactors = F)

    # set column name
    colnames(hist_data) <- c(
                    "policy_code",
                    "NAV_cal_date",
                    "NAV_date",
                    "NAV",
                    "total_unit",
                    "NAV_per_unit",
                    "YTD",
                    "ret_since",
                    "ret_percent")

    return(hist_data)
}

get_hist <- function() {
    hist_data = read_data()
    fund_hist = list()
    #loop
    for (i in 1:nrow(hist_data)) {
        hist_raw = hist_data[i,]

        # insert NAV_per_unit
        tmp_hist = fund_hist[[hist_raw$policy_code]]
        if (is.null(tmp_hist)) {
            tmp_hist = c(hist_raw$NAV_per_unit)
        } else {
            tmp_hist = c(tmp_hist, hist_raw$NAV_per_unit)
        }

        fund_hist[[hist_raw$policy_code]] = tmp_hist
#         if (i > 10) {
#             return(fund_hist)
#         }

    }

    return(data.frame(fund_hist))
}
