<script lang="ts">
	interface Props {
		item: string;
		itemName?: string;
		quantity: number;
		red?: boolean;
	}

	let { item, itemName = item, quantity, red = false }: Props = $props();
</script>

<div class="flex flex-col items-center">
	<div
		class="mb-2 border-3 lg:border-4 {red
			? 'border-red-500'
			: 'border-vsborder'} w-16 lg:w-20 h-16 lg:h-20 bg-vsbg flex flex-col gap-6 items-center justify-center"
	>
		{#if quantity > 0}
			<img
				class="w-8 lg:w-10 [image-rendering:pixelated]"
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
