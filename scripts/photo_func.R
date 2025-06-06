# photo handing functions from 
# https://github.com/rfsaldanha/rfsaldanha.github.io/blob/main/photos/photos.qmd

prepare_photos <- function(source_path, dest_path, geometry = "1600"){
  for(f in list.files(source_path, full.names = TRUE)){
    magick::image_read(path = f) |>
      magick::image_resize(geometry = geometry) |>
      magick::image_write(path = paste0("images/", basename(f)))
  }
}

descrip_exif <- function(x){
  exif <- exifr::read_exif(
    path = x, 
    tags = c("Make" ,"Model", "FocalLength", "FNumber", "ExposureTime", 
             "ISO", "LensModel", 
             "BatteryLevel", "SelfTimer", "DateTimeOriginal", "OffsetTime")
  )
  
  glue::glue("{exif$Make} {exif$Model} Lens {exif$LensModel} <br>
             {exif$FocalLength}mm f/{exif$FNumber} 1/{round(1/exif$ExposureTime)} ISO {exif$ISO} <br>
             {lubridate::as_datetime(glue::glue('{exif$DateTimeOriginal} {exif$OffsetTime}'))} UTC")
}

prepare_photos(
  source_path = "~/Downloads/parc_naturel//", 
  dest_path = "images/")
