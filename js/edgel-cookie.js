/*!
 * EdGEL: The University of Edinburgh Experience Language. v4.3.4
 * Copyright 2014-2018 The University of Edinburgh
 *
 * Browser bundle of nunjucks 3.1.2 (slim, only works with precompiled templates)
 */

if (typeof jQuery === 'undefined') {
  throw new Error('EdGEL\'s JavaScript requires jQuery')
}

+function ($) {
  'use strict';
  var version = $.fn.jquery.split(' ')[0].split('.')
  if ((version[0] < 2 && version[1] < 9) || (version[0] == 1 && version[1] == 9 && version[2] < 1) || (version[0] > 3)) {
    throw new Error('EdGEL\'s JavaScript requires jQuery version 1.9.1 or higher, but lower than version 4')
  }
}(jQuery);

/*! Browser bundle of nunjucks 3.1.2 (slim, only works with precompiled templates) */
!function(n,t){"object"==typeof exports&&"object"==typeof module?module.exports=t():"function"==typeof define&&define.amd?define([],t):"object"==typeof exports?exports.nunjucks=t():n.nunjucks=t()}("undefined"!=typeof self?self:this,function(){return function(n){var t={};function r(i){if(t[i])return t[i].exports;var e=t[i]={i:i,l:!1,exports:{}};return n[i].call(e.exports,e,e.exports,r),e.l=!0,e.exports}return r.m=n,r.c=t,r.d=function(n,t,i){r.o(n,t)||Object.defineProperty(n,t,{configurable:!1,enumerable:!0,get:i})},r.n=function(n){var t=n&&n.__esModule?function(){return n.default}:function(){return n};return r.d(t,"a",t),t},r.o=function(n,t){return Object.prototype.hasOwnProperty.call(n,t)},r.p="",r(r.s=6)}([function(n,t){},function(n,t,r){"use strict";var i=Array.prototype,e=Object.prototype,u={"&":"&amp;",'"':"&quot;","'":"&#39;","<":"&lt;",">":"&gt;"},o=/[&"'<>]/g,f=n.exports={};function c(n,t){return e.hasOwnProperty.call(n,t)}function s(n){return u[n]}function a(n,t,r){var i,e,u,o=this;if(n instanceof Error&&(n=(e=n).name+": "+e.message),Object.setPrototypeOf?Object.setPrototypeOf(i=Error(n),a.prototype):Object.defineProperty(i=this,"message",{enumerable:!1,writable:!0,value:n}),Object.defineProperty(i,"name",{value:"Template render error"}),Error.captureStackTrace&&Error.captureStackTrace(i,this.constructor),e){var f=Object.getOwnPropertyDescriptor(e,"stack");(u=f&&(f.get||function(){return f.value}))||(u=function(){return e.stack})}else{var c=Error(n).stack;u=function(){return c}}return Object.defineProperty(i,"stack",{get:function(){return u.call(o)}}),Object.defineProperty(i,"cause",{value:e}),i.lineno=t,i.colno=r,i.firstUpdate=!0,i.Update=function(n){var t="("+(n||"unknown path")+")";return o.firstUpdate&&(o.lineno&&o.colno?t+=" [Line "+o.lineno+", Column "+o.colno+"]":o.lineno&&(t+=" [Line "+o.lineno+"]")),t+="\n ",o.firstUpdate&&(t+=" "),o.message=t+(o.message||""),o.firstUpdate=!1,o},i}function h(n){return"[object Function]"===e.toString.call(n)}function l(n){return"[object Array]"===e.toString.call(n)}function v(n){return"[object String]"===e.toString.call(n)}function d(n){return"[object Object]"===e.toString.call(n)}function p(n){return Array.prototype.slice.call(n)}function y(n,t,r){return Array.prototype.indexOf.call(n||[],t,r)}function w(n){var t=[];for(var r in n)c(n,r)&&t.push(r);return t}f.hasOwnProp=c,f.t=function(n,t,r){if(r.Update||(r=new f.TemplateError(r)),r.Update(n),!t){var i=r;(r=Error(i.message)).name=i.name}return r},Object.setPrototypeOf?Object.setPrototypeOf(a.prototype,Error.prototype):a.prototype=Object.create(Error.prototype,{constructor:{value:a}}),f.TemplateError=a,f.escape=function(n){return n.replace(o,s)},f.isFunction=h,f.isArray=l,f.isString=v,f.isObject=d,f.groupBy=function(n,t){for(var r={},i=h(t)?t:function(n){return n[t]},e=0;e<n.length;e++){var u=n[e],o=i(u,e);(r[o]||(r[o]=[])).push(u)}return r},f.toArray=p,f.without=function(n){var t=[];if(!n)return t;for(var r=n.length,i=p(arguments).slice(1),e=-1;++e<r;)-1===y(i,n[e])&&t.push(n[e]);return t},f.repeat=function(n,t){for(var r="",i=0;i<t;i++)r+=n;return r},f.each=function(n,t,r){if(null!=n)if(i.forEach&&n.forEach===i.forEach)n.forEach(t,r);else if(n.length===+n.length)for(var e=0,u=n.length;e<u;e++)t.call(r,n[e],e,n)},f.map=function(n,t){var r=[];if(null==n)return r;if(i.map&&n.map===i.map)return n.map(t);for(var e=0;e<n.length;e++)r[r.length]=t(n[e],e);return n.length===+n.length&&(r.length=n.length),r},f.asyncIter=function(n,t,r){var i=-1;!function e(){++i<n.length?t(n[i],i,e,r):r()}()},f.asyncFor=function(n,t,r){var i=w(n||{}),e=i.length,u=-1;!function o(){var f=i[++u];u<e?t(f,n[f],u,e,o):r()}()},f.indexOf=y,f.keys=w,f.r=function(n){return w(n).map(function(t){return[t,n[t]]})},f.u=function(n){return w(n).map(function(t){return n[t]})},f.f=f.extend=function(n,t){return n=n||{},w(t).forEach(function(r){n[r]=t[r]}),n},f.inOperator=function(n,t){if(l(t)||v(t))return-1!==t.indexOf(n);if(d(t))return n in t;throw Error('Cannot use "in" operator to search for "'+n+'" in unexpected types.')}},function(n,t,r){"use strict";var i=r(1),e=Array.from,u="function"==typeof Symbol&&Symbol.iterator&&"function"==typeof e,o=function(){function n(n,t){this.variables={},this.parent=n,this.topLevel=!1,this.isolateWrites=t}var t=n.prototype;return t.set=function(n,t,r){var i=n.split("."),e=this.variables,u=this;if(r&&(u=this.resolve(i[0],!0)))u.set(n,t);else{for(var o=0;o<i.length-1;o++){var f=i[o];e[f]||(e[f]={}),e=e[f]}e[i[i.length-1]]=t}},t.get=function(n){var t=this.variables[n];return void 0!==t?t:null},t.lookup=function(n){var t=this.parent,r=this.variables[n];return void 0!==r?r:t&&t.lookup(n)},t.resolve=function(n,t){var r=t&&this.isolateWrites?void 0:this.parent;return void 0!==this.variables[n]?this:r&&r.resolve(n)},t.push=function(t){return new n(this,t)},t.pop=function(){return this.parent},n}();function f(n){return n&&Object.prototype.hasOwnProperty.call(n,"__keywords")}function c(n){var t=n.length;return 0===t?0:f(n[t-1])?t-1:t}function s(n){if("string"!=typeof n)return n;this.val=n,this.length=n.length}s.prototype=Object.create(String.prototype,{length:{writable:!0,configurable:!0,value:0}}),s.prototype.valueOf=function(){return this.val},s.prototype.toString=function(){return this.val},n.exports={Frame:o,makeMacro:function(n,t,r){var i=this;return function(){for(var e=arguments.length,u=Array(e),o=0;o<e;o++)u[o]=arguments[o];var s,a=c(u),h=function(n){var t=n.length;if(t){var r=n[t-1];if(f(r))return r}return{}}(u);if(a>n.length)s=u.slice(0,n.length),u.slice(s.length,a).forEach(function(n,r){r<t.length&&(h[t[r]]=n)}),s.push(h);else if(a<n.length){s=u.slice(0,a);for(var l=a;l<n.length;l++){var v=n[l];s.push(h[v]),delete h[v]}s.push(h)}else s=u;return r.apply(i,s)}},makeKeywordArgs:function(n){return n.__keywords=!0,n},numArgs:c,suppressValue:function(n,t){return n=void 0!==n&&null!==n?n:"",!t||n instanceof s||(n=i.escape(n.toString())),n},ensureDefined:function(n,t,r){if(null===n||void 0===n)throw new i.TemplateError("attempted to output null or undefined value",t+1,r+1);return n},memberLookup:function(n,t){if(void 0!==n&&null!==n)return"function"==typeof n[t]?function(){for(var r=arguments.length,i=Array(r),e=0;e<r;e++)i[e]=arguments[e];return n[t].apply(n,i)}:n[t]},contextOrFrameLookup:function(n,t,r){var i=t.lookup(r);return void 0!==i?i:n.lookup(r)},callWrap:function(n,t,r,i){if(!n)throw Error("Unable to call `"+t+"`, which is undefined or falsey");if("function"!=typeof n)throw Error("Unable to call `"+t+"`, which is not a function");return n.apply(r,i)},handleError:function(n,t,r){return n.lineno?n:new i.TemplateError(n,t,r)},isArray:i.isArray,keys:i.keys,SafeString:s,copySafeness:function(n,t){return n instanceof s?new s(t):t.toString()},markSafe:function(n){var t=typeof n;return"string"===t?new s(n):"function"!==t?n:function(t){var r=n.apply(this,arguments);return"string"==typeof r?new s(r):r}},asyncEach:function(n,t,r,e){if(i.isArray(n)){var u=n.length;i.asyncIter(n,function(n,i,e){switch(t){case 1:r(n,i,u,e);break;case 2:r(n[0],n[1],i,u,e);break;case 3:r(n[0],n[1],n[2],i,u,e);break;default:n.push(i,u,e),r.apply(this,n)}},e)}else i.asyncFor(n,function(n,t,i,e,u){r(n,t,i,e,u)},e)},asyncAll:function(n,t,r,e){var u,o,f=0;function c(n,t){f++,o[n]=t,f===u&&e(null,o.join(""))}if(i.isArray(n))if(u=n.length,o=Array(u),0===u)e(null,"");else for(var s=0;s<n.length;s++){var a=n[s];switch(t){case 1:r(a,s,u,c);break;case 2:r(a[0],a[1],s,u,c);break;case 3:r(a[0],a[1],a[2],s,u,c);break;default:a.push(s,u,c),r.apply(this,a)}}else{var h=i.keys(n||{});if(u=h.length,o=Array(u),0===u)e(null,"");else for(var l=0;l<h.length;l++){var v=h[l];r(v,n[v],l,u,c)}}},inOperator:i.inOperator,fromIterator:function(n){return"object"!=typeof n||null===n||i.isArray(n)?n:u&&Symbol.iterator in n?e(n):n}}},function(n,t,r){"use strict";var i=function(n){var t,r;function i(t){var r;return(r=n.call(this)||this).precompiled=t||{},r}return r=n,(t=i).prototype=Object.create(r.prototype),t.prototype.constructor=t,t.__proto__=r,i.prototype.getSource=function(n){return this.precompiled[n]?{src:{type:"code",obj:this.precompiled[n]},path:n}:null},i}(r(4));n.exports={PrecompiledLoader:i}},function(n,t,r){"use strict";var i=r(0),e=r(5);n.exports=function(n){var t,r;function e(){return n.apply(this,arguments)||this}r=n,(t=e).prototype=Object.create(r.prototype),t.prototype.constructor=t,t.__proto__=r;var u=e.prototype;return u.on=function(n,t){this.listeners=this.listeners||{},this.listeners[n]=this.listeners[n]||[],this.listeners[n].push(t)},u.emit=function(n){for(var t=arguments.length,r=Array(t>1?t-1:0),i=1;i<t;i++)r[i-1]=arguments[i];this.listeners&&this.listeners[n]&&this.listeners[n].forEach(function(n){n.apply(void 0,r)})},u.resolve=function(n,t){return i.resolve(i.dirname(n),t)},u.isRelative=function(n){return 0===n.indexOf("./")||0===n.indexOf("../")},e}(e)},function(n,t,r){"use strict";function i(n,t){for(var r=0;r<t.length;r++){var i=t[r];i.enumerable=i.enumerable||!1,i.configurable=!0,"value"in i&&(i.writable=!0),Object.defineProperty(n,i.key,i)}}function e(n,t,r){return t&&i(n.prototype,t),r&&i(n,r),n}var u=r(1);function o(n,t,r){r=r||{},u.keys(r).forEach(function(t){var i,e;r[t]=(i=n.prototype[t],e=r[t],"function"!=typeof i||"function"!=typeof e?e:function(){var n=this.parent;this.parent=i;var t=e.apply(this,arguments);return this.parent=n,t})});var i=function(n){var r,i;function u(){return n.apply(this,arguments)||this}return i=n,(r=u).prototype=Object.create(i.prototype),r.prototype.constructor=r,r.__proto__=i,e(u,[{key:"typename",get:function(){return t}}]),u}(n);return u.f(i.prototype,r),i}var f=function(){function n(){this.init.apply(this,arguments)}return n.prototype.init=function(){},n.extend=function(n,t){return"object"==typeof n&&(t=n,n="anonymous"),o(this,n,t)},e(n,[{key:"typename",get:function(){return this.constructor.name}}]),n}();n.exports=f},function(n,t,r){"use strict";var i,e=r(1),u=r(7),o=u.Environment,f=u.Template,c=r(4),s=r(3),a=r(0),h=r(0),l=r(0),v=r(0),d=r(2),p=r(0),y=r(16);function w(n,t){var r;return t=t||{},e.isObject(n)&&(t=n,n=null),s.FileSystemLoader?r=new s.FileSystemLoader(n,{watch:t.watch,noCache:t.noCache}):s.WebLoader&&(r=new s.WebLoader(n,{useCache:t.web&&t.web.useCache,async:t.web&&t.web.async})),i=new o(r,t),t&&t.express&&i.express(t.express),i}n.exports={Environment:o,Template:f,Loader:c,FileSystemLoader:s.FileSystemLoader,PrecompiledLoader:s.PrecompiledLoader,WebLoader:s.WebLoader,compiler:h,parser:l,lexer:v,runtime:d,lib:e,nodes:p,installJinjaCompat:y,configure:w,reset:function(){i=void 0},compile:function(n,t,r,e){return i||w(),new f(n,t,r,e)},render:function(n,t,r){return i||w(),i.render(n,t,r)},renderString:function(n,t,r){return i||w(),i.renderString(n,t,r)},precompile:a?a.precompile:void 0,precompileString:a?a.precompileString:void 0}},function(n,t,r){"use strict";function i(n,t){n.prototype=Object.create(t.prototype),n.prototype.constructor=n,n.__proto__=t}var e=r(8),u=r(11),o=r(1),f=r(0),c=r(12),s=r(3),a=s.FileSystemLoader,h=s.WebLoader,l=s.PrecompiledLoader,v=r(13),d=r(14),p=r(5),y=r(2),w=y.handleError,b=y.Frame,m=r(15);function g(n,t,r){e(function(){n(t,r)})}var j={type:"code",obj:{root:function(n,t,r,i,e){try{e(null,"")}catch(n){e(w(n,null,null))}}}},E=function(n){function t(){return n.apply(this,arguments)||this}i(t,n);var r=t.prototype;return r.init=function(n,t){var r=this;t=this.opts=t||{},this.opts.dev=!!t.dev,this.opts.autoescape=null==t.autoescape||t.autoescape,this.opts.throwOnUndefined=!!t.throwOnUndefined,this.opts.trimBlocks=!!t.trimBlocks,this.opts.lstripBlocks=!!t.lstripBlocks,this.loaders=[],n?this.loaders=o.isArray(n)?n:[n]:a?this.loaders=[new a("views")]:h&&(this.loaders=[new h("/views")]),"undefined"!=typeof window&&window.nunjucksPrecompiled&&this.loaders.unshift(new l(window.nunjucksPrecompiled)),this.initCache(),this.globals=d(),this.filters={},this.tests={},this.asyncFilters=[],this.extensions={},this.extensionsList=[],o.r(c).forEach(function(n){var t=n[0],i=n[1];return r.addFilter(t,i)}),o.r(v).forEach(function(n){var t=n[0],i=n[1];return r.addTest(t,i)})},r.initCache=function(){this.loaders.forEach(function(n){n.cache={},"function"==typeof n.on&&n.on("update",function(t){n.cache[t]=null})})},r.addExtension=function(n,t){return t.__name=n,this.extensions[n]=t,this.extensionsList.push(t),this},r.removeExtension=function(n){var t=this.getExtension(n);t&&(this.extensionsList=o.without(this.extensionsList,t),delete this.extensions[n])},r.getExtension=function(n){return this.extensions[n]},r.hasExtension=function(n){return!!this.extensions[n]},r.addGlobal=function(n,t){return this.globals[n]=t,this},r.getGlobal=function(n){if(void 0===this.globals[n])throw Error("global not found: "+n);return this.globals[n]},r.addFilter=function(n,t,r){var i=t;return r&&this.asyncFilters.push(n),this.filters[n]=i,this},r.getFilter=function(n){if(!this.filters[n])throw Error("filter not found: "+n);return this.filters[n]},r.addTest=function(n,t){return this.tests[n]=t,this},r.getTest=function(n){if(!this.tests[n])throw Error("test not found: "+n);return this.tests[n]},r.resolveTemplate=function(n,t,r){return!(!n.isRelative||!t)&&n.isRelative(r)&&n.resolve?n.resolve(t,r):r},r.getTemplate=function(n,t,r,i,e){var u,f=this,c=this,s=null;if(n&&n.raw&&(n=n.raw),o.isFunction(r)&&(e=r,r=null,t=t||!1),o.isFunction(t)&&(e=t,t=!1),n instanceof O)s=n;else{if("string"!=typeof n)throw Error("template names must be a string: "+n);for(var a=0;a<this.loaders.length;a++){var h=this.loaders[a];if(s=h.cache[this.resolveTemplate(h,r,n)])break}}if(s)return t&&s.compile(),e?void e(null,s):s;return o.asyncIter(this.loaders,function(t,i,e,u){function o(n,r){n?u(n):r?(r.loader=t,u(null,r)):e()}n=c.resolveTemplate(t,r,n),t.async?t.getSource(n,o):o(null,t.getSource(n))},function(r,o){if(o||r||i||(r=Error("template not found: "+n)),r){if(e)return void e(r);throw r}var c;o?(c=new O(o.src,f,o.path,t),o.noCache||(o.loader.cache[n]=c)):c=new O(j,f,"",t),e?e(null,c):u=c}),u},r.express=function(n){return m(this,n)},r.render=function(n,t,r){o.isFunction(t)&&(r=t,t=null);var i=null;return this.getTemplate(n,function(n,e){if(n&&r)g(r,n);else{if(n)throw n;i=e.render(t,r)}}),i},r.renderString=function(n,t,r,i){return o.isFunction(r)&&(i=r,r={}),new O(n,this,(r=r||{}).path).render(t,i)},r.waterfall=function(n,t,r){return u(n,t,r)},t}(p),k=function(n){function t(){return n.apply(this,arguments)||this}i(t,n);var r=t.prototype;return r.init=function(n,t,r){var i=this;this.env=r||new E,this.ctx=o.extend({},n),this.blocks={},this.exported=[],o.keys(t).forEach(function(n){i.addBlock(n,t[n])})},r.lookup=function(n){return n in this.env.globals&&!(n in this.ctx)?this.env.globals[n]:this.ctx[n]},r.setVariable=function(n,t){this.ctx[n]=t},r.getVariables=function(){return this.ctx},r.addBlock=function(n,t){return this.blocks[n]=this.blocks[n]||[],this.blocks[n].push(t),this},r.getBlock=function(n){if(!this.blocks[n])throw Error('unknown block "'+n+'"');return this.blocks[n][0]},r.getSuper=function(n,t,r,i,e,u){var f=o.indexOf(this.blocks[t]||[],r),c=this.blocks[t][f+1];if(-1===f||!c)throw Error('no super block available for "'+t+'"');c(n,this,i,e,u)},r.addExport=function(n){this.exported.push(n)},r.getExported=function(){var n=this,t={};return this.exported.forEach(function(r){t[r]=n.ctx[r]}),t},t}(p),O=function(n){function t(){return n.apply(this,arguments)||this}i(t,n);var r=t.prototype;return r.init=function(n,t,r,i){if(this.env=t||new E,o.isObject(n))switch(n.type){case"code":this.tmplProps=n.obj;break;case"string":this.tmplStr=n.obj;break;default:throw Error("Unexpected template object type "+n.type+"; expected 'code', or 'string'")}else{if(!o.isString(n))throw Error("src must be a string or an object describing the source");this.tmplStr=n}if(this.path=r,i)try{this.a()}catch(n){throw o.t(this.path,this.env.opts.dev,n)}else this.compiled=!1},r.render=function(n,t,r){var i=this;"function"==typeof n?(r=n,n={}):"function"==typeof t&&(r=t,t=null);var e=!t;try{this.compile()}catch(n){var u=o.t(this.path,this.env.opts.dev,n);if(r)return g(r,u);throw u}var f=new k(n||{},this.blocks,this.env),c=t?t.push(!0):new b;c.topLevel=!0;var s=null,a=!1;return this.rootRenderFunc(this.env,f,c,y,function(n,t){if(!a)if(n&&(n=o.t(i.path,i.env.opts.dev,n),a=!0),r)e?g(r,n,t):r(n,t);else{if(n)throw n;s=t}}),s},r.getExported=function(n,t,r){"function"==typeof n&&(r=n,n={}),"function"==typeof t&&(r=t,t=null);try{this.compile()}catch(n){if(r)return r(n);throw n}var i=t?t.push():new b;i.topLevel=!0;var e=new k(n||{},this.blocks,this.env);this.rootRenderFunc(this.env,e,i,y,function(n){n?r(n,null):r(null,e.getExported())})},r.compile=function(){this.compiled||this.a()},r.a=function(){var n;if(this.tmplProps)n=this.tmplProps;else{var t=f.compile(this.tmplStr,this.env.asyncFilters,this.env.extensionsList,this.path,this.env.opts);n=Function(t)()}this.blocks=this.h(n),this.rootRenderFunc=n.root,this.compiled=!0},r.h=function(n){var t={};return o.keys(n).forEach(function(r){"b_"===r.slice(0,2)&&(t[r.slice(2)]=n[r])}),t},t}(p);n.exports={Environment:E,Template:O}},function(n,t,r){"use strict";var i=r(9),e=[],u=[],o=i.makeRequestCallFromTimer(function(){if(u.length)throw u.shift()});function f(n){var t;(t=e.length?e.pop():new c).task=n,i(t)}function c(){this.task=null}n.exports=f,c.prototype.call=function(){try{this.task.call()}catch(n){f.onerror?f.onerror(n):(u.push(n),o())}finally{this.task=null,e[e.length]=this}}},function(n,t,r){"use strict";!function(t){function r(n){e.length||(i(),!0),e[e.length]=n}n.exports=r;var i,e=[],u=0,o=1024;function f(){for(;u<e.length;){var n=u;if(u+=1,e[n].call(),u>o){for(var t=0,r=e.length-u;t<r;t++)e[t]=e[t+u];e.length-=u,u=0}}e.length=0,u=0,!1}var c,s,a,h=void 0!==t?t:self,l=h.MutationObserver||h.WebKitMutationObserver;function v(n){return function(){var t=setTimeout(i,0),r=setInterval(i,50);function i(){clearTimeout(t),clearInterval(r),n()}}}"function"==typeof l?(c=1,s=new l(f),a=document.createTextNode(""),s.observe(a,{characterData:!0}),i=function(){c=-c,a.data=c}):i=v(f),r.requestFlush=i,r.makeRequestCallFromTimer=v}(r(10))},function(n,t){var r;r=function(){return this}();try{r=r||Function("return this")()||(0,eval)("this")}catch(n){"object"==typeof window&&(r=window)}n.exports=r},function(n,t,r){var i;!function(r){"use strict";var e=function(){var n=Array.prototype.slice.call(arguments);"function"==typeof n[0]&&n[0].apply(null,n.splice(1))},u=function(n){"function"==typeof setImmediate?setImmediate(n):"undefined"!=typeof process&&process.nextTick?process.nextTick(n):setTimeout(n,0)},o=Array.isArray||function(n){return"[object Array]"===Object.prototype.toString.call(n)},f=function(n,t,r){var i=r?u:e;if(t=t||function(){},!o(n))return t(Error("First argument to waterfall must be an array of functions"));if(!n.length)return t();var f=function(n){return function(r){if(r)t.apply(null,arguments),t=function(){};else{var e=Array.prototype.slice.call(arguments,1),u=n.next();u?e.push(f(u)):e.push(t),i(function(){n.apply(null,e)})}}};f(function(n){var t=function(r){var i=function(){return n.length&&n[r].apply(null,arguments),i.next()};return i.next=function(){return r<n.length-1?t(r+1):null},i};return t(0)}(n))()};void 0===(i=function(){return f}.apply(t,[]))||(n.exports=i)}()},function(n,t,r){"use strict";var i=r(1),e=r(2),u=n.exports={};function o(n,t){return null===n||void 0===n||!1===n?t:n}function f(n){return n!=n}function c(n){var t=(n=o(n,"")).toLowerCase();return e.copySafeness(n,t.charAt(0).toUpperCase()+t.slice(1))}function s(n){if(i.isString(n))return n.split("");if(i.isObject(n))return i.r(n||{}).map(function(n){return{key:n[0],value:n[1]}});if(i.isArray(n))return n;throw new i.TemplateError("list filter: type not iterable")}function a(n){return e.copySafeness(n,n.replace(/^\s*|\s*$/g,""))}u.abs=Math.abs,u.batch=function(n,t,r){var i,e=[],u=[];for(i=0;i<n.length;i++)i%t==0&&u.length&&(e.push(u),u=[]),u.push(n[i]);if(u.length){if(r)for(i=u.length;i<t;i++)u.push(r);e.push(u)}return e},u.capitalize=c,u.center=function(n,t){if(n=o(n,""),t=t||80,n.length>=t)return n;var r=t-n.length,u=i.repeat(" ",r/2-r%2),f=i.repeat(" ",r/2);return e.copySafeness(n,u+n+f)},u.default=function(n,t,r){return r?n||t:void 0!==n?n:t},u.dictsort=function(n,t,r){if(!i.isObject(n))throw new i.TemplateError("dictsort filter: val must be an object");var e,u=[];for(var o in n)u.push([o,n[o]]);if(void 0===r||"key"===r)e=0;else{if("value"!==r)throw new i.TemplateError("dictsort filter: You can only sort by either key or value");e=1}return u.sort(function(n,r){var u=n[e],o=r[e];return t||(i.isString(u)&&(u=u.toUpperCase()),i.isString(o)&&(o=o.toUpperCase())),u>o?1:u===o?0:-1}),u},u.dump=function(n,t){return JSON.stringify(n,null,t)},u.escape=function(n){return n instanceof e.SafeString?n:(n=null===n||void 0===n?"":n,e.markSafe(i.escape(n.toString())))},u.safe=function(n){return n instanceof e.SafeString?n:(n=null===n||void 0===n?"":n,e.markSafe(n.toString()))},u.first=function(n){return n[0]},u.forceescape=function(n){return n=null===n||void 0===n?"":n,e.markSafe(i.escape(n.toString()))},u.groupby=function(n,t){return i.groupBy(n,t)},u.indent=function(n,t,r){if(""===(n=o(n,"")))return"";t=t||4;var u=n.split("\n"),f=i.repeat(" ",t),c=u.map(function(n,t){return 0!==t||r?""+f+n+"\n":n+"\n"}).join("");return e.copySafeness(n,c)},u.join=function(n,t,r){return t=t||"",r&&(n=i.map(n,function(n){return n[r]})),n.join(t)},u.last=function(n){return n[n.length-1]},u.length=function(n){var t=o(n,"");return void 0!==t?"function"==typeof Map&&t instanceof Map||"function"==typeof Set&&t instanceof Set?t.size:!i.isObject(t)||t instanceof e.SafeString?t.length:i.keys(t).length:0},u.list=s,u.lower=function(n){return(n=o(n,"")).toLowerCase()},u.nl2br=function(n){return null===n||void 0===n?"":e.copySafeness(n,n.replace(/\r\n|\n/g,"<br />\n"))},u.random=function(n){return n[Math.floor(Math.random()*n.length)]},u.rejectattr=function(n,t){return n.filter(function(n){return!n[t]})},u.selectattr=function(n,t){return n.filter(function(n){return!!n[t]})},u.replace=function(n,t,r,i){var u=n;if(t instanceof RegExp)return n.replace(t,r);void 0===i&&(i=-1);var o="";if("number"==typeof t)t=""+t;else if("string"!=typeof t)return n;if("number"==typeof n&&(n=""+n),"string"!=typeof n&&!(n instanceof e.SafeString))return n;if(""===t)return o=r+n.split("").join(r)+r,e.copySafeness(n,o);var f=n.indexOf(t);if(0===i||-1===f)return n;for(var c=0,s=0;f>-1&&(-1===i||s<i);)o+=n.substring(c,f)+r,c=f+t.length,s++,f=n.indexOf(t,c);return c<n.length&&(o+=n.substring(c)),e.copySafeness(u,o)},u.reverse=function(n){var t;return(t=i.isString(n)?s(n):i.map(n,function(n){return n})).reverse(),i.isString(n)?e.copySafeness(n,t.join("")):t},u.round=function(n,t,r){var i=Math.pow(10,t=t||0);return("ceil"===r?Math.ceil:"floor"===r?Math.floor:Math.round)(n*i)/i},u.slice=function(n,t,r){for(var i=Math.floor(n.length/t),e=n.length%t,u=[],o=0,f=0;f<t;f++){var c=o+f*i;f<e&&o++;var s=o+(f+1)*i,a=n.slice(c,s);r&&f>=e&&a.push(r),u.push(a)}return u},u.sum=function(n,t,r){return void 0===r&&(r=0),t&&(n=i.map(n,function(n){return n[t]})),r+n.reduce(function(n,t){return n+t},0)},u.sort=e.makeMacro(["value","reverse","case_sensitive","attribute"],[],function(n,t,r,e){var u=i.map(n,function(n){return n});return u.sort(function(n,u){var o=e?n[e]:n,f=e?u[e]:u;return!r&&i.isString(o)&&i.isString(f)&&(o=o.toLowerCase(),f=f.toLowerCase()),o<f?t?1:-1:o>f?t?-1:1:0}),u}),u.string=function(n){return e.copySafeness(n,n)},u.striptags=function(n,t){var r=a((n=o(n,"")).replace(/<\/?([a-z][a-z0-9]*)\b[^>]*>|<!--[\s\S]*?-->/gi,"")),i="";return i=t?r.replace(/^ +| +$/gm,"").replace(/ +/g," ").replace(/(\r\n)/g,"\n").replace(/\n\n\n+/g,"\n\n"):r.replace(/\s+/gi," "),e.copySafeness(n,i)},u.title=function(n){var t=(n=o(n,"")).split(" ").map(function(n){return c(n)});return e.copySafeness(n,t.join(" "))},u.trim=a,u.truncate=function(n,t,r,i){var u=n;if(n=o(n,""),t=t||255,n.length<=t)return n;if(r)n=n.substring(0,t);else{var f=n.lastIndexOf(" ",t);-1===f&&(f=t),n=n.substring(0,f)}return n+=void 0!==i&&null!==i?i:"...",e.copySafeness(u,n)},u.upper=function(n){return(n=o(n,"")).toUpperCase()},u.urlencode=function(n){var t=encodeURIComponent;return i.isString(n)?t(n):(i.isArray(n)?n:i.r(n)).map(function(n){var r=n[0],i=n[1];return t(r)+"="+t(i)}).join("&")};var h=/^(?:\(|<|&lt;)?(.*?)(?:\.|,|\)|\n|&gt;)?$/,l=/^[\w.!#$%&'*+\-\/=?\^`{|}~]+@[a-z\d\-]+(\.[a-z\d\-]+)+$/i,v=/^https?:\/\/.*$/,d=/^www\./,p=/\.(?:org|net|com)(?:\:|\/|$)/;u.urlize=function(n,t,r){f(t)&&(t=1/0);var i=!0===r?' rel="nofollow"':"";return n.split(/(\s+)/).filter(function(n){return n&&n.length}).map(function(n){var r=n.match(h),e=r?r[1]:n,u=e.substr(0,t);return v.test(e)?'<a href="'+e+'"'+i+">"+u+"</a>":d.test(e)?'<a href="http://'+e+'"'+i+">"+u+"</a>":l.test(e)?'<a href="mailto:'+e+'">'+e+"</a>":p.test(e)?'<a href="http://'+e+'"'+i+">"+u+"</a>":n}).join("")},u.wordcount=function(n){var t=(n=o(n,""))?n.match(/\w+/g):null;return t?t.length:null},u.float=function(n,t){var r=parseFloat(n);return f(r)?t:r},u.int=function(n,t){var r=parseInt(n,10);return f(r)?t:r},u.d=u.default,u.e=u.escape},function(n,t,r){"use strict";var i=r(2).SafeString;t.callable=function(n){return"function"==typeof n},t.defined=function(n){return void 0!==n},t.divisibleby=function(n,t){return n%t==0},t.escaped=function(n){return n instanceof i},t.equalto=function(n,t){return n===t},t.eq=t.equalto,t.sameas=t.equalto,t.even=function(n){return n%2==0},t.falsy=function(n){return!n},t.ge=function(n,t){return n>=t},t.greaterthan=function(n,t){return n>t},t.gt=t.greaterthan,t.le=function(n,t){return n<=t},t.lessthan=function(n,t){return n<t},t.lt=t.lessthan,t.lower=function(n){return n.toLowerCase()===n},t.ne=function(n,t){return n!==t},t.null=function(n){return null===n},t.number=function(n){return"number"==typeof n},t.odd=function(n){return n%2==1},t.string=function(n){return"string"==typeof n},t.truthy=function(n){return!!n},t.undefined=function(n){return void 0===n},t.upper=function(n){return n.toUpperCase()===n},t.iterable=function(n){return"undefined"!=typeof Symbol?!!n[Symbol.iterator]:Array.isArray(n)||"string"==typeof n},t.mapping=function(n){var t=null!==n&&void 0!==n&&"object"==typeof n&&!Array.isArray(n);return Set?t&&!(n instanceof Set):t}},function(n,t,r){"use strict";n.exports=function(){return{range:function(n,t,r){void 0===t?(t=n,n=0,r=1):r||(r=1);var i=[];if(r>0)for(var e=n;e<t;e+=r)i.push(e);else for(var u=n;u>t;u+=r)i.push(u);return i},cycler:function(){return n=Array.prototype.slice.call(arguments),t=-1,{current:null,reset:function(){t=-1,this.current=null},next:function(){return++t>=n.length&&(t=0),this.current=n[t],this.current}};var n,t},joiner:function(n){return function(n){n=n||",";var t=!0;return function(){var r=t?"":n;return t=!1,r}}(n)}}}},function(n,t,r){"use strict";var i=r(0);n.exports=function(n,t){function r(n,t){if(this.name=n,this.path=n,this.defaultEngine=t.defaultEngine,this.ext=i.extname(n),!this.ext&&!this.defaultEngine)throw Error("No default engine was specified and no extension was provided.");this.ext||(this.name+=this.ext=("."!==this.defaultEngine[0]?".":"")+this.defaultEngine)}return r.prototype.render=function(t,r){n.render(this.name,t,r)},t.set("view",r),t.set("nunjucksEnv",n),n}},function(n,t,r){"use strict";n.exports=function(){var n,t,r=this.runtime,i=this.lib,e=this.compiler.Compiler,u=this.parser.Parser,o=(this.nodes,this.lexer,r.contextOrFrameLookup),f=r.memberLookup;function c(n,t){return Object.prototype.hasOwnProperty.call(n,t)}e&&(n=e.prototype.assertType),u&&(t=u.prototype.parseAggregate),r.contextOrFrameLookup=function(n,t,r){var i=o.apply(this,arguments);if(void 0!==i)return i;switch(r){case"True":return!0;case"False":return!1;case"None":return null;default:return}};var s={pop:function(n){if(void 0===n)return this.pop();if(n>=this.length||n<0)throw Error("KeyError");return this.splice(n,1)},append:function(n){return this.push(n)},remove:function(n){for(var t=0;t<this.length;t++)if(this[t]===n)return this.splice(t,1);throw Error("ValueError")},count:function(n){for(var t=0,r=0;r<this.length;r++)this[r]===n&&t++;return t},index:function(n){var t;if(-1===(t=this.indexOf(n)))throw Error("ValueError");return t},find:function(n){return this.indexOf(n)},insert:function(n,t){return this.splice(n,0,t)}},a={items:function(){return i.r(this)},values:function(){return i.u(this)},keys:function(){return i.keys(this)},get:function(n,t){var r=this[n];return void 0===r&&(r=t),r},has_key:function(n){return c(this,n)},pop:function(n,t){var r=this[n];if(void 0===r&&void 0!==t)r=t;else{if(void 0===r)throw Error("KeyError");delete this[n]}return r},popitem:function(){var n=i.keys(this);if(!n.length)throw Error("KeyError");var t=n[0],r=this[t];return delete this[t],[t,r]},setdefault:function(n,t){return void 0===t&&(t=null),n in this||(this[n]=t),this[n]},update:function(n){return i.f(this,n),null}};return a.iteritems=a.items,a.itervalues=a.values,a.iterkeys=a.keys,r.memberLookup=function(n,t,e){return 4===arguments.length?function(n,t,i,e){n=n||[],null===t&&(t=e<0?n.length-1:0),null===i?i=e<0?-1:n.length:i<0&&(i+=n.length),t<0&&(t+=n.length);for(var u=[],o=t;!(o<0||o>n.length||e>0&&o>=i||e<0&&o<=i);o+=e)u.push(r.memberLookup(n,o));return u}.apply(this,arguments):(n=n||{},i.isArray(n)&&c(s,t)?s[t].bind(n):i.isObject(n)&&c(a,t)?a[t].bind(n):f.apply(this,arguments))},function(){r.contextOrFrameLookup=o,r.memberLookup=f,e&&(e.prototype.assertType=n),u&&(u.prototype.parseAggregate=t)}}}])});
//# sourceMappingURL=nunjucks-slim.min.js.map
(function() {(window.nunjucksPrecompiled = window.nunjucksPrecompiled || {})["uoe-cookies-banner.njk"] = (function() {
function root(env, context, frame, runtime, cb) {
var lineno = null;
var colno = null;
var output = "";
try {
var parentTemplate = null;
output += "<div class=\"cookie-container\">\r\n  <div class=\"cookie-row\">\r\n    <div class=\"cookie-col-single\">\r\n      <h3 class=\"cookie-heading\">";
output += runtime.suppressValue(runtime.contextOrFrameLookup(context, frame, "heading"), env.opts.autoescape);
output += "</h3>\r\n    </div>\r\n    <div class=\"cookie-col-double\">\r\n      <p>";
output += runtime.suppressValue(runtime.contextOrFrameLookup(context, frame, "text"), env.opts.autoescape);
output += "</p>\r\n    </div>\r\n    <div class=\"cookie-col-single\">\r\n      <ul class=\"cookie-actions\">\r\n        <li><button type=\"button\" class=\"cookie-btn cookie-btn-primary cookie-btn-save\">Continue</button></li>\r\n        <li><button type=\"button\" class=\"cookie-btn cookie-btn-primary cookie-btn-change\">Change settings</button></li>\r\n        <li><a href=\"";
output += runtime.suppressValue(env.getFilter("safe").call(context, runtime.contextOrFrameLookup(context, frame, "link")), env.opts.autoescape);
output += "\" class=\"cookie-btn cookie-btn-secondary\">Find out more</a></li>\r\n      </ul>\r\n    </div>\r\n  </div>\r\n</div>\r\n";
if(parentTemplate) {
parentTemplate.rootRenderFunc(env, context, frame, runtime, cb);
} else {
cb(null, output);
}
;
} catch (e) {
  cb(runtime.handleError(e, lineno, colno));
}
}
return {
root: root
};

})();
})();
(function() {(window.nunjucksPrecompiled = window.nunjucksPrecompiled || {})["uoe-cookies-lid.njk"] = (function() {
function root(env, context, frame, runtime, cb) {
var lineno = null;
var colno = null;
var output = "";
try {
var parentTemplate = null;
output += "<button type=\"button\" class=\"cookie-btn cookie-btn-secondary cookie-btn-sm cookie-btn-change\">Change cookie settings</button>\r\n";
if(parentTemplate) {
parentTemplate.rootRenderFunc(env, context, frame, runtime, cb);
} else {
cb(null, output);
}
;
} catch (e) {
  cb(runtime.handleError(e, lineno, colno));
}
}
return {
root: root
};

})();
})();
(function() {(window.nunjucksPrecompiled = window.nunjucksPrecompiled || {})["uoe-cookies-overlay.njk"] = (function() {
function root(env, context, frame, runtime, cb) {
var lineno = null;
var colno = null;
var output = "";
try {
var parentTemplate = null;
output += "<div class=\"cookie-overlay embed-responsive-item\">\r\n    <div class=\"cookie-container\">\r\n        <div class=\"cookie-row\">\r\n            <div class=\"cookie-col-single\">\r\n                <h3 class=\"cookie-heading\">Privacy statement</h3>\r\n                <p>This content is delivered by partner companies we work with.</p>\r\n                <p>Viewing this content will result in cookies being set on your device and may result in some\r\n                    information about your visit being saved. By accepting this you agree for this information\r\n                    to be shared with these non-University companies.</p>\r\n                <button type=\"button\" class=\"cookie-btn cookie-btn-primary cookie-btn-overlay\">Accept and view</button>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n";
if(parentTemplate) {
parentTemplate.rootRenderFunc(env, context, frame, runtime, cb);
} else {
cb(null, output);
}
;
} catch (e) {
  cb(runtime.handleError(e, lineno, colno));
}
}
return {
root: root
};

})();
})();
(function() {(window.nunjucksPrecompiled = window.nunjucksPrecompiled || {})["uoe-cookies-preferences.njk"] = (function() {
function root(env, context, frame, runtime, cb) {
var lineno = null;
var colno = null;
var output = "";
try {
var parentTemplate = null;
output += "<div class=\"cookie-container\">\r\n  <div class=\"cookie-row\">\r\n    <div class=\"cookie-col-single\">\r\n      <h3 class=\"cookie-heading\">";
output += runtime.suppressValue(runtime.contextOrFrameLookup(context, frame, "heading"), env.opts.autoescape);
output += "</h3>\r\n    </div>\r\n    <div id=\"cookiePrefs\" class=\"cookie-col-double\">\r\n      ";
frame = frame.push();
var t_3 = runtime.contextOrFrameLookup(context, frame, "settings");
if(t_3) {t_3 = runtime.fromIterator(t_3);
var t_2 = t_3.length;
for(var t_1=0; t_1 < t_3.length; t_1++) {
var t_4 = t_3[t_1];
frame.set("setting", t_4);
frame.set("loop.index", t_1 + 1);
frame.set("loop.index0", t_1);
frame.set("loop.revindex", t_2 - t_1);
frame.set("loop.revindex0", t_2 - t_1 - 1);
frame.set("loop.first", t_1 === 0);
frame.set("loop.last", t_1 === t_2 - 1);
frame.set("loop.length", t_2);
output += "<div class=\"checkbox checkbox-cookie-setting\">\r\n          <input type=\"checkbox\" id=\"uoe-cookie-setting-";
output += runtime.suppressValue(runtime.memberLookup((runtime.contextOrFrameLookup(context, frame, "loop")),"index"), env.opts.autoescape);
output += "\" name=\"";
output += runtime.suppressValue(runtime.memberLookup((t_4),"name"), env.opts.autoescape);
output += "\" value=\"true\"";
if(runtime.memberLookup((t_4),"disabled")) {
output += " disabled ";
;
}
if(runtime.memberLookup((t_4),"checked")) {
output += " checked ";
;
}
output += " />\r\n          <label for=\"uoe-cookie-setting-";
output += runtime.suppressValue(runtime.memberLookup((runtime.contextOrFrameLookup(context, frame, "loop")),"index"), env.opts.autoescape);
output += "\">";
output += runtime.suppressValue(runtime.memberLookup((t_4),"label"), env.opts.autoescape);
output += "\r\n            <a class=\"cookie-link\" href=\"";
output += runtime.suppressValue(env.getFilter("safe").call(context, runtime.memberLookup((t_4),"link")), env.opts.autoescape);
output += "\">Learn more about ";
output += runtime.suppressValue(runtime.memberLookup((t_4),"name"), env.opts.autoescape);
output += " cookies.</a></label>\r\n        </div>";
;
}
}
frame = frame.pop();
output += "\r\n    </div>\r\n    <div class=\"cookie-col-single\">\r\n      <ul class=\"cookie-actions\">\r\n        <li><button type=\"button\" class=\"cookie-btn cookie-btn-primary cookie-btn-save\">Save settings</button></li>\r\n        <li><button type=\"button\" class=\"cookie-btn cookie-btn-primary cookie-btn-cancel\">Cancel</button></li>\r\n        <li><a href=\"https://www.ed.ac.uk/about/website/privacy\" class=\"cookie-btn cookie-btn-secondary\">Find out more</a></li>\r\n      </ul>\r\n    </div>\r\n  </div>\r\n</div>\r\n";
if(parentTemplate) {
parentTemplate.rootRenderFunc(env, context, frame, runtime, cb);
} else {
cb(null, output);
}
;
} catch (e) {
  cb(runtime.handleError(e, lineno, colno));
}
}
return {
root: root
};

})();
})();

if (typeof jQuery === 'undefined') {
  throw new Error('EdGEL\'s JavaScript requires jQuery')
}

var EdGel = EdGel || {};

(function (global, $) {
  'use strict';

  global.EdGel.cookieSettings = global.EdGel.cookieSettings || (function () {
    var loaded = false;
    var permissions = {
        necessary: {
          name: 'necessary',
          disabled: true,
          checked: true,
          label: 'These cookies are essential in order to enable you to ' +
            'move around the website and so cannot be disabled.',
          link: 'https://www.ed.ac.uk/about/website/privacy/necessary-cookies'
        },
        performance: {
          name: 'performance',
          disabled: false,
          checked: true,
          label: 'Allow performance cookies for analytics tools that help ' +
            'us improve the experience of using our site.',
          link: 'https://www.ed.ac.uk/about/website/privacy/performance-cookies'
        },
        advertising: {
          name: 'advertising',
          disabled: false,
          checked: true,
          label: 'Allow us to personalise ads, such as providing reminders ' +
            'of Open Days, by sharing information about your site use with ' +
            'partners we work with.',
          link: 'https://www.ed.ac.uk/about/website/privacy/advertising-cookies'
        }
      };
    var _values = {};
    var subscribers = [];
    var bootstrapped = false;

    function getValues() {
      var values = {}

      for (var pref in permissions) {
        if (permissions[pref].disabled) {
          values[pref] = permissions[pref].checked
        }
        else if (_values.hasOwnProperty(pref)) {
          values[pref] = _values[pref]
        }
        else {
          values[pref] = permissions[pref].checked
        }
      }

      return values
    }

    function reset() {
      loaded = false;
      _values = {}
    }

    function load() {
      reset();

      var stored = readPrefs();

      _values = stored;
      loaded = true;

      // If we are missing any immutable (disabled checkbox) values, we
      // don't have a valid load.
      for (var perm in permissions) {
        if (permissions[perm].disabled && !stored.hasOwnProperty(perm)) {
          loaded = false;
        }
      }
    }

    function readPrefs() {
      var decodedCookie = decodeURIComponent(document.cookie);
      var allCookies = decodedCookie.split(';');
      var json = '';
      for (var i = 0; i < allCookies.length; i++) {
        var curr = allCookies[i].trim();

        if (curr.indexOf('_uoeCookiePrefs=') == 0) {
          json = curr.substring('_uoeCookiePrefs='.length, curr.length);
        }
      }

      var parsed = {};
      var requiresUpdate = false;
      if (json) {
        try {
          // If we have raw JSON string encode this since the value can cause
          // problems with other systems: I180531-0649
          if (json.indexOf('{') == 0) {
            requiresUpdate = true;
          }
          else {
            json = global.atob(json);
          }
          parsed = JSON.parse(json);
        }
        catch (e) {
          parsed = {};
        }
      }

      if (requiresUpdate) {
        writeCookie(parsed);
      }

      return parsed;
    }

    function savePrefs() {
      // Iterate over all checkboxes in #cookiePrefs.
      $('#cookiePrefs input[type="checkbox"]').each(function () {
        _values[$(this).attr('name')] = $(this).is(':checked')
      });

      // Don't lose any values from custom permissions on external sites.
      var storePrefs = readPrefs();
      var values = getValues();

      // Update preferences for this site.
      for (var pref in values) {
        storePrefs[pref] = values[pref]
      }

      writeCookie(storePrefs);
    }

    function writeCookie(cValue) {
      cValue = JSON.stringify(cValue);
      cValue = global.btoa(cValue);

      var d = new Date();
      d.setTime(d.getTime() + (365 * 24 * 60 * 60 * 1000));
      var expires = 'expires=' + d.toUTCString();

      // Set cDomain to ".docker.local" for local development.
      var cDomain = '.ed.ac.uk';
      document.cookie = '_uoeCookiePrefs=' + cValue + ';' + expires + ';domain=' + cDomain + ';path=/';

      // Notify subscribers that a change has happened.
      for (var i = 0; i < subscribers.length; i++) {
        subscribers[i]()
      }
    }

    function editPrefs() {
      var preferences = permissions;
      var values = getValues();
      var cookiePrefsOptionsView = [];

      for (var pref in preferences) {
        if (values.hasOwnProperty(pref)) {
          preferences[pref].checked = values[pref]
        }
        cookiePrefsOptionsView.push(preferences[pref])
      }

      var cookiePrefsFormView = {
        settings: cookiePrefsOptionsView,
        heading: 'Change my cookie settings for the University of Edinburgh website'
      };

      $('#cookie-jar').html(nunjucks.render('uoe-cookies-preferences.njk', cookiePrefsFormView));
      $('#cookie-jar').slideDown('slow');
      $('html, body').animate({ scrollTop: 0 }, 400);
      $('#cookie-lid').hide('slow');
    }

    return {
      allowed: function (permission) {
        var prefs = getValues();
        return prefs[permission];
      },

      bannerRequired: function () {
        return !(this.hasSavedSettings());
      },

      hasSavedSettings: function () {
        return loaded;
      },

      cookieInfoView: {
        link: 'https://www.ed.ac.uk/about/website/privacy',
        heading: 'Cookies on the University of Edinburgh website',
        text: 'We use cookies to ensure that we give you the best ' +
          'experience on our website. If you continue without changing ' +
          'your settings, we\'ll assume that you are happy to receive all ' +
          'cookies on the University of Edinburgh website. However, you can ' +
          'change your settings at any time.'
      },

      bootstrap: function () {
        if (!bootstrapped) {
          load();

          // Attach callbacks to banner buttons.
          var _this = this;
          $('html').on('click', 'button.cookie-btn-save', function () {
            savePrefs();
            // Re-open the banner; it will close to the lid if preference
            // values are complete.
            _this.openBanner(true);
            return false;
          });
          $('html').on('click', 'button.cookie-btn-change', function () {
            editPrefs();
            return false;
          });
          $('html').on('click', 'button.cookie-btn-cancel', function () {
            // Re-open the banner; it will close to the lid if preference
            // values are complete.
            _this.openBanner(true);
            return false;
          });
          bootstrapped = true;
        }
      },

      openBanner: function (animate) {
        // Reload preferences from _uoeCookiePrefs cookie, if present.
        load();

        if (this.bannerRequired()) {
          $('#cookie-jar').html(nunjucks.render('uoe-cookies-banner.njk', this.cookieInfoView));
          if (animate) {
            $('#cookie-jar').slideDown('slow');
            $('#cookie-lid').hide('slow');
          }
          else {
            $('#cookie-jar').show(0);
            $('#cookie-lid').hide(0);
          }
        }
        else {
          // Show the floating button that allows access to change settings.
          $('#cookie-lid').html(nunjucks.render('uoe-cookies-lid.njk', this.cookieInfoView));
          if (animate) {
            $('#cookie-lid').show('slow');
            $('#cookie-jar').slideUp('slow');
          }
          else {
            $('#cookie-lid').show(0);
            $('#cookie-jar').hide(0);
          }
        }
      },

      // Add a subscriber function to be called whenever settings are changed
      // or successfully loaded.
      subscribe: function (fn) {
        subscribers.push(fn);

        // Do an initial call to the subscriber function so it can initialise.
        fn()
      },

      // Allow extra departmental permissions to be added to the banner.
      addPermission: function (perm) {
        // Validate permission object.
        var stringProps = ['name', 'label', 'link']
        var booleanProps = ['checked', 'disabled']
        var allProps = stringProps.concat(booleanProps)

        for (var i = 0; i < stringProps.length; i++) {
          if (!perm.hasOwnProperty(stringProps[i])
              || typeof perm[stringProps[i]] !== 'string'
              || !perm[stringProps[i]]) {
            throw 'The permission object must have a non-empty string ' +
              'value for the ' + stringProps[i] + ' property.'
          }
        }
        for (i = 0; i < booleanProps.length; i++) {
          if (!perm.hasOwnProperty(booleanProps[i])
              || typeof perm[booleanProps[i]] !== 'boolean') {
            throw 'The permission object must have a boolean value for the ' +
              booleanProps[i] + ' property.'
          }
        }
        // Check for extra properties.  Since we're storing this, we don't
        // want extra unnecessary data.
        for (var prop in perm) {
          if (allProps.indexOf(prop) === -1) {
            throw 'Unknown property ' + prop + ' in permission object.'
          }
        }

        // If the permission already exists don't allow it to be changed.
        if (permissions.hasOwnProperty(perm.name)) {
          throw 'The permission ' + perm.name + ' has already been defined.'
        }

        // Permission has been validated, so add it to cookiePrefs.
        permissions[perm.name] = perm;
      }
    }
  })();

  // Preload cookie settings ready for subscribers.
  global.EdGel.cookieSettings.bootstrap();

  $(function () {
    // Add a div for the main banner for cookie settings.
    var $cookieJar = $('<div id="cookie-jar" class="cookie-jar" />');
    $cookieJar.prependTo($('body')).hide(0);

    // Add a div for the small panel to allow changing cookie options.
    var $cookieLid = $('<div id="cookie-lid" class="cookie-lid" />');
    $cookieLid.appendTo($('body')).hide(0);

    EdGel.cookieSettings.openBanner(false);
  });

})(this, jQuery);

(function ($) {
  'use strict';

  $(function () {

    $('iframe[data-uoe-cookie-src]').each(function () {
      var $this = $(this)
      var $cookieOverlay = $(nunjucks.render('uoe-cookies-overlay.njk'))

      $cookieOverlay.height($this.height())
      $cookieOverlay.width($this.width())
      $this.hide(0)
      $this.before($cookieOverlay)
    })

    $('button.cookie-btn-overlay').on('click', function () {
      var $overlay = $(this).closest('.cookie-overlay')
      var $iframe = $overlay.next('iframe')

      $iframe.attr('src', $iframe.attr('data-uoe-cookie-src'))
      $overlay.hide(0)
      $iframe.show(0)
    })

  });

})(jQuery);

