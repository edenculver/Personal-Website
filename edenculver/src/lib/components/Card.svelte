<script lang="ts">
	let { children } = $props();
</script>

<div class="border border-fg rounded-md h-full p-6 flex flex-col gap-6">
	{@render children()}
</div>
