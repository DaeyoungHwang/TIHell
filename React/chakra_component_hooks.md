# useCheckbox

체크박스 커스텀훅
|Name|Type|Description|
|---|---|---|
|state|CheckboxState|An object that contains all props defining the current state of a checkbox.|
|getCheckboxProps|PropGetter|A function to get the props of the checkbox.|
|getInputProps|PropGetter|A function to get the props of the input field.|
|getLabelProps|PropGetter|A function to get the props of the checkbox label.|
|htmlProps|{}|An object with all htmlProps.|

```TypeScript
const CustomCheckbox = (props) => {
    const { state, getCheckboxProps, getInputProps, getLabelProps, htmlProps } =
      useCheckbox(props)

    return (
      <chakra.label
        display='flex'
        flexDirection='row'
        alignItems='center'
        gridColumnGap={2}
        maxW='36'
        bg='green.50'
        border='1px solid'
        borderColor='green.500'
        rounded='lg'
        px={3}
        py={1}
        cursor='pointer'
        {...htmlProps}
      >
        <input {...getInputProps()} hidden />
        <Flex
          alignItems='center'
          justifyContent='center'
          border='2px solid'
          borderColor='green.500'
          w={4}
          h={4}
          {...getCheckboxProps()}
        >
          {state.isChecked && <Box w={2} h={2} bg='green.500' />}
        </Flex>
        <Text {...getLabelProps()}>Click me</Text>
      </chakra.label>
    )
  }
```
