#include <iostream>
#include <algorithm>
#include <vector>

int main()
{
    std::vector<int> num = {1, 2, 3, 4, 5};

    int aux = 0;

    do
    {
        for (int num : num)
        {
            std::cout << num << " ";
        }
        std::cout << std::endl;
        aux++;
    } while (std::next_permutation(num.begin(), num.end())); // <-----Para la siguiente prmutacion
    return 0;
}
