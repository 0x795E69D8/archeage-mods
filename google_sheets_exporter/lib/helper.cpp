#include <iostream>
#include "Cbignum.h"
#include "Cbignums.h"
#include "cryptlib.h"
#include "files.h"
#include "filters.h"
#include "hex.h"
#include "sha.h"
using namespace std;

int main(int argc, char *argv[]) 
{
    if (argc < 2) {
        cout << "Usage: helper sha256 | modpow";
        return 1;
    } else if (string_view(argv[1]) == "sha256") {
        if (argc != 3) {
            cout << "Usage: helper sha256 [string]";
            return 1;
        }
        string msg = argv[2];
        string digest;

        CryptoPP::HexEncoder encoder(new CryptoPP::FileSink(cout));
        CryptoPP::SHA256 hash;
        hash.Update((const CryptoPP::byte*)msg.data(), msg.size());
        digest.resize(hash.DigestSize());
        hash.Final((CryptoPP::byte*)&digest[0]);

        CryptoPP::StringSource(digest, true, new CryptoPP::Redirector(encoder));
        return 0;
    } else if (string_view(argv[1]) == "modpow") {
        if (argc != 5) {
            cout << "Usage: helper modpow [base] [exponent] [modulus]";
            return 1;
        }
        cBigString str;
        cBigNumber x = cBigNumber(argv[2], 0); 
        cBigNumber y = cBigNumber(argv[3], 0); 
        cBigNumber p = cBigNumber(argv[4], 0); 
        x.powmod(y, p);
        cout << x.toa(str);
        return 0; 
    } else {
        cout << "Usage: helper sha256 | modpow";
        return 1;
    }
} 