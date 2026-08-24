<script lang="ts">
	import NavBar from "./NavBar.svelte";
	import PrivacyPolicy from "./PrivacyPolicy.svelte";

	let { children } = $props();
</script>

<div class="min-h-dvh flex flex-col">
	<NavBar />
	<div class="flex-1 overflow-x-auto">
		{@render children()}
	</div>
	<PrivacyPolicy />
</div>
