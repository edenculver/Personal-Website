const pianoKeys = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"]; // the indexes of these are used as pitch values
const noteNames = "CDEFGAB";
const qualities = {
	"minor": 3,
	"major": 4,
}
const reverseQualities = {
	// 5th
	6: "diminished",
	7: "perfect",
	8: "augmented",
	// 7th
	9: "diminished",
	10: "minor",
	11: "major",
	0: "augmented"
}
const unselectedColor = "#ffffff";
const semiselectedColor = "#ccccff";
const selectedColor = "#0000ff";
const chordNames = { // R = root note
	"33": "R diminished (R°)",
	"34": "R minor (Rm)",
	"43": "R major (R)",
	"44": "R augmented (R+)",
	"333": "R fully-diminished 7th (R°7)",
	"334": "R half-diminished 7th (Rø7)",
	"343": "R minor 7th (Rm7)",
	"344": "R minor major 7th (RmM7)",
	"433": "R dominant 7th (R7)",
	"434": "R major 7th (RM7)",
	"443": "R augmented major 7th (R+M7)",
	"444": "(don't do this, it sounds the same as R+)"
}

var rootButtons;
var chord = {
	"root": "C♮",
	"1_3": 4,
	"three": "E♮",
	"3_5": 3,
	"five": "G♮",
	"5_7": 3,
	"seven": "B♭",
	"useSeventh": true
}

window.addEventListener("DOMContentLoaded", () => {
	rootButtons = document.getElementsByClassName("rootButton");
	for(let rootButton of rootButtons) {
		rootButton.addEventListener("click", () => {
			selectRoot(rootButton);
			calcChord();
		});
	}

	let seventhElements = document.getElementsByClassName("7th");
	yes7.addEventListener("click", () => {
		chord.useSeventh = true;
		yes7.style.backgroundColor = selectedColor;
		no7.style.backgroundColor = unselectedColor;
		for(let seventhElement of seventhElements) {
			seventhElement.removeAttribute("hidden");
		}
		calcChord();
	});
	no7.addEventListener("click", () => {
		chord.useSeventh = false;
		yes7.style.backgroundColor = unselectedColor;
		no7.style.backgroundColor = selectedColor;
		for(let seventhElement of seventhElements) {
			seventhElement.setAttribute("hidden","true");
		}
		calcChord();
	});

	let qualityButtons = document.getElementsByClassName("qualityButton");
	for(let qualityButton of qualityButtons) {
		qualityButton.addEventListener("click", () => {
			selectQuality(qualityButton);
			calcChord();
		});
	}
});

function selectRoot(selectedRootButton) {
	chord.root = selectedRootButton.textContent;
	let rootPitch = selectedRootButton.getAttribute("pitch");

	for(let rootButton of rootButtons) {
		if(rootButton.getAttribute("pitch") == rootPitch) {
			rootButton.style.backgroundColor = semiselectedColor; // enharmonics
		} else {
			rootButton.style.backgroundColor = unselectedColor;
		} 
	}
	selectedRootButton.style.backgroundColor = selectedColor;
}

function selectQuality(selectedQualityButton) {
	let interval = selectedQualityButton.className.split(" ")[1]; // get which interval this is
	let qualityButtons = document.getElementsByClassName(interval);
	for(let qualityButton of qualityButtons) {
		qualityButton.style.backgroundColor = unselectedColor;
	}
	selectedQualityButton.style.backgroundColor = selectedColor;

	chord[interval] = qualities[selectedQualityButton.textContent];
}

function calcChord() {
	// pitches
	let rootPitch;
	for(let rootButton of rootButtons) {
		if(rootButton.textContent == chord.root) {
			rootPitch = parseInt(rootButton.getAttribute("pitch"));
			break;
		}
	}
	let threePitch = pianoKeyIndexWrap(rootPitch + chord["1_3"]);
	let fivePitch = pianoKeyIndexWrap(threePitch + chord["3_5"]);
	let sevenPitch = pianoKeyIndexWrap(fivePitch + chord["5_7"]);

	// note names
	chord.three = noteSpeller(threePitch,traverseNoteNames(chord.root,2));
	chord.five = noteSpeller(fivePitch,traverseNoteNames(chord.root,4));
	chord.seven = noteSpeller(sevenPitch,traverseNoteNames(chord.root,6));

	// display and check for illegal spellings
	illegalWarning.setAttribute("hidden",true);
	chordName.style.color = "black";
	root.textContent = chord.root.replace("♮","");
	three.textContent = chord.three.replace("♮","");
	stopAndFrisk(three);
	five.textContent = chord.five.replace("♮","");
	stopAndFrisk(five);
	if(chord.useSeventh) {
		seven.textContent = chord.seven.replace("♮","");
		stopAndFrisk(seven);
	}
	
	// fifth and seventh qualities
	fifthQuality.textContent = reverseQualities[fivePitch - rootPitch] + " fifth";
	seventhQuality.textContent = reverseQualities[sevenPitch - rootPitch] + " seventh";
	
	// chord name
	let chordNameDictKey = "";
	chordNameDictKey += chord["1_3"].toString();
	chordNameDictKey += chord["3_5"].toString();
	if(chord.useSeventh) {
		chordNameDictKey += chord["5_7"].toString();
	}
	chordName.textContent = chordNames[chordNameDictKey].replaceAll("R",chord.root.replace("♮",""));

	// keyboard
	// undo wrapping
	if(threePitch < rootPitch) threePitch += 12;
	if(fivePitch < rootPitch) fivePitch += 12;
	if(sevenPitch < rootPitch) sevenPitch += 12;
	// tickle the ivories
	let pianoKeys = document.getElementsByClassName("pianoKey");
	for(let pianoKey of pianoKeys) {
		pianoKey.setAttribute("fill",pianoKey.classList[0]);
		let pitch = parseInt(pianoKey.getAttribute("pitch"));
		if([rootPitch,threePitch,fivePitch,sevenPitch].includes(pitch)) {
			pianoKey.setAttribute("fill",selectedColor);
		}
	}
}

function noteSpeller(pitch,letter) {
	// uses rootButtons as a dictionary
	// it may be janky, but it works
	for(let rootButton of rootButtons) {
		if(rootButton.getAttribute("pitch") == pitch && rootButton.textContent[0] == letter) {
			return rootButton.textContent;
		}
	}
	return letter + "?"; // illegal spelling (triple flat/sharp)
}

function pianoKeyIndexWrap(raw) {
	let wrapped = ((raw % pianoKeys.length) + pianoKeys.length) % pianoKeys.length; // modulo
	return wrapped;
}

function traverseNoteNames(start,move) {
	let startIndex = noteNames.indexOf(start[0]);
	let newIndex = (((startIndex + move) % noteNames.length) + noteNames.length) % noteNames.length; // modulo 
	return noteNames[newIndex];
}

function stopAndFrisk(td) {
	if(td.textContent[1] == "?") {
		td.style.color = "red";
		illegalWarning.removeAttribute("hidden");
		chordName.style.color = "red";
	} else {
		td.style.color = "black";
	}
}
