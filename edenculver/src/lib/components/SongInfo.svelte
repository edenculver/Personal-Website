<script lang="ts">
	interface Props {
		title: string;
		gameTitle: string;
		trackNumber: number;
	}

	let { title, gameTitle, trackNumber }: Props = $props();
</script>

<div class="flex flex-col gap-2">
	<p class="m-4 mb-0 text-xl font-bold">{title}</p>
	<p class="mx-4 text-sm italic">{gameTitle.replace("Chapter", "Ch.")} OST #{trackNumber}</p>
	<p class="mx-4">Leitmotifs:</p>
</div>
