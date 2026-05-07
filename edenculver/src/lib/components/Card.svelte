<script lang="ts">
	interface Props {
		title: string;
		description?: string;
		href: string;
		src: string;
		alt: string;
		pixelated?: boolean;
	}

	let { title, description, href, src, alt, pixelated = false }: Props = $props();
</script>

<a
	class="hover:bg-gray-500 border border-gray-500 duration-250 flex flex-1 flex-col gap-4 min-w-md p-6 rounded-xl"
	{href}
>
	<div class="flex gap-4 items-center">
		<img class={"h-12 w-12" + (pixelated ? " [image-rendering:pixelated]" : "")} {src} {alt} />
		<p class="font-bold text-lg">{title}</p>
	</div>
	<p>{description}</p>
</a>
