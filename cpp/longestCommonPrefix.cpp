#include <iostream>
#include <string>
using namespace std;
/*
string longestCommonPrefix(list of strings)
    string to store common prefixes
    while (list is not empty)
        try
            store first letter of the first string
            for (first letter of every string within the list)
                if (stored first letter matched first letter of string)
                    erase first letter of the string if letters match
                else 
                    return stored string of common prefixes
            add matched letter to stored string
        catch (All strings are equal to each other)
            return stored string
    return empty string if list is empty
*/
string longestCommonPrefix(vector<string>& strs)
{
    string comStr = "";
    while (!strs.empty())
    {
        try 
        {
            char letter = strs[0].at(0);
            for (int i = 0; i < strs.size(); i++)
            {
                if (letter == strs[i].at(0))
                    strs[i].erase(0,1);
                else
                    return comStr;
            }
            comStr = comStr + letter;
        }
        catch (exception e)
        {
            return comStr;
        }
    }
    return comStr;
}