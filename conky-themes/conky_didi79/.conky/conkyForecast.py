#!/usr/bin/python
# -*- coding: utf-8 -*-
###############################################################################
# conkyForecast.py is a (not so) simple (anymore) python script to gather 
# details of the current weather for use in conky.
#
#  Author: Kaivalagi
# Created: 13/04/2008
# Modifications:
#    14/04/2008    Allow day ranges for forecast data
#    14/04/2008    Check for connectivity to xoap service
#    18/04/2008    Allow the setting of spaces for ranged output
#    18/04/2008    Allow Night and Day forecast output
#    18/04/2008    Support locale for condition code text "CC" option, awaiting spanish language translation
#    18/04/2008    Use pickling for class data rather than opening xml, this bypasses the need to interrogate cached data
#    19/04/2008    Added spanish condition text - Thanks Bruce M
#    19/04/2008    Added isnumeric check on all numeric output with units suffix
#    19/04/2008    Altered pickle file naming to include location code
#    19/04/2008    Added spanish week days conversion via locale
#    20/04/2008    Added decent command argument parser
#    20/04/2008    Added --shortweekday option, if given the day of week data type is shortened to 3 characters
#    21/04/2008    Fixed locale options for forecast output
#    21/04/2008    Added --template option to allow custom output using a single exec call :)
#    21/04/2008    Added --hideunits option to remove, for example, mph and C from output
#    23/04/2008    Removed --imperial option from template, this MUST be set as a standard option on the script call and not used in the template file. 
#    23/04/2008    Readded --imperial option to template, enabling metric or imperial values per datatype. Note when using templates command line option will not work.
#    23/04/2008    Added output notifying user if the location given is bad
#    24/04/2008    Added handling for no connectivity, will revert to cached data now (erroring if no cache exists). Tests by trying to open xoap.weather.com
#    24/04/2008    Fixed Celsius to fahrenheit conversion
#    06/05/2008    Updated url used after webservice was updated
#    09/05/2008    Consolidated current condition and forecast data fetch into one call
#    09/05/2008    Added Sunrise and sunset to datatypes, these are specific to both current conditions and forecast data
#    09/05/2008    Added moon phase, barometer reading and barometer description to datatypes, these are only specific to current conditions and so are N/A in forecasted output
#    09/05/2008    Added unit conversions for barometer from mb to inches (imperial)
#    09/05/2008  Updated spanish condition text - Thanks Bruce M
#    10/05/2008  Added french locale data - Thanks benpaka
#    12/05/2008  Added new BF (bearing font) datatype to provide an arrow character (use with Arrow.ttf font) instead of NSEW output from WD (wind direction)
#    12/05/2008  Updated WD output to be locale specific, currently supports default english and spanish - Thanks Bruce M
#    18/05/2008    Added new MF (moon font) datatype to provide a moon font character (characters incorrect and no dedicated font yet).
#    21/05/2008    For current conditions the --datatype=LT option now displays "feels like" temperature rather than the current temperature
#    28/05/2008    Arrows reported to be pointing in the wrong direction. Correction provided by jjgomera
#    03/06/2008    Updated MF function, added days #26, #27, #28 nad #29 to complete the cycle. Corrections provided by Bruce M/uboops/HippyRandall
#    15/06/2008    Added new UI (UV index), UT (UV text), DP (dew point) datatypes
#    18/06/2008    Updated DP (dew point) output to convert to imperial units when required - thanks HippyRandall
#    18/06/2008    Added Spanish and French translations for UV text - Thanks Bruce M.
#    18/06/2008    Fixed incorrect WSW bearing text translation for Spanish and French - thanks Bruce M. 
#    18/06/2008    Updated to now use users own registration details from weather.com, visit http://www.weather.com/services/xmloap.html to register and obtain the PAR and KEY codes
#    06/07/2008    Added check for invalid licence key error in returned xml and now display "*** ERROR: Invalid License Key ***" in output if found...
#    27/07/2008    Updated help text to include bearing font in list of datatypes
#    28/07/2008    Added --beaufont option to convert wind speeds to the beaufort scale, works in templates too
#    28/07/2008    Updated sunrise and sunset times to be output in 24 hour format to save space
#    29/07/2008    24 hour clock now works, units removed for beaufort and --beaufont renamed to --beaufort :)
#    30/07/2008    Updated beaufort calculation to round up or down accordingly to the nearest whole number
#    02/08/2008    Fixed spacing error, default spacing of 1 for ranged output, --space=3 will now give 3 spaces rather than 4.
#    08/08/2008    Updated weather font conditions list to not use black background weather fonts
#    08/08/2008    Added and translate bulgarian locale data from stanko<dot>metodiev<at>gmail<dot>com, aka stancho
#    15/08/2008    Fixed issue with datatype=BF, when N/A is returned for current conditions wind direction, it is now correctly converted to a space
#    16/08/2008    Fixed issue with template output when template file has no space and new line at the end
#    16/08/2008    Added --hidedegreesymbol option to remove the symbol from temperature output, only valid if used as well as --hideunits
#    16/08/2008    Updated connectivity check so it only happens when necessary, also added a timeout option, defaulting to 5 seconds
#    16/08/2008    Added Czech locale "cs" translations - thanks Nite
#    16/08/2008    Tidied up non conky specific output, if there is an error or not only the verbose option will display it
#    16/08/2008    Added --datatype=LU (last updated), it provides the date and time when the last update of weather data occurred
#    17/08/2008    Fix to correct datetime function error
#    17/08/2008    Added Dutch locale "nl" translations - thanks El_Belgicano
#    17/08/2008    Updated error handling and set max startday/endday limit rules in code
#    17/08/2008    Refactored the xoap service handling and caching fallback for issues
#    17/08/2008    Added config data file handling
#    18/08/2008    Updated script to handle languages using the gettext (i18n) functions, seperate locale ".mo" will now be required
#    19/08/2008    Updated conditions_text to match xoap sdk and updated translation options in code
#    20/08/2008    Now using last update field from weather data rather than cache datetime, as this is when the weather data was recorded
#    20/08/2008    config now loaded from ~/.conkyForecast.config
#    28/08/2008    Major rewrite by nite (small changes to this by Kaivalagi)
#                  important functionality changes:
#                      - moved all cached data into one class per location, which gets pickled into one cache file ".conkyForecast-LOCATION.pkl". Because of that, only one option,
#                        CACHE_FOLDERPATH replaced the previous 3 options for specifying the destination cache folder.
#                      - changed DATETIME_FORMAT config option to DATE_FORMAT, which is used only for formatting dates. For times, TIME_FORMAT is used.
#                      - added the following new datatypes:
#                          - LF - Last Fetch. Displays date and time of the last fetching of weather data from the server
#                          - WA - Wind Angle. Displays wind direction as a number
#                          - OB - OBservatory. Displays the name of the observatory from which the weather data for given location originate.
#                          - VI - VIsibility. Displays visibility. As of now, only metric units are supported, because I'm not sure of all possible values
#                                 this can have, so far I only got "Unlimited", 8.0 and 10.0 (in kilometers) but in case of fog this could change to meters?
#                                 If converted to imperial, these numbers are not so "pretty", but it seems weather.com does it this way.
#                                 For 10.km the imperial value from weather.com was 6.2mi.
#                          - CO - COuntry. Previous CN (City Name) is now split into 2 strings (the format was "City, Country")
#                      - some datatypes' value was modified:
#                          - LF and LU both display timestamp in format "DATE_FORMAT TIME_FORMAT". New option --minuteshide was introduced, which hides certain
#                            parts of the timestamp if it is "recent enough" (not older than the minutes specified). Proper description is in the OptionParser help.
#                          - CN now only displays City Name, country is displayed in the CO datatype.
#                      - template parsing was rewritten from scratch and should now be a bit more effective and handle any kind of syntax error gracefully
#                      - added a new option --enableerrors which will in case of an error replace the regular output with the error description
#                        not usable in a template, in case of a template replaces the whole template text with the error description
#                        (useful for testing with templates etc.., but also in conky for displaying an error with internet connection for example)
#                      - errors are now printed to stderr, so they always appear in console but not in conky (only through --enableerrors)
#    31/08/2008    When barometric reading (BR) outputted in imperial (inches) it is given 2 decimal places
#    31/08/2008    Changed pickle import to cPickle because of better performance
#    31/08/2008    Added KeyError exception handler to getOutputText(), in case an unexpected word appears in the weather xml and is used as index to
#                  WeatherText dictionary (like a Wind Bearing text is used as an index for Bearing Font)
#    31/08/2008    Added a "VAR" key to the Bearing Font dictionary in WeatherText
#    31/09/2008    Fixed mixed up current and feels_like temp in current conditions
#    01/09/2008    Shortweekday option missed from getDatatypeFromSet function
#    01/09/2008    Strip out local time from last update before converting datetime for output
#    01/09/2008    Added version option to script which only outputs the version number of the script and exits
#    02/09/2008    Used regex to extract the datetime and timezone (if applicable) from the lastupdate text
#    02/09/2008    VI (visibility) is now converted to miles if --imperial option used
#    02/09/2008    Updated convert function to provide decimal place functionality and used for VI and BR output
#    03/09/2008    Replaced weather.ttf with ConkyWeather.oft and updated WF output to suit, we now have day and night based font output! - thanks Stancho
#    14/09/2008    Updated script to be python 2.4 compliant, file open function not reliant on with operator now
#    14/09/2008    Updated script to be python 2.4 compliant, this time for datetime conversions....hopefully
#    20/09/2008    Added new datatype BS (Bearing font with Speed) for the new direction font which displays different arrows for different wind speeds:
#                      Beafort scale 1-3: Small arrow
#                      Beafort scale 4-6: Bigger arrow
#                      Beafort scale 7-9: Big arrow
#                      Beafort scale 10-12: Very big arrow
#    27/09/2008    Added --centeredwidth option, if used the output will be centered in a string of the set width, padded out with spaces, if the output width is greater than the setting it will have no effect
#    02/10/2008    Updated script to now use "[" and "]" as template brackets rather than "{" and "}" so that the execp/execpi conky command can be used, this enables the use of $font, $color options in the template which conky will then make adjustments for in the output!
#    04/10/2008    Added DL (Daylight) datatype which returns the difference in hours and minutes between sunrise and sunset
#    04/10/2008    Updated to load template file in unicode mode, so we can work with all characters
#    05/10/2008	   Added the possibility to set the location inside a template. To achive this, the script now loads different locations into a dictionary whenever a new location is needed.
#    05/10/2008	   The command line options now set default values for corresponding options of template items
#    05/10/2008	   Modified the error handling a bit (because of the locations etc..). --enableerrors can be used inside a template and after it prints the errors it clears them (so that errors don't get printed many times in a long template).
#    05/10/2008	   Changed the output of DL datatype to HH:MM
#    24/10/2008    Updated daylight output to always provide correct output, now using delta.seconds -> hours/minutes string
#    10/11/2008    Added --errorlog and --infolog options to log data to a file, and removed unnecessary --enableerrors option

#    16/11/2008    Updated translation code to fallback to english if no translation found for locale requested
#    17/11/2008    Added unused text arrays to aid the translation process, all translatable text will now be picked up by pygettext - thanks foppeh
import sys, os, socket, urllib2, gettext, locale, re, codecs

from optparse import OptionParser
from xml.dom import minidom
from datetime import datetime, timedelta
import time

# cPickle is a pickle class implemented in C - so its faster
# in case its not available, use regular pickle
try:
    import cPickle as pickle
except ImportError:
    import pickle

# default to standard locale translation
domain = __file__.replace(os.path.dirname (__file__) + "/", "").replace(".py", "")
localedirectory = os.path.dirname(os.path.abspath(__file__)) + "/locale"
gettext.bindtextdomain(domain, localedirectory)
gettext.textdomain(domain)
gettext.install(domain)

class CommandLineParser:

    parser = None

    def __init__(self):

        self.parser = OptionParser()
        self.parser.add_option("-l", "--location", dest="location", default="UKXX0103", type="string", metavar="CODE", help=u"location code for weather data [default: %default],Use the following url to determine your location code by city name: http://xoap.weather.com/search/search?where=Norwich")
        self.parser.add_option("-d", "--datatype", dest="datatype", default="HT", type="string", metavar="DATATYPE", help=u"[default: %default] The data type options are: DW (Day of Week), WF (Weather Font output), LT (Forecast:Low Temp,Current:Feels Like Temp), HT (Forecast:High Temp,Current:Current Temp), CC (Current Conditions), CT (Conditions Text), PC (Precipitation Chance), HM (Humidity), VI (Visibility), WD (Wind Direction), WA (Wind Angle - in degrees), WS (Wind Speed), WG (Wind Gusts), BF (Bearing Font), BS (Bearing font with Speed), CN (City Name), CO (Country), OB (Observatory), SR (SunRise), SS (SunSet), DL (DayLight), MP (Moon Phase), MF (Moon Font), BR (Barometer Reading), BD (Barometer Description), UI (UV Index), UT (UV Text), DP (Dew Point), LU (Last Update at weather.com), LF (Last Fetch from weather.com). Not applicable at command line when using templates.")
        self.parser.add_option("-s", "--startday", dest="startday", type="int", metavar="NUMBER", help=u"define the starting day number, if omitted current conditions are output. Not applicable at command line when using templates.")
        self.parser.add_option("-e", "--endday", dest="endday", type="int", metavar="NUMBER", help=u"define the ending day number, if omitted only starting day data is output. Not applicable at command line when using templates.")
        self.parser.add_option("-S", "--spaces", dest="spaces", type="int", default=1, metavar="NUMBER", help=u"[default: %default] Define the number of spaces between ranged output. Not applicable at command line when using templates.")
        self.parser.add_option("-t", "--template", dest="template", type="string", metavar="FILE", help=u"define a template file to generate output in one call. A displayable item in the file is in the form [--datatype=HT --startday=1]. The following are possible options within each item: --location,--datatype,--startday,--endday,--night,--shortweekday,--imperial,--beaufort,--hideunits,--hidedegreesymbol,--spaces,--minuteshide. Note that the short forms of the options are not supported! If any of these options is set from the commandline, it sets the default value of the option for all template items.")
        self.parser.add_option("-L", "--locale", dest="locale", type="string", help=u"override the system locale for language output (en=english, es=spanish, fr=french, bg=bulgarian, cs=czech, more to come)")
        self.parser.add_option("-i", "--imperial", dest="imperial", default=False, action="store_true", help=u"request imperial units, if omitted output is in metric.")
        self.parser.add_option("-b", "--beaufort", dest="beaufort", default=False, action="store_true", help=u"request beaufort scale for wind speeds, if omitted output is either metric/imperial.")
        self.parser.add_option("-n", "--night", dest="night", default=False, action="store_true", help=u"switch output to night data, if omitted day output will be output.")
        self.parser.add_option("-w", "--shortweekday", dest="shortweekday", default=False, action="store_true", help=u"Shorten the day of week data type to 3 characters.")
        self.parser.add_option("-u", "--hideunits", dest="hideunits", default=False, action="store_true", help=u"Hide units such as mph or C, degree symbols (°) are still shown.")
        self.parser.add_option("-x", "--hidedegreesymbol", dest="hidedegreesymbol", default=False, action="store_true", help=u"Hide the degree symbol used with temperature output, this is only valid if used in conjunction with --hideunits.")
        self.parser.add_option("-m", "--minuteshide", dest="minuteshide", type="int", metavar="NUMBER", help=u"Works only with LU and LF. If present, hides the date part of the LU or LF timestamp if the day of the timestamp is today. The time part is also hidden, if the timestamp is older than minutes specified in this argument. If set to 0, the time part is always shown. If set to -1, the value EXPIRY_MINUTES from the config file is used.")
        self.parser.add_option("-c", "--centeredwidth", dest="centeredwidth", type="int", metavar="WIDTH", help=u"If used the output will be centered in a string of the set width, padded out with spaces, if the output width is greater than the setting it will have no effect")
        self.parser.add_option("-r", "--refetch", dest="refetch", default=False, action="store_true", help=u"Fetch data regardless of data expiry.")
        self.parser.add_option("-v", "--verbose", dest="verbose", default=False, action="store_true", help=u"Request verbose output, not a good idea when running through conky!")
        self.parser.add_option("-V", "--version", dest="version", default=False, action="store_true", help=u"Displays the version of the script.")
        self.parser.add_option("--errorlogfile", dest="errorlogfile", type="string", metavar="FILE", help=u"If a filepath is set, the script appends errors to the filepath.")
        self.parser.add_option("--infologfile", dest="infologfile", type="string", metavar="FILE", help=u"If a filepath is set, the script appends info to the filepath.")                

    def parse_args(self):
        (options, args) = self.parser.parse_args()
        return (options, args)

    def print_help(self):
        return self.parser.print_help()
    
    
class ForecastConfig:
    CACHE_FOLDERPATH = "/tmp/"
    CONNECTION_TIMEOUT = 5
    EXPIRY_MINUTES = 30
    TIME_FORMAT = "%H:%M"
    DATE_FORMAT = "%Y-%m-%d"
    LOCALE = "" # with no setting the default locale of the system is used
    XOAP_PARTNER_ID = "" # need config with correct partner id
    XOAP_LICENCE_KEY = "" # need config with correct licence key


class ForecastDataset:
    def __init__(self, last_update, day_of_week, low, high, condition_code, condition_text, precip, humidity, wind_dir, wind_dir_numeric, wind_speed, wind_gusts, sunrise, sunset, moon_phase, moon_icon, bar_read, bar_desc, uv_index, uv_text, dew_point, observatory, visibility, city, country):
        self.last_update = last_update
        self.day_of_week = day_of_week
        self.low = low
        self.high = high
        self.condition_code = condition_code
        self.condition_text = condition_text
        self.precip = precip
        self.humidity = humidity
        self.wind_dir = wind_dir
        self.wind_dir_numeric = wind_dir_numeric
        self.wind_speed = wind_speed
        self.wind_gusts = wind_gusts
        self.sunrise = sunrise
        self.sunset = sunset
        self.moon_phase = moon_phase
        self.moon_icon = moon_icon        
        self.bar_read = bar_read
        self.bar_desc = bar_desc
        self.uv_index = uv_index
        self.uv_text = uv_text
        self.dew_point = dew_point
        self.observatory = observatory
        self.visibility = visibility
        self.city = city
        self.country = country

class ForecastLocation:
    timestamp = None
    
    def __init__(self, current, day, night):
        self.current = current
        self.day = day
        self.night = night
        self.timestamp = datetime.today()
        
    def outdated(self, mins):
        if datetime.today() > self.timestamp + timedelta(minutes=mins):
            return True
        else:
            return False

# start ignoring translations required at runtime
def _(text): return text

class ForecastText:

    # translatable dictionaries
    conditions_text = {
        "0": _(u"Tornado"),
        "1": _(u"Tropical Storm"),
        "2": _(u"Hurricane"),
        "3": _(u"Severe Thunderstorms"),
        "4": _(u"Thunderstorms"),
        "5": _(u"Mixed Rain and Snow"),
        "6": _(u"Mixed Rain and Sleet"),
        "7": _(u"Mixed Precipitation"),
        "8": _(u"Freezing Drizzle"),
        "9": _(u"Drizzle"),
        "10": _(u"Freezing Rain"),
        "11": _(u"Light Rain"),
        "12": _(u"Rain"),
        "13": _(u"Snow Flurries"),
        "14": _(u"Light Snow Showers"),
        "15": _(u"Drifting Snow"),
        "16": _(u"Snow"),
        "17": _(u"Hail"),
        "18": _(u"Sleet"),
        "19": _(u"Dust"),
        "20": _(u"Fog"),
        "21": _(u"Haze"),
        "22": _(u"Smoke"),
        "23": _(u"Blustery"),
        "24": _(u"Windy"),
        "25": _(u"N/A"),
        "26": _(u"Cloudy"),
        "27": _(u"Przewaznie pochmurnie"),
        "28": _(u"Przewaznie pochmurnie"),
        "29": _(u"Czesciowo pochmurnie"),
        "30": _(u"Czesciowo pochmurnie"),
        "31": _(u"Clear"),
        "32": _(u"Clear"),
        "33": _(u"Fair"),
        "34": _(u"Fair"),
        "35": _(u"Mixed Rain and Hail"),
        "36": _(u"Hot"),
        "37": _(u"Isolated Thunderstorms"),
        "38": _(u"Scattered Thunderstorms"),
        "39": _(u"Scattered Showers"),
        "40": _(u"Heavy Rain"),
        "41": _(u"Scattered Snow Showers"),
        "42": _(u"Heavy Snow"),
        "43": _(u"Heavy Snow"),
        "44": _(u"N/A"),
        "45": _(u"Scattered Showers"),
        "46": _(u"Snow Showers"),
        "47": _(u"Isolated Thunderstorms"),
        "na": _(u"N/A"),
        "-": _(u"N/A")
    }

    day_of_week_short = {
        "Today": _(u"Now"),
        "Monday": _(u"Mon"),
        "Tuesday": _(u"Tue"),
        "Wednesday": _(u"Wed"),
        "Thursday": _(u"Thu"),
        "Friday": _(u"Fri"),
        "Saturday": _(u"Sat"),
        "Sunday": _(u"Sun")
    }

    # font based character sets, untranslatable

    # ConkyWeather.ttf based output
    conditions_weather_font = {
        "0": u"1", #Tornado
        "1": u"2", #Tropical Storm
        "2": u"3", #Hurricane
        "3": u"n", #Severe Thunderstorms
        "4": u"m", #Thunderstorms
        "5": u"x", #Mixed Rain and Snow
        "6": u"x", #Mixed Rain and Sleet
        "7": u"y", #Mixed Precipitation
        "8": u"s", #Freezing Drizzle
        "9": u"h", #Drizzle
        "10": u"t", #Freezing Rain
        "11": u"h", #Light Rain
        "12": u"i", #Rain
        "13": u"p", #Snow Flurries
        "14": u"p", #Light Snow Showers
        "15": u"8", #Drifting Snow
        "16": u"q", #Snow
        "17": u"u", #Hail
        "18": u"w", #Sleet
        "19": u"7", #Dust
        "20": u"0", #Fog
        "21": u"9", #Haze
        "22": u"4", #Smoke
        "23": u"6", #Blustery 
        "24": u"6", #Windy
        "25": u"-", #N/A
        "26": u"f", #Cloudy
        "27": u"D", #Mostly Cloudy - night
        "28": u"d", #Mostly Cloudy - day
        "29": u"C", #Partly Cloudy - night
        "30": u"c", #Partly Cloudy - day
        "31": u"A", #Clear - night
        "32": u"a", #Clear - day
        "33": u"B", #Fair - night
        "34": u"b", #Fair - day
        "35": u"v", #Mixed Rain and Hail
        "36": u"5", #Hot
        "37": u"k", #Isolated Thunderstorms - day
        "38": u"k", #Scattered Thunderstorms - day
        "39": u"g", #Scattered Showers - day
        "40": u"j", #Heavy Rain
        "41": u"o", #Scattered Snow Showers - day
        "42": u"r", #Heavy Snow
        "43": u"r", #Heavy Snow
        "44": u"-", #N/A
        "45": u"G", #Scattered Showers - night
        "46": u"O", #Scattered Snow Showers - night
        "47": u"K", #Isolated Thunderstorms - night
        "na": u"-", #N/A
        "-": u"-" #N/A
    }

    conditions_moon_font = {
        "0": u"1",
        "1": u"N",
        "2": u"O",
        "3": u"P",
        "4": u"Q",
        "5": u"R",
        "6": u"S",
        "7": u"T",
        "8": u"U",
        "9": u"V",
        "10": u"W",
        "11": u"X",
        "12": u"Y",
        "13": u"Z",
        "14": u"0",
        "15": u"0",
        "16": u"A",
        "17": u"B",
        "18": u"C",
        "19": u"D",
        "20": u"E",
        "21": u"F",
        "22": u"G",
        "23": u"H",
        "24": u"I",
        "25": u"J",
        "26": u"K",
        "27": u"L",
        "28": u"M",
        "29": u"1",
        "N/A": u"",
        "na": u"",
        "-": u""
    }

    # this now returns ascii code
    bearing_arrow_font = {
        "S": 0x31,
        "SSW": 0x32,
        "SW": 0x33,
        "WSW": 0x34,
        "W": 0x35,
        "WNW": 0x36,
        "NW": 0x37,
        "NNW": 0x38,
        "N": 0x39,
        "NNE": 0x3a,
        "NE": 0x3b,
        "ENE": 0x3c,
        "E": 0x3d,
        "ESE": 0x3e,
        "SE": 0x3f,
        "SSE": 0x40,
    }

    # New translatable strings
    # foppeh >> These arrays are here so they get translated even if they
    #           are not used in the code. 
    
    # first all about moon phases
    moon_phase = {	
	"New": _(u"New"),
	"First Quarter": _(u"First Quarter"),
	"Full": _(u"Full"),
	"Last Quarter": _(u"Last Quarter"),
	"Waning Cresent": _(u"Waning Cresent"),
	"Waning Gibbous": _(u"Waning Gibbous"),
	"Waxing Cresent": _(u"Waxing Cresent"),
	"Waxing Gibbous": _(u"Waxing Gibbous")
    }
    
    # foppeh >> Something is going on with these string. I don't know if they are valid.
    #           The weird thing is they are in lower case and the XML seems to spit
    #           text with too many Uppercase. So I don't know if strings presented here
    #           will ever be a valid output from weather.com. Yet I stored them here for
    #           future reference (and because of the French translation).
    
    # all about weather conditions
    # 'blowing dust'                 => 'tempête de sable',
    # 'blowing snow'                 => 'tempête de neige',
    # 'blowing snow and windy'       => 'blizzard',
    # 'clear'                        => 'clair     ',
    # 'cloudy'                       => 'nuageux',
    # 'cloudy and windy'             => 'nuageux et venteux',
    # 'drizzle'                      => 'bruine',
    # 'drifting snow'                => 'accumulation de neige',
    # 'fair'                         => 'clair',
    # 'fair and windy'               => 'clair et venteux',
    # 'fog'                          => 'brouillard',
    # 'haze'                         => 'smog',
    # 'heavy drizzle'                => 'bruine intense',
    # 'heavy rain'                   => 'pluie intense',
    # 'heavy rain and windy'         => 'pluie intense et venteux',
    # 'heavy snow'                   => 'neige intense',
    # 'heavy snow and windy'         => 'neige intense et venteux',
    # 'heavy t-storm'                => 'orage électrique intense',
    # 'light drizzle'                => 'faible bruine',
    # 'light drizzle and windy'      => 'bruine légère  et venteux',
    # 'light freezing drizzle'       => 'bruine légère verglassante',
    # 'light freezing rain'          => 'faible pluie verglassante',
    # 'light rain'                   => 'faible pluie',
    # 'light rain shower'            => 'faible averse de pluie',
    # 'light rain and fog'           => 'faible pluie et brouillard',
    # 'light rain and freezing rain' => 'pluie faible et pluie erglassante',
    # 'light rain with thunder'      => 'faible pluie avec tonnerre',
    # 'light rain and windy'         => 'faible pluie et venteux',
    # 'light snow'                   => 'faible neige',
    # 'light snow shower'            => 'faible averse de neige',
    # 'light snow and sleet'         => 'leichter Schneefall und Schneeregen',
    # 'light snow and windy'         => 'leichter Schneefall und windig',
    # 'mist'                         => 'brume',
    # 'mostly cloudy'                => 'nuageux avec éclaircies',
    # 'mostly cloudy and windy'      => 'venteux et nuageux avec éclaircies',
    # 'partial fog'                  => 'partiellement brumeux',
    # 'partly cloudy'                => 'partiellement nuageux',
    # 'partly cloudy and windy'      => 'partiellement nuageux et venteux',
    # 'patches of fog'               => 'partielles de brouillard',
    # 'rain'                         => 'pluvieux',
    # 'rain and sleet'               => 'pluie et grésil',
    # 'rain and snow'                => 'pluie et neige',
    # 'rain shower'                  => 'averse de pluie',
    # 'rain and fog'                 => 'pluie et brouillard',
    # 'rain and windy'               => 'pluvieux et venteux',
    # 'sand'                         => 'sable',
    # 'shallow fog'                  => 'brouillard mince',
    # 'showers in the vicinity'      => 'averses à proximité',
    # 'sleet'                        => 'grésil',
    # 'smoke'                        => 'fumée',
    # 'snow'                         => 'neige',
    # 'snow and fog'                 => 'neige et brouillard',
    # 'snow and freezing rain'       => 'neige et pluie verglassante',
    # 'snow grains'                  => 'neige intermittante',
    # 'snow showers'                 => 'averse de neige',
    # 'snow and windy and fog'       => 'neige, brouillard et venteux',
    # 'squalls and windy'            => 'vent et grésil',
    # 'sunny'                        => 'ensoleillé',
    # 'sunny and windy'              => 'ensoleillé et venteux',
    # 't-storm'                      => 'Orage Électrique',
    # 'thunder'                      => 'tonnerre',
    # 'thunder in the vicinity'      => 'tonnerre aux alentours',
    # 'unknown precip'               => 'précipitation inconnue',
    # 'widespread dust'              => 'vents de poussière',
    # 'wintry mix'                   => 'conditions hivernales variables',

    
    # some general things...
    general = {
 	"n/a": _(u"n/a"),
	'N/A': _(u"N/A"),
	'Not Available': _(u"Not Available"),
	'unknown': _(u"unknown"),
	'NONE': _(u"NONE"),
	'day': _(u"day"),
	'night': _(u"night")
    }
    
    # UV index ...
    UV_index = {
	"Extreme": _(u"Extreme"),
	"Very high": _(u"Very High"),
	"High": _(u"High"),
	"Moderate": (u"Moderate"),
	"Low": _(u"Low")
    }
    
    # tendencies used for barometric pressure
    bar_pressure = {
	"Very Low": _(u"Very Low"),
	"Moderate": _(u"Moderate"),
	"rising": _(u"rising"),
	"falling": _(u"falling"),
	"steady": _(u"steady"),
	"calm": _(u"calm")
    }


    # wind directions long
    wind_directions_long = {
	"East": _(u"East"),
	"East Northeast": _(u"East Northeast"),
	"East Southeast": _(u"East Southeast"),
	"North": _(u"North"),
	"Northeast": _(u"Northeast"),
	"North Northeast": _(u"North Northeast"),
	"North Northwest": _(u"North Northwest"),
	"Northwest": _(u"Northwest"),
	"South": _(u"South"),
	"Souteast": _(u"Southeast"),
	"South Southeast": _(u"South Southeast"),
	"South Southwest": _(u"South Southwest"),
	"Southwest": _(u"Southwest"),
	"variable": _(u"variable"),
	"West": _(u"West"),
	"West Northwest": _(u"West Northwest"),
	"West Southwest": _(u"West Southwest")
    }
    
    wind_directions_short = {
	"E": _(u"E"),
	"ENE": _(u"ENE"),
	"ESE": _(u"ESE"),
	"N": _(u"N"),
	"NE": _(u"NE"),
	"NNE": _(u"NNE"),
	"NNW": _(u"NNW"),
	"NW": _(u"NW"),
	"S": _(u"S"),
	"SE": _(u"SE"),
	"SSE": _(u"SSE"),
	"SSW": _(u"SSW"),
	"SW": _(u"SW"),
	"W": _(u"W"),
	"WNW": _(u"WNW"),
	"WSW": _(u"WSW")
    }

    days_of_week = {
	"Today": _(u"Today"),
	"Monday": _(u"Monday"),
	"Tuesday":_(u"Tuesday"),
	"Wednesday":_(u"Wednesday"),
	"Thursday": _(u"Thursday"),
	"Friday": _(u"Friday"),
	"Saturday": _(u"Saturday"),
	"Sunday": _(u"Sunday")
    }
    
# end ignoring translations
del _

class ForecastInfo:
    
    # design time variables
    options = None
    config = None
    forecast_data = {}
    # a list of locations for which an attempt was made to load them
    # locations in this list are not loaded again (if there was an error,
    # this makes sure it doesn't reapeat over and over)
    loaded_locations = []
    error = ""
    errorfound = False
    
    # design time settings
    CONFIG_FILENAME = ".conkyForecast.config"
    CACHE_FILENAME_TEMPLATE = ".conkyForecast-LOCATION.cache"
    MAX_DAY_NUMBER = 4

    def __init__(self, options):

        self.options = options
                                         
        self.loadConfigData()
        
        # setup timeout for connections
        # TODO: seems like this doesn't work in all cases..
        socket.setdefaulttimeout(self.config.CONNECTION_TIMEOUT)
        
        # set the locale
        if self.options.locale == None:
            if self.config.LOCALE == "":
                self.options.locale = locale.getdefaultlocale()[0][0:2]
            else:
                self.options.locale = self.config.LOCALE

        self.logInfo("Locale set to " + self.options.locale)
        
        # if not the default "en" locale, configure the i18n language translation    
        if self.options.locale != "en":

            self.logInfo("Looking for translation file for '%s' under %s" % (self.options.locale, localedirectory))
            
            if gettext.find(domain, localedirectory, languages=[self.options.locale]) != None:
                self.logInfo("Translation file found for '%s'" % self.options.locale)
                
                try:
                    trans = gettext.translation(domain, localedirectory, languages=[self.options.locale])
                    trans.install(unicode=True)
                    self.logInfo("Translation installed for '%s'" % self.options.locale)
                    
                except Exception, e:
                    self.logError("Unable to load translation for '%s' %s" % (self.options.locale, e.__str__()))
            else:
                self.logInfo("Translation file not found for '%s', defaulting to 'en'" % self.options.locale)
                self.options.locale = "en"
                
    def loadConfigData(self):
        try:         
            # load .conkyForecast.config from home directory of the user
            configfilepath = os.path.join(os.path.expanduser('~'), self.CONFIG_FILENAME)
                                          
            if os.path.exists(configfilepath):
                
                self.config = ForecastConfig()
                
                #load the file
                fileinput = open(configfilepath)
                lines = fileinput.read().split("\n")
                fileinput.close() 

                for line in lines:
                    line = line.strip()
                    if len(line) > 0 and line[0:1] != "#": # ignore commented lines or empty ones
    
                        name = line.split("=")[0].strip().upper() # config setting name on the left of =
                        value = line.split("=")[1].split("#")[0].strip() # config value on the right of = (minus any trailing comments)
                        
                        if len(value) > 0:
                            if name == "CACHE_FOLDERPATH":
                                self.config.CACHE_FOLDERPATH = value
                            elif name == "CONNECTION_TIMEOUT":
                                try: # NITE: removed the isNumeric() check in favor of this..its more effective and lets the user know something is wrong
                                    self.config.CONNECTION_TIMEOUT = int(value)
                                except:
                                    self.logError("Invalid value of config option CONNECTION_TIMEOUT: " + value)
                            elif name == "EXPIRY_MINUTES":
                                try:
                                    self.config.EXPIRY_MINUTES = int(value)
                                except:
                                    self.logError("Invalid value of config option EXPIRY_MINUTES: " + value)
                            elif name == "TIME_FORMAT":
                                self.config.TIME_FORMAT = value
                            elif name == "DATE_FORMAT":
                                self.config.DATE_FORMAT = value                                    
                            elif name == "LOCALE":
                                self.config.LOCALE = value
                            elif name == "XOAP_PARTNER_ID":
                                self.config.XOAP_PARTNER_ID = value
                            elif name == "XOAP_LICENCE_KEY":
                                self.config.XOAP_LICENCE_KEY = value
                            else:
                                self.logError("Unknown option in config file: " + name)

                if self.options.verbose == True:
                    print >> sys.stdout,"*** CONFIG OPTIONS:"
                    print >> sys.stdout,"    CACHE_FOLDERPATH:", self.config.CACHE_FOLDERPATH
                    print >> sys.stdout,"    CONNECTION_TIMEOUT:", self.config.CONNECTION_TIMEOUT
                    print >> sys.stdout,"    EXPIRY_MINUTES:", self.config.EXPIRY_MINUTES
                    print >> sys.stdout,"    TIME_FORMAT:", self.config.TIME_FORMAT
                    print >> sys.stdout,"    DATE_FORMAT:", self.config.DATE_FORMAT                
                    print >> sys.stdout,"    LOCALE:", self.config.LOCALE
                    print >> sys.stdout,"    XOAP_PARTNER_ID:", self.config.XOAP_PARTNER_ID
                    print >> sys.stdout,"    XOAP_LICENCE_KEY:", self.config.XOAP_LICENCE_KEY
                    
            else:
                self.logError("Config data file %s not found, using defaults (Registration info is needed though)" % configfilepath)

        except Exception, e:
            self.logError("Error while loading config data, using defaults (Registration info is needed though): " + e.__str__())


    def checkAndLoad(self, location):

        # if the location was not loaded before (or attempted to load)
        if not location in self.loaded_locations:
            # add it to the list so it doesn't get loaded again (or attempted to load)
            self.loaded_locations.append(location)

            # define CACHE_FILEPATH based on cache folder and location code
            CACHE_FILEPATH = os.path.join(self.config.CACHE_FOLDERPATH, self.CACHE_FILENAME_TEMPLATE.replace("LOCATION", location))

            if not self.forecast_data.has_key(location):
                if os.path.exists(CACHE_FILEPATH):
                    try:
                        self.logInfo("Loading cache file " + CACHE_FILEPATH)
                        file = open(CACHE_FILEPATH, 'rb')
                        self.forecast_data[location] = pickle.load(file)
                        file.close()
                    except Exception, e:
                        self.logError("Unable to read the cache file %s: %s" % (CACHE_FILEPATH, e.__str__()))

            # check the data in the dictionary and update if outdated
            # if there was an update, store the new data in the cache file
            if self.checkAndUpdate(location) == True:
                try:
                    self.logInfo("Saving updated cache file " + CACHE_FILEPATH)
                    file = open(CACHE_FILEPATH, 'wb')
                    pickle.dump(self.forecast_data[location], file)
                    file.close()
                except Exception, e:
                    self.logError("Unable to save cache file %s: %s" % (CACHE_FILEPATH, e.__str__()))

        # if the location is still not in cache, print an error and return false to writeOutput()
        if self.forecast_data.has_key(location):
            return True
        else:
            self.logError("Location %s is not in cache." % self.options.location) 
            return False

    def checkAndUpdate(self, location):
        # if the location is outdated or the refetch is forced..
        if not self.forecast_data.has_key(location) or \
           self.forecast_data[location].outdated(self.config.EXPIRY_MINUTES) or \
           self.options.refetch == True:

            # obtain current conditions data from xoap service
            try:
                url = "http://xoap.weather.com/weather/local/" + location + "?cc=*&dayf=8&link=xoap&prod=xoap&par=" + self.config.XOAP_PARTNER_ID + "&key=" + self.config.XOAP_LICENCE_KEY + "&unit=m"
        
                self.logInfo("Fetching weather data from " + url)

                usock = urllib2.urlopen(url)
                xml = usock.read()
                usock.close()
                
            except Exception, e:
                self.logError("Server connection error: " + e.__str__())
            
            else:
                # interrogate weather data
                try:
                    # parse the XML
                    self.weatherxmldoc = minidom.parseString(xml)
                                    
                    weather_n = self.weatherxmldoc.documentElement
                    
                    # check for an error and raise an exception
                    if len(weather_n.getElementsByTagName('err')) > 0:
                        raise Exception, self.getText(weather_n, 'err')
                    
                    #head_n = self.getChild(weather_n, 'head')
                    #visibility_unit = self.getText(head_n, 'ud')
                    
                    location_n = self.getChild(weather_n, 'loc')
                    city, country = self.getText(location_n, 'dnam').split(',')
                    country = country.strip()
                    
                    # current conditions data
                    day_of_week = _(u"Today")
                    precip = _(u"N/A")
                    sunrise = self.getText(location_n, 'sunr')
                    sunset = self.getText(location_n, 'suns')

                    current_condition_n = self.getChild(weather_n, 'cc')
                    last_update = self.getText(current_condition_n, 'lsup')
                    observatory = self.getText(current_condition_n, 'obst')
                    # remove the ", country" from the string (the string is in form "location_name, country")
                    observatory = observatory[:observatory.rfind(',')]
                    current_desc = self.getText(current_condition_n, 't')
                    current_code = self.getText(current_condition_n, 'icon')
                    current_temp = self.getText(current_condition_n, 'tmp')
                    current_temp_feels = self.getText(current_condition_n, 'flik')
                    
                    bar_n = self.getChild(current_condition_n, 'bar')
                    bar_read = self.getText(bar_n, 'r')
                    bar_desc = self.getText(bar_n, 'd')
                    
                    wind_n = self.getChild(current_condition_n, 'wind')
                    wind_speed = self.getText(wind_n, 's')
                    wind_gusts = self.getText(wind_n, 'gust')
                    wind_direction_numeric = self.getText(wind_n, 'd')
                    wind_direction = self.getText(wind_n, 't')
                    
                    humidity = self.getText(current_condition_n, 'hmid')
                    visibility = self.getText(current_condition_n, 'vis')
                    #if self.isNumeric(visibility):
                    #    visibility = visibility + visibility_unit
                    
                    uv_n = self.getChild(current_condition_n, 'uv')
                    uv_index = self.getText(uv_n, 'i')
                    uv_text = self.getText(uv_n, 't')
                    
                    dew_point = self.getText(current_condition_n, 'dewp')
                    
                    moon_n = self.getChild(current_condition_n, 'moon')
                    moon_icon = self.getText(moon_n, 'icon')
                    moon_phase = self.getText(moon_n, 't')
                    
                    current_forecast_data = ForecastDataset(last_update, day_of_week, current_temp_feels, current_temp, current_code, current_desc, precip, humidity, wind_direction, wind_direction_numeric, wind_speed, wind_gusts, sunrise, sunset, moon_phase, moon_icon, bar_read, bar_desc, uv_index, uv_text, dew_point, observatory, visibility, city, country)
    
                    # collect forecast data
                    observatory = _(u"N/A")
                    bar_read = _(u"N/A")
                    bar_desc = _(u"N/A")
                    visibility = _(u"N/A")
                    uv_index = _(u"N/A")
                    uv_text = _(u"N/A")
                    dew_point = _(u"N/A")
                    moon_phase = _(u"N/A")
                    moon_icon = _(u"N/A")
                    
                    forecast_n = self.getChild(weather_n, 'dayf')
                    last_update = self.getText(forecast_n, 'lsup')
                    
                    day_nodes = forecast_n.getElementsByTagName('day')
                    
                    day_forecast_data_list = []
                    night_forecast_data_list = []
        
                    for day in day_nodes:
                        day_of_week = day.getAttribute('t')

                        high_temp = self.getText(day, 'hi')
                        low_temp = self.getText(day, 'low')
                        sunrise = self.getText(day, 'sunr')
                        sunset = self.getText(day, 'suns')
    
                        # day forecast specific data
                        daytime_n = self.getChild(day, 'part')
                        condition_code = self.getText(daytime_n, 'icon')
                        condition = self.getText(daytime_n, 't')

                        wind_n = self.getChild(daytime_n, 'wind')
                        wind_speed = self.getText(wind_n, 's')
                        wind_gusts = self.getText(wind_n, 'gust')
                        wind_direction_numeric = self.getText(wind_n, 'd')
                        wind_direction = self.getText(wind_n, 't')
                        
                        precip = self.getText(daytime_n, 'ppcp')
                        humidity = self.getText(daytime_n, 'hmid')
                        
                        day_forecast_data = ForecastDataset(last_update, day_of_week, low_temp, high_temp, condition_code, condition, precip, humidity, wind_direction, wind_direction_numeric, wind_speed, wind_gusts, sunrise, sunset, moon_phase, moon_icon, bar_read, bar_desc, uv_index, uv_text, dew_point, observatory, visibility, city, country)
                        day_forecast_data_list.append(day_forecast_data)
    
                        # night forecast specific data
                        daytime_n = self.getChild(day, 'part', 1)
                        condition_code = self.getText(daytime_n, 'icon')
                        condition = self.getText(daytime_n, 't')

                        wind_n = self.getChild(daytime_n, 'wind')
                        wind_speed = self.getText(wind_n, 's')
                        wind_gusts = self.getText(wind_n, 'gust')
                        wind_direction_numeric = self.getText(wind_n, 'd')
                        wind_direction = self.getText(wind_n, 't')
                        
                        precip = self.getText(daytime_n, 'ppcp')
                        humidity = self.getText(daytime_n, 'hmid')
                        
                        night_forecast_data = ForecastDataset(last_update, day_of_week, low_temp, high_temp, condition_code, condition, precip, humidity, wind_direction, wind_direction_numeric, wind_speed, wind_gusts, sunrise, sunset, moon_phase, moon_icon, bar_read, bar_desc, uv_index, uv_text, dew_point, observatory, visibility, city, country)
                        night_forecast_data_list.append(night_forecast_data)
                        
                    self.forecast_data[location] = ForecastLocation(current_forecast_data, day_forecast_data_list, night_forecast_data_list)
                    
                    return True
            
                except Exception, e:
                    self.logError("Error reading weather data: " + e.__str__())

    def getTimestampOutput(self, timestamp, minuteshide):            
        # minuteshide:
        # None = disabled
        # -1 = hide days and use config.EXPIRY_MINUTES
        # 0 = hide days and always show hours
        
        output = u""
        
        today = datetime.today()
        days = today.day - timestamp.day
        if days or minuteshide == None:
            output += timestamp.strftime(self.config.DATE_FORMAT)
        
        if minuteshide == -1:
            minuteshide = self.config.EXPIRY_MINUTES
            
        delta = today - timestamp
        if days or minuteshide == None or minuteshide == 0 or delta.seconds > minuteshide * 60:
            if (len(output) > 0):
                output += " "
            output += timestamp.strftime(self.config.TIME_FORMAT)
        
        return output


    def getDatatypeFromSet(self, location, datatype, set, shortweekday, imperial, beaufort, tempunit, speedunit, distanceunit, pressureunit, minuteshide, centeredwidth):
        output = u""

        try:
            if datatype == "LU":
                datetext, timezone = re.match(r"(\d{1,2}/\d{1,2}/\d{2} \d{1,2}:\d{2} [A|P]M)\s(\w*\s*\w*)",set.last_update).groups()
                if datetext != None:
                    #output = self.getTimestampOutput(datetime.strptime(datetext, "%m/%d/%y %I:%M %p"), minuteshide)
                    
                    # python 2.4 compliant
                    output = self.getTimestampOutput(datetime(*(time.strptime(datetext, "%m/%d/%y %I:%M %p"))[0:6]), minuteshide)
                    if timezone != None and timezone != "Local Time" and len(output) > 0:
                        output = output + " " + timezone
                else:
                    output = set.last_update.strip()
                    self.logError("Unable to extract the Last update date from the dataset")
            elif datatype == "LF":
                output = self.getTimestampOutput(self.forecast_data[location].timestamp, minuteshide)
            elif datatype == "DW":
                if shortweekday == True:
                    output = _(ForecastText.day_of_week_short[set.day_of_week])
                else:
                    output = _(set.day_of_week)
            elif datatype == "WF":
                output = ForecastText.conditions_weather_font[set.condition_code]
            elif datatype == "LT":
                if self.isNumeric(set.low) == True:
                    if imperial == True:
                        string = self.convertCelsiusToFahrenheit(set.low)
                    else:
                        string = set.low
                    string = string + tempunit
                else:
                    string = _(set.low)
                output = string
            elif datatype == "HT":
                if self.isNumeric(set.high) == True:
                    if imperial == True:
                        string = self.convertCelsiusToFahrenheit(set.high)
                    else:
                        string = set.high
                    string = string + tempunit
                else:
                    string = _(set.high)
                output = string
            elif datatype == "CC":
                output = _(ForecastText.conditions_text[set.condition_code])
            elif datatype == "CT":
                output = _(set.condition_text)
            elif datatype == "PC":
                if self.isNumeric(set.precip) == True:
                    string = set.precip + u"%"
                else:
                    string = _(set.precip)
                output = string
            elif datatype == "HM":
                if self.isNumeric(set.humidity) == True:
                    string = set.humidity + u"%"
                else:
                    string = _(set.humidity)
                output = string
            elif datatype == "WD":
                output = _(set.wind_dir)
            elif datatype == "BF":
                if set.wind_speed == "calm":
                    output = chr(0x25)
                else:
                    if (set.wind_dir == "VAR"):
                        output = chr(0x22) # 2nd level var arrow
                    else:
                        try:
                            # for the old datatype, add 0x10, that makes the output in the A-P range,
                            # which is the 2nd level arrow
                            output = chr(ForecastText.bearing_arrow_font[set.wind_dir] + 0x10)
                        except KeyError:
                            # if the value wasn't found in ForecastText.bearing_arrow_font, use space
                            output = "-"
            elif datatype == "BS":
                if set.wind_speed == "calm":
                    output = chr(0x25)
                elif self.isNumeric(set.wind_speed) == True:
                    if (set.wind_dir == "VAR"):
                        output = chr(0x21 + self.getWindLevel(set.wind_speed))
                    else:
                        try:
                            output = chr(ForecastText.bearing_arrow_font[set.wind_dir] + self.getWindLevel(set.wind_speed) * 0x10)
                        except KeyError:
                            # if the value wasn't found in ForecastText.bearing_arrow_font, use N/A
                            output = "-"
                else:
                    try:
                        # if the speed is not "calm" but also not a number, add 0x10
                        # that makes the output in the A-P range, the 2nd level arrow
                        output = chr(ForecastText.bearing_arrow_font[set.wind_dir] + 0x10)
                    except KeyError:
                        # if the value wasn't found in ForecastText.bearing_arrow_font, use N/A
                        output = "-"
            elif datatype == "WA":
                output = _(set.wind_dir_numeric)
            elif datatype == "WS":
                if self.isNumeric(set.wind_speed) == True:
                    if beaufort == True:
                        string = self.convertKPHtoBeaufort(set.wind_speed)
                    elif imperial == True:
                        string = self.convertKilometresToMiles(set.wind_speed)
                    else:
                        string = set.wind_speed
                    string = string + speedunit
                else:
                    string = _(set.wind_speed)
                output = string
            elif datatype == "WG":
                if self.isNumeric(set.wind_gusts) == True:
                    if beaufort == True:
                        string = self.convertKPHtoBeaufort(set.wind_gusts)
                    elif imperial == True:
                        string = self.convertKilometresToMiles(set.wind_gusts)
                    else:
                        string = set.wind_gusts
                    string = string + speedunit
                else:
                    string = _(set.wind_gusts) # need to define translations
                output = string
            elif datatype == "SR":
                #srtime = datetime.strptime(set.sunrise, "%I:%M %p")
                #output = srtime.strftime(self.config.TIME_FORMAT)

                # python 2.4 compliant
                srtime = datetime(*(time.strptime(set.sunrise, "%I:%M %p"))[0:6])
                output = srtime.strftime(self.config.TIME_FORMAT)    
                                
            elif datatype == "SS":
                #sstime = datetime.strptime(set.sunset, "%I:%M %p")
                #output = sstime.strftime(self.config.TIME_FORMAT)
                
                # python 2.4 compliant
                sstime = datetime(*(time.strptime(set.sunset, "%I:%M %p"))[0:6])
                output = sstime.strftime(self.config.TIME_FORMAT)
            elif datatype == "DL":
                srtime = datetime(*(time.strptime(set.sunrise, "%I:%M %p"))[0:6])
                sstime = datetime(*(time.strptime(set.sunset, "%I:%M %p"))[0:6])
                delta = sstime - srtime              
                output = self.getHoursMinutesStringFromSeconds(delta.seconds)
            elif datatype == "MP":
                output = _(set.moon_phase) # need to define translations
            elif datatype == "MF":
                output = ForecastText.conditions_moon_font[set.moon_icon]                        
            elif datatype == "BR":
                if self.isNumeric(set.bar_read) == True:
                    if imperial == True:
                        string = self.convertMillibarsToInches(set.bar_read,2)
                    else:
                        string = set.bar_read
                    string = string + pressureunit
                else:
                    string = _(set.bar_read)
                output = string
            elif datatype == "BD":
                output = _(set.bar_desc) # need to define translations
            elif datatype == "UI":
                output = _(set.uv_index)
            elif datatype == "UT":
                output = _(set.uv_text)
            elif datatype == "DP":
                if self.isNumeric(set.dew_point) == True:
                    if imperial == True:
                        string = self.convertCelsiusToFahrenheit(set.dew_point)
                    else:
                        string = set.dew_point
                    string = string + tempunit
                else:
                    string = _(set.dew_point)
                output = string
            elif datatype == "OB":
                output = set.observatory
            elif datatype == "VI":
                if self.isNumeric(set.visibility) == True:
                    if imperial == True:
                        string = self.convertKilometresToMiles(set.visibility,1)
                    else:
                        string = set.visibility
                    string = string + distanceunit
                else:
                    string = _(set.visibility)
                output = string            
            elif datatype == "CN":
                output = set.city
            elif datatype == "CO":
                output = set.country
            else:
                self.logError("Unknown datatype requested: " + datatype)

        except KeyError, e:
            self.logError("Unknown value %s encountered for datatype '%s'! Please report this!" % (e.__str__(), datatype))
        
        # center the text if requested
        if self.isNumeric(centeredwidth) == True:
            output = output.center(int(centeredwidth))    
                            
        return output


    def getDatasetOutput(self, location, datatype, startday, endday, night, shortweekday, imperial, beaufort, hideunits, hidedegreesymbol, spaces, minuteshide, centeredwidth):

        output = u""
        # Check if the location is loaded, if not, load it. If it can't be loaded, there was an error
        if not self.checkAndLoad(location):
            self.logError("Failed to load the location cache")
            return output

        # define current units for output
        if hideunits == False:
            if imperial == False:
                tempunit = _(u"°C")
                speedunit = _(u"kph")
                distanceunit = _(u"km")
                pressureunit = _(u"mb")
            else:
                tempunit = _(u"°F")
                speedunit = _(u"mph")
                distanceunit = _(u"m")
                pressureunit = _(u"in")
                
            # override speed units if beaufort selected
            if beaufort == True:
                speedunit = u""
        else:
            # remove degree symbol if not required
            if hidedegreesymbol == False:
                tempunit = u"°"
            else:
                tempunit = u""
                
            speedunit = u""
            distanceunit = u""
            pressureunit = u""

        if startday == None:
            output += self.getDatatypeFromSet(location, datatype, self.forecast_data[location].current, shortweekday, imperial, beaufort, tempunit, speedunit, distanceunit, pressureunit, minuteshide, centeredwidth)
        else: # forecast data

            # ensure startday and enday are within the forecast limit
            
            if startday < 0:
                startday = 0
                self.logError("--startday set beyond forecast limit, reset to minimum of 0")
            elif startday > self.MAX_DAY_NUMBER:
                startday = self.MAX_DAY_NUMBER
                self.logError("--startday set beyond forecast limit, reset to maximum of " + self.MAX_DAY_NUMBER)
                
            if endday == None: # if no endday was set use startday
                endday = startday
            elif endday < 0:
                endday = 0
                self.logError("--endday set beyond forecast limit, reset to minimum of 0")
            elif endday > self.MAX_DAY_NUMBER:
                endday = self.MAX_DAY_NUMBER
                self.logError("--endday set beyond forecast limit, reset to maximum of " + self.MAX_DAY_NUMBER)
                
            for daynumber in range(startday, endday + 1):
                
                if night == True:
                    output += self.getDatatypeFromSet(location, datatype, self.forecast_data[location].night[daynumber], shortweekday, imperial, beaufort, tempunit, speedunit, distanceunit, pressureunit, minuteshide, centeredwidth)
                else:
                    output += self.getDatatypeFromSet(location, datatype, self.forecast_data[location].day[daynumber], shortweekday, imperial, beaufort, tempunit, speedunit, distanceunit, pressureunit, minuteshide, centeredwidth)
                    
                if daynumber != endday:
                    output += self.getSpaces(spaces)

        return output

    def getTemplateItemOutput(self, template_text):
        
        # keys to template data
        LOCATION_KEY = "location"
        DATATYPE_KEY = "datatype"
        STARTDAY_KEY = "startday"
        ENDDAY_KEY = "endday"
        NIGHT_KEY = "night"
        SHORTWEEKDAY_KEY = "shortweekday"
        IMPERIAL_KEY = "imperial"
        BEAUFORT_KEY = "beaufort"
        HIDEUNITS_KEY = "hideunits"
        HIDEDEGREESYMBOL_KEY = "hidedegreesymbol"
        SPACES_KEY = "spaces"
        MINUTESHIDE_KEY = "minuteshide"
        CENTEREDWIDTH_KEY = "centeredwidth"
        
        location = self.options.location
        datatype = self.options.datatype
        startday = self.options.startday
        endday = self.options.endday
        night = self.options.night
        shortweekday = self.options.shortweekday
        imperial = self.options.imperial
        beaufort = self.options.beaufort
        hideunits = self.options.hideunits
        hidedegreesymbol = self.options.hidedegreesymbol
        spaces = self.options.spaces
        minuteshide = self.options.minuteshide
        centeredwidth = self.options.centeredwidth
        
        for option in template_text.split('--'):
            if len(option) == 0 or option.isspace():
                continue
            
            # not using split here...it can't assign both key and value in one call, this should be faster
            x = option.find('=')
            if (x != -1):
                key = option[:x].strip()
                value = option[x + 1:].strip()
                if value == "":
                    value = None
            else:
                key = option.strip()
                value = None
            
            try:
                if key == LOCATION_KEY:
                    location = value
                elif key == DATATYPE_KEY:
                    datatype = value
                elif key == STARTDAY_KEY:
                    startday = int(value)
                elif key == ENDDAY_KEY:
                    endday = int(value)
                elif key == NIGHT_KEY:
                    night = True
                elif key == SHORTWEEKDAY_KEY:
                    shortweekday = True
                elif key == IMPERIAL_KEY:
                    imperial = True
                elif key == BEAUFORT_KEY:
                    beaufort = True
                elif key == HIDEUNITS_KEY:
                    hideunits = True
                elif key == HIDEDEGREESYMBOL_KEY:
                    hidedegreesymbol = True
                elif key == SPACES_KEY:
                    spaces = int(value)
                elif key == MINUTESHIDE_KEY:
                    if value != None:
                        minuteshide = int(value)
                    else:
                        minuteshide = -1
                elif key == CENTEREDWIDTH_KEY:
                    centeredwidth = value
                else:
                    self.logError("Unknown template option: " + option)

            except (TypeError, ValueError):
                self.logError("Cannot convert option argument to number: " + option)
                return u""
                
        if datatype != None:
            return self.getDatasetOutput(location, datatype, startday, endday, night, shortweekday, imperial, beaufort, hideunits, hidedegreesymbol, spaces, minuteshide, centeredwidth)
        else:
            self.logError("Template item does not have datatype defined")
            return u""

    def getOutputFromTemplate(self, template):
        output = u""
        end = False
        a = 0
        
        # a and b are indexes in the template string
        # moving from left to right the string is processed
        # b is index of the opening bracket and a of the closing bracket
        # everything between b and a is a template that needs to be parsed
        while not end:
            b = template.find('[', a)
            
            if b == -1:
                b = len(template)
                end = True
            
            # if there is something between a and b, append it straight to output
            if b > a:
                output += template[a : b]
                # check for the escape char (if we are not at the end)
                if template[b - 1] == '\\' and not end:
                    # if its there, replace it by the bracket
                    output = output[:-1] + '['
                    # skip the bracket in the input string and continue from the beginning
                    a = b + 1
                    continue
                    
            if end:
                break
            
            a = template.find(']', b)
            
            if a == -1:
                self.logError("Missing terminal bracket (]) for a template item")
                return u""
            
            # if there is some template text...
            if a > b + 1:
                output += self.getTemplateItemOutput(template[b + 1 : a])
            
            a = a + 1

        return output

    def writeOutput(self):
        if self.options.template != None:
            #load the file
            try:
                fileinput = codecs.open(self.options.template, encoding='utf-8')
                template = fileinput.read()
                fileinput.close()
            except Exception, e:
                self.logError("Error loading template file: " + e.__str__())
            else:
                output = self.getOutputFromTemplate(template)
        else:
            output = self.getDatasetOutput(self.options.location, self.options.datatype, self.options.startday, self.options.endday, self.options.night, self.options.shortweekday, self.options.imperial, self.options.beaufort, self.options.hideunits, self.options.hidedegreesymbol, self.options.spaces, self.options.minuteshide, self.options.centeredwidth)
            
        print output.encode("utf-8")

    def logInfo(self, text):
        if self.options.verbose == True:
            print >> sys.stdout, "INFO: " + text

        if self.options.infologfile != None:
            datetimestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S") 
            fileoutput = open(self.options.infologfile, "ab")
            fileoutput.write(datetimestamp+" INFO: "+text+"\n")
            fileoutput.close()
            
    def logError(self, text):
        print >> sys.stderr, "ERROR: " + text
        
        if self.options.errorlogfile != None:
            datetimestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S") 
            fileoutput = open(self.options.errorlogfile, "ab")
            fileoutput.write(datetimestamp+" ERROR: "+text+"\n")
            fileoutput.close()

    def getText(self, parentNode, name):
        try:
            node = parentNode.getElementsByTagName(name)[0]
        except IndexError:
            raise Exception, "Data element <%s> not present under <%s>" % (name, parentNode.tagName)

        rc = ""
        for child in node.childNodes:
            if child.nodeType == child.TEXT_NODE:
                rc = rc + child.data
        return rc
    
    def getChild(self, parentNode, name, index = 0):
        try:
            return parentNode.getElementsByTagName(name)[index]
        except IndexError:
            raise Exception, "Data element <%s> is not present under <%s> (index %i)" % (name, parentNode.tagName, index)

    def getSpaces(self, spaces=1):
        string = u""
        for dummy in range(0, spaces):
            string = string + u" "
        return string

    def isNumeric(self, string):
        try:
            dummy = float(string)
            return True
        except:
            return False

    def convertCelsiusToFahrenheit(self, temp, dp=0):
        value = ((float(temp) * 9.0) / 5.0) + 32
        if dp == 0:
            return str(int(round(value,dp))) # lose the dp
        else:
            return str(round(value,dp))

    def convertKilometresToMiles(self, dist, dp=0):
        value = float(dist) * 0.621371192
        if dp == 0:
            return str(int(round(value,dp))) # lose the dp
        else:
            return str(round(value,dp))

    def convertKPHtoBeaufort(self, kph, dp=0):
        value = pow(float(kph) * 0.332270069, 2.0 / 3.0)
        if dp == 0:
            return str(int(round(value,dp))) # lose the dp
        else:
            return str(round(value,dp))
        
    def convertMillibarsToInches(self,mb,dp=0):
        value = float(mb)/33.8582
        if dp == 0:
            return str(int(round(value,dp))) # lose the dp
        else:
            return str(round(value,dp))
    
    def getWindLevel(self, speed):
        beaufort = self.convertKPHtoBeaufort(speed)
        if beaufort < 4:
            return 0
        elif beaufort < 7:
            return 1
        elif beaufort < 10:
            return 2
        else:
            return 3

    def getHoursMinutesStringFromSeconds(self,seconds):
        time = int(seconds)
        hours, time = divmod(time, 60*60)
        minutes, seconds = divmod(time, 60)
        output = str(hours).rjust(2,"0") + ":" + str(minutes).rjust(2,"0")
        return output
    
def main():

    parser = CommandLineParser()
    (options, args) = parser.parse_args()

    if options.version == True:
        
        print >> sys.stdout,"conkyForecast v.2.01"
        
    else:
        
        if options.verbose == True:
            print >> sys.stdout, "*** INITIAL OPTIONS:"
            print >> sys.stdout, "    location:", options.location
            print >> sys.stdout, "    datatype:", options.datatype
            print >> sys.stdout, "    start day:", options.startday
            print >> sys.stdout, "    end day:", options.endday
            print >> sys.stdout, "    spaces:", options.spaces
            print >> sys.stdout, "    template:", options.template
            print >> sys.stdout, "    locale:", options.locale
            print >> sys.stdout, "    imperial:", options.imperial
            print >> sys.stdout, "    beaufort:", options.beaufort
            print >> sys.stdout, "    night:", options.night
            print >> sys.stdout, "    shortweekday:", options.shortweekday
            print >> sys.stdout, "    hideunits:", options.hideunits
            print >> sys.stdout, "    hidedegreesymbol:", options.hidedegreesymbol
            print >> sys.stdout, "    minuteshide:", options.minuteshide
            print >> sys.stdout, "    centeredwidth:", options.centeredwidth
            print >> sys.stdout, "    refetch:", options.refetch
            print >> sys.stdout, "    verbose:", options.verbose
            print >> sys.stdout, "    errorlogfile:",options.errorlogfile
            print >> sys.stdout, "    infologfile:",options.infologfile        
    
        forecastinfo = ForecastInfo(options)
        forecastinfo.writeOutput()

if __name__ == '__main__':
    main()
    sys.exit()
    
