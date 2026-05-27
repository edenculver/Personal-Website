<script lang="ts">
	interface Props {
		gameTitle: string;
		title: string;
		trackNumber: number;
	}

	let { gameTitle, title, trackNumber }: Props = $props();
</script>

<div class="flex flex-col gap-4">
	<p class="m-4 mb-0 text-xl font-bold">{title}</p>
	<p class="mx-4 mb-2 italic">{gameTitle.replace("Chapter", "Ch.")} OST #{trackNumber}</p>
	<div class="p-5 bg-gray-950 flex flex-col gap-3">x</div>
</div>
