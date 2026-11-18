<script lang="ts">
	import type { Minifig } from "./MinifigTable.svelte";

	interface Props {
		minifigs: Minifig[];
	}

	let { minifigs }: Props = $props();
</script>

<tr class="align-top">
	{#each minifigs as minifig}
		<td colspan={minifig.count} style="max-width: {200 * minifig.count}px;">
			<div class="p-3 flex flex-col gap-1">
				<p
					class={minifig.is_unique ? "font-bold" : undefined}
					title={minifig.is_unique ? "Unique to this set!" : undefined}
				>
					{minifig.name}
				</p>

				{#if minifig.count > 1}
					<p class="text-sm">x{minifig.count}</p>
				{/if}

				<a
					class="text-sm text-gray-500 italic hover:underline"
					href="https://www.bricklink.com/v2/catalog/catalogitem.page?M={minifig.bricklink_id}"
				>
					{minifig.bricklink_id}
				</a>
			</div>
		</td>
	{/each}
</tr>
