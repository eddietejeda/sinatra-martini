# Examples:
# - https://projects.iq.harvard.edu/eda
# - https://catalog.data.gov/dataset/u-s-congressional-districts-cb827/resource/36849429-e132-461b-9738-a8dc1adbd03e
# - https://github.com/unitedstates/districts


sources = [
  'https://www2.census.gov/geo/tiger/TIGER2019/ZCTA5/tl_2019_us_zcta510.zip',
  'https://github.com/unitedstates/districts/archive/gh-pages.zip',
  'https://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg'
]


puts "Loading"
download_sequential(sources)
# User.create(:)