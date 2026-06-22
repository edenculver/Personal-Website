<script lang="ts">
	export interface Minifig {
		bricklink_id: string;
		name: string;
		specification?: string;
		count: number;
		is_unique: boolean;
	}
	interface Props {
		minifigs: Minifig[];
	}

	let { minifigs }: Props = $props();
</script>

<table class="bg-white text-center text-black">
	<tbody>
		<tr class="align-bottom">
			{#each minifigs as minifig}
				{#each { length: minifig.count }}
					<td>
						<img
							class="mx-auto w-24"
							src="https://www.bricklink.com/ML/{minifig.bricklink_id}.jpg"
							alt="Photograph of {minifig.name}."
						/>
					</td>
				{/each}
			{/each}
		</tr>
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
	</tbody>
</table>
