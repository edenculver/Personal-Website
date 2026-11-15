<script lang="ts">
	import {
		Bars3,
		BookOpen,
		CalendarDays,
		CircleStack,
		Cog8Tooth,
		Fire,
		Flag,
		Home,
		MusicalNote,
		Share,
		UserGroup,
	} from "svelte-heros-v2";
	import { browser } from "$app/environment";
	import Icon from "./Icon.svelte";
	import NavItem from "./NavItem.svelte";
	import NavDrawer from "./NavDrawer.svelte";

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
	<header class="border-b-2 border-gray-400 dark:border-gray-600 px-4 py-2 flex gap-3 items-center">
		<button onclick={() => toggleLeftPane()}>
			<Bars3 class="hover:text-green-600 dark:hover:text-green-400 duration-100" />
		</button>
		<Icon classes="ml-2 w-10" />
		<h1 class="text-xl lg:text-2xl font-bold">{title}</h1>
	</header>

	<div class="flex">
		{#if leftPaneVisible}
			<div class="border-r-2 border-gray-400 dark:border-gray-600 flex flex-col">
				<NavItem title="Home" href="/">
					<Home variation="mini" />
				</NavItem>

				<NavDrawer title="Tools">
					<NavItem title="IP Calculator" href="/tools/ip-calculator">
						<CircleStack variation="mini" />
					</NavItem>

					<NavItem
						title="Vintage Story Alloy Calculator"
						shortTitle="VS Alloy Calc"
						href="/tools/alloy-calculator"
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
			<div class="flex-1">
				{@render children()}
			</div>

			<footer
				class="p-1 text-center lg:text-right text-[11px] lg:text-xs text-gray-500 dark:text-gray-500 italic"
			>
				This website does not collect, track, or store any of your data.
			</footer>
		</div>
	</div>
</div>
