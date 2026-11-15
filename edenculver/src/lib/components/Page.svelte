<script lang="ts">
	import Bars3 from "svelte-heros-v2/Bars3.svelte";
	import BookOpen from "svelte-heros-v2/BookOpen.svelte";
	import { borderSoft, textClickable, textSecondary } from "$lib/colorClasses";
	import { browser } from "$app/environment";
	import CalendarDays from "svelte-heros-v2/CalendarDays.svelte";
	import CircleStack from "svelte-heros-v2/CircleStack.svelte";
	import Cog8Tooth from "svelte-heros-v2/Cog8Tooth.svelte";
	import Fire from "svelte-heros-v2/Fire.svelte";
	import Flag from "svelte-heros-v2/Flag.svelte";
	import Home from "svelte-heros-v2/Home.svelte";
	import Icon from "./Icon.svelte";
	import MusicalNote from "svelte-heros-v2/MusicalNote.svelte";
	import NavDrawer from "./NavDrawer.svelte";
	import NavItem from "./NavItem.svelte";
	import Share from "svelte-heros-v2/Share.svelte";
	import UserGroup from "svelte-heros-v2/UserGroup.svelte";

	interface Props {
		title: string;
		children: any;
	}

	let { title, children }: Props = $props();

	// load state from sessionStorage (client-side only)
	let leftPaneVisibleSaved = $state(browser ? window.sessionStorage.getItem("leftPaneVisible") || "false" : "false");
	let leftPaneVisible = $state(leftPaneVisibleSaved === "true");

	function toggleLeftPane() {
		leftPaneVisible = !leftPaneVisible;

		// save state to sessionStorage (client-side only)
		if (browser) {
			window.sessionStorage.setItem("leftPaneVisible", leftPaneVisible.toString());
		}
	}
</script>

<div class="min-h-dvh bg-white dark:bg-black text-black dark:text-white flex flex-col">
	<header class="border-b-2 {borderSoft} px-4 py-2 flex gap-3 items-center">
		<button onclick={toggleLeftPane}>
			<Bars3 class={textClickable} />
		</button>
		<Icon classes="ml-2 w-10" />
		<h1 class="text-xl lg:text-2xl font-bold">{title}</h1>
	</header>

	<div class="flex flex-1">
		{#if leftPaneVisible}
			<div class="border-r-2 {borderSoft} flex flex-col">
				<NavItem title="Home" href="/">
					<Home variation="mini" />
				</NavItem>

				<NavDrawer title="Tools">
					<NavItem title="IP Calculator" href="/tools/ip-calculator">
						<CircleStack variation="mini" />
					</NavItem>

					<NavItem
						title="Vintage Story Alloy Calc"
						shortTitle="VS Alloy Calc"
						href="/tools/vs-alloy-calculator"
					>
						<Fire variation="mini" />
					</NavItem>

					<NavItem title="Signal Flags Translator" shortTitle="Signal Flags" href="/tools/signal-flags">
						<Flag variation="mini" />
					</NavItem>

					<NavItem title="Chord Builder" href="/tools/chord-builder">
						<MusicalNote variation="mini" />
					</NavItem>

					<NavItem
						title="Create Steam Engine Sim"
						shortTitle="Steam Engine"
						href="/tools/create-steam-engine"
					>
						<Cog8Tooth variation="mini" />
					</NavItem>
				</NavDrawer>

				<NavDrawer title="Reference">
					<NavItem
						title="LEGO Star Wars Battle Packs"
						shortTitle="Battle Packs"
						href="/reference/battle-packs"
					>
						<BookOpen variation="mini" />
					</NavItem>

					<NavItem title="UT/DR Leitmotifs" shortTitle="Leitmotifs" href="/reference/leitmotifs">
						<Share variation="mini" />
					</NavItem>

					<NavItem title="Stardew Valley Fish" shortTitle="SV Fish" href="/reference/sv-fish">
						<CalendarDays variation="mini" />
					</NavItem>
				</NavDrawer>

				<NavDrawer title="Fun">
					<NavItem title="Villager Quiz" href="/fun/villager-quiz">
						<UserGroup variation="mini" />
					</NavItem>
				</NavDrawer>
			</div>
		{/if}

		<div class="flex flex-col flex-1">
			<div class="flex flex-col flex-1">
				{@render children()}
			</div>

			<footer class="p-1 text-center lg:text-right text-[11px] lg:text-xs {textSecondary} italic">
				This website does not collect, track, or store any of your data.
			</footer>
		</div>
	</div>
</div>
