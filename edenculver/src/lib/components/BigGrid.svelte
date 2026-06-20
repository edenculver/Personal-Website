<script lang="ts">
	let { children } = $props();
</script>

<div class="grid xl:grid-cols-4 lg:grid-cols-3 md:grid-cols-2 gap-6">
	{@render children()}
</div>
