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

<a class="border border-gray-500 rounded-xl p-6 hover:bg-gray-500 duration-250 flex-1 flex flex-col gap-4" {href}>
	<div class="flex gap-4 items-center">
		<img class={"w-12 h-12 object-contain" + (pixelated ? " [image-rendering:pixelated]" : "")} {src} {alt} />
		<p class="font-bold text-lg">{title}</p>
	</div>
	<p>{description}</p>
</a>
