<script lang="ts">
	import { bgClickableSecondary } from "$lib/colorClasses";
	import { ChevronDown, ChevronUp } from "svelte-heros-v2";

	interface Props {
		title: string;
		children: any;
	}

	let { title, children }: Props = $props();

	let collapsed = $state(false);

	function toggleCollapsed() {
		collapsed = !collapsed;
	}
</script>

<div class="flex flex-col">
	<button class="px-3 py-2 {bgClickableSecondary} font-bold flex cursor-pointer" onclick={() => toggleCollapsed()}>
		<p class="text-left text-sm flex-1">{title}</p>
		{#if collapsed}
			<ChevronUp variation="mini" />
		{:else}
			<ChevronDown variation="mini" />
		{/if}
	</button>

	{#if !collapsed}
		{@render children()}
	{/if}
</div>
