<script lang="ts">
	interface Props {
		extraClasses?: string;
		children: any;
	}

	let { extraClasses, children }: Props = $props();
</script>

<h2 class="text-lg lg:text-xl font-bold {extraClasses ? ` ${extraClasses}` : ''}">
	{@render children()}
</h2>
