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
	class="border border-gray-400 dark:border-gray-600 hover:border-green-600 dark:hover:border-green-400 rounded-md p-6 hover:bg-gray-100 dark:hover:bg-gray-900 hover:text-green-600 dark:hover:text-green-400 duration-100 flex-1 flex flex-col gap-4"
	{href}
>
	<div class="flex gap-4 items-center">
		<img
			class={"w-10 lg:w-12 h-10 lg:h-12 object-contain" + (pixelated ? " [image-rendering:pixelated]" : "")}
			{src}
			{alt}
		/>
		<p class="text-base lg:text-lg font-bold">{title}</p>
	</div>
	<p class="text-sm lg:text-base text-black dark:text-white">{description}</p>
</a>
