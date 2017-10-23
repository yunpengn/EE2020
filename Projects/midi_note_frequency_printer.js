var midi = [];
var standard = 440;

for (var i = 0; i < 127; i++) {
	midi[i] = (standard / 32) * Math.pow(2, (i - 9) / 12);
}

var count_until = [];
for (i = 0; i < 127; i++) {
	count_until[i] = 1e8 / midi[i] / 2;
}

var result = "";
for (i = 0; i < 127; i++) {
	result += (i + ": " + midi[i] + "\n");
}
console.log(result);

result = "";
for (i = 0; i < 127; i++) {
	result += (i + ": " + count_until[i] + "\n");
}
console.log(result);