/** 
 * @param start 
 * @param end
 * @returns Array of numbers from start to end.
 */
export default function range(start:number, end:number) {
	let range: number[] = [];
	for (let i = start; i < end + 1; i++) {
		range.push(i);
	}
	return range;
}
