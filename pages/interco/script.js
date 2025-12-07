import FlagMaker from "./FlagMaker.js";

const flagMaker = new FlagMaker();
var useSubs = null;

// main
window.addEventListener("DOMContentLoaded", () => {
	msgInput.focus();

	// add event listeners to all inputs
	let inputs = [msgInput, wInput, hInput, subInput, bgInput, blackInput, whiteInput, redInput, yellowInput, blueInput];
	inputs.forEach(input => {
		input.addEventListener("input", () => {
			refreshFlags();
		});
	});
});

function refreshFlags() {
	getAndSetSettings();
	clearField();
	let msg = parseMsg(msgInput.value.trim());
	drawFlags(msg);
}

function getAndSetSettings() {
	flagMaker.w = Math.min(Math.max(wInput.value, 20), 2000);
	flagMaker.h = Math.min(Math.max(hInput.value, 20), 2000);
	useSubs = subInput.checked;
	Array.from(document.getElementsByTagName("body"))[0].style.backgroundColor = bgInput.value;
	flagMaker.black = blackInput.value;
	flagMaker.white = whiteInput.value;
	flagMaker.red = redInput.value;
	flagMaker.yellow = yellowInput.value;
	flagMaker.blue = blueInput.value;
}

function clearField() {
	let child = flagsField.lastElementChild;
	while (child) {
		flagsField.removeChild(child);
		child = flagsField.lastElementChild;
	}
}

function parseMsg(msg) {
	msg = msg.toUpperCase();
	msg = msg.replace(/[^A-Z0-9#\s]/g, ""); // remove everything except letters, numbers, #, and space
	msg = msg.replace(/\s+/g, " "); // squish spaces
	msg = msg.split(" "); // split into array of words

	// find longest word
	let longest = 0;
	msg.forEach(word => {
		if (word.length > longest) {
			longest = word.length;
		}
	});

	// split each word into array of chars
	let msgArray = [];
	msg.forEach(word => {
		let wordArray = [];
		for (let i = 0; i < longest; i++) {
			wordArray.push(word.charAt(i));
		}
		msgArray.push(wordArray);
	});

	// substitutes
	if (useSubs == true) {
		for (let i = 0; i < msgArray.length; i++) {
			for (let j = 1; j < msgArray[i].length; j++) {
				if (msgArray[i][j] == msgArray[i][0] && msgArray[i][j] != "") {
					msgArray[i][j] = "x" // first substitute
				}
			}
			for (let j = 2; j < msgArray[i].length; j++) {
				if (msgArray[i][j] == msgArray[i][1] && msgArray[i][j] != "") {
					msgArray[i][j] = "y" // second substitute
				}
			}
			for (let j = 3; j < msgArray[i].length; j++) {
				if (msgArray[i][j] == msgArray[i][2] && msgArray[i][j] != "") {
					msgArray[i][j] = "z" // third substitute
				}
			}
		}
	}

	// swap the dimensions
	let finalMsg = [];
	for (let i = 0; i < msgArray.length; i++) {
		for (let j = 0; j < msgArray[i].length; j++) {
			if (finalMsg[j] == null) {
				finalMsg[j] = [];
			}
			finalMsg[j][i] = msgArray[i][j];
		}
	}
   
	//console.log(finalMsg);
	return finalMsg;
}

function drawFlags(msgArray) {
	msgArray.forEach(row => {
		let tr = document.createElement("tr");
		row.forEach(char => {
			let td = document.createElement("td");
			td.className = "flagtd";
			let flag = flagMaker.make(char);
			td.appendChild(flag);
			tr.appendChild(td);
			
			// padding
			let pad = document.createElement("td");
			pad.className = "flagpadcol";
			tr.appendChild(pad);
		});
		tr.lastChild.remove(); // delete last pad
		flagsField.appendChild(tr);
	});
}
