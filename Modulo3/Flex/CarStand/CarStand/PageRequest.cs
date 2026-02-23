using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CarStand
{
    public class PageRequest
    {
        public PesquisaArgs ActiveFilters {get; private set;}
        
        public int CurrentPage { get; private set; }
        
        public int ResultsPerPage {  get; private set; }
        public PageRequest(PesquisaArgs activeFilters, int resultsPerPage)
        {
            ActiveFilters = activeFilters;
            ResultsPerPage = resultsPerPage;
            CurrentPage = 1;
        }

        public void ApplyNewFilters(PesquisaArgs filters)
        {
            ActiveFilters = filters;
            CurrentPage = 1; 
        }

        public void NextPage()
        {
            CurrentPage++;
        }

        public void PreviousPage()
        {
            if (CurrentPage > 1)
                CurrentPage--;
        }

        public void ChangePageSize(int newSize)
        {
            ResultsPerPage = newSize;
            CurrentPage = 1;
        }

        public int OffSet()
        {
            return ResultsPerPage * (CurrentPage - 1);
        }
    }
}
