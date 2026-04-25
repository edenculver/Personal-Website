<script lang="ts">
	interface Props {
		title: string;
		description?: string;
		href: string;
		src: string;
		alt: string;
		pixelated?: boolean;
	}

	let { title, description, href, src, alt, pixelated = false }: Props = $props();
</script>

<a {href}>
	<div class="titleBar">
		<img class={pixelated ? "pixel" : ""} {src} {alt} />
		<b class="title">{title}</b>
	</div>
	<div class="description">{description}</div>
</a>

<style>
	a {
		align-items: center;
		border: 2px solid gray;
		border-radius: 10px;
		flex: 1;
		margin: 10px;
		min-width: 300px;
	}
	a:hover {
		background-color: gray;
		transition: 0.25s;
	}
	a:link,
	a:visited {
		color: white;
		text-decoration: none;
	}
	.titleBar {
		align-items: center;
		display: flex;
	}
	img {
		height: 48px;
		margin: 20px;
		width: 48px;
	}
	.pixel {
		image-rendering: pixelated;
	}
	.title {
		margin: 20px 20px 20px 0px;
	}
	.description {
		margin: 0px 20px 20px;
	}
	@media (prefers-color-scheme: light) {
		a:link,
		a:visited {
			color: black;
		}
	}
</style>
