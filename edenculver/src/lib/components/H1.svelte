<script lang="ts">
	interface Props {
		children: any;
		classes?: string;
		extraClasses?: string;
	}

	let { children, classes = "text-xl lg:text-2xl font-bold", extraClasses }: Props = $props();
</script>

<h1 class={extraClasses ? `${classes} ${extraClasses}` : classes}>
	{@render children()}
</h1>
