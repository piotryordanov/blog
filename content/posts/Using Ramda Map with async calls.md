---
author: "Piotr Yordanov"
title: "Using Ramda Map with async calls"
date: "2022-03-14"
description: ""
tags:
---

By far, the hardest Ramda challenge I faced while building [Zeistab](https://zeistab.piotryordanov.com) was running a `R.map` on a bunch of `async` functions, and then **waiting** for the result of all the async functions before proceeding.
Normally,  `Promise.All` does the job, but the question was to figure out how to integrate that with ramda.
