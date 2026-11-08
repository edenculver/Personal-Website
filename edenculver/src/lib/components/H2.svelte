<script lang="ts">
	interface Props {
		children: any;
		classes?: string;
		extraClasses?: string;
	}

	let { children, classes = "text-lg lg:text-xl font-bold", extraClasses }: Props = $props();
</script>

<h2 class={extraClasses ? `${classes} ${extraClasses}` : classes}>
	{@render children()}
</h2>
