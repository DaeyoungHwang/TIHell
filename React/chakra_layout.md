# Layout

## Aspect Ratio

종횡비를 맞춰야 하는 비디오, 지도, 사진 등을 임베드 시키는 레이아웃

```TypeScript
<AspectRatio maxW='400px' ratio={4 / 3}>
  <Image src='https://bit.ly/naruto-sage' alt='naruto' objectFit='cover' />
</AspectRatio>
```

## Box

가장 기본적인 컴포넌트, div 요소를 랜더링함
as를 사용하여 styped-component처럼 랜더 요소를 변경할 수 있다.

```TypeScript
<Box as='button' borderRadius='md' bg='tomato' color='white' px={4} h={8}>
  Button
</Box>
```

## Center

child를 center로 정렬해주는 레이아웃

- Center: centers its child given width and height
- Square: centers its child given size (width and height)
- Circle: a Square with round border-radius

## Container

지정된 사이즈만큼 child의 크기를 제한하는 컨테이너

- centerContent: child를 중앙에 배치

## Flex

flexbox가 적용된 Box 컴포넌트

- Flex: A Box with display: flex.
- Spacer: Creates an adjustable, empty space that can be used to tune the spacing between child elements within Flex.

```TypeScript
<Box>
  <Text>Flex and Spacer: Full width, equal Spacing</Text>
  <Flex>
    <Box w='70px' h='10' bg='red.500' />
    <Spacer />
    <Box w='170px' h='10' bg='red.500' />
    <Spacer />
    <Box w='180px' h='10' bg='red.500' />
  </Flex>

  <Text>
    Grid: The children start at the beginning, the 1/3 mark and 2/3 mark
  </Text>
  <Grid templateColumns='repeat(3, 1fr)' gap={6}>
    <Box w='70px' h='10' bg='blue.500' />
    <Box w='170px' h='10' bg='blue.500' />
    <Box w='180px' h='10' bg='blue.500' />
  </Grid>

  <Text>
    HStack: The children have equal spacing but don't span the whole container
  </Text>
  <HStack spacing='24px'>
    <Box w='70px' h='10' bg='teal.500' />
    <Box w='170px' h='10' bg='teal.500' />
    <Box w='180px' h='10' bg='teal.500' />
  </HStack>
</Box>
```

## Grid

display: grid 가 적용된 Box 컴포넌트

```TypeScript
<Grid templateColumns='repeat(5, 1fr)' gap={6}>
  <GridItem w='100%' h='10' bg='blue.500' />
  <GridItem w='100%' h='10' bg='blue.500' />
  <GridItem w='100%' h='10' bg='blue.500' />
  <GridItem w='100%' h='10' bg='blue.500' />
  <GridItem w='100%' h='10' bg='blue.500' />
</Grid>
```

### Spanning

```TypeScript
<Grid
  h='200px'
  templateRows='repeat(2, 1fr)'
  templateColumns='repeat(5, 1fr)'
  gap={4}
>
  <GridItem rowSpan={2} colSpan={1} bg='tomato' />
  <GridItem colSpan={2} bg='papayawhip' />
  <GridItem colSpan={2} bg='papayawhip' />
  <GridItem colSpan={4} bg='tomato' />
</Grid>
```

```TypeScript
<Grid templateColumns='repeat(5, 1fr)' gap={4}>
  <GridItem colSpan={2} h='10' bg='tomato' />
  <GridItem colStart={4} colEnd={6} h='10' bg='papayawhip' />
</Grid>
```

## SimpleGrid

심플한 표준 그리드

```TypeScript
<SimpleGrid columns={2} spacing={10}>
  <Box bg='tomato' height='80px'></Box>
  <Box bg='tomato' height='80px'></Box>
  <Box bg='tomato' height='80px'></Box>
  <Box bg='tomato' height='80px'></Box>
  <Box bg='tomato' height='80px'></Box>
</SimpleGrid>
```

```TypeScript
// Passing `columns={[2, null, 3]}` and `columns={{sm: 2, md: 3}}`
// will have the same effect.

<SimpleGrid columns={[2, null, 3]} spacing='40px'>
  <Box bg='tomato' height='80px'></Box>
  <Box bg='tomato' height='80px'></Box>
  <Box bg='tomato' height='80px'></Box>
  <Box bg='tomato' height='80px'></Box>
  <Box bg='tomato' height='80px'></Box>
</SimpleGrid>
```

### auto-responsive grid

```TypeScript
<SimpleGrid minChildWidth='120px' spacing='40px'>
  <Box bg='tomato' height='80px'></Box>
  <Box bg='tomato' height='80px'></Box>
  <Box bg='tomato' height='80px'></Box>
  <Box bg='tomato' height='80px'></Box>
  <Box bg='tomato' height='80px'></Box>
  <Box bg='tomato' height='80px'></Box>
</SimpleGrid>
```

```TypeScript
<SimpleGrid columns={2} spacingX='40px' spacingY='20px'>
  <Box bg='tomato' height='80px'></Box>
  <Box bg='tomato' height='80px'></Box>
  <Box bg='tomato' height='80px'></Box>
  <Box bg='tomato' height='80px'></Box>
  <Box bg='tomato' height='80px'></Box>
</SimpleGrid>
```

## Stack

stack 레이아웃 컴포넌트

- VStack
- HStack

```TypeScript
<Stack direction={['column', 'row']} spacing='24px'>
  <Box w='40px' h='40px' bg='yellow.200'>
    1
  </Box>
  <Box w='40px' h='40px' bg='tomato'>
    2
  </Box>
  <Box w='40px' h='40px' bg='pink.100'>
    3
  </Box>
</Stack>
```

### dividers

```TypeScript
<VStack
  divider={<StackDivider borderColor='gray.200' />}
  spacing={4}
  align='stretch'
>
  <Box h='40px' bg='yellow.200'>
    1
  </Box>
  <Box h='40px' bg='tomato'>
    2
  </Box>
  <Box h='40px' bg='pink.100'>
    3
  </Box>
</VStack>
```

## Wrap

flex-wrap를 구현한 컴포넌트이다. spacing 기능도 추가로 제공한다.

```TypeScript
<Wrap spacing='30px'>
  <WrapItem>
    <Center w='180px' h='80px' bg='red.200'>
      Box 1
    </Center>
  </WrapItem>
  <WrapItem>
    <Center w='180px' h='80px' bg='green.200'>
      Box 2
    </Center>
  </WrapItem>
  <WrapItem>
    <Center w='180px' h='80px' bg='tomato'>
      Box 3
    </Center>
  </WrapItem>
  <WrapItem>
    <Center w='180px' h='80px' bg='blue.200'>
      Box 4
    </Center>
  </WrapItem>
  <WrapItem>
    <Center w='180px' h='80px' bg='blackAlpha.500'>
      Box 5
    </Center>
  </WrapItem>
</Wrap>
```

```TypeScript
<Wrap spacing='30px' align='center'>
  <WrapItem>
    <Center w='180px' h='80px' bg='red.200'>
      Box 1
    </Center>
  </WrapItem>
  <WrapItem>
    <Center w='180px' h='40px' bg='green.200'>
      Box 2
    </Center>
  </WrapItem>
  <WrapItem>
    <Center w='120px' h='80px' bg='tomato'>
      Box 3
    </Center>
  </WrapItem>
  <WrapItem>
    <Center w='180px' h='40px' bg='blue.200'>
      Box 4
    </Center>
  </WrapItem>
  <WrapItem>
    <Center w='180px' h='80px' bg='blackAlpha.500'>
      Box 5
    </Center>
  </WrapItem>
</Wrap>
```
