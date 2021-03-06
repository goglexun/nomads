/*
* AtomicVar.h
*
* Implements an atomic variable.
*
* This class uses templates to specify both the type of variable
* and the type of lock that is used to guarantee the mutually
* exclusive access to the variable. The default lock is Mutex.
*
* This file is part of the IHMC Utility Library
* Copyright (c) IHMC. All Rights Reserved.
*
* Usage restricted to not-for-profit use only.
* Contact IHMC for other types of licenses.
*
* authors : Alessandro Morelli          amorelli@ihmc.us
*
*/

#ifndef INCL_ATOMIC_VAR_H
#define INCL_ATOMIC_VAR_H

#include <stdexcept>
#include "Mutex.h"


namespace NOMADSUtil
{
    template <class Type, class Lock = Mutex> class AtomicVar
    {
    public:
        explicit AtomicVar(const Type &varValue);
        explicit AtomicVar(const AtomicVar &rhs);

        virtual ~AtomicVar();

        // Assignment operators
        AtomicVar<Type, Lock> & operator= (const Type &rhs);
        AtomicVar<Type, Lock> & operator= (const AtomicVar<Type, Lock> &rhs);

        // Compound assignment operators
        AtomicVar<Type, Lock> & operator+= (const Type &val);
        AtomicVar<Type, Lock> & operator-= (const Type &val);
        AtomicVar<Type, Lock> & operator*= (const Type &val);
        AtomicVar<Type, Lock> & operator/= (const Type &val);
        
        //Increment and decrement operators
        AtomicVar<Type, Lock> & operator++ (void);
        AtomicVar<Type, Lock> & operator-- (void);

        // Type conversion operator
        operator const Type&() const { return _var; };

    private:
        Type _var;
        mutable Lock _lock;
    };


    template<class Type, class Lock> inline AtomicVar<Type, Lock>::AtomicVar(const Type &varValue)
        : _var(varValue) {}

    // Copy constructor does not copy the Lock, but only the value of the instance of AtomicVar being copied
    template<class Type, class Lock> inline AtomicVar<Type, Lock>::AtomicVar(const AtomicVar &rhs)
        : _var(rhs._var) {}

    template<class Type, class Lock> inline AtomicVar<Type, Lock>::~AtomicVar() {}

    template <class Type, class Lock> AtomicVar<Type, Lock> & AtomicVar<Type, Lock>::operator= (const Type &rhs)
    {
        #ifndef ANDROID
            if (_lock.lock() != Mutex::RC_Ok) {
                throw std::runtime_error("Impossible to acquire lock()");
            }
        #else
            _lock.lock();
        #endif

        _var = rhs;
        _lock.unlock();

        return *this;
    }

    template <class Type, class Lock> AtomicVar<Type, Lock> & AtomicVar<Type, Lock>::operator= (const AtomicVar<Type, Lock> &rhs)
    {
        #ifndef ANDROID
            if (_lock.lock() != Mutex::RC_Ok) {
                throw std::runtime_error("Impossible to acquire lock()");
            }
        #else
            _lock.lock();
        #endif

        _var = rhs._var;
        _lock.unlock();

        return *this;
    }

    // Compound assignment operators
    template <class Type, class Lock> AtomicVar<Type, Lock> & AtomicVar<Type, Lock>::operator+= (const Type &val)
    {
        #ifndef ANDROID
            if (_lock.lock() != Mutex::RC_Ok) {
                throw std::runtime_error("Impossible to acquire lock()");
            }
        #else
            _lock.lock();
        #endif

        _var += val;
        _lock.unlock();

        return *this;
    }

    template <class Type, class Lock> AtomicVar<Type, Lock> & AtomicVar<Type, Lock>::operator-= (const Type &val)
    {
        #ifndef ANDROID
            if (_lock.lock() != Mutex::RC_Ok) {
                throw std::runtime_error("Impossible to acquire lock()");
            }
        #else
            _lock.lock();
        #endif

        _var -= val;
        _lock.unlock();

        return *this;
    }

    template <class Type, class Lock> AtomicVar<Type, Lock> & AtomicVar<Type, Lock>::operator*= (const Type &val)
    {
        if (_lock.lock() != Mutex::RC_Ok) {
            throw std::runtime_error("Impossible to acquire lock()");
        }

        _var *= val;
        _lock.unlock();

        return *this;
    }

    template <class Type, class Lock> AtomicVar<Type, Lock> & AtomicVar<Type, Lock>::operator/= (const Type &val)
    {
        #ifndef ANDROID
            if (_lock.lock() != Mutex::RC_Ok) {
                throw std::runtime_error("Impossible to acquire lock()");
            }
        #else
            _lock.lock();
        #endif

        _var /= val;
        _lock.unlock();

        return *this;
    }

    template <class Type, class Lock> AtomicVar<Type, Lock> & AtomicVar<Type, Lock>::operator++ (void)
    {
        #ifndef ANDROID
            if (_lock.lock() != Mutex::RC_Ok) {
                throw std::runtime_error("Impossible to acquire lock()");
            }
        #else
            _lock.lock();
        #endif

        _var++;
        _lock.unlock();

        return *this;
    }

    template <class Type, class Lock> AtomicVar<Type, Lock> & AtomicVar<Type, Lock>::operator-- (void)
    {
        #ifndef ANDROID
            if (_lock.lock() != Mutex::RC_Ok) {
                throw std::runtime_error("Impossible to acquire lock()");
            }
        #else
            _lock.lock();
        #endif

        _var--;
        _lock.unlock();

        return *this;
    }

}

#endif