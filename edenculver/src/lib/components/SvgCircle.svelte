<script lang="ts">
	interface Props {
		cx: number;
		cy: number;
		r: number;
		fill: string;
	}

	let { cx, cy, r, fill }: Props = $props();
</script>

<circle {cx} {cy} {r} {fill}></circle>
