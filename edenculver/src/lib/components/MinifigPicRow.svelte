<script lang="ts">
	import type { Minifig } from "./MinifigTable.svelte";

	interface Props {
		minifigs: Minifig[];
	}

	let { minifigs }: Props = $props();
</script>

<tr class="align-bottom">
	{#each minifigs as minifig}
		{#each { length: minifig.count }}
			<td>
				<img
					class="mx-auto w-full max-w-24 max-h-36 object-contain"
					src="https://www.bricklink.com/ML/{minifig.bricklink_id}.jpg"
					alt="Photo of {minifig.name}."
				/>
			</td>
		{/each}
	{/each}
</tr>
