const biomes = [
	"b_desert",
	"b_jungle",
	"b_plains",
	"b_savanna",
	"b_snowy",
	"b_swamp",
	"b_taiga"
];
const professions = [
	"p_armorer",
	"p_butcher",
	"p_cartographer",
	"p_cleric",
	"p_farmer",
	"p_fisherman",
	"p_fletcher",
	"p_leatherworker",
	"p_librarian",
	"p_nitwit",
	"p_stone_mason",
	"p_shepherd",
	"p_toolsmith",
	"p_unemployed",
	"p_weaponsmith"
];

var quizResults = {
	// biomes
	b_desert: 0,
	b_jungle: 0,
	b_plains: 0,
	b_savanna: 0,
	b_snowy: 0,
	b_swamp: 0,
	b_taiga: 0,
	// professions
	p_armorer: 0,
	p_butcher: 0,
	p_cartographer: 0,
	p_cleric: 0,
	p_farmer: 0,
	p_fisherman: 0,
	p_fletcher: 0,
	p_leatherworker: 0,
	p_librarian: 0,
	p_nitwit: 0,
	p_stone_mason: 0,
	p_shepherd: 0,
	p_toolsmith: 0,
	p_unemployed: 0,
	p_weaponsmith: 0
}

var bank;
var imgs;
fetch("villager_quiz.json")
	.then((response) => response.json())
	.then((json) => {
		bank = json.bank;
		imgs = json.imgs;
	});

var qIndex = 0;

var audio = new Audio("media/click_stereo.ogg");
audio.volume = 0.3;

window.addEventListener("DOMContentLoaded", () => {
	startButton.addEventListener("click", () => {
		audio.play();
		startDiv.setAttribute("hidden", true);
		questionDiv.removeAttribute("hidden");
		displayQuestion();
	});
	testButton.addEventListener("click", () => {
		audio.play();
		// set stress test run count here
		stressTest(100000);
	});
	shareButton.addEventListener("click", () => {
		audio.play();
		let copyText = "I'm a " + villagerName.textContent + "!\n" + "https://edenculver.net/villager_quiz.html" + "\n\n" + villagerImg.src;
		navigator.clipboard.writeText(copyText);
	});
	restartButton.addEventListener("click", () => {
		audio.play();
		location.reload();
	});
});

function displayQuestion() {
	questionDiv.innerHTML = "";

	let h2 = newElement("h2");
	h2.textContent = bank[qIndex].text;
	questionDiv.appendChild(h2);

	let button;
	for (let answer of ["a", "b", "c", "d"]) {
		button = newElement("button", "button");
		button.textContent = bank[qIndex][answer].text;
		button.addEventListener("click", () => {
			audio.play();

			// add score to results
			for (let key of bank[qIndex][answer].score) {
				quizResults[key]++;
			}

			// next question
			qIndex++;
			if (qIndex < bank.length) {
				displayQuestion();
			} else {
				finalResults();
			}
		});
		questionDiv.appendChild(button);
	}
}

function finalResults() {
	questionDiv.setAttribute("hidden", true);
	resultsDiv.removeAttribute("hidden");

	// probably could do this better
	let biome = findWinner(quizResults, biomes);
	let profession = findWinner(quizResults, professions);

	villagerName.textContent = textFormat(biome) + " " + textFormat(profession);
	villagerImg.alt = villagerName.textContent + " picture";
	villagerImg.src = imgs[biome][profession];

	console.log(quizResults);
}

function findWinner(results, keys) {
	// find top score
	let maxScore = 0;
	for (let key of keys) {
		if (results[key] > maxScore) {
			maxScore = results[key];
		}
	}

	// find all keys tied for first place
	let firstPlaceKeys = [];
	for (let key of keys) {
		if (results[key] == maxScore) {
			firstPlaceKeys.push(key);
		}
	}

	// randomly select one of the top keys
	return firstPlaceKeys[Math.floor(Math.random() * firstPlaceKeys.length)];
}

function newElement(childType, className = "") {
	let child = document.createElement(childType);
	if (className) {
		child.className = className;
	}
	return child;
}

function textFormat(raw) {
	let words = raw.substring(2).split("_");
	for (let i = 0; i < words.length; i++) {
		words[i] = words[i][0].toUpperCase() + words[i].substring(1);
	}
	return words.join(" ");
}

// simulate X quizes with random answers and print summary of results
function stressTest(runs) {
	console.log(`Simulating ${runs} runs...`)

	// build empty results table
	let resultsTable = {};
	let resultsRow = {};
	for (let biome of biomes) {
		resultsRow[biome] = 0;
	}
	for (let profession of professions) {
		resultsTable[profession] = Object.assign({}, resultsRow);
	}

	// run tests
	for (let i = 0; i < runs; i++) {
		let runResults = Object.assign({}, quizResults);

		for (let question of bank) {
			// random answer
			let answers = ["a", "b", "c", "d"];
			let answer = answers[Math.ceil(Math.random() * 3)];
			// add score to results
			for (let key of question[answer].score) {
				runResults[key]++;
			}
		}

		let biome = findWinner(runResults, biomes);
		let profession = findWinner(runResults, professions);

		// add result to table
		resultsTable[profession][biome]++;
	}

	// pretty print results
	console.log(`${" ".padEnd(13)} | desert  | jungle  | plains  | savanna | snowy   | swamp   | taiga`);
	for (let profession of professions) {
		let line = profession.substring(2).padEnd(13);
		for (let biome of biomes) {
			line += ` | ${resultsTable[profession][biome].toString().padStart(7)}`;
		}
		console.log(line);
	}
}
