<script lang="ts">
	interface Props {
		x?: number;
		y?: number;
		w: number;
		h: number;
		fill: string;
	}

	let { x = 0, y = 0, w, h, fill }: Props = $props();
</script>

<rect {x} {y} width={w} height={h} {fill}></rect>
