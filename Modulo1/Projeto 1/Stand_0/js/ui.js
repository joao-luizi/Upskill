

function inspecaoEstado(data) {
  const agora = new Date();
  const diffMeses = (agora - data) / (1000 * 60 * 60 * 24 * 30);
  if (diffMeses > 12) return '<span class="vendido">Expirada</span>';
  if (diffMeses > 10) return '<span class="aviso">A expirar</span>';
  return '<span class="ok">Válida</span>';
}


function updateSortElement(element, IsAscending)
{
    if (IsAscending)
    {
      element.innerHTML = '&#x25b4'
      element.title = "Ordered by Descending"

    }
    else
    {
      element.title = "Ordered by Ascending"
      element.innerHTML = '&#x25be'
    }

}
