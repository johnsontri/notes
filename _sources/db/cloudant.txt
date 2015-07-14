********
Cloudant
********

API
===

_all_doc
--------

/_all_doc -> sorted key list


GET
^^^^

params:

+ startkey
+ endkey
+ include_doc=(true|false) *false*
+ descending=(true|false) *false*
+ limit=N
+ skip=N


Secondary index
===============

MapReduce
---------

Map Function
^^^^^^^^^^^^^

``map() -> (key, val)``

+ build-in MapReduce fnuctions was written in Erlang -> faster

reduce function can be group by ``key``
    + ``pi?group=true``
    + ``api?group_level=N``

multiple ``emit``

    .. code-block:: javascript


        function(doc)
        {
            emit(doc.id, 1);
            emit(doc.other, 2);
        }


GET
    :reduce: ``true|false``
    :group:  ``true|false``
    :stale:  ``ok`` -> optional skip index building
    :group_level:
        key in [k1, k2, k3]

        ``group_level=1`` -> group by [k1]

        ``group_level=2`` -> group by [k1, k2]


Reduce Function
^^^^^^^^^^^^^^^
if rereduce is False::

    reduce(
        [ 
            [key1, id1],
            [key2, id2],
            [key3, id3]
        ],
        [ value1, value2, value3 ],
        false,
    ) 


e.g::

    reduce(
        [ 
            [
                [
                    id,
                    val,
                ],
                id1],
            [
                [
                    id,
                    val,
                ]
                , id2],
            [
                [
                    id,
                    val,
                ]
                , id3]
        ],
        [ value1, value2, value3 ],
        false,
    ) 


View Group
-----------

One design doc can contain multiple view.
Thus, there is a view group.

Each view group consume one Query Server(one process),



Chainable MapReduce
^^^^^^^^^^^^^^^^^^^


Show Function
=============


List Function
=============


Cloudant Search
===============

+ build on Apache Lucene
+ text searching
+ text analyzer
+ ad-hoc query
    + primary index
    + secondary index
+ can create index on inside text

Query Syntax
-------------

`Lucene query syntax ref <https://lucene.apache.org/core/5_2_0/queryparser/org/apache/lucene/queryparser/classic/package-summary.html#package_description>`_


Index Function
--------------

``index('field', doc.field, {options: val})``

