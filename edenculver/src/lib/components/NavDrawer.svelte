<script lang="ts">
	import { bgClickableSecondary, textPrimary } from "$lib/colorClasses";
	import ChevronDown from "svelte-heros-v2/ChevronDown.svelte";
	import ChevronUp from "svelte-heros-v2/ChevronUp.svelte";

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
	<button class="px-3 py-2 {bgClickableSecondary} {textPrimary} font-bold flex cursor-pointer" onclick={() => toggleCollapsed()}>
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
