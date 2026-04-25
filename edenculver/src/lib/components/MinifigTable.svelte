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

<table>
	<tbody>
		<tr class="pics">
			{#each minifigs as minifig}
				{#each { length: minifig.count }}
					<td>
						<img src="https://www.bricklink.com/ML/{minifig.bricklink_id}.jpg" alt="Photograph of {minifig.name}." />
					</td>
				{/each}
			{/each}
		</tr>
		<tr class="descs">
			{#each minifigs as minifig}
				<td class="desc" colspan={minifig.count} style="max-width: {200 * minifig.count}px;">
					<p class={minifig.is_unique ? "unique" : ""} title={minifig.is_unique ? "Unique to this set!" : ""}>
						{minifig.count > 1 ? minifig.name + " (x" + minifig.count + ")" : minifig.name}
					</p>
					<p>
						<i>{minifig.specification ? minifig.specification : ""}</i>
					</p>
					<p>
						<i>
							<a href="https://www.bricklink.com/v2/catalog/catalogitem.page?M={minifig.bricklink_id}">{minifig.bricklink_id}</a>
						</i>
					</p>
				</td>
			{/each}
		</tr>
	</tbody>
</table>

<style>
	table {
		background-color: white;
		color: black;
		text-align: center;
	}
	.pics {
		padding: 0px;
		vertical-align: bottom;
	}
	img {
		max-width: 100px;
	}
	.descs {
		vertical-align: top;
	}
	.desc {
		padding: 10px;
	}
	p {
		margin: 10px;
	}
	.unique {
		font-weight: bold;
	}
	i {
		font-size: 90%;
	}
	a {
		color: gray;
		text-align: center;
		text-decoration: none;
	}
</style>
