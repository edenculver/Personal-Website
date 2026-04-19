<script lang="ts">
	interface Props {
		title: string;
		description?: string;
		href: string;
		src: string;
		alt: string;
		pixelated?: boolean;
	}

	let { title, description, href, src, alt, pixelated=false }: Props = $props();
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
		border: 1px solid gray;
		border-radius: 10px;
		margin: 10px;
		min-width: 300px;
		flex: 1;
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
		display: flex;
		align-items: center;
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
</style>
