<script lang="ts">
	import { borderSoft } from "$lib/colorClasses";

	let { children } = $props();
</script>

<div class="border {borderSoft} rounded-md h-full p-6 flex flex-col gap-6">
	{@render children()}
</div>
