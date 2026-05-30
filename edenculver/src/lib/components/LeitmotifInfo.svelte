<script lang="ts">
	interface Props {
		name: string;
		subthemes?: string[];
		description: string;
	}

	let { name, subthemes, description }: Props = $props();
	let naturalW = $state(0);
	let naturalH = $state(0);
</script>

<div class="flex flex-col gap-4">
	<p class="m-4 mb-0 text-xl font-bold">{name}</p>
	<p class="mx-4 italic">Leitmotif</p>
	<div class="px-5 py-4 bg-gray-300 dark:bg-gray-950 flex flex-col gap-3">
		<img
			class="mx-auto [image-rendering:pixelated]"
			src="/images/leitmotifs/{name.replace('?', '')}.png"
			bind:naturalWidth={naturalW}
			bind:naturalHeight={naturalH}
			width={naturalW * 2}
			height={naturalH * 2}
			alt="Sprite representing {name}."
		/>
		{#if subthemes}
			<table>
				<tbody>
					{#each subthemes as subtheme}
						<tr>
							<td class="p-3 pl-0">{subtheme}</td>
							<td>
								{#key `${name} ${subtheme}`}
									<audio class="w-full" controls>
										<source src="/audio/{name} {subtheme}.mp3" />
									</audio>
								{/key}
							</td>
						</tr>
					{/each}
				</tbody>
			</table>
		{:else}
			{#key name}
				<audio class="w-full" controls>
					<source src="/audio/{name}.mp3" />
				</audio>
			{/key}
		{/if}
		{#if description}
			<p>{description}</p>
		{/if}
	</div>
</div>
