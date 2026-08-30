<script lang="ts">
	import type { Minifig } from "./MinifigTable.svelte";

	interface Props {
		minifigs: Minifig[];
	}

	let { minifigs }: Props = $props();
</script>

<tr class="align-top">
	{#each minifigs as minifig}
		<td class="p-3" colspan={minifig.count} style="max-width: {200 * minifig.count}px;">
			<p
				class={"m-2" + (minifig.is_unique ? " font-bold" : "")}
				title={minifig.is_unique ? "Unique to this set!" : undefined}
			>
				{minifig.count > 1 ? minifig.name + " (x" + minifig.count + ")" : minifig.name}
			</p>

			<p class="m-2 text-sm italic">
				{minifig.specification ? minifig.specification : ""}
			</p>

			<a
				class="m-2 text-sm text-gray-500 italic no-underline"
				href="https://www.bricklink.com/v2/catalog/catalogitem.page?M={minifig.bricklink_id}"
			>
				{minifig.bricklink_id}
			</a>
		</td>
	{/each}
</tr>
