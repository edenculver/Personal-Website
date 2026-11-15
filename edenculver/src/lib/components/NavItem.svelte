<script lang="ts">
	import { page } from "$app/state";
	import { bgClickableSecondary, bgSelectedSecondary } from "$lib/colorClasses";

	interface Props {
		children?: any;
		title: string;
		shortTitle?: string;
		href: string;
	}

	let { children, title, shortTitle, href }: Props = $props();
</script>

<a
	class="{bgClickableSecondary} no-underline px-3 py-2 text-sm flex gap-2 items-center {page.url.pathname === href
		? bgSelectedSecondary
		: ''}"
	{href}
>
	{#if children}
		{@render children()}
	{/if}

	<p class="lg:hidden flex-1">{shortTitle ?? title}</p>
	<p class="hidden lg:block flex-1">{title}</p>
</a>
