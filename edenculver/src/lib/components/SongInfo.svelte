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
	<p class="mx-4 italic">{gameTitle.replace("Chapter", "Ch.")} OST #{trackNumber}</p>
</div>
