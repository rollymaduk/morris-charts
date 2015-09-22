/**
 * Created by rolly_000 on 8/3/2015.
 */
/* Copyright (c) 2014 Paulo Sérgio Borges de Oliveira Filho
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

Package.describe({
    name:     'rollypolly:morris-charts',
    summary:  'reactive morris charts for meteor',
    version:  '1.0.0',
    git:      'https://github.com/rollymaduk/morris-charts.git'
});

Package.onUse(function (api) {
    api.use(['jquery','coffeescript','reactive-var','templating'],'client');
    api.addFiles(['lib.coffee', 'chart.html'], 'client');
    api.export('Rp_mchart', ['client']);
});




