<script lang="ts">
	import { page } from "$app/state";

	interface Props {
		title: string;
		href: string;
	}

	let { title, href }: Props = $props();
</script>

<a
	class="hover:bg-gray-500 duration-250 no-underline p-2 px-3 text-center text-sm text-black dark:text-white transition {page
		.url.pathname === href
		? 'bg-gray-500'
		: null}"
	{href}
>
	{title}
</a>
