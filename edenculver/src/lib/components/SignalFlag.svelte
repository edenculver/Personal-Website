<script lang="ts">
	import SvgCircle from "./SvgCircle.svelte";
	import SvgPolygon from "./SvgPolygon.svelte";
	import SvgRect from "./SvgRect.svelte";

	interface Props {
		w?: number;
		penW?: number;
		subW?: number;
		h?: number;
		black?: string;
		white?: string;
		red?: string;
		yellow?: string;
		blue?: string;
		char: string;
	}

	let {
		w = 100,
		subW = w * 1.5,
		penW = w * 1.75,
		h = 100,
		black = "#000000",
		white = "#ffffff",
		red = "#ff0000",
		yellow = "#ffcc00",
		blue = "#000080",
		char,
	}: Props = $props();

	function getCanvasW() {
		if (["a", "b", "c"].includes(char)) {
			return subW;
		} else if (["#", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"].includes(char)) {
			return penW;
		}
		return w;
	}
</script>

<svg width={getCanvasW()} height={h}>
	{#if char === "A"}
		<SvgRect w={w / 2} {h} fill={white} />
		<SvgPolygon
			points={[
				[w / 2, 0],
				[w, 0],
				[(w * 3) / 4, h / 2],
				[w, h],
				[w / 2, h],
			]}
			fill={blue}
		/>
	{:else if char === "B"}
		<SvgPolygon
			points={[
				[0, 0],
				[w, 0],
				[(w * 3) / 4, h / 2],
				[w, h],
				[0, h],
			]}
			fill={red}
		/>
	{:else if char === "C"}
		<SvgRect {w} {h} fill={blue} />
		<SvgRect y={h / 5} {w} h={(h * 3) / 5} fill={white} />
		<SvgRect y={(h * 2) / 5} {w} h={h / 5} fill={red} />
	{:else if char === "D"}
		<SvgRect {w} {h} fill={yellow} />
		<SvgRect y={h / 5} {w} h={(h * 3) / 5} fill={blue} />
	{:else if char === "E"}
		<SvgRect {w} h={h / 2} fill={blue} />
		<SvgRect y={h / 2} {w} h={h / 2} fill={red} />
	{:else if char === "F"}
		<SvgRect {w} {h} fill={white} />
		<SvgPolygon
			points={[
				[w / 2, 0],
				[w, h / 2],
				[w / 2, h],
				[0, h / 2],
			]}
			fill={red}
		/>
	{:else if char === "G"}
		<SvgRect {w} {h} fill={yellow} />
		<SvgRect x={w / 6} w={w / 6} {h} fill={blue} />
		<SvgRect x={(w * 3) / 6} w={w / 6} {h} fill={blue} />
		<SvgRect x={(w * 5) / 6} w={w / 6} {h} fill={blue} />
	{:else if char === "H"}
		<SvgRect w={w / 2} {h} fill={white} />
		<SvgRect x={w / 2} w={w / 2} {h} fill={red} />
	{:else if char === "I"}
		<SvgRect {w} {h} fill={yellow} />
		<SvgCircle cx={w / 2} cy={w / 2} r={w / 4} fill={black} />
	{:else if char === "J"}
		<SvgRect {w} {h} fill={blue} />
		<SvgRect y={h / 3} {w} h={h / 3} fill={white} />
	{:else if char === "K"}
		<SvgRect w={w / 2} {h} fill={yellow} />
		<SvgRect x={w / 2} w={w / 2} {h} fill={blue} />
	{:else if char === "L"}
		<SvgRect {w} {h} fill={yellow} />
		<SvgRect x={w / 2} w={w / 2} h={h / 2} fill={black} />
		<SvgRect y={h / 2} w={w / 2} h={h / 2} fill={black} />
	{:else if char === "M"}
		<SvgRect {w} {h} fill={blue} />
		<SvgPolygon
			points={[
				[0, h / 8],
				[0, 0],
				[w / 8, 0],
				[w, (h * 7) / 8],
				[w, h],
				[(w * 7) / 8, h],
			]}
			fill={white}
		/>
		<SvgPolygon
			points={[
				[(w * 7) / 8, 0],
				[w, 0],
				[w, h / 8],
				[w / 8, h],
				[0, h],
				[0, (h * 7) / 8],
			]}
			fill={white}
		/>
	{:else if char === "N"}
		<SvgRect {w} {h} fill={blue} />
		<SvgRect x={w / 4} w={w / 4} h={h / 4} fill={white} />
		<SvgRect x={(w * 3) / 4} w={w / 4} h={h / 4} fill={white} />
		<SvgRect y={h / 4} w={w / 4} h={h / 4} fill={white} />
		<SvgRect x={w / 2} y={h / 4} w={w / 4} h={h / 4} fill={white} />
		<SvgRect x={w / 4} y={h / 2} w={w / 4} h={h / 4} fill={white} />
		<SvgRect x={(w * 3) / 4} y={h / 2} w={w / 4} h={h / 4} fill={white} />
		<SvgRect y={(h * 3) / 4} w={w / 4} h={h / 4} fill={white} />
		<SvgRect x={w / 2} y={(h * 3) / 4} w={w / 4} h={h / 4} fill={white} />
	{:else if char === "O"}
		<SvgRect {w} {h} fill={red} />
		<SvgPolygon
			points={[
				[0, 0],
				[w, h],
				[0, h],
			]}
			fill={yellow}
		/>
	{:else if char === "P"}
		<SvgRect {w} {h} fill={blue} />
		<SvgRect x={w / 4} y={h / 4} w={w / 2} h={h / 2} fill={white} />
	{:else if char === "Q"}
		<SvgRect {w} {h} fill={yellow} />
	{:else if char === "R"}
		<SvgRect {w} {h} fill={red} />
		<SvgRect x={(w * 3) / 8} w={w / 4} {h} fill={yellow} />
		<SvgRect y={(h * 3) / 8} {w} h={h / 4} fill={yellow} />
	{:else if char === "S"}
		<SvgRect {w} {h} fill={white} />
		<SvgRect x={w / 4} y={h / 4} w={w / 2} h={h / 2} fill={blue} />
	{:else if char === "T"}
		<SvgRect w={w / 3} {h} fill={red} />
		<SvgRect x={w / 3} w={w / 3} {h} fill={white} />
		<SvgRect x={(w * 2) / 3} w={w / 3} {h} fill={blue} />
	{:else if char === "U"}
		<SvgRect {w} {h} fill={red} />
		<SvgRect x={w / 2} w={w / 2} h={h / 2} fill={white} />
		<SvgRect y={h / 2} w={w / 2} h={h / 2} fill={white} />
	{:else if char === "V"}
		<SvgRect {w} {h} fill={white} />
		<SvgPolygon
			points={[
				[0, h / 8],
				[0, 0],
				[w / 8, 0],
				[w, (h * 7) / 8],
				[w, h],
				[(w * 7) / 8, h],
			]}
			fill={red}
		/>
		<SvgPolygon
			points={[
				[(w * 7) / 8, 0],
				[w, 0],
				[w, h / 8],
				[w / 8, h],
				[0, h],
				[0, (h * 7) / 8],
			]}
			fill={red}
		/>
	{:else if char === "W"}
		<SvgRect {w} {h} fill={blue} />
		<SvgRect x={w / 6} y={h / 6} w={(w * 2) / 3} h={(h * 2) / 3} fill={white} />
		<SvgRect x={w / 3} y={w / 3} w={w / 3} h={h / 3} fill={red} />
	{:else if char === "X"}
		<SvgRect {w} {h} fill={white} />
		<SvgRect x={(w * 3) / 8} w={w / 4} {h} fill={blue} />
		<SvgRect y={(h * 3) / 8} {w} h={h / 4} fill={blue} />
	{:else if char === "Y"}
		<SvgRect {w} {h} fill={yellow} />
		<SvgPolygon
			points={[
				[w / 5, 0],
				[(w * 2) / 5, 0],
				[0, (h * 2) / 5],
				[0, h / 5],
			]}
			fill={red}
		/>
		<SvgPolygon
			points={[
				[(w * 3) / 5, 0],
				[(w * 4) / 5, 0],
				[0, (h * 4) / 5],
				[0, (h * 3) / 5],
			]}
			fill={red}
		/>
		<SvgPolygon
			points={[
				[w, 0],
				[w, h / 5],
				[w / 5, h],
				[0, h],
			]}
			fill={red}
		/>
		<SvgPolygon
			points={[
				[w, (h * 2) / 5],
				[w, (h * 3) / 5],
				[(w * 3) / 5, h],
				[(w * 2) / 5, h],
			]}
			fill={red}
		/>
		<SvgPolygon
			points={[
				[w, (h * 4) / 5],
				[w, h],
				[(w * 4) / 5, h],
			]}
			fill={red}
		/>
	{:else if char === "Z"}
		<SvgRect {w} h={h / 2} fill={yellow} />
		<SvgRect y={h / 2} {w} h={h / 2} fill={red} />
		<SvgPolygon
			points={[
				[0, 0],
				[w / 2, h / 2],
				[0, h],
			]}
			fill={black}
		/>
		<SvgPolygon
			points={[
				[w, 0],
				[w / 2, h / 2],
				[w, h],
			]}
			fill={blue}
		/>
	{:else if char === "a"}
		<SvgPolygon
			points={[
				[0, 0],
				[subW, h / 2],
				[0, h],
			]}
			fill={blue}
		/>
		<SvgPolygon
			points={[
				[0, h / 5],
				[(subW * 3) / 5, h / 2],
				[0, (h * 4) / 5],
			]}
			fill={yellow}
		/>
	{:else if char === "b"}
		<SvgPolygon
			points={[
				[0, 0],
				[subW / 2, h / 4],
				[subW / 2, (h * 3) / 4],
				[0, h],
			]}
			fill={blue}
		/>
		<SvgPolygon
			points={[
				[subW / 2, h / 4],
				[subW, h / 2],
				[subW / 2, (h * 3) / 4],
			]}
			fill={white}
		/>
	{:else if char === "c"}
		<SvgPolygon
			points={[
				[0, 0],
				[(subW * 2) / 3, h / 3],
				[(subW * 2) / 3, (h * 2) / 3],
				[0, h],
			]}
			fill={white}
		/>
		<SvgPolygon
			points={[
				[0, h / 3],
				[(subW * 2) / 3, h / 3],
				[subW, h / 2],
				[(subW * 2) / 3, (h * 2) / 3],
				[0, (h * 2) / 3],
			]}
			fill={black}
		/>
	{:else if char === "#"}
		<SvgPolygon
			points={[
				[0, 0],
				[penW / 5, h / 20],
				[penW / 5, (h * 19) / 20],
				[0, h],
			]}
			fill={red}
		/>
		<SvgPolygon
			points={[
				[penW / 5, h / 20],
				[(penW * 2) / 5, h / 10],
				[(penW * 2) / 5, (h * 9) / 10],
				[penW / 5, (h * 19) / 20],
			]}
			fill={white}
		/>
		<SvgPolygon
			points={[
				[(penW * 2) / 5, h / 10],
				[(penW * 3) / 5, (h * 3) / 20],
				[(penW * 3) / 5, (h * 17) / 20],
				[(penW * 2) / 5, (h * 9) / 10],
			]}
			fill={red}
		/>
		<SvgPolygon
			points={[
				[(penW * 3) / 5, (h * 3) / 20],
				[(penW * 4) / 5, h / 5],
				[(penW * 4) / 5, (h * 4) / 5],
				[(penW * 3) / 5, (h * 17) / 20],
			]}
			fill={white}
		/>
		<SvgPolygon
			points={[
				[(penW * 4) / 5, h / 5],
				[penW, h / 4],
				[penW, (h * 3) / 4],
				[(penW * 4) / 5, (h * 4) / 5],
			]}
			fill={red}
		/>
	{:else if char === "1"}
		<SvgPolygon
			points={[
				[0, 0],
				[penW, h / 4],
				[penW, (h * 3) / 4],
				[0, h],
			]}
			fill={white}
		/>
		<SvgCircle cx={w / 2} cy={w / 2} r={w / 4} fill={red} />
	{:else if char === "2"}
		<SvgPolygon
			points={[
				[0, 0],
				[penW, h / 4],
				[penW, (h * 3) / 4],
				[0, h],
			]}
			fill={blue}
		/>
		<SvgCircle cx={w / 2} cy={w / 2} r={w / 4} fill={white} />
	{:else if char === "3"}
		<SvgPolygon
			points={[
				[0, 0],
				[penW / 3, h / 12],
				[penW / 3, (h * 11) / 12],
				[0, h],
			]}
			fill={red}
		/>
		<SvgPolygon
			points={[
				[penW / 3, h / 12],
				[(penW * 2) / 3, h / 6],
				[(penW * 2) / 3, (h * 5) / 6],
				[penW / 3, (h * 11) / 12],
			]}
			fill={white}
		/>
		<SvgPolygon
			points={[
				[(penW * 2) / 3, h / 6],
				[penW, h / 4],
				[penW, (h * 3) / 4],
				[(penW * 2) / 3, (h * 5) / 6],
			]}
			fill={blue}
		/>
	{:else if char === "4"}
		<SvgPolygon
			points={[
				[0, 0],
				[(penW * 2) / 7, h / 14],
				[(penW * 2) / 7, (h * 13) / 14],
				[0, h],
			]}
			fill={red}
		/>
		<SvgPolygon
			points={[
				[(penW * 2) / 7, h / 14],
				[(penW * 3) / 7, (h * 3) / 28],
				[(penW * 3) / 7, (h * 25) / 28],
				[(penW * 2) / 7, (h * 13) / 14],
			]}
			fill={white}
		/>
		<SvgPolygon
			points={[
				[(penW * 3) / 7, (h * 3) / 28],
				[penW, h / 4],
				[penW, (h * 3) / 4],
				[(penW * 3) / 7, (h * 25) / 28],
			]}
			fill={red}
		/>
		<SvgRect y={(h * 3) / 8} w={penW} h={h / 4} fill={white} />
	{:else if char === "5"}
		<SvgPolygon
			points={[
				[0, 0],
				[penW / 2, h / 8],
				[penW / 2, (h * 7) / 8],
				[0, h],
			]}
			fill={yellow}
		/>
		<SvgPolygon
			points={[
				[penW / 2, h / 8],
				[penW, h / 4],
				[penW, (h * 3) / 4],
				[penW / 2, (h * 7) / 8],
			]}
			fill={blue}
		/>
	{:else if char === "6"}
		<SvgPolygon
			points={[
				[0, 0],
				[penW, h / 4],
				[penW, h / 2],
				[0, h / 2],
			]}
			fill={black}
		/>
		<SvgPolygon
			points={[
				[0, h / 2],
				[penW, h / 2],
				[penW, (h * 3) / 4],
				[0, h],
			]}
			fill={white}
		/>
	{:else if char === "7"}
		<SvgPolygon
			points={[
				[0, 0],
				[penW, h / 4],
				[penW, h / 2],
				[0, h / 2],
			]}
			fill={yellow}
		/>
		<SvgPolygon
			points={[
				[0, h / 2],
				[penW, h / 2],
				[penW, (h * 3) / 4],
				[0, h],
			]}
			fill={red}
		/>
	{:else if char === "8"}
		<SvgPolygon
			points={[
				[0, 0],
				[(penW * 2) / 7, h / 14],
				[(penW * 2) / 7, (h * 13) / 14],
				[0, h],
			]}
			fill={white}
		/>
		<SvgPolygon
			points={[
				[(penW * 2) / 7, h / 14],
				[(penW * 3) / 7, (h * 3) / 28],
				[(penW * 3) / 7, (h * 25) / 28],
				[(penW * 2) / 7, (h * 13) / 14],
			]}
			fill={red}
		/>
		<SvgPolygon
			points={[
				[(penW * 3) / 7, (h * 3) / 28],
				[penW, h / 4],
				[penW, (h * 3) / 4],
				[(penW * 3) / 7, (h * 25) / 28],
			]}
			fill={white}
		/>
		<SvgRect y={(h * 3) / 8} w={penW} h={h / 4} fill={red} />
	{:else if char === "9"}
		<SvgPolygon
			points={[
				[0, 0],
				[penW / 2, h / 8],
				[penW / 2, h / 2],
				[0, h / 2],
			]}
			fill={white}
		/>
		<SvgPolygon
			points={[
				[penW / 2, h / 8],
				[penW, h / 4],
				[penW, h / 2],
				[penW / 2, h / 2],
			]}
			fill={black}
		/>
		<SvgPolygon
			points={[
				[0, h / 2],
				[penW / 2, h / 2],
				[penW / 2, (h * 7) / 8],
				[0, h],
			]}
			fill={red}
		/>
		<SvgPolygon
			points={[
				[penW / 2, h / 2],
				[penW, h / 2],
				[penW, (h * 3) / 4],
				[penW / 2, (h * 7) / 8],
			]}
			fill={yellow}
		/>
	{:else if char === "0"}
		<SvgPolygon
			points={[
				[0, 0],
				[penW / 3, h / 12],
				[penW / 3, (h * 11) / 12],
				[0, h],
			]}
			fill={yellow}
		/>
		<SvgPolygon
			points={[
				[penW / 3, h / 12],
				[(penW * 2) / 3, h / 6],
				[(penW * 2) / 3, (h * 5) / 6],
				[penW / 3, (h * 11) / 12],
			]}
			fill={red}
		/>
		<SvgPolygon
			points={[
				[(penW * 2) / 3, h / 6],
				[penW, h / 4],
				[penW, (h * 3) / 4],
				[(penW * 2) / 3, (h * 5) / 6],
			]}
			fill={yellow}
		/>
	{/if}
</svg>
