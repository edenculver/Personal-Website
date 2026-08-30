<script lang="ts">
	import NavBar from "./NavBar.svelte";
	import PrivacyPolicy from "./PrivacyPolicy.svelte";

	interface Props {
		children: any;
		classes?: string;
		extraClasses?: string;
	}

	let {
		children,
		classes = "mx-auto lg:mx-16 my-4 lg:my-10 p-4 text-sm lg:text-base flex flex-col gap-6 flex-1",
		extraClasses,
	}: Props = $props();
</script>

<div class="min-h-dvh flex flex-col">
	<NavBar />

	<div class={extraClasses ? `${classes} ${extraClasses}` : classes}>
		{@render children()}
	</div>

	<PrivacyPolicy />
</div>
