#include <cstdio>
class testclass
{
public:
    testclass(const char* name) : m_name(name), m_count(0) {}

    ~testclass()
    {
        printf("%s destroyed, count = %i \n", m_name, ++m_count);
    }
private:
    const char* m_name;
    int m_count;
};

static testclass static_test("file scope static");
testclass global_test("global variable");

void foo() {
    static testclass func_static("function scope static");
}
