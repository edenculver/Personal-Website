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
	class="border border-fg hover:border-accent rounded-md p-6 hover:text-accent duration-250 flex-1 flex flex-col gap-4"
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
	<p class="text-sm lg:text-base text-fg">{description}</p>
</a>
