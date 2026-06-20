<script lang="ts">
	export interface Fish {
		name: string;
		base_price: number;
		season: string;
		weather: string;
		time: string;
		bundle: string;
		sublocation?: string;
	}
	interface Props {
		location: string;
		fishes: Fish[];
	}

	let { location, fishes }: Props = $props();

	const locationsWithSublocations = ["River", "Mines", "Ginger Island", "Special"];
	const locationsWithoutSeasons = ["Mines", "Ginger Island", "Special"];

	function returnAnyIfFalsy(value: string) {
		return value ? value : "Any";
	}

	function getWeatherColor(weather: string) {
		switch (weather) {
			case null:
				return undefined;
			case "Rain":
				return "bg-svrain";
			case "Sun":
				return "bg-svsun";
			case "Wind":
				return "bg-svwind";
			case "Sun or wind":
				return "bg-svsky";
			default:
				return "bg-red-500";
		}
	}
</script>

<div class="bg-svtan border-3 border-svverydarktan flex flex-col gap-4 p-6 rounded-lg">
	<h2 class="font-bold text-xl">{location}</h2>
	<table class="border border-svverydarktan">
		<tbody>
			<tr>
				<th>Fish</th>
				<th>Base Price</th>
				{#if locationsWithSublocations.includes(location)}
					<th>Location</th>
				{/if}
				{#if !locationsWithoutSeasons.includes(location)}
					<th>Season</th>
				{/if}
				{#if location !== "Mines"}
					<th>Weather</th>
					<th>Time</th>
				{/if}
				<th>Bundle</th>
			</tr>
			{#each fishes as fish}
				<tr>
					<td>
						<div class="flex gap-3">
							<img src="/images/fish/{fish.name.replace(' ', '_')}.png" alt="{fish.name} sprite." />
							<p>{fish.name}</p>
						</div>
					</td>
					<td class="text-right">{fish.base_price}g</td>
					{#if locationsWithSublocations.includes(location)}
						<td>{fish.sublocation}</td>
					{/if}
					{#if !locationsWithoutSeasons.includes(location)}
						<td>{returnAnyIfFalsy(fish.season)}</td>
					{/if}
					{#if location !== "Mines"}
						<td class={getWeatherColor(fish.weather)}>{returnAnyIfFalsy(fish.weather)}</td>
						<td>{returnAnyIfFalsy(fish.time)}</td>
					{/if}
					{#if fish.bundle}
						<td>
							<div class="flex gap-3">
								<img
									src="/images/fish/{fish.bundle.replaceAll(' ', '_')}.png"
									alt="{fish.bundle} sprite."
								/>
								<p>{fish.bundle}</p>
							</div>
						</td>
					{:else}
						<td></td>
					{/if}
				</tr>
			{/each}
		</tbody>
	</table>
</div>

<style lang="postcss">
	@reference "../app.css";
	img {
		@apply h-8 [image-rendering:pixelated] w-8;
	}
	td,
	th {
		@apply border border-svverydarktan px-3 py-2;
	}
</style>
