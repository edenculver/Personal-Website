/**
 * If value falls outside the given bounds, set it the the nearest boundary.
 * @param value 
 * @param min 
 * @param max 
 * @returns Clamped value.
 */
export function clamp(value: number, min: number, max: number) {
	if (value < min) {
		return min;
	} else if (value > max) {
		return max;
	}
	return value;
}

/** 
 * @param start 
 * @param end
 * @returns Array of numbers from start to end.
 */
export function range(start: number, end: number) {
	let range: number[] = [];
	for (let i = start; i < end + 1; i++) {
		range.push(i);
	}
	return range;
}
