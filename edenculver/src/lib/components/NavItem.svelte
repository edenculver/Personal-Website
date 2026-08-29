<script lang="ts">
	import { page } from "$app/state";

	interface Props {
		title: string;
		href: string;
	}

	let { title, href }: Props = $props();
</script>

<a
	class="border-black dark:border-white rounded-t-sm hover:bg-gray-500 duration-250 no-underline p-2 px-3 text-center text-xs lg:text-sm text-black dark:text-white transition whitespace-nowrap {page
		.url.pathname === href
		? 'border-x border-t'
		: 'border-b'}"
	{href}
>
	{title}
</a>
