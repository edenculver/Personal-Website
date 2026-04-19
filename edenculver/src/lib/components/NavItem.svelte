<script lang="ts">
	import { page } from "$app/state";

	interface Props {
		title: string;
		href: string;
	}

	let { title, href }: Props = $props();
</script>

<a class={page.data.title === title ? "active" : ""} {href}>{title}</a>

<style>
	a {
		color: white;
		font-size: 10pt;
		padding: 10px;
		text-align: center;
		text-decoration: none;
	}
	a:hover {
		background-color: gray;
		transition: 0.25s;
	}
	.active {
		background-color: gray;
	}
</style>
