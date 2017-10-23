var midi = [];
var standard = 440;

for (var i = 0; i <= 127; i++) {
	midi[i] = (standard / 32) * Math.pow(2, (i - 9) / 12);
}

var count_until = [];
for (i = 0; i <= 127; i++) {
	count_until[i] = Math.round(1e8 / midi[i] / 2);
}
console.log("Successfully generated the frequency table for 128 MIDI notes.");

var result = "MEMORY_INITIALIZATION_RADIX=10;\nMEMORY_INITIALIZATION_VECTOR=\n";
for (i = 0; i < 127; i++) {
	result += (count_until[i] + ",\n");
}
result += (count_until[127] + ";\n\n\n");
console.log("Successfully converted the format of frequency table to COE-friendly.");

var fs = require('fs');
fs.writeFile("midi_frequency.coe", result, "utf8", (err) => {
	if (err) {
		throw err;
		console.log("We occur an error when trying to write to the required file.");
	} else {
		console.log("Successfully write the result to the required file.");
	}
});