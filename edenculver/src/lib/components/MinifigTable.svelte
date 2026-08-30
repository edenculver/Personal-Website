<script lang="ts">
	import MinifigNameRow from "./MinifigNameRow.svelte";
	import MinifigPicRow from "./MinifigPicRow.svelte";

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

{#each minifigs as minifig}
	<table class="text-center lg:hidden">
		<tbody>
			<MinifigPicRow minifigs={[minifig]} />
			<MinifigNameRow minifigs={[minifig]} />
		</tbody>
	</table>
{/each}

<table class="my-auto text-center hidden lg:table">
	<tbody>
		<MinifigPicRow {minifigs} />
		<MinifigNameRow {minifigs} />
	</tbody>
</table>
