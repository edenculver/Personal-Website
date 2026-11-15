<script lang="ts">
	import H2 from "$lib/components/H2.svelte";
	import { page } from "$app/state";
	import Page from "$lib/components/Page.svelte";
</script>

<Page title="EdenCulver.net > Error">
	<H2 extraClasses="mx-auto lg:mx-16 my-4 lg:my-10 p-4 text-red-600 dark:text-red-400 font-mono">
		Error {page.status}: {page.error ? page.error.message : "Unknown error"}
	</H2>
</Page>
