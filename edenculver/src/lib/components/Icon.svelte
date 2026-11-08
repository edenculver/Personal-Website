<script lang="ts">
	import favicon from "$lib/assets/favicon.svg";

	interface Props {
		classes: string;
	}

	let { classes }: Props = $props();
</script>

<img class={classes} src={favicon} alt="Icon of two sandhill cranes on a blue hexagon." />
