<script lang="ts">
	import { page } from "$app/state";

	interface Props {
		title: string;
		href: string;
	}

	let { title, href }: Props = $props();
</script>

<a
	class="border-midg rounded-t-sm hover:bg-accent duration-250 no-underline px-3 py-2 text-center text-xs lg:text-sm transition whitespace-nowrap {page
		.url.pathname === href
		? 'border-x border-t'
		: 'border-b'}"
	{href}
>
	{title}
</a>
