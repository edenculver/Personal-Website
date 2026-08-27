<script lang="ts">
	interface Props {
		item: string;
		itemName?: string;
		quantity: number;
	}

	let { item, itemName = item, quantity }: Props = $props();
</script>

<div class="flex flex-col items-center">
	<div
		class="mb-2 border-5 border-vsborder w-16 md:w-24 h-16 md:h-24 bg-vsbg flex flex-col gap-6 items-center justify-center"
	>
		{#if quantity > 0}
			<img
				class="w-8 md:w-12 [image-rendering:pixelated]"
				src="/images/alloy-calculator/{item}.png"
				alt="{item}."
			/>
		{/if}
	</div>

	{#if quantity > 0}
		<p>{quantity}</p>
		<p>{itemName}</p>
	{/if}
</div>
