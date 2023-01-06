/**
 * mansearch.js
 */
$('.index_doc').on('click',function(){
   $('#center').load('/mansearch/mansearch_view');
});
$('.mansearch_insert').on('click',function(){
   $('#center').load('/mansearch/mansearch_insert');
});