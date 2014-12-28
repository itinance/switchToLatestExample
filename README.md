switchToLatestExample
=====================

An example for ReactiveCocoa :: switchToLatest.

Imagine the following task: you want to observe some properties of an object, which sometimes may not exist. For instance, this could be an object, which is delivered via a REST API at a later time. How to deal with that? RACObserve(subject, property) won't work if subject is nil at this time. Fortunatly, ReactiveCocoa has tools for this issue.

Inspired by Patrick Bacons Artikel about switchToLatest (http://spin.atomicobject.com/2014/05/21/reactivecocoa-understanding-switchtolatest) I played around with it and created this example project.
