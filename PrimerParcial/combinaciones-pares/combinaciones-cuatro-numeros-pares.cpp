#include <iostream>
#include <algorithm>
#include <vector>

int main()
{
    std::vector<int> num = {2, 3, 4};

    int aux = 0;

    do
    {
        if (num.back() == 2 || num.back() == 4)
        {
            for (int n : num)
            {
                std::cout << n << " ";
            }
            std::cout << std::endl;
            aux++;
        }
    } while (std::next_permutation(num.begin(), num.end()));

    std::cout << "Número total de combinaciones: " << aux << std::endl;
    return 0;
}
