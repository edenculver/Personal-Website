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

<div class="border-2 lg:border-3 border-svverydarktan rounded-md p-6 bg-svtan flex flex-col gap-4 overflow-x-auto">
	<h2 class="text-lg lg:text-xl font-bold">{location}</h2>

	<table class="border border-svverydarktan">
		<tbody>
			<tr>
				<th class="border border-svverydarktan px-3 py-2">Fish</th>
				<th class="border border-svverydarktan px-3 py-2">Base Price</th>
				{#if locationsWithSublocations.includes(location)}
					<th class="border border-svverydarktan px-3 py-2">Location</th>
				{/if}
				{#if !locationsWithoutSeasons.includes(location)}
					<th class="border border-svverydarktan px-3 py-2">Season</th>
				{/if}
				{#if location !== "Mines"}
					<th class="border border-svverydarktan px-3 py-2">Weather</th>
					<th class="border border-svverydarktan px-3 py-2">Time</th>
				{/if}
				<th class="border border-svverydarktan px-3 py-2">Bundle</th>
			</tr>
			{#each fishes as fish}
				<tr>
					<td class="border border-svverydarktan px-3 py-2">
						<div class="flex flex-wrap gap-3 items-center">
							<img
								class="w-8 h-8 [image-rendering:pixelated]"
								src="/images/sv-fish/{fish.name.replace(' ', '_')}.png"
								alt="{fish.name} sprite."
							/>
							<p>{fish.name}</p>
						</div>
					</td>
					<td class="border border-svverydarktan px-3 py-2 text-right">{fish.base_price}g</td>
					{#if locationsWithSublocations.includes(location)}
						<td class="border border-svverydarktan px-3 py-2">{fish.sublocation}</td>
					{/if}
					{#if !locationsWithoutSeasons.includes(location)}
						<td class="border border-svverydarktan px-3 py-2">{returnAnyIfFalsy(fish.season)}</td>
					{/if}
					{#if location !== "Mines"}
						<td class="border border-svverydarktan px-3 py-2 {getWeatherColor(fish.weather)}">
							{returnAnyIfFalsy(fish.weather)}
						</td>
						<td class="border border-svverydarktan px-3 py-2">{returnAnyIfFalsy(fish.time)}</td>
					{/if}
					{#if fish.bundle}
						<td class="border border-svverydarktan px-3 py-2">
							<div class="flex flex-wrap gap-3 items-center">
								<img
									class="w-8 h-8 [image-rendering:pixelated]"
									src="/images/sv-fish/{fish.bundle.replaceAll(' ', '_')}.png"
									alt="{fish.bundle} sprite."
								/>
								<p>{fish.bundle}</p>
							</div>
						</td>
					{:else}
						<td class="border border-svverydarktan px-3 py-2"></td>
					{/if}
				</tr>
			{/each}
		</tbody>
	</table>
</div>
