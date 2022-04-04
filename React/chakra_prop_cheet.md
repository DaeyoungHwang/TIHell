## Css Prop Table

| Prop              | CSS Property                              | Theme Key |
| ----------------- | ----------------------------------------- | --------- |
| m, margin         | margin                                    | space     |
| mt, marginTop     | margin-top                                | space     |
| mr, marginRight   | margin-right                              | space     |
| me, marginEnd     | margin-inline-end                         | space     |
| mb, marginBottom  | margin-bottom                             | space     |
| ml, marginLeft    | margin-left                               | space     |
| ms, marginStart   | margin-inline-start                       | space     |
| mx, marginX       | margin-inline-start + margin-inline-end   | space     |
| my, marginY       | margin-top + margin-bottom                | space     |
| p, padding        | padding                                   | space     |
| pt, paddingTop    | padding-top                               | space     |
| pr, paddingRight  | padding-right                             | space     |
| pe, paddingEnd    | padding-inline-end                        | space     |
| pb, paddingBottom | padding-bottom                            | space     |
| pl, paddingLeft   | padding-left                              | space     |
| ps, paddingStart  | padding-inline-start                      | space     |
| px, paddingX      | padding-inline-start + padding-inline-end | space     |
| py, paddingY      | padding-top + padding-bottom              | space     |

## Color

| Prop           | CSS Property     | Theme Key |
| -------------- | ---------------- | --------- |
| color          | color            | colors    |
| bg, background | background       | colors    |
| bgColor        | background-color | colors    |
| opacity        | opacity          | none      |

```Typescript
// picks up a nested color value using dot notation
// => `theme.colors.gray[50]`
<Box color='gray.50' />

// raw CSS color value
<Box color='#f00' />

// background colors
<Box bg='tomato' />

// verbose prop
<Box backgroundColor='tomato' />
```

## Gradient

| Prop                   | CSS Property     | Theme Key |
| ---------------------- | ---------------- | --------- |
| bgGradient             | background-image | none      |
| bgClip, backgroundClip | background-clip  | none      |

```TypeScript
// adding linear gradient and color transitions
<Box w="100%" h="200px" bgGradient="linear(to-t, green.200, pink.500)" />

// adding radial gradient and color transitions
<Box w="100%" h="200px" bgGradient="radial(gray.300, yellow.400, pink.200)" />

// adding the text gradient
<Text
  bgGradient="linear(to-l, #7928CA, #FF0080)"
  bgClip="text"
  fontSize="6xl"
  fontWeight="extrabold"
>
  Welcome to Chakra UI
</Text>
```

## Typography

| Prop           | CSS Property    | Theme Key      |
| -------------- | --------------- | -------------- |
| fontFamily     | font-family     | fonts          |
| fontSize       | font-size       | fontSizes      |
| fontWeight     | font-weight     | fontWeights    |
| lineHeight     | line-height     | lineHeights    |
| letterSpacing  | letter-spacing  | letterSpacings |
| textAlign      | text-align      | none           |
| fontStyle      | font-style      | none           |
| textTransform  | text-transform  | none           |
| textDecoration | text-decoration | none           |

```TypeScript
// font-size of `theme.fontSizes.md`
<Text fontSize="md" />

// font-size `32px`
<Text fontSize={32} />

// font-size `'2em'`
<Text fontSize='2em' />

// text-align `left` on all viewports and `center` from the first breakpoint and up
<Text textAlign={[ 'left', 'center' ]} />
```

## Layout, width and height

| Prop            | CSS Property   | Theme Key |
| --------------- | -------------- | --------- |
| w, width        | width          | sizes     |
| h, height       | height         | sizes     |
| minW, minWidth  | min-width      | sizes     |
| maxW, maxWidth  | max-width      | sizes     |
| minH, minHeight | min-height     | sizes     |
| maxH, maxHeight | max-height     | sizes     |
| d, display      | display        | none      |
| boxSize         | width, height  | sizes     |
| verticalAlign   | vertical-align | none      |
| overflow        | overflow       | none      |
| overflowX       | overflowX      | none      |
| overflowY       | overflowY      | none      |

```TypeScript
// verbose
<Box width="100%" height={32} />

// shorthand
<Box w="100%" h="32px" />

// use theme sizing
<Box boxSize="sm" />

// width `256px`
<Box w={256} />

// width `'40px'`
<Box w='40px' />
```
