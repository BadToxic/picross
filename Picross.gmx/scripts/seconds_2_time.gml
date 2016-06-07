/// seconds_2_time(seconds);
// Gets a time in seconds and formats it to a string like 00:00.00
// By BadToxic

var time_formatted, seconds, minutes, hours;

seconds        = string(argument0 mod 60);
minutes        = argument0 div 60;
hours          = minutes div 60;
time_formatted = string(minutes mod 60);

if (string_length(time_formatted) < 2) {
    time_formatted = "0" + time_formatted;
}

time_formatted += ":";

if (string_length(seconds) < 5) {
    time_formatted += "0";
}

time_formatted += seconds;

if (seconds == "0") {
    time_formatted += ".00";
}

if (hours > 0) {
    time_formatted = string(hours) + ":" + time_formatted;
}

return time_formatted;
