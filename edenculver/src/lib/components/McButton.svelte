<script lang="ts">
	interface Props {
		onclick: () => void;
		children: any;
	}

	let { onclick, children }: Props = $props();
</script>

<button
	class="border-10 [border-image:url(/images/villager-quiz/mcbutton_gray.png)_10_stretch] hover:[border-image:url(/images/villager-quiz/mcbutton_green.png)_10_stretch] w-[80vw] max-w-200 p-5 bg-mclightgray hover:bg-mcgreen text-mcdarkgray hover:text-white"
	{onclick}
>
	{@render children()}
</button>
