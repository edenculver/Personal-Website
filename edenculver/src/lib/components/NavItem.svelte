<script lang="ts">
	import { page } from "$app/state";

	interface Props {
		children?: any;
		title: string;
		shortTitle?: string;
		href: string;
	}

	let { children, title, shortTitle, href }: Props = $props();
</script>

<a
	class="hover:bg-gray-100 dark:hover:bg-gray-900 duration-100 no-underline px-3 py-2 text-sm flex gap-2 items-center{page.url.pathname ===
	href
		? ' bg-gray-200 dark:bg-gray-800'
		: ''}"
	{href}
>
	{#if children}
		{@render children()}
	{/if}

	<p class="lg:hidden flex-1">{shortTitle ?? title}</p>
	<p class="hidden lg:block flex-1">{title}</p>
</a>
