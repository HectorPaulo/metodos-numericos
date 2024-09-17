#include <iostream>
#include <vector>
#include <algorithm>

int main()
{

    std::vector<int> num = {1, 2, 3};

    std::vector<char> let = {'a', 'b'};

    int aux = 0;

    do
    {
        for (char l1 : let)
        {
            for (char l2 : let)
            {
                if (l1 != l2)
                {
                    std::cout << l1 << l2 << num[0] << num[1] << num[2] << std::endl;
                    aux++;
                }
            }
        }
    } while (std::next_permutation(num.begin(), num.end()));

    std::cout << "Total de combinaciones: " << aux << std::endl;

    return 0;
}
