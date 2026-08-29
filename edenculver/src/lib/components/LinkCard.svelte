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
	class="border border-black dark:border-white rounded-md p-6 hover:bg-gray-300 dark:hover:bg-gray-900 duration-250 flex-1 flex flex-col gap-4"
	{href}
>
	<div class="flex gap-4 items-center">
		<img class={"w-10 lg:w-12 h-10 lg:h-12 object-contain" + (pixelated ? " [image-rendering:pixelated]" : "")} {src} {alt} />
		<p class="text-base lg:text-lg font-bold">{title}</p>
	</div>
	<p class="text-sm lg:text-base">{description}</p>
</a>
