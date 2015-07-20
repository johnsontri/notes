********
Cloudant
********

API
===

_all_doc
--------

sorted key list


GET
^^^^

params:

+ startkey
+ endkey
+ include_doc=(true|false) *false*
+ descending=(true|false) *false*
+ limit=N
+ skip=N


Replication
============

+ master-master
+ Only sync on differ, including change history, deleted docs.
+ compression through transfer


Single Replication
------------------

For the snapshot of database


Secondary index
===============

MapReduce
---------

+ Unable to join between documents

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

Add ``dbcopy`` field in design document

+ cloudant *only* feature

TOOD
    `ref <http://examples.cloudant.com/sales/_design/sales/index.html>`_


CouchApp
==========

Application can live in CouchDB.
The function defined in design documents will be run with *Query Server*.
CouchDB self-shipped a js engine, SpiderMonkey, as default *Query Server*.
We can customized our Query Server, also.

- It contains server-side js engine, earlier than nodejs.

- `Couch Desktop <http://www.freedesktop.org/wiki/Specifications/desktopcouch/>`_


Show Function
-------------


List Function
-------------


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


Security
=========

Auth
-----

``local.ini``
^^^^^^^^^^^^^^

Assume we have the following admin section with unencrypted password.

::

    [admin]

    admin = password
    foo = bar
    ...

And restart the cloudant/couchdb, it will auto generate encrypted password for you.

Couchdb:

.. code-block:: shell

        $ sudo service couchdb restart

Cloudant on debian:

.. code-block:: shell

        $ sudo sv restart /etc/service/cloudant


Comparison
===========

The following table compare some method in design document.


+------------+---------------------------+---------------------------+---------------------------+
| item       | Secondary Index           | Cloudant Search           | Cloudant Query            |
+------------+---------------------------+---------------------------+---------------------------+
| Require to | V                         | V                         | X                         |
| build      |                           |                           |                           |
| index      |                           |                           |                           |
+------------+---------------------------+---------------------------+---------------------------+
| Senario    | - Map                     | - Search engine           | - Ad-hoc query            |
|            |    - doc filtering        |    - keyword search       | - module mango            |
|            |    - doc reshaping        |    - tokenlizer           |    - provide mongo-like   |
|            |    - multiple ``emit()``  |    - fuzzy search         |      query syntax         |
|            | - Reduce                  |    - regex                | - SQL-like                |
|            |    - ``sum``              |    - numeric value        |    - need to define       |
|            |    - ``stat``             |       - range base        |      schema first         |
|            |    - ``count``            |                           |                           |
|            |    - grouping             |                           |                           |
|            |    - complex key          |                           |                           |
|            |    - *for reporting*      |                           |                           |
|            | - Query Server            |                           |                           |
|            |    - embeded AP           |                           |                           |
|            |    - special protocol     |                           |                           |
|            |    - highly customized    |                           |                           |
|            |                           |                           |                           |
|            |                           |                           |                           |
|            |                           |                           |                           |
|            |                           |                           |                           |
|            |                           |                           |                           |
|            |                           |                           |                           |
|            |                           |                           |                           |
|            |                           |                           |                           |
+------------+---------------------------+---------------------------+---------------------------+


TODO
=====

+ Attachment
