$.ajax({
  url: 'https://www.federalregister.gov/documents/full_text/xml/2017/07/20/2017-15190.xml',
  type: 'GET',
  dataType: 'XML'
})
.done((data) => {
  console.log(data)
})
