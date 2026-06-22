<script lang="ts">
	interface Props {
		points: [number, number][];
		fill: string;
	}

	let { points, fill }: Props = $props();
</script>

<polygon points={points.toString()} {fill}></polygon>
