//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/        	/*Command*/	            /*Update Interval*/	/*Update Signal*/

    {"", "~/Software/suckless/statusbar/music.sh",               0, 0},
    {"", "~/Software/suckless/statusbar/system_stats.sh",               30, 0},
    {"", "~/Software/suckless/statusbar/battery.sh",               60, 0},
    {"", "~/Software/suckless/statusbar/clock.sh",               60, 0},
};
//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
