function getParams(a, b) {
    arguments.length < 2 && (b = location.href);
    if (arguments.length > 0 && a != "") {
        if (a == "#")var c = new RegExp("[#]([^$]*)"); else if (a == "?")var c = new RegExp("[?]([^#$]*)"); else var c = new RegExp("[?&]" + a + "=([^&#]*)");
        var d = c.exec(b);
        return d == null ? "" : d[1]
    }
    b = b.split("?");
    var d = {};
    b.length > 1 && (b = b[1].split("#"), b.length > 1 && (d.hash = b[1]), $.each(b[0].split("&"), function (a, b) {
        b = b.split("="), d[b[0]] = b[1]
    }));
    return d
}
function defineNetwork(a) {
    var b = function (a, b, c) {
        this.container = a, this.width = b, this.height = c, this.loaderInterval = null, this.loaderOffset = 0, this.ctx = this.initCanvas(a, b, c), this.startLoader("Loading graph data"), this.loadMeta()
    };
    b.prototype = {initCanvas:function (b, c, d) {
        var e = a(b).find("canvas")[0];
        e.style.zIndex = "0";
        return e.getContext("2d")
    }, startLoader:function (a) {
        this.ctx.save(), this.ctx.font = "14px Monaco, monospace", this.ctx.fillStyle = "#99b2cc", this.ctx.textAlign = "center", this.ctx.fillText(a, this.width / 2, 85), this.ctx.restore();
        var b = this;
        this.loaderInterval = setInterval(function () {
            b.displayLoader()
        }, 75)
    }, stopLoader:function () {
        clearInterval(this.loaderInterval)
    }, displayLoader:function () {
        colors = ["#36689a", "#4a77a4", "#5e86ae", "#9cb4cd"], this.ctx.save(), this.ctx.translate(this.width / 2 + .5, 50), this.ctx.clearRect(-16, -16, 32, 32), this.ctx.rotate(this.loaderOffset * (Math.PI / 6));
        for (var a = 0; a < 12; a++)this.ctx.fillStyle = colors[a] || "#c4d2e1", this.ctx.beginPath(), this.ctx.moveTo(-1.5, -8), this.ctx.lineTo(-1.5, -15), this.ctx.lineTo(0, -16), this.ctx.lineTo(1.5, -15), this.ctx.lineTo(1.5, -8), this.ctx.lineTo(-1.5, -8), this.ctx.fill(), this.ctx.rotate(-Math.PI / 6);
        this.ctx.restore(), this.loaderOffset = (this.loaderOffset + 1) % 12
    }, waitForCurrent:function (b) {
        var c = this;
        c.current ? b({current:!0}) : a(".js-network-poll").each(function () {
            var d = a(this).attr("rel");
            a.smartPoller(function (e) {
                a.getJSON("/cache/network_current/" + d, function (a) {
                    a && a.current ? (c.current = !0, b(a)) : e()
                })
            })
        })
    }, loadMeta:function () {
        var b = this;
        b.loaded = !1, a.smartPoller(function (c) {
            a.ajax({url:"network_meta", dataType:"json", success:function (d) {
                d && d.nethash ? (b.loaded = !0, b.init(d)) : b.waitForCurrent(function () {
                    a(".js-network-poll").hide(), a(".js-network-current").show(), b.loaded || c()
                })
            }, error:function () {
                c()
            }})
        })
    }, init:function (a) {
        this.focus = a.focus, this.nethash = a.nethash, this.spaceMap = a.spacemap, this.userBlocks = a.blocks, this.commits = [];
        for (var c = 0; c < a.dates.length; c++)this.commits.push(new b.Commit(c, a.dates[c]));
        this.users = {};
        for (var c = 0; c < a.users.length; c++) {
            var d = a.users[c];
            this.users[d.name] = d
        }
        this.chrome = new b.Chrome(this, this.ctx, this.width, this.height, this.focus, this.commits, this.userBlocks, this.users), this.graph = new b.Graph(this, this.ctx, this.width, this.height, this.focus, this.commits, this.users, this.spaceMap, this.userBlocks, this.nethash), this.mouseDriver = new b.MouseDriver(this.container, this.chrome, this.graph), this.keyDriver = new b.KeyDriver(this.container, this.chrome, this.graph), this.stopLoader(), this.graph.drawBackground(), this.chrome.draw(), this.graph.requestInitialChunk()
    }, initError:function () {
        this.stopLoader(), this.ctx.clearRect(0, 0, this.width, this.height), this.startLoader("Graph could not be drawn due to a network IO problem.")
    }}, b.Commit = function (a, b) {
        this.time = a, this.date = Date.parseISO8601(b), this.requested = null, this.populated = null
    }, b.Commit.prototype = {populate:function (a, b, c) {
        this.user = b, this.author = a.author, this.date = Date.parseISO8601(a.date), this.gravatar = a.gravatar, this.id = a.id, this.login = a.login, this.message = a.message, this.space = a.space, this.time = a.time, this.parents = this.populateParents(a.parents, c), this.requested = !0, this.populated = new Date
    }, populateParents:function (a, b) {
        var c = [];
        for (var d = 0; d < a.length; d++) {
            var e = a[d], f = b[e[1]];
            f.id = e[0], f.space = e[2], c.push(f)
        }
        return c
    }}, b.Chrome = function (a, b, c, d, e, f, g, h) {
        this.namesWidth = 100, this.months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"], this.userBgColors = ["#EBEBFF", "#E0E0FF"], this.network = a, this.ctx = b, this.width = c, this.height = d, this.commits = f, this.userBlocks = g, this.users = h, this.offsetX = this.namesWidth + (c - this.namesWidth) / 2 - e * 20, this.offsetY = 0, this.contentHeight = this.calcContentHeight(), this.graphMidpoint = this.namesWidth + (c - this.namesWidth) / 2, this.activeUser = null
    }, b.Chrome.prototype = {moveX:function (a) {
        this.offsetX += a, this.offsetX > this.graphMidpoint ? this.offsetX = this.graphMidpoint : this.offsetX < this.graphMidpoint - this.commits.length * 20 && (this.offsetX = this.graphMidpoint - this.commits.length * 20)
    }, moveY:function (a) {
        this.offsetY += a, this.offsetY > 0 || this.contentHeight < this.height - 40 ? this.offsetY = 0 : this.offsetY < -this.contentHeight + this.height / 2 && (this.offsetY = -this.contentHeight + this.height / 2)
    }, calcContentHeight:function () {
        var a = 0;
        for (var b = 0; b < this.userBlocks.length; b++) {
            var c = this.userBlocks[b];
            a += c.count
        }
        return a * 20
    }, hover:function (a, b) {
        for (var c = 0; c < this.userBlocks.length; c++) {
            var d = this.userBlocks[c];
            if (a > 0 && a < this.namesWidth && b > 40 + this.offsetY + d.start * 20 && b < 40 + this.offsetY + (d.start + d.count) * 20)return this.users[d.name]
        }
        return null
    }, draw:function () {
        this.drawTimeline(this.ctx), this.drawUsers(this.ctx), this.drawFooter(this.ctx)
    }, drawTimeline:function (a) {
        a.fillStyle = "#111111", a.fillRect(0, 0, this.width, 20), a.fillStyle = "#333333", a.fillRect(0, 20, this.width, 20);
        var b = parseInt((0 - this.offsetX) / 20);
        b < 0 && (b = 0);
        var c = b + parseInt(this.width / 20);
        c > this.commits.length && (c = this.commits.length), a.save(), a.translate(this.offsetX, 0), a.font = "10px Helvetica, sans-serif";
        var d = null, e = null;
        for (var f = b; f < c; f++) {
            var g = this.commits[f], h = this.months[g.date.getMonth()];
            h != d && (a.fillStyle = "#ffffff", a.fillText(h, f * 20 - 3, 14), d = h);
            var i = parseInt(g.date.getDate());
            i != e && (a.fillStyle = "#ffffff", a.fillText(i, f * 20 - 3, 33), e = i)
        }
        a.restore()
    }, drawUsers:function (a) {
        a.fillStyle = "#FFFFFF", a.fillRect(0, 0, this.namesWidth, this.height), a.save(), a.translate(0, 40 + this.offsetY);
        for (var b = 0; b < this.userBlocks.length; b++) {
            var c = this.userBlocks[b];
            a.fillStyle = this.userBgColors[b % 2], a.fillRect(0, c.start * 20, this.namesWidth, c.count * 20), this.activeUser && this.activeUser.name == c.name && (a.fillStyle = "rgba(0, 0, 0, 0.05)", a.fillRect(0, c.start * 20, this.namesWidth, c.count * 20)), a.fillStyle = "#DDDDDD", a.fillRect(0, c.start * 20, 1, c.count * 20), a.fillRect(this.namesWidth - 1, c.start * 20, 1, c.count * 20), a.fillRect(this.width - 1, c.start * 20, 1, c.count * 20), a.fillRect(0, (c.start + c.count) * 20 - 1, this.namesWidth, 1);
            var d = a.measureText(c.name).width, e = (c.start + c.count / 2) * 20 + 3;
            a.fillStyle = "#000000", a.font = "12px Monaco, monospace", a.textAlign = "center", a.fillText(c.name, this.namesWidth / 2, e, 96)
        }
        a.restore(), a.fillStyle = "#111111", a.fillRect(0, 0, this.namesWidth, 20), a.fillStyle = "#333333", a.fillRect(0, 20, this.namesWidth, 20)
    }, drawFooter:function (a) {
        a.fillStyle = "#F4F4F4", a.fillRect(0, this.height - 20, this.width, 20), a.fillStyle = "#CCCCCC", a.fillRect(0, this.height - 20, this.width, 1), a.fillStyle = "#000000", a.font = "11px Monaco, monospace", a.fillText("GitHub Network Graph Viewer v4.0.0", 5, this.height - 5)
    }}, b.Graph = function (a, b, c, d, e, f, g, h, i, j) {
        this.namesWidth = 100, this.spaceColors = [], this.bgColors = ["#F5F5FF", "#F0F0FF"], this.spaceColors.push("#FF0000"), this.spaceColors.push("#0000FF"), this.spaceColors.push("#00FF00"), this.spaceColors.push("#FF00FF"), this.spaceColors.push("#E2EB00"), this.spaceColors.push("#FFA600"), this.spaceColors.push("#00FFFC"), this.spaceColors.push("#DD458E"), this.spaceColors.push("#AD7331"), this.spaceColors.push("#97AD31"), this.spaceColors.push("#51829D"), this.spaceColors.push("#70387F"), this.spaceColors.push("#740000"), this.spaceColors.push("#745C00"), this.spaceColors.push("#419411"), this.spaceColors.push("#37BE8C"), this.spaceColors.push("#6C5BBD"), this.spaceColors.push("#F300AA"), this.spaceColors.push("#586D41"), this.spaceColors.push("#3B4E31"), this.network = a, this.ctx = b, this.width = c, this.height = d, this.focus = e, this.commits = f, this.users = g, this.spaceMap = h, this.userBlocks = i, this.nethash = j, this.offsetX = this.namesWidth + (c - this.namesWidth) / 2 - e * 20, this.offsetY = 0, this.bgCycle = 0, this.marginMap = {}, this.gravatars = {}, this.activeCommit = null, this.contentHeight = this.calcContentHeight(), this.graphMidpoint = this.namesWidth + (c - this.namesWidth) / 2, this.showRefs = !0, this.lastHotLoadCenterIndex = null, this.connectionMap = {}, this.spaceUserMap = {};
        for (var k = 0; k < i.length; k++) {
            var l = i[k];
            for (var m = l.start; m < l.start + l.count; m++)this.spaceUserMap[m] = g[l.name]
        }
        this.headsMap = {};
        for (var k = 0; k < i.length; k++) {
            var l = i[k], n = g[l.name];
            for (var m = 0; m < n.heads.length; m++) {
                var o = n.heads[m];
                this.headsMap[o.id] || (this.headsMap[o.id] = []);
                var p = {name:n.name, head:o};
                this.headsMap[o.id].push(p)
            }
        }
    }, b.Graph.prototype = {moveX:function (a) {
        this.offsetX += a, this.offsetX > this.graphMidpoint ? this.offsetX = this.graphMidpoint : this.offsetX < this.graphMidpoint - this.commits.length * 20 && (this.offsetX = this.graphMidpoint - this.commits.length * 20), this.hotLoadCommits()
    }, moveY:function (a) {
        this.offsetY += a, this.offsetY > 0 || this.contentHeight < this.height - 40 ? this.offsetY = 0 : this.offsetY < -this.contentHeight + this.height / 2 && (this.offsetY = -this.contentHeight + this.height / 2)
    }, toggleRefs:function () {
        this.showRefs = !this.showRefs
    }, calcContentHeight:function () {
        var a = 0;
        for (var b = 0; b < this.userBlocks.length; b++) {
            var c = this.userBlocks[b];
            a += c.count
        }
        return a * 20
    }, hover:function (a, b) {
        var c = this.timeWindow();
        for (var d = c.min; d <= c.max; d++) {
            var e = this.commits[d], f = this.offsetX + e.time * 20, g = this.offsetY + 50 + e.space * 20;
            if (a > f - 5 && a < f + 5 && b > g - 5 && b < g + 5)return e
        }
        return null
    }, hotLoadCommits:function () {
        var a = 200, b = parseInt((-this.offsetX + this.graphMidpoint) / 20);
        b < 0 && (b = 0), b > this.commits.length - 1 && (b = this.commits.length - 1);
        if (!(this.lastHotLoadCenterIndex && Math.abs(this.lastHotLoadCenterIndex - b) < 10)) {
            this.lastHotLoadCenterIndex = b;
            var c = this.backSpan(b, a), d = this.frontSpan(b, a);
            if (c || d) {
                var e = c ? c[0] : d[0], f = d ? d[1] : c[1];
                this.requestChunk(e, f)
            }
        }
    }, backSpan:function (a, b) {
        var c = null;
        for (var d = a; d >= 0 && d > a - b; d--)if (!this.commits[d].requested) {
            c = d;
            break
        }
        if (c != null) {
            var e = null, f = null;
            for (var d = c; d >= 0 && d > c - b; d--)if (this.commits[d].requested) {
                e = d;
                break
            }
            e ? f = e + 1 : (f = c - b, f < 0 && (f = 0));
            return[f, c]
        }
        return null
    }, frontSpan:function (a, b) {
        var c = null;
        for (var d = a; d < this.commits.length && d < a + b; d++)if (!this.commits[d].requested) {
            c = d;
            break
        }
        if (c != null) {
            var e = null, f = null;
            for (var d = c; d < this.commits.length && d < c + b; d++)if (this.commits[d].requested) {
                e = d;
                break
            }
            e ? f = e - 1 : c + b >= this.commits.length ? f = this.commits.length - 1 : f = c + b;
            return[c, f]
        }
        return null
    }, requestInitialChunk:function () {
        var b = this;
        a.getJSON("network_data_chunk?nethash=" + this.nethash, function (a) {
            b.importChunk(a), b.draw(), b.network.chrome.draw()
        })
    }, requestChunk:function (b, c) {
        for (var d = b; d <= c; d++)this.commits[d].requested = new Date;
        var e = this, f = "network_data_chunk?nethash=" + this.nethash + "&start=" + b + "&end=" + c;
        a.getJSON(f, function (a) {
            e.importChunk(a), e.draw(), e.network.chrome.draw(), e.lastHotLoadCenterIndex = this.focus
        })
    }, importChunk:function (a) {
        for (var b = 0; b < a.commits.length; b++) {
            var c = a.commits[b], d = this.spaceUserMap[c.space], e = this.commits[c.time];
            e.populate(c, d, this.commits);
            for (var f = 0; f < e.parents.length; f++) {
                var g = e.parents[f];
                for (var h = g.time + 1; h < e.time; h++)this.connectionMap[h] = this.connectionMap[h] || [], this.connectionMap[h].push(e)
            }
        }
    }, timeWindow:function () {
        var a = parseInt((this.namesWidth - this.offsetX + 20) / 20);
        a < 0 && (a = 0);
        var b = a + parseInt((this.width - this.namesWidth) / 20);
        b > this.commits.length - 1 && (b = this.commits.length - 1);
        return{min:a, max:b}
    }, draw:function () {
        this.drawBackground();
        var a = this.timeWindow(), b = a.min, c = a.max;
        this.ctx.save(), this.ctx.translate(this.offsetX, this.offsetY + 50);
        var d = {};
        for (var e = 0; e < this.spaceMap.length; e++) {
            var f = this.spaceMap.length - e - 1;
            for (var g = b; g <= c; g++) {
                var h = this.commits[g];
                h.populated && h.space == f && (this.drawConnection(h), d[h.id] = !0)
            }
        }
        for (var e = b; e <= c; e++) {
            var i = this.connectionMap[e];
            if (i)for (var g = 0; g < i.length; g++) {
                var h = i[g];
                d[h.id] || (this.drawConnection(h), d[h.id] = !0)
            }
        }
        for (var e = 0; e < this.spaceMap.length; e++) {
            var f = this.spaceMap.length - e - 1;
            for (var g = b; g <= c; g++) {
                var h = this.commits[g];
                h.populated && h.space == f && (h == this.activeCommit ? this.drawActiveCommit(h) : this.drawCommit(h))
            }
        }
        if (this.showRefs)for (var g = b; g <= c; g++) {
            var h = this.commits[g];
            if (h.populated) {
                var j = this.headsMap[h.id];
                if (j) {
                    var k = 0;
                    for (var l = 0; l < j.length; l++) {
                        var m = j[l];
                        if (this.spaceUserMap[h.space].name == m.name) {
                            var n = this.drawHead(h, m.head, k);
                            k += n
                        }
                    }
                }
            }
        }
        this.ctx.restore(), this.activeCommit && this.drawCommitInfo(this.activeCommit)
    }, drawBackground:function () {
        this.ctx.clearRect(0, 0, this.width, this.height), this.ctx.save(), this.ctx.translate(0, this.offsetY + 50), this.ctx.clearRect(0, -10, this.width, this.height);
        for (var a = 0; a < this.userBlocks.length; a++) {
            var b = this.userBlocks[a];
            this.ctx.fillStyle = this.bgColors[a % 2], this.ctx.fillRect(0, b.start * 20 - 10, this.width, b.count * 20), this.ctx.fillStyle = "#DDDDDD", this.ctx.fillRect(0, (b.start + b.count) * 20 - 11, this.width, 1)
        }
        this.ctx.restore()
    }, drawCommit:function (a) {
        var b = a.time * 20, c = a.space * 20;
        this.ctx.strokeStyle = "#F7F7FF", this.ctx.lineWidth = 1.5, this.ctx.fillStyle = this.spaceColor(a.space), this.ctx.beginPath(), this.ctx.arc(b, c, 4, 0, Math.PI * 2, !1), this.ctx.fill(), this.ctx.stroke()
    }, drawActiveCommit:function (a) {
        var b = a.time * 20, c = a.space * 20;
        this.ctx.strokeStyle = "#F7F7FF", this.ctx.lineWidth = 1.5, this.ctx.fillStyle = this.spaceColor(a.space), this.ctx.beginPath(), this.ctx.arc(b, c, 6, 0, Math.PI * 2, !1), this.ctx.fill(), this.ctx.stroke()
    }, drawCommitInfo:function (a) {
        var b = this.splitLines(a.message, 54), c = 80 + 15 * b.length, d = this.offsetX + a.time * 20, e = 50 + this.offsetY + a.space * 20, f = 0, g = 0;
        d < this.graphMidpoint ? f = d + 10 : f = d - 410, e < 40 + (this.height - 40) / 2 ? g = e + 10 : g = e - c - 10, this.ctx.save(), this.ctx.translate(f, g), this.ctx.fillStyle = "#FFFFFF", this.ctx.strokeStyle = "#000000", this.ctx.lineWidth = "2", this.ctx.beginPath(), this.ctx.moveTo(0, 5), this.ctx.quadraticCurveTo(0, 0, 5, 0), this.ctx.lineTo(395, 0), this.ctx.quadraticCurveTo(400, 0, 400, 5), this.ctx.lineTo(400, c - 5), this.ctx.quadraticCurveTo(400, c, 395, c), this.ctx.lineTo(5, c), this.ctx.quadraticCurveTo(0, c, 0, c - 5), this.ctx.lineTo(0, 5), this.ctx.fill(), this.ctx.stroke();
        var h = this.gravatars[a.gravatar];
        if (h)this.drawGravatar(h, 10, 10); else {
            var i = this, j = window.location.protocol;
            h = new Image, h.src = "https://secure.gravatar.com/avatar/" + a.gravatar + "?s=32&d=https%3A%2F%2Fgithub.com%2Fimages%2Fgravatars%2Fgravatar-32.png", h.onload = function () {
                i.activeCommit == a && (i.drawGravatar(h, f + 10, g + 10), i.gravatars[a.gravatar] = h)
            }
        }
        this.ctx.fillStyle = "#000000", this.ctx.font = "bold 14px Helvetica, sans-serif", this.ctx.fillText(a.author, 55, 32), this.ctx.fillStyle = "#888888", this.ctx.font = "12px Monaco, monospace", this.ctx.fillText(a.id, 12, 65), this.drawMessage(b, 12, 85), this.ctx.restore()
    }, drawGravatar:function (a, b, c) {
        this.ctx.strokeStyle = "#AAAAAA", this.ctx.lineWidth = 1, this.ctx.beginPath(), this.ctx.strokeRect(b + .5, c + .5, 35, 35), this.ctx.drawImage(a, b + 2, c + 2)
    }, drawMessage:function (a, b, c) {
        this.ctx.font = "12px Monaco, monospace", this.ctx.fillStyle = "#000000";
        for (var d = 0; d < a.length; d++) {
            var e = a[d];
            this.ctx.fillText(e, b, c + d * 15)
        }
    }, splitLines:function (a, b) {
        var c = a.split(" "), d = [], e = "";
        for (var f = 0; f < c.length; f++) {
            var g = c[f];
            e.length + 1 + g.length < b ? e = e == "" ? g : e + " " + g : (d.push(e), e = g)
        }
        d.push(e);
        return d
    }, drawHead:function (a, b, c) {
        this.ctx.font = "10.25px Monaco, monospace", this.ctx.save();
        var d = this.ctx.measureText(b.name).width;
        this.ctx.restore();
        var e = a.time * 20, f = a.space * 20 + 5 + c;
        this.ctx.save(), this.ctx.translate(e, f), this.ctx.fillStyle = "rgba(0, 0, 0, 0.8)", this.ctx.beginPath(), this.ctx.moveTo(0, 0), this.ctx.lineTo(-4, 10), this.ctx.quadraticCurveTo(-9, 10, -9, 15), this.ctx.lineTo(-9, 15 + d), this.ctx.quadraticCurveTo(-9, 15 + d + 5, -4, 15 + d + 5), this.ctx.lineTo(4, 15 + d + 5), this.ctx.quadraticCurveTo(9, 15 + d + 5, 9, 15 + d), this.ctx.lineTo(9, 15), this.ctx.quadraticCurveTo(9, 10, 4, 10), this.ctx.lineTo(0, 0), this.ctx.fill(), this.ctx.fillStyle = "#FFFFFF", this.ctx.font = "12px Monaco, monospace", this.ctx.textBaseline = "middle", this.ctx.scale(.85, .85), this.ctx.rotate(Math.PI / 2), this.ctx.fillText(b.name, 17, -1), this.ctx.restore();
        return d + 20
    }, drawConnection:function (a) {
        for (var b = 0; b < a.parents.length; b++) {
            var c = a.parents[b];
            b == 0 ? c.space == a.space ? this.drawBasicConnection(c, a) : this.drawBranchConnection(c, a) : this.drawMergeConnection(c, a)
        }
    }, drawBasicConnection:function (a, b) {
        var c = this.spaceColor(b.space);
        this.ctx.strokeStyle = c, this.ctx.lineWidth = 2, this.ctx.beginPath(), this.ctx.moveTo(a.time * 20, b.space * 20), this.ctx.lineTo(b.time * 20, b.space * 20), this.ctx.stroke()
    }, drawBranchConnection:function (a, b) {
        var c = this.spaceColor(b.space);
        this.ctx.strokeStyle = c, this.ctx.lineWidth = 2, this.ctx.beginPath(), this.ctx.moveTo(a.time * 20, a.space * 20), this.ctx.lineTo(a.time * 20, b.space * 20), this.ctx.lineTo(b.time * 20 - 14, b.space * 20), this.ctx.stroke(), this.threeClockArrow(c, b.time * 20, b.space * 20)
    }, drawMergeConnection:function (a, b) {
        var c = this.spaceColor(a.space);
        this.ctx.strokeStyle = c, this.ctx.lineWidth = 2, this.ctx.beginPath();
        if (a.space > b.space) {
            this.ctx.moveTo(a.time * 20, a.space * 20);
            var d = this.safePath(a.time, b.time, a.space);
            if (d)this.ctx.lineTo(b.time * 20 - 10, a.space * 20), this.ctx.lineTo(b.time * 20 - 10, b.space * 20 + 15), this.ctx.lineTo(b.time * 20 - 7.7, b.space * 20 + 9.5), this.ctx.stroke(), this.oneClockArrow(c, b.time * 20, b.space * 20); else {
                var e = this.closestMargin(a.time, b.time, a.space, -1);
                a.space == b.space + 1 && a.space == e + 1 ? (this.ctx.lineTo(a.time * 20, e * 20 + 10), this.ctx.lineTo(b.time * 20 - 15, e * 20 + 10), this.ctx.lineTo(b.time * 20 - 9.5, e * 20 + 7.7), this.ctx.stroke(), this.twoClockArrow(c, b.time * 20, e * 20), this.addMargin(a.time, b.time, e)) : a.time + 1 == b.time ? (e = this.closestMargin(a.time, b.time, b.space, 0), this.ctx.lineTo(a.time * 20, e * 20 + 10), this.ctx.lineTo(b.time * 20 - 15, e * 20 + 10), this.ctx.lineTo(b.time * 20 - 15, b.space * 20 + 10), this.ctx.lineTo(b.time * 20 - 9.5, b.space * 20 + 7.7), this.ctx.stroke(), this.twoClockArrow(c, b.time * 20, b.space * 20), this.addMargin(a.time, b.time, e)) : (this.ctx.lineTo(a.time * 20 + 10, a.space * 20 - 10), this.ctx.lineTo(a.time * 20 + 10, e * 20 + 10), this.ctx.lineTo(b.time * 20 - 10, e * 20 + 10), this.ctx.lineTo(b.time * 20 - 10, b.space * 20 + 15), this.ctx.lineTo(b.time * 20 - 7.7, b.space * 20 + 9.5), this.ctx.stroke(), this.oneClockArrow(c, b.time * 20, b.space * 20), this.addMargin(a.time, b.time, e))
            }
        } else {
            var e = this.closestMargin(a.time, b.time, b.space, -1);
            e < b.space ? (this.ctx.moveTo(a.time * 20, a.space * 20), this.ctx.lineTo(a.time * 20, e * 20 + 10), this.ctx.lineTo(b.time * 20 - 12.7, e * 20 + 10), this.ctx.lineTo(b.time * 20 - 12.7, b.space * 20 - 10), this.ctx.lineTo(b.time * 20 - 9.4, b.space * 20 - 7.7), this.ctx.stroke(), this.fourClockArrow(c, b.time * 20, b.space * 20), this.addMargin(a.time, b.time, e)) : (this.ctx.moveTo(a.time * 20, a.space * 20), this.ctx.lineTo(a.time * 20, e * 20 + 10), this.ctx.lineTo(b.time * 20 - 12.7, e * 20 + 10), this.ctx.lineTo(b.time * 20 - 12.7, b.space * 20 + 10), this.ctx.lineTo(b.time * 20 - 9.4, b.space * 20 + 7.7), this.ctx.stroke(), this.twoClockArrow(c, b.time * 20, b.space * 20), this.addMargin(a.time, b.time, e))
        }
    }, addMargin:function (a, b, c) {
        var d = c;
        this.marginMap[d] || (this.marginMap[d] = []), this.marginMap[d].push([a, b])
    }, oneClockArrow:function (a, b, c) {
        this.ctx.fillStyle = a, this.ctx.beginPath(), this.ctx.moveTo(b - 6.3, c + 13.1), this.ctx.lineTo(b - 10.8, c + 9.7), this.ctx.lineTo(b - 2.6, c + 3.5), this.ctx.fill()
    }, twoClockArrow:function (a, b, c) {
        this.ctx.fillStyle = a, this.ctx.beginPath(), this.ctx.moveTo(b - 12.4, c + 6.6), this.ctx.lineTo(b - 9.3, c + 10.6), this.ctx.lineTo(b - 3.2, c + 2.4), this.ctx.fill()
    }, threeClockArrow:function (a, b, c) {
        this.ctx.fillStyle = a, this.ctx.beginPath(), this.ctx.moveTo(b - 14, c - 2.5), this.ctx.lineTo(b - 14, c + 2.5), this.ctx.lineTo(b - 4, c), this.ctx.fill()
    }, fourClockArrow:function (a, b, c) {
        this.ctx.fillStyle = a, this.ctx.beginPath(), this.ctx.moveTo(b - 12.4, c - 6.6), this.ctx.lineTo(b - 9.3, c - 10.6), this.ctx.lineTo(b - 3.2, c - 2.4), this.ctx.fill()
    }, safePath:function (a, b, c) {
        for (var d = 0; d < this.spaceMap[c].length; d++) {
            var e = this.spaceMap[c][d];
            if (this.timeInPath(a, e))return e[1] == b
        }
        return!1
    }, closestMargin:function (a, b, c, d) {
        var e = this.spaceMap.length, f = d, g = !1, h = !1, i = !1;
        while (!h || !g) {
            if (c + f >= 0 && this.safeMargin(a, b, c + f))return c + f;
            c + f < 0 && (g = !0), c + f > e && (h = !0), i == !1 && f == 0 ? (f = -1, i = !0) : f < 0 ? f = -f - 1 : f = -f - 2
        }
        return c > 0 ? c - 1 : 0
    }, safeMargin:function (a, b, c) {
        var d = c;
        if (!this.marginMap[d])return!0;
        var e = this.marginMap[d];
        for (var f = 0; f < e.length; f++) {
            var g = e[f];
            if (this.pathsCollide([a, b], g))return!1
        }
        return!0
    }, pathsCollide:function (a, b) {
        return this.timeWithinPath(a[0], b) || this.timeWithinPath(a[1], b) || this.timeWithinPath(b[0], a) || this.timeWithinPath(b[1], a)
    }, timeInPath:function (a, b) {
        return a >= b[0] && a <= b[1]
    }, timeWithinPath:function (a, b) {
        return a > b[0] && a < b[1]
    }, spaceColor:function (a) {
        return a == 0 ? "#000000" : this.spaceColors[a % this.spaceColors.length]
    }}, b.MouseDriver = function (b, c, d) {
        this.container = b, this.chrome = c, this.graph = d, this.dragging = !1, this.lastPoint = {x:0, y:0}, this.lastHoverCommit = null, this.lastHoverUser = null, this.pressedCommit = null, this.pressedUser = null;
        var e = a(b).eq(0), f = a("canvas", e)[0];
        f.style.cursor = "move";
        var g = this;
        this.up = function (a) {
            g.dragging = !1, g.pressedCommit && g.graph.activeCommit == g.pressedCommit ? window.open("/" + g.graph.activeCommit.user.name + "/" + g.graph.activeCommit.user.repo + "/commit/" + g.graph.activeCommit.id) : g.pressedUser && g.chrome.activeUser == g.pressedUser && (window.location = "/" + g.chrome.activeUser.name + "/" + g.chrome.activeUser.repo + "/network"), g.pressedCommit = null, g.pressedUser = null
        }, this.down = function (a) {
            g.graph.activeCommit ? g.pressedCommit = g.graph.activeCommit : g.chrome.activeUser ? g.pressedUser = g.chrome.activeUser : g.dragging = !0
        }, this.docmove = function (a) {
            var b = a.pageX, c = a.pageY;
            g.dragging && (g.graph.moveX(b - g.lastPoint.x), g.graph.moveY(c - g.lastPoint.y), g.graph.draw(), g.chrome.moveX(b - g.lastPoint.x), g.chrome.moveY(c - g.lastPoint.y), g.chrome.draw()), g.lastPoint.x = b, g.lastPoint.y = c
        }, this.move = function (a) {
            var b = a.pageX, c = a.pageY;
            if (g.dragging)g.graph.moveX(b - g.lastPoint.x), g.graph.moveY(c - g.lastPoint.y), g.graph.draw(), g.chrome.moveX(b - g.lastPoint.x), g.chrome.moveY(c - g.lastPoint.y), g.chrome.draw(); else {
                var d = g.chrome.hover(b - a.target.offsetLeft, c - a.target.offsetTop);
                if (d != g.lastHoverUser)d ? f.style.cursor = "pointer" : f.style.cursor = "move", g.chrome.activeUser = d, g.chrome.draw(), g.lastHoverUser = d; else {
                    var e = g.graph.hover(b - a.target.offsetLeft, c - a.target.offsetTop);
                    e != g.lastHoverCommit && (e ? f.style.cursor = "pointer" : f.style.cursor = "move", g.graph.activeCommit = e, g.graph.draw(), g.chrome.draw(), g.lastHoverCommit = e)
                }
            }
            g.lastPoint.x = b, g.lastPoint.y = c
        }, this.out = function (a) {
            g.graph.activeCommit = null, g.chrome.activeUser = null, g.graph.draw(), g.chrome.draw(), g.lastHoverCommit = null, g.lastHoverUser = null
        }, a("body")[0].onmouseup = this.up, a("body")[0].onmousemove = this.docmove, f.onmousedown = this.down, f.onmousemove = this.move, f.onmouseout = this.out
    }, b.KeyDriver = function (b, c, d) {
        this.container = b, this.chrome = c, this.graph = d, this.dirty = !1, this.moveBothX = function (a) {
            this.graph.moveX(a), this.chrome.moveX(a), this.graph.activeCommit = null, this.dirty = !0
        }, this.moveBothY = function (a) {
            this.graph.moveY(a), this.chrome.moveY(a), this.graph.activeCommit = null, this.dirty = !0
        }, this.toggleRefs = function () {
            this.graph.toggleRefs(), this.dirty = !0
        }, this.redraw = function () {
            this.dirty && (this.graph.draw(), this.chrome.draw()), this.dirty = !1
        };
        var e = this;
        this.down = function (a) {
            var b = !1;
            if (a.shiftKey)switch (a.which) {
                case 37:
                case 72:
                    e.moveBothX(999999), b = !0;
                    break;
                case 38:
                case 75:
                    e.moveBothY(999999), b = !0;
                    break;
                case 39:
                case 76:
                    e.moveBothX(-999999), b = !0;
                    break;
                case 40:
                case 74:
                    e.moveBothY(-999999), b = !0
            } else switch (a.which) {
                case 37:
                case 72:
                    e.moveBothX(100), b = !0;
                    break;
                case 38:
                case 75:
                    e.moveBothY(20), b = !0;
                    break;
                case 39:
                case 76:
                    e.moveBothX(-100), b = !0;
                    break;
                case 40:
                case 74:
                    e.moveBothY(-20), b = !0;
                    break;
                case 84:
                    e.toggleRefs(), b = !0
            }
            b && e.redraw()
        }, this.press = function (b) {
            (a.browser.mozilla || a.browser.opera) && e.down({shiftKey:!1, which:b.keyCode})
        }, a(document).keydown(this.down), a(document).keypress(this.press)
    };
    return b
}
function clippyCopiedCallback(a) {
    var b = $("#clippy_tooltip_" + a);
    b.length != 0 && (b.attr("title", "copied!").trigger("tipsy.reload"), setTimeout(function () {
        b.attr("title", "copy to clipboard")
    }, 500))
}
function debug(a, b) {
    GitHub.debug && console && console.log && (b ? console.log(a, b) : console.log(a))
}
function definePrimer(a) {
    var b = function (a, b, c, d) {
        this.container = a, this.width = b, this.height = c, this.primer = this, this.useGlobalMouseMove = d, this.actions = [], this.init(), this.autoDraw = !0
    };
    b.prototype = {init:function () {
        a("html head").append("<style>.primer_text { position: absolute; margin: 0; padding: 0; line-height: normal; z-index: 0;}</style>");
        var c = a(this.container).eq(0);
        c.append('<div id="primer_text"></div>');
        var d = a("#primer_text", c).eq(0);
        d.css("position", "relative"), this.element = d;
        var e = document.createElement("canvas");
        e.width = this.width, e.height = this.height, e.style.zIndex = "0", e.getContext ? c.append(e) : window.G_vmlCanvasManager && window.G_vmlCanvasManager.initElement(a(e).appendTo(c).get(0));
        var f = a("canvas", c), g = f[0];
        this.context = g.getContext("2d"), this.root = new b.Layer, this.root.bind(this), this.setupExt();
        var h = this;
        this.useGlobalMouseMove ? a("body").bind("mousemove", function (b) {
            if (a(b.target).parents().find(this.container)) {
                var c = a(g), d = c.offset();
                b.localX = b.pageX - d.left, b.localY = b.pageY - d.top, h.ghost(b)
            } else h.outOfBounds()
        }) : f.eq(0).bind("mousemove", function (b) {
            var c = a(b.currentTarget).offset();
            b.localX = b.pageX - c.left, b.localY = b.pageY - c.top, h.ghost(b)
        })
    }, getX:function () {
        return 0
    }, getY:function () {
        return 0
    }, getGlobalX:function () {
        return 0
    }, getGlobalY:function () {
        return 0
    }, addChild:function (a) {
        a.bind(this), this.root.addChild(a), this.draw()
    }, removeChild:function (a) {
        this.root.removeChild(a), this.draw()
    }, draw:function (b) {
        if (b || this.autoDraw)this.context.clearRect(0, 0, this.width, this.height), a(".primer_text", this.element).remove(), this.setupExt(), this.root.draw()
    }, ghost:function (a) {
        this.root.ghost(a);
        for (var b in this.actions) {
            var c = this.actions[b];
            c[0](c[1])
        }
        this.actions = []
    }, outOfBounds:function () {
    }, setupExt:function () {
        this.context.ext = {textAlign:"left", font:"10px sans-serif"}
    }}, b.Layer = function () {
        this.primer = null, this.context = null, this.element = null, this.children = [], this.calls = [], this.xVal = 0, this.yVal = 0, this.visibleVal = !0, this.mouseoverVal = function () {
        }, this.mouseoutVal = function () {
        }, this.mouseWithin = !1
    }, b.Layer.prototype = {bind:function (a) {
        this.parent = a, this.primer = a.primer, this.context = this.primer.context, this.element = this.primer.element;
        for (var b in this.children)this.children[b].bind(this)
    }, getX:function () {
        return this.xVal
    }, setX:function (a) {
        this.xVal = a, this.primer && this.primer.draw()
    }, getY:function () {
        return this.yVal
    }, setY:function (a) {
        this.yVal = a, this.primer && this.primer.draw()
    }, getGlobalX:function () {
        return this.getX() + this.parent.getGlobalX()
    }, getGlobalY:function () {
        return this.getY() + this.parent.getGlobalY()
    }, getVisible:function () {
        return this.visibleVal
    }, setVisible:function (a) {
        this.visibleVal = a, this.primer && this.primer.draw()
    }, addChild:function (a) {
        a.bind(this), this.children.push(a), this.primer && this.primer.draw()
    }, removeChild:function (a) {
        var b = [];
        for (var c = 0; c < this.children.length; c++) {
            var d = this.children[c];
            d != a && b.push(d)
        }
        this.children = b
    }, mouseover:function (a) {
        this.mouseoverVal = a
    }, mouseout:function (a) {
        this.mouseoutVal = a
    }, setFillStyle:function (a) {
        this.calls.push(["fillStyle", a])
    }, setStrokeStyle:function (a) {
        this.calls.push(["strokeStyle", a])
    }, setLineWidth:function (a) {
        this.calls.push(["lineWidth", a])
    }, beginPath:function () {
        this.calls.push(["beginPath"])
    }, moveTo:function (a, b) {
        this.calls.push(["moveTo", a, b])
    }, lineTo:function (a, b) {
        this.calls.push(["lineTo", a, b])
    }, quadraticCurveTo:function (a, b, c, d) {
        this.calls.push(["quadraticCurveTo", a, b, c, d])
    }, arc:function (a, b, c, d, e, f) {
        this.calls.push(["arc", a, b, c, d, e, f])
    }, fill:function () {
        this.calls.push(["fill"])
    }, stroke:function () {
        this.calls.push(["stroke"])
    }, fillRect:function (a, b, c, d) {
        this.calls.push(["fillRect", a, b, c, d])
    }, fillText:function (a, b, c, d, e) {
        this.calls.push(["fillText", a, b, c, d, e])
    }, setTextAlign:function (a) {
        this.calls.push(["textAlign", a])
    }, setFont:function (a) {
        this.calls.push(["font", a])
    }, rect:function (a, b, c, d) {
        this.beginPath(), this.moveTo(a, b), this.lineTo(a + c, b), this.lineTo(a + c, b + d), this.lineTo(a, b + d), this.lineTo(a, b)
    }, roundedRect:function (a, b, c, d, e) {
        this.beginPath(), this.moveTo(a, b + e), this.lineTo(a, b + d - e), this.quadraticCurveTo(a, b + d, a + e, b + d), this.lineTo(a + c - e, b + d), this.quadraticCurveTo(a + c, b + d, a + c, b + d - e), this.lineTo(a + c, b + e), this.quadraticCurveTo(a + c, b, a + c - e, b), this.lineTo(a + e, b), this.quadraticCurveTo(a, b, a, b + e)
    }, fillRoundedRect:function (a, b, c, d, e) {
        this.roundedRect(a, b, c, d, e), this.fill()
    }, draw:function () {
        if (!!this.getVisible()) {
            this.context.save(), this.context.translate(this.getX(), this.getY());
            for (var a in this.calls) {
                var b = this.calls[a];
                switch (b[0]) {
                    case"strokeStyle":
                        this.context.strokeStyle = b[1];
                        break;
                    case"lineWidth":
                        this.context.lineWidth = b[1];
                        break;
                    case"fillStyle":
                        this.context.fillStyle = b[1];
                        break;
                    case"fillRect":
                        this.context.fillRect(b[1], b[2], b[3], b[4]);
                        break;
                    case"beginPath":
                        this.context.beginPath();
                        break;
                    case"moveTo":
                        this.context.moveTo(b[1], b[2]);
                        break;
                    case"lineTo":
                        this.context.lineTo(b[1], b[2]);
                        break;
                    case"quadraticCurveTo":
                        this.context.quadraticCurveTo(b[1], b[2], b[3], b[4]);
                        break;
                    case"arc":
                        this.context.arc(b[1], b[2], b[3], b[4], b[5], b[6]);
                        break;
                    case"fill":
                        this.context.fill();
                        break;
                    case"stroke":
                        this.context.stroke();
                        break;
                    case"fillText":
                        this.extFillText(b[1], b[2], b[3], b[4], b[5]);
                        break;
                    case"textAlign":
                        this.context.ext.textAlign = b[1];
                    case"font":
                        this.context.ext.font = b[1]
                }
            }
            for (var a = 0; a < this.children.length; a++)this.children[a].draw();
            this.context.restore()
        }
    }, extFillText:function (a, b, c, d, e) {
        var f = "";
        f += "left: " + (this.getGlobalX() + b) + "px;", f += "top: " + (this.getGlobalY() + c) + "px;", f += "width: " + d + "px;", f += "text-align: " + this.context.ext.textAlign + ";", f += "color: " + this.context.fillStyle + ";", f += "font: " + this.context.ext.font + ";", this.element.append('<p class="primer_text ' + e + '" style="' + f + '">' + a + "</p>")
    }, ghost:function (a) {
        if (!!this.getVisible()) {
            this.context.save(), this.context.translate(this.getX(), this.getY());
            for (var b in this.calls) {
                var c = this.calls[b];
                switch (c[0]) {
                    case"fillRect":
                        this.ghostFillRect(a, c[1], c[2], c[3], c[4]);
                        break;
                    case"beginPath":
                        this.context.beginPath();
                        break;
                    case"moveTo":
                        this.context.moveTo(c[1], c[2]);
                        break;
                    case"lineTo":
                        this.context.lineTo(c[1], c[2]);
                        break;
                    case"quadraticCurveTo":
                        this.context.quadraticCurveTo(c[1], c[2], c[3], c[4]);
                        break;
                    case"arc":
                        this.context.arc(c[1], c[2], c[3], c[4], c[5], c[6]);
                        break;
                    case"fill":
                        this.ghostFill(a)
                }
            }
            jQuery.browser.safari || (a.localX -= this.getX(), a.localY -= this.getY());
            for (var b in this.children)this.children[b].ghost(a);
            jQuery.browser.safari || (a.localX += this.getX(), a.localY += this.getY()), this.context.restore()
        }
    }, ghostDetect:function (a) {
        jQuery.browser.safari ? (testX = a.localX, testY = a.localY) : (testX = a.localX - this.getX(), testY = a.localY - this.getY()), this.context.isPointInPath(testX, testY) ? (this.mouseWithin || this.primer.actions.push([this.mouseoverVal, a]), this.mouseWithin = !0) : (this.mouseWithin && this.primer.actions.push([this.mouseoutVal, a]), this.mouseWithin = !1)
    }, ghostFillRect:function (a, b, c, d, e) {
        this.context.beginPath(), this.context.moveTo(b, c), this.context.lineTo(b + d, c), this.context.lineTo(b + d, c + e), this.context.lineTo(b, c + e), this.context.lineTo(b, c), this.ghostDetect(a)
    }, ghostFill:function (a) {
        this.ghostDetect(a)
    }};
    return b
}
if (window.CanvasRenderingContext2D && CanvasRenderingContext2D.prototype.getImageData) {
    var defaultOffsets = {destX:0, destY:0, sourceX:0, sourceY:0, width:"auto", height:"auto"};
    CanvasRenderingContext2D.prototype.blendOnto = function (a, b, c) {
        var d = {};
        for (var e in defaultOffsets)defaultOffsets.hasOwnProperty(e) && (d[e] = c && c[e] || defaultOffsets[e]);
        d.width == "auto" && (d.width = this.canvas.width), d.height == "auto" && (d.height = this.canvas.height), d.width = Math.min(d.width, this.canvas.width - d.sourceX, a.canvas.width - d.destX), d.height = Math.min(d.height, this.canvas.height - d.sourceY, a.canvas.height - d.destY);
        var f = this.getImageData(d.sourceX, d.sourceY, d.width, d.height), g = a.getImageData(d.destX, d.destY, d.width, d.height), h = f.data, i = g.data, j, k, l = i.length, m, n, o, p, q, r, s, t;
        for (var u = 0; u < l; u += 4) {
            j = h[u + 3] / 255, k = i[u + 3] / 255, s = j + k - j * k, i[u + 3] = s * 255, m = h[u] / 255 * j, p = i[u] / 255 * k, n = h[u + 1] / 255 * j, q = i[u + 1] / 255 * k, o = h[u + 2] / 255 * j, r = i[u + 2] / 255 * k, t = 255 / s;
            switch (b) {
                case"normal":
                case"src-over":
                    i[u] = (m + p - p * j) * t, i[u + 1] = (n + q - q * j) * t, i[u + 2] = (o + r - r * j) * t;
                    break;
                case"screen":
                    i[u] = (m + p - m * p) * t, i[u + 1] = (n + q - n * q) * t, i[u + 2] = (o + r - o * r) * t;
                    break;
                case"multiply":
                    i[u] = (m * p + m * (1 - k) + p * (1 - j)) * t, i[u + 1] = (n * q + n * (1 - k) + q * (1 - j)) * t, i[u + 2] = (o * r + o * (1 - k) + r * (1 - j)) * t;
                    break;
                case"difference":
                    i[u] = (m + p - 2 * Math.min(m * k, p * j)) * t, i[u + 1] = (n + q - 2 * Math.min(n * k, q * j)) * t, i[u + 2] = (o + r - 2 * Math.min(o * k, r * j)) * t;
                    break;
                case"src-in":
                    s = j * k, t = 255 / s, i[u + 3] = s * 255, i[u] = m * k * t, i[u + 1] = n * k * t, i[u + 2] = o * k * t;
                    break;
                case"plus":
                case"add":
                    s = Math.min(1, j + k), i[u + 3] = s * 255, t = 255 / s, i[u] = Math.min(m + p, 1) * t, i[u + 1] = Math.min(n + q, 1) * t, i[u + 2] = Math.min(o + r, 1) * t;
                    break;
                case"overlay":
                    i[u] = p <= .5 ? 2 * h[u] * p / k : 255 - (2 - 2 * p / k) * (255 - h[u]), i[u + 1] = q <= .5 ? 2 * h[u + 1] * q / k : 255 - (2 - 2 * q / k) * (255 - h[u + 1]), i[u + 2] = r <= .5 ? 2 * h[u + 2] * r / k : 255 - (2 - 2 * r / k) * (255 - h[u + 2]);
                    break;
                case"hardlight":
                    i[u] = m <= .5 ? 2 * i[u] * m / k : 255 - (2 - 2 * m / j) * (255 - i[u]), i[u + 1] = n <= .5 ? 2 * i[u + 1] * n / k : 255 - (2 - 2 * n / j) * (255 - i[u + 1]), i[u + 2] = o <= .5 ? 2 * i[u + 2] * o / k : 255 - (2 - 2 * o / j) * (255 - i[u + 2]);
                    break;
                case"colordodge":
                case"dodge":
                    h[u] == 255 && p == 0 ? i[u] = 255 : i[u] = Math.min(255, i[u] / (255 - h[u])) * t, h[u + 1] == 255 && q == 0 ? i[u + 1] = 255 : i[u + 1] = Math.min(255, i[u + 1] / (255 - h[u + 1])) * t, h[u + 2] == 255 && r == 0 ? i[u + 2] = 255 : i[u + 2] = Math.min(255, i[u + 2] / (255 - h[u + 2])) * t;
                    break;
                case"colorburn":
                case"burn":
                    h[u] == 0 && p == 0 ? i[u] = 0 : i[u] = (1 - Math.min(1, (1 - p) / m)) * t, h[u + 1] == 0 && q == 0 ? i[u + 1] = 0 : i[u + 1] = (1 - Math.min(1, (1 - q) / n)) * t, h[u + 2] == 0 && r == 0 ? i[u + 2] = 0 : i[u + 2] = (1 - Math.min(1, (1 - r) / o)) * t;
                    break;
                case"darken":
                case"darker":
                    i[u] = (m > p ? p : m) * t, i[u + 1] = (n > q ? q : n) * t, i[u + 2] = (o > r ? r : o) * t;
                    break;
                case"lighten":
                case"lighter":
                    i[u] = (m < p ? p : m) * t, i[u + 1] = (n < q ? q : n) * t, i[u + 2] = (o < r ? r : o) * t;
                    break;
                case"exclusion":
                    i[u] = (p + m - 2 * p * m) * t, i[u + 1] = (q + n - 2 * q * n) * t, i[u + 2] = (r + o - 2 * r * o) * t;
                    break;
                default:
                    i[u] = i[u + 3] = 255, i[u + 1] = u % 8 == 0 ? 255 : 0, i[u + 2] = u % 8 == 0 ? 0 : 255
            }
        }
        a.putImageData(g, d.destX, d.destY)
    };
    var modes = CanvasRenderingContext2D.prototype.blendOnto.supportedBlendModes = "normal src-over screen multiply difference src-in plus add overlay hardlight colordodge dodge colorburn burn darken lighten exclusion".split(" "), supports = CanvasRenderingContext2D.prototype.blendOnto.supports = {};
    for (var i = 0, len = modes.length; i < len; ++i)supports[modes[i]] = !0
}
"abbr article aside audio canvas details figcaption figure footer header hgroup mark meter nav output progress section summary time video".replace(/\w+/g, function (a) {
    document.createElement(a)
}), function (a) {
    a.fn.autoResize = function (b) {
        var c = a.extend({onResize:function () {
        }, animate:!0, animateDuration:150, animateCallback:function () {
        }, extraSpace:20, limit:1e3}, b);
        this.filter("textarea").each(function () {
            var b = a(this), d = 0, e = function () {
                var c = ["height", "width", "lineHeight", "textDecoration", "letterSpacing"], d = {};
                a.each(c, function (a, c) {
                    d[c] = b.css(c)
                });
                return b.clone().removeAttr("id").removeAttr("name").css({position:"absolute", top:0, left:-9999}).css(d).attr("tabIndex", "-1").insertBefore(b)
            }(), f = null, g = function () {
                e.height(0).val(a(this).val()).scrollTop(1e4), d == 0 && (d = b.height());
                var g = Math.max(e.scrollTop() + c.extraSpace, d), h = a(this).add(e);
                if (f !== g) {
                    f = g;
                    if (g >= c.limit) {
                        a(this).css("overflow-y", "");
                        return
                    }
                    c.onResize.call(this), c.animate && b.css("display") === "block" ? h.stop().animate({height:g}, c.animateDuration, c.animateCallback) : h.height(g)
                }
            };
            b.unbind(".dynSiz").bind("resize.dynSiz", g)
        });
        return this
    }
}(jQuery), function (a) {
    a.fn.extend({autocomplete:function (b, c) {
        var d = typeof b == "string";
        c = a.extend({}, a.Autocompleter.defaults, {url:d ? b : null, data:d ? null : b, delay:d ? a.Autocompleter.defaults.delay : 10, max:c && !c.scroll ? 10 : 150}, c), c.highlight = c.highlight || function (a) {
            return a
        }, c.formatMatch = c.formatMatch || c.formatItem;
        return this.each(function () {
            new a.Autocompleter(this, c)
        })
    }, result:function (a) {
        return this.bind("result", a)
    }, search:function (a) {
        return this.trigger("search", [a])
    }, flushCache:function () {
        return this.trigger("flushCache")
    }, setOptions:function (a) {
        return this.trigger("setOptions", [a])
    }, unautocomplete:function () {
        return this.trigger("unautocomplete")
    }}), a.Autocompleter = function (b, c) {
        function z() {
            e.removeClass(c.loadingClass)
        }

        function y(b) {
            var d = [], e = b.split("\n");
            for (var f = 0; f < e.length; f++) {
                var g = a.trim(e[f]);
                g && (g = g.split("|"), d[d.length] = {data:g, value:g[0], result:c.formatResult && c.formatResult(g, g[0]) || g[0]})
            }
            return d
        }

        function x(d, e, f) {
            c.matchCase || (d = d.toLowerCase());
            var g = h.load(d);
            if (g && g.length)e(d, g); else if (typeof c.url == "string" && c.url.length > 0) {
                var i = {timestamp:+(new Date)};
                a.each(c.extraParams, function (a, b) {
                    i[a] = typeof b == "function" ? b() : b
                }), a.ajax({mode:"abort", port:"autocomplete" + b.name, dataType:c.dataType, url:c.url, data:a.extend({q:q(d), limit:c.max}, i), success:function (a) {
                    var b = c.parse && c.parse(a) || y(a);
                    h.add(d, b), e(d, b)
                }})
            } else l.emptyList(), f(d)
        }

        function w(a, b) {
            b && b.length && i ? (z(), t = !1, l.display(b, a), r(a, b[0].value), s(a, b), t || l.show()) : v()
        }

        function v() {
            var a = l.visible();
            l.hide(), clearTimeout(f), z(), c.mustMatch && e.search(function (a) {
                if (!a)if (c.multiple) {
                    var b = p(e.val()).slice(0, -1);
                    e.val(b.join(c.multipleSeparator) + (b.length ? c.multipleSeparator : ""))
                } else e.val(""), e.trigger("result", null)
            })
        }

        function u() {
            clearTimeout(f), f = setTimeout(v, 200), t = !0
        }

        function s(a, b) {
            if (!!c.autoResult && !!b.length) {
                var d = b[0], f = d.result;
                q(e.val()).toLowerCase() == f.toLowerCase() && (e.trigger("result", [d.data, d.value]), b.length == 1 && u())
            }
        }

        function r(f, h) {
            c.autoFill && q(e.val()).toLowerCase() == f.toLowerCase() && j != d.BACKSPACE && (e.val(e.val() + h.substring(q(g).length)), a(b).selection(g.length, g.length + h.length))
        }

        function q(d) {
            if (!c.multiple)return d;
            var e = p(d);
            if (e.length == 1)return e[0];
            var f = a(b).selection().start;
            f == d.length ? e = p(d) : e = p(d.replace(d.substring(f), ""));
            return e[e.length - 1]
        }

        function p(b) {
            if (!b)return[""];
            if (!c.multiple)return[a.trim(b)];
            return a.map(b.split(c.multipleSeparator), function (c) {
                return a.trim(b).length ? a.trim(c) : null
            })
        }

        function o(a, b) {
            if (j == d.DEL)l.hide(); else {
                var f = e.val();
                if (!b && f == g)return;
                g = f, f = q(f), f.length >= c.minChars ? (e.addClass(c.loadingClass), c.matchCase || (f = f.toLowerCase()), x(f, w, v)) : (z(), l.hide())
            }
        }

        function n() {
            var d = l.selected();
            if (!d)return!1;
            var f = d.result;
            g = f;
            if (c.multiple) {
                var h = p(e.val());
                if (h.length > 1) {
                    var i = c.multipleSeparator.length, j = a(b).selection().start, k, m = 0;
                    a.each(h, function (a, b) {
                        m += b.length;
                        if (j <= m) {
                            k = a;
                            return!1
                        }
                        m += i
                    }), h[k] = f, f = h.join(c.multipleSeparator)
                }
                f += c.multipleSeparator
            }
            e.val(f), v(), e.trigger("result", [d.data, d.value]);
            return!0
        }

        var d = {UP:38, DOWN:40, DEL:46, TAB:9, RETURN:13, ESC:27, COMMA:188, PAGEUP:33, PAGEDOWN:34, BACKSPACE:8}, e = a(b).attr("autocomplete", "off").addClass(c.inputClass), f, g = "", h = a.Autocompleter.Cache(c), i = 0, j, k = {mouseDownOnSelect:!1}, l = a.Autocompleter.Select(c, b, n, k), m;
        a.browser.opera && a(b.form).bind("submit.autocomplete", function () {
            if (m) {
                m = !1;
                return!1
            }
        }), e.bind((a.browser.opera ? "keypress" : "keydown") + ".autocomplete",
            function (b) {
                i = 1, j = b.keyCode;
                switch (b.keyCode) {
                    case d.UP:
                        b.preventDefault(), l.visible() ? l.prev() : o(0, !0);
                        break;
                    case d.DOWN:
                        b.preventDefault(), l.visible() ? l.next() : o(0, !0);
                        break;
                    case d.PAGEUP:
                        b.preventDefault(), l.visible() ? l.pageUp() : o(0, !0);
                        break;
                    case d.PAGEDOWN:
                        b.preventDefault(), l.visible() ? l.pageDown() : o(0, !0);
                        break;
                    case c.multiple && a.trim(c.multipleSeparator) == "," && d.COMMA:
                    case d.TAB:
                    case d.RETURN:
                        if (n()) {
                            b.preventDefault(), m = !0;
                            return!1
                        }
                        break;
                    case d.ESC:
                        l.hide();
                        break;
                    default:
                        clearTimeout(f), f = setTimeout(o, c.delay)
                }
            }).focus(
            function () {
                i++
            }).blur(
            function () {
                i = 0, k.mouseDownOnSelect || u()
            }).click(
            function () {
                i++ > 1 && !l.visible() && o(0, !0)
            }).bind("search",
            function () {
                function c(a, c) {
                    var d;
                    if (c && c.length)for (var f = 0; f < c.length; f++)if (c[f].result.toLowerCase() == a.toLowerCase()) {
                        d = c[f];
                        break
                    }
                    typeof b == "function" ? b(d) : e.trigger("result", d && [d.data, d.value])
                }

                var b = arguments.length > 1 ? arguments[1] : null;
                a.each(p(e.val()), function (a, b) {
                    x(b, c, c)
                })
            }).bind("flushCache",
            function () {
                h.flush()
            }).bind("setOptions",
            function () {
                a.extend(c, arguments[1]), "data"in arguments[1] && h.populate()
            }).bind("unautocomplete", function () {
            l.unbind(), e.unbind(), a(b.form).unbind(".autocomplete")
        });
        var t = !1
    }, a.Autocompleter.defaults = {inputClass:"ac_input", resultsClass:"ac_results", loadingClass:"ac_loading", minChars:1, delay:400, matchCase:!1, matchSubset:!0, matchContains:!1, cacheLength:10, max:100, mustMatch:!1, extraParams:{}, selectFirst:!0, formatItem:function (a) {
        return a[0]
    }, formatMatch:null, autoFill:!1, autoResult:!0, width:0, multiple:!1, multipleSeparator:", ", highlight:function (a, b) {
        return a.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + b.replace(/([\^\$\(\)\[\]\{\}\*\.\+\?\|\\])/gi, "\\$1") + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<strong>$1</strong>")
    }, scroll:!0, scrollHeight:180}, a.Autocompleter.Cache = function (b) {
        function h() {
            c = {}, d = 0
        }

        function g() {
            if (!b.data)return!1;
            var c = {}, d = 0;
            b.url || (b.cacheLength = 1), c[""] = [];
            for (var e = 0, g = b.data.length; e < g; e++) {
                var h = b.data[e];
                h = typeof h == "string" ? [h] : h;
                var i = b.formatMatch(h, e + 1, b.data.length);
                if (i === !1)continue;
                var j = i.charAt(0).toLowerCase();
                c[j] || (c[j] = []);
                var k = {value:i, data:h, result:b.formatResult && b.formatResult(h) || i};
                c[j].push(k), d++ < b.max && c[""].push(k)
            }
            a.each(c, function (a, c) {
                b.cacheLength++, f(a, c)
            })
        }

        function f(a, e) {
            d > b.cacheLength && h(), c[a] || d++, c[a] = e
        }

        function e(a, c) {
            b.matchCase || (a = a.toLowerCase());
            var d = a.indexOf(c);
            b.matchContains == "word" && (d = a.toLowerCase().search("\\b" + c.toLowerCase()));
            if (d == -1)return!1;
            return d == 0 || b.matchContains
        }

        var c = {}, d = 0;
        setTimeout(g, 25);
        return{flush:h, add:f, populate:g, load:function (f) {
            if (!b.cacheLength || !d)return null;
            if (!b.url && b.matchContains) {
                var g = [];
                for (var h in c)if (h.length > 0) {
                    var i = c[h];
                    a.each(i, function (a, b) {
                        e(b.value, f) && g.push(b)
                    })
                }
                return g
            }
            if (c[f])return c[f];
            if (b.matchSubset)for (var j = f.length - 1; j >= b.minChars; j--) {
                var i = c[f.substr(0, j)];
                if (i) {
                    var g = [];
                    a.each(i, function (a, b) {
                        e(b.value, f) && (g[g.length] = b)
                    });
                    return g
                }
            }
            return null
        }}
    }, a.Autocompleter.Select = function (b, c, d, e) {
        function s() {
            m.empty();
            var c = r(i.length);
            for (var d = 0; d < c; d++) {
                if (!i[d])continue;
                var e = b.formatItem(i[d].data, d + 1, c, i[d].value, j);
                if (e === !1)continue;
                var k = a("<li/>").html(b.highlight(e, j)).addClass(d % 2 == 0 ? "ac_even" : "ac_odd").appendTo(m)[0];
                a.data(k, "ac_data", i[d])
            }
            g = m.find("li"), b.selectFirst && (g.slice(0, 1).addClass(f.ACTIVE), h = 0), a.fn.bgiframe && m.bgiframe()
        }

        function r(a) {
            return b.max && b.max < a ? b.max : a
        }

        function q(a) {
            h += a, h < 0 ? h = g.size() - 1 : h >= g.size() && (h = 0)
        }

        function p(a) {
            g.slice(h, h + 1).removeClass(f.ACTIVE), q(a);
            var c = g.slice(h, h + 1).addClass(f.ACTIVE);
            if (b.scroll) {
                var d = 0;
                g.slice(0, h).each(function () {
                    d += this.offsetHeight
                }), d + c[0].offsetHeight - m.scrollTop() > m[0].clientHeight ? m.scrollTop(d + c[0].offsetHeight - m.innerHeight()) : d < m.scrollTop() && m.scrollTop(d)
            }
        }

        function o(a) {
            var b = a.target;
            while (b && b.tagName != "LI")b = b.parentNode;
            if (!b)return[];
            return b
        }

        function n() {
            !k || (l = a("<div/>").hide().addClass(b.resultsClass).css("position", "absolute").appendTo(document.body), m = a("<ul/>").appendTo(l).mouseover(
                function (b) {
                    o(b).nodeName && o(b).nodeName.toUpperCase() == "LI" && (h = a("li", m).removeClass(f.ACTIVE).index(o(b)), a(o(b)).addClass(f.ACTIVE))
                }).click(
                function (b) {
                    a(o(b)).addClass(f.ACTIVE), d(), c.focus();
                    return!1
                }).mousedown(
                function () {
                    e.mouseDownOnSelect = !0
                }).mouseup(function () {
                e.mouseDownOnSelect = !1
            }), b.width > 0 && l.css("width", b.width), k = !1)
        }

        var f = {ACTIVE:"ac_over"}, g, h = -1, i, j = "", k = !0, l, m;
        return{display:function (a, b) {
            n(), i = a, j = b, s()
        }, next:function () {
            p(1)
        }, prev:function () {
            p(-1)
        }, pageUp:function () {
            h != 0 && h - 8 < 0 ? p(-h) : p(-8)
        }, pageDown:function () {
            h != g.size() - 1 && h + 8 > g.size() ? p(g.size() - 1 - h) : p(8)
        }, hide:function () {
            l && l.hide(), g && g.removeClass(f.ACTIVE), h = -1
        }, visible:function () {
            return l && l.is(":visible")
        }, current:function () {
            return this.visible() && (g.filter("." + f.ACTIVE)[0] || b.selectFirst && g[0])
        }, show:function () {
            var d = a(c).offset();
            l.css({width:typeof b.width == "string" || b.width > 0 ? b.width : a(c).width(), top:d.top + c.offsetHeight, left:d.left}).show();
            if (b.scroll) {
                m.scrollTop(0), m.css({maxHeight:b.scrollHeight, overflow:"auto"});
                if (a.browser.msie && typeof document.body.style.maxHeight == "undefined") {
                    var e = 0;
                    g.each(function () {
                        e += this.offsetHeight
                    });
                    var f = e > b.scrollHeight;
                    m.css("height", f ? b.scrollHeight : e), f || g.width(m.width() - parseInt(g.css("padding-left")) - parseInt(g.css("padding-right")))
                }
            }
        }, selected:function () {
            var b = g && g.filter("." + f.ACTIVE).removeClass(f.ACTIVE);
            return b && b.length && a.data(b[0], "ac_data")
        }, emptyList:function () {
            m && m.empty()
        }, unbind:function () {
            l && l.remove()
        }}
    }, a.fn.selection = function (a, b) {
        if (a !== undefined)return this.each(function () {
            if (this.createTextRange) {
                var c = this.createTextRange();
                b === undefined || a == b ? (c.move("character", a), c.select()) : (c.collapse(!0), c.moveStart("character", a), c.moveEnd("character", b), c.select())
            } else this.setSelectionRange ? this.setSelectionRange(a, b) : this.selectionStart && (this.selectionStart = a, this.selectionEnd = b)
        });
        var c = this[0];
        if (c.createTextRange) {
            var d = document.selection.createRange(), e = c.value, f = "<->", g = d.text.length;
            d.text = f;
            var h = c.value.indexOf(f);
            c.value = e, this.selection(h, h + g);
            return{start:h, end:h + g}
        }
        if (c.selectionStart !== undefined)return{start:c.selectionStart, end:c.selectionEnd}
    }
}(jQuery), function (a) {
    a.fn.autocompleteField = function (b) {
        var c = a.extend({searchVar:"q", url:null, delay:250, useCache:!1, extraParams:{}, autoClearResults:!0, dataType:"html", minLength:1}, b);
        return a(this).each(function () {
            function i(a) {
                a.length >= c.minLength ? f != a && (h(a), f = a) : b.trigger("autocomplete.clear")
            }

            function h(e) {
                d && d.readyState < 4 && d.abort();
                if (c.useCache && g[e])b.trigger("autocomplete.finish", g[e]); else {
                    var f = {};
                    f[c.searchVar] = e, f = a.extend(!0, c.extraParams, f), b.trigger("autocomplete.beforesend"), d = a.get(c.url, f, function (a) {
                        c.useCache && (g[e] = a), b.val() === e && b.trigger("autocomplete.finish", a)
                    }, c.dataType)
                }
            }

            var b = a(this), d, e, f, g = {};
            c.url != null && (b.attr("autocomplete", "off"), b.keyup(function (a) {
                a.preventDefault(), clearTimeout(e), e = setTimeout(function () {
                    clearTimeout(e), i(b.val())
                }, c.delay)
            }), b.blur(function () {
                f = null
            }))
        })
    }
}(jQuery), function (a) {
    a.fn.autosaveField = function (b) {
        var c = a.extend({}, a.fn.autosaveField.defaults, b);
        return this.each(function () {
            var b = a(this), d = b.attr("data-field-type") || ":text", e = b.find(d), f = b.find(".error"), g = b.find(".success"), h = b.attr("data-action"), i = b.attr("data-name"), j = e.val(), k = function (d) {
                e.spin(), a.ajax({url:h, type:"POST", data:{_method:c.method, field:i, value:e.val()}, success:function () {
                    e.stopSpin(), g.show(), j = e.val()
                }, error:function () {
                    e.stopSpin(), b.attr("data-reset-on-error") && e.val(j), f.show()
                }})
            };
            d == ":text" ? (e.blur(function () {
                a(this).val() != j && k()
            }), e.keyup(function () {
                f.hide(), g.hide()
            })) : d == "input[type=checkbox]" && e.change(function () {
                f.hide(), g.hide(), k()
            })
        })
    }, a.fn.autosaveField.defaults = {method:"put"}
}(jQuery), function (a) {
    function c(a) {
        var b = 0;
        if (a.offsetParent)while (a.offsetParent)b += a.offsetLeft, a = a.offsetParent; else a.x && (b += a.x);
        return b
    }

    function b(a) {
        var b = Math.floor(a / 1e3), c = Math.floor(b / 60);
        b = b % 60, b = b < 10 ? "0" + b : b;
        return c + ":" + b
    }

    BaconPlayer = {sound:null, playing:!1, sm2:"/js/soundmanager2.js", flashURL:"/flash/", playOrPause:function (a) {
        this.initSound(a, function () {
            this.playing ? this.pause() : this.play()
        })
    }, play:function () {
        if (!!this.sound) {
            this.playing = !0, this.sound.play(), a(".baconplayer .play, .baconplayer .pause").toggle();
            return"playing"
        }
    }, pause:function () {
        if (!!this.sound) {
            this.playing = !1, this.sound.pause(), a(".baconplayer .play, .baconplayer .pause").toggle();
            return"paused"
        }
    }, initSound:function (b, c) {
        if (!window.soundManager)return a.getScript(this.sm2, function () {
            soundManager.url = BaconPlayer.flashURL, soundManager.debugMode = !1, soundManager.onready(function () {
                BaconPlayer.initSound(b, c)
            })
        });
        this.sound = soundManager.createSound({id:"baconplayer", url:b, whileplaying:function () {
            BaconPlayer.moveProgressBar(this), BaconPlayer.setPositionTiming(this)
        }, whileloading:function () {
            BaconPlayer.moveLoadingBar(this), BaconPlayer.setDurationTiming(this)
        }, onload:function () {
            BaconPlayer.setDurationTiming(this, !0)
        }}), c.call(this)
    }, moveProgressBar:function (b) {
        var c = b.position / b.durationEstimate;
        a(".baconplayer .inner-progress").width(this.progressBar().width() * c)
    }, moveLoadingBar:function (b) {
        var c = b.bytesLoaded / b.bytesTotal;
        a(".baconplayer .loading-progress").width(this.progressBar().width() * c)
    }, setPositionTiming:function (c) {
        var d = b(c.position);
        a(".baconplayer .position").text(d)
    }, setDurationTiming:function (c, d) {
        if (!!d || !this.durationTimingTimer) {
            this.durationTimingTimer = setTimeout(function () {
                BaconPlayer.setDurationTiming(c), BaconPlayer.durationTimingTimer = null
            }, 2e3);
            var e = b(c.durationEstimate);
            a(".baconplayer .duration").text(e)
        }
    }, progressBar:function () {
        return a(".baconplayer .progress")
    }, setPosition:function (a) {
        var b = this.progressBar()[0], d = this.sound, e = parseInt(a.clientX), f = Math.floor((e - c(b) - 4) / b.offsetWidth * d.durationEstimate);
        isNaN(f) || (f = Math.min(f, d.duration)), isNaN(f) || d.setPosition(f)
    }, startDrag:function (a) {
        !this.dragging && !!this.sound && (this.attachDragHandlers(), this.dragging = !0, this.pause(), this.setPosition(a))
    }, drag:function (a) {
        this.setPosition(a)
    }, stopDrag:function (a) {
        this.removeDragHandlers(), this.dragging = !1, this.setPosition(a), this.play()
    }, attachDragHandlers:function () {
        a(document).bind("mousemove.baconplayer", function (a) {
            BaconPlayer.drag(a)
        }), a(document).bind("mouseup.baconplayer", function (a) {
            BaconPlayer.stopDrag(a)
        })
    }, removeDragHandlers:function () {
        a(document).unbind("mousemove.baconplayer"), a(document).unbind("mouseup.baconplayer")
    }}, a(function () {
        a(".baconplayer .play, .baconplayer .pause").click(function () {
            BaconPlayer.playOrPause(this.href);
            return!1
        }), a(".baconplayer .progress").mousedown(function (a) {
            BaconPlayer.startDrag(a)
        })
    })
}(jQuery), function (a) {
    function c(c, d) {
        var e;
        do {
            e = a.curCSS(c, d);
            if (e != "" && e != "transparent" || a.nodeName(c, "body"))break;
            d = "backgroundColor"
        } while (c = c.parentNode);
        return b(e)
    }

    function b(b) {
        var c;
        if (b && b.constructor == Array && b.length == 3)return b;
        if (c = /rgb\(\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*,\s*([0-9]{1,3})\s*\)/.exec(b))return[parseInt(c[1]), parseInt(c[2]), parseInt(c[3])];
        if (c = /rgb\(\s*([0-9]+(?:\.[0-9]+)?)\%\s*,\s*([0-9]+(?:\.[0-9]+)?)\%\s*,\s*([0-9]+(?:\.[0-9]+)?)\%\s*\)/.exec(b))return[parseFloat(c[1]) * 2.55, parseFloat(c[2]) * 2.55, parseFloat(c[3]) * 2.55];
        if (c = /#([a-fA-F0-9]{2})([a-fA-F0-9]{2})([a-fA-F0-9]{2})/.exec(b))return[parseInt(c[1], 16), parseInt(c[2], 16), parseInt(c[3], 16)];
        if (c = /#([a-fA-F0-9])([a-fA-F0-9])([a-fA-F0-9])/.exec(b))return[parseInt(c[1] + c[1], 16), parseInt(c[2] + c[2], 16), parseInt(c[3] + c[3], 16)];
        return d[a.trim(b).toLowerCase()]
    }

    a.each(["backgroundColor", "borderBottomColor", "borderLeftColor", "borderRightColor", "borderTopColor", "color", "outlineColor"], function (d, e) {
        a.fx.step[e] = function (a) {
            a.state == 0 && (a.start = c(a.elem, e), a.end = b(a.end)), a.elem.style[e] = "rgb(" + [Math.max(Math.min(parseInt(a.pos * (a.end[0] - a.start[0]) + a.start[0]), 255), 0), Math.max(Math.min(parseInt(a.pos * (a.end[1] - a.start[1]) + a.start[1]), 255), 0), Math.max(Math.min(parseInt(a.pos * (a.end[2] - a.start[2]) + a.start[2]), 255), 0)].join(",") + ")"
        }
    });
    var d = {aqua:[0, 255, 255], azure:[240, 255, 255], beige:[245, 245, 220], black:[0, 0, 0], blue:[0, 0, 255], brown:[165, 42, 42], cyan:[0, 255, 255], darkblue:[0, 0, 139], darkcyan:[0, 139, 139], darkgrey:[169, 169, 169], darkgreen:[0, 100, 0], darkkhaki:[189, 183, 107], darkmagenta:[139, 0, 139], darkolivegreen:[85, 107, 47], darkorange:[255, 140, 0], darkorchid:[153, 50, 204], darkred:[139, 0, 0], darksalmon:[233, 150, 122], darkviolet:[148, 0, 211], fuchsia:[255, 0, 255], gold:[255, 215, 0], green:[0, 128, 0], indigo:[75, 0, 130], khaki:[240, 230, 140], lightblue:[173, 216, 230], lightcyan:[224, 255, 255], lightgreen:[144, 238, 144], lightgrey:[211, 211, 211], lightpink:[255, 182, 193], lightyellow:[255, 255, 224], lime:[0, 255, 0], magenta:[255, 0, 255], maroon:[128, 0, 0], navy:[0, 0, 128], olive:[128, 128, 0], orange:[255, 165, 0], pink:[255, 192, 203], purple:[128, 0, 128], violet:[128, 0, 128], red:[255, 0, 0], silver:[192, 192, 192], white:[255, 255, 255], yellow:[255, 255, 0]}
}(jQuery), jQuery.cookie = function (a, b, c) {
    if (typeof b == "undefined") {
        var i = null;
        if (document.cookie && document.cookie != "") {
            var j = document.cookie.split(";");
            for (var k = 0; k < j.length; k++) {
                var l = jQuery.trim(j[k]);
                if (l.substring(0, a.length + 1) == a + "=") {
                    i = decodeURIComponent(l.substring(a.length + 1));
                    break
                }
            }
        }
        return i
    }
    c = c || {}, b === null && (b = "", c.expires = -1);
    var d = "";
    if (c.expires && (typeof c.expires == "number" || c.expires.toUTCString)) {
        var e;
        typeof c.expires == "number" ? (e = new Date, e.setTime(e.getTime() + c.expires * 24 * 60 * 60 * 1e3)) : e = c.expires, d = "; expires=" + e.toUTCString()
    }
    var f = c.path ? "; path=" + c.path : "", g = c.domain ? "; domain=" + c.domain : "", h = c.secure ? "; secure" : "";
    document.cookie = [a, "=", encodeURIComponent(b), d, f, g, h].join("")
}, DateInput = function (a) {
    function b(c, d) {
        typeof d != "object" && (d = {}), a.extend(this, b.DEFAULT_OPTS, d), this.input = a(c), this.bindMethodsToObj("show", "hide", "hideIfClickOutside", "keydownHandler", "selectDate"), this.build(), this.selectDate(), this.hide(), this.input.data("datePicker", this)
    }

    b.DEFAULT_OPTS = {month_names:["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"], short_month_names:["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"], short_day_names:["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], start_of_week:1}, b.prototype = {build:function () {
        var b = a('<p class="month_nav"><span class="button prev" title="[Page-Up]">&#171;</span> <span class="month_name"></span> <span class="button next" title="[Page-Down]">&#187;</span></p>');
        this.monthNameSpan = a(".month_name", b), a(".prev", b).click(this.bindToObj(function () {
            this.moveMonthBy(-1)
        })), a(".next", b).click(this.bindToObj(function () {
            this.moveMonthBy(1)
        }));
        var c = a('<p class="year_nav"><span class="button prev" title="[Ctrl+Page-Up]">&#171;</span> <span class="year_name"></span> <span class="button next" title="[Ctrl+Page-Down]">&#187;</span></p>');
        this.yearNameSpan = a(".year_name", c), a(".prev", c).click(this.bindToObj(function () {
            this.moveMonthBy(-12)
        })), a(".next", c).click(this.bindToObj(function () {
            this.moveMonthBy(12)
        }));
        var d = a('<div class="nav"></div>').append(b, c), e = "<table><thead><tr>";
        a(this.adjustDays(this.short_day_names)).each(function () {
            e += "<th>" + this + "</th>"
        }), e += "</tr></thead><tbody></tbody></table>", this.dateSelector = this.rootLayers = a('<div class="date_selector"></div>').append(d, e).insertAfter(this.input), a.browser.msie && a.browser.version < 7 && (this.ieframe = a('<iframe class="date_selector_ieframe" frameborder="0" src="#"></iframe>').insertBefore(this.dateSelector), this.rootLayers = this.rootLayers.add(this.ieframe), a(".button", d).mouseover(function () {
            a(this).addClass("hover")
        }), a(".button", d).mouseout(function () {
            a(this).removeClass("hover")
        })), this.tbody = a("tbody", this.dateSelector), this.input.change(this.bindToObj(function () {
            this.selectDate()
        })), this.selectDate()
    }, selectMonth:function (b) {
        var c = new Date(b.getFullYear(), b.getMonth(), 1);
        if (!this.currentMonth || this.currentMonth.getFullYear() != c.getFullYear() || this.currentMonth.getMonth() != c.getMonth()) {
            this.currentMonth = c;
            var d = this.rangeStart(b), e = this.rangeEnd(b), f = this.daysBetween(d, e), g = "";
            for (var h = 0; h <= f; h++) {
                var i = new Date(d.getFullYear(), d.getMonth(), d.getDate() + h, 12, 0);
                this.isFirstDayOfWeek(i) && (g += "<tr>"), i.getMonth() == b.getMonth() ? g += '<td class="selectable_day" date="' + this.dateToString(i) + '">' + i.getDate() + "</td>" : g += '<td class="unselected_month" date="' + this.dateToString(i) + '">' + i.getDate() + "</td>", this.isLastDayOfWeek(i) && (g += "</tr>")
            }
            this.tbody.empty().append(g), this.monthNameSpan.empty().append(this.monthName(b)), this.yearNameSpan.empty().append(this.currentMonth.getFullYear()), a(".selectable_day", this.tbody).click(this.bindToObj(function (b) {
                this.changeInput(a(b.target).attr("date"))
            })), a("td[date='" + this.dateToString(new Date) + "']", this.tbody).addClass("today"), a("td.selectable_day", this.tbody).mouseover(function () {
                a(this).addClass("hover")
            }), a("td.selectable_day", this.tbody).mouseout(function () {
                a(this).removeClass("hover")
            })
        }
        a(".selected", this.tbody).removeClass("selected"), a('td[date="' + this.selectedDateString + '"]', this.tbody).addClass("selected")
    }, selectDate:function (a) {
        typeof a == "undefined" && (a = this.stringToDate(this.input.val())), a || (a = new Date), this.selectedDate = a, this.selectedDateString = this.dateToString(this.selectedDate), this.selectMonth(this.selectedDate)
    }, changeInput:function (a) {
        this.input.val(a).change(), this.hide()
    }, show:function () {
        this.rootLayers.css("display", "block"), a([window, document.body]).click(this.hideIfClickOutside), this.input.unbind("focus", this.show), this.rootLayers.keydown(this.keydownHandler), this.setPosition()
    }, hide:function () {
        this.rootLayers.css("display", "none"), a([window, document.body]).unbind("click", this.hideIfClickOutside), this.input.focus(this.show), this.rootLayers.unbind("keydown", this.keydownHandler)
    }, hideIfClickOutside:function (a) {
        a.target != this.input[0] && !this.insideSelector(a) && this.hide()
    }, insideSelector:function (a) {
        var b = this.dateSelector.position();
        b.right = b.left + this.dateSelector.outerWidth(), b.bottom = b.top + this.dateSelector.outerHeight();
        return a.pageY < b.bottom && a.pageY > b.top && a.pageX < b.right && a.pageX > b.left
    }, keydownHandler:function (a) {
        switch (a.keyCode) {
            case 9:
            case 27:
                this.hide();
                return;
            case 13:
                this.changeInput(this.selectedDateString);
                break;
            case 33:
                this.moveDateMonthBy(a.ctrlKey ? -12 : -1);
                break;
            case 34:
                this.moveDateMonthBy(a.ctrlKey ? 12 : 1);
                break;
            case 38:
                this.moveDateBy(-7);
                break;
            case 40:
                this.moveDateBy(7);
                break;
            case 37:
                this.moveDateBy(-1);
                break;
            case 39:
                this.moveDateBy(1);
                break;
            default:
                return
        }
        a.preventDefault()
    }, stringToDate:function (a) {
        var b;
        return(b = a.match(/^(\d{1,2}) ([^\s]+) (\d{4,4})$/)) ? new Date(b[3], this.shortMonthNum(b[2]), b[1], 12, 0) : null
    }, dateToString:function (a) {
        return a.getDate() + " " + this.short_month_names[a.getMonth()] + " " + a.getFullYear()
    }, setPosition:function () {
        var a = this.input.offset();
        this.rootLayers.css({top:a.top + this.input.outerHeight(), left:a.left}), this.ieframe && this.ieframe.css({width:this.dateSelector.outerWidth(), height:this.dateSelector.outerHeight()})
    }, moveDateBy:function (a) {
        var b = new Date(this.selectedDate.getFullYear(), this.selectedDate.getMonth(), this.selectedDate.getDate() + a);
        this.selectDate(b)
    }, moveDateMonthBy:function (a) {
        var b = new Date(this.selectedDate.getFullYear(), this.selectedDate.getMonth() + a, this.selectedDate.getDate());
        b.getMonth() == this.selectedDate.getMonth() + a + 1 && b.setDate(0), this.selectDate(b)
    }, moveMonthBy:function (a) {
        var b = new Date(this.currentMonth.getFullYear(), this.currentMonth.getMonth() + a, this.currentMonth.getDate());
        this.selectMonth(b)
    }, monthName:function (a) {
        return this.month_names[a.getMonth()]
    }, bindToObj:function (a) {
        var b = this;
        return function () {
            return a.apply(b, arguments)
        }
    }, bindMethodsToObj:function () {
        for (var a = 0; a < arguments.length; a++)this[arguments[a]] = this.bindToObj(this[arguments[a]])
    }, indexFor:function (a, b) {
        for (var c = 0; c < a.length; c++)if (b == a[c])return c
    }, monthNum:function (a) {
        return this.indexFor(this.month_names, a)
    }, shortMonthNum:function (a) {
        return this.indexFor(this.short_month_names, a)
    }, shortDayNum:function (a) {
        return this.indexFor(this.short_day_names, a)
    }, daysBetween:function (a, b) {
        a = Date.UTC(a.getFullYear(), a.getMonth(), a.getDate()), b = Date.UTC(b.getFullYear(), b.getMonth(), b.getDate());
        return(b - a) / 864e5
    }, changeDayTo:function (a, b, c) {
        var d = c * (Math.abs(b.getDay() - a - c * 7) % 7);
        return new Date(b.getFullYear(), b.getMonth(), b.getDate() + d)
    }, rangeStart:function (a) {
        return this.changeDayTo(this.start_of_week, new Date(a.getFullYear(), a.getMonth()), -1)
    }, rangeEnd:function (a) {
        return this.changeDayTo((this.start_of_week - 1) % 7, new Date(a.getFullYear(), a.getMonth() + 1, 0), 1)
    }, isFirstDayOfWeek:function (a) {
        return a.getDay() == this.start_of_week
    }, isLastDayOfWeek:function (a) {
        return a.getDay() == (this.start_of_week - 1) % 7
    }, adjustDays:function (a) {
        var b = [];
        for (var c = 0; c < a.length; c++)b[c] = a[(c + this.start_of_week) % 7];
        return b
    }}, a.fn.date_input = function (a) {
        return this.each(function () {
            new b(this, a)
        })
    }, a.date_input = {initialize:function (b) {
        a("input.date_input").date_input(b)
    }};
    return b
}(jQuery), jQuery.easing.jswing = jQuery.easing.swing, jQuery.extend(jQuery.easing, {def:"easeOutQuad", swing:function (a, b, c, d, e) {
    return jQuery.easing[jQuery.easing.def](a, b, c, d, e)
}, easeInQuad:function (a, b, c, d, e) {
    return d * (b /= e) * b + c
}, easeOutQuad:function (a, b, c, d, e) {
    return-d * (b /= e) * (b - 2) + c
}, easeInOutQuad:function (a, b, c, d, e) {
    if ((b /= e / 2) < 1)return d / 2 * b * b + c;
    return-d / 2 * (--b * (b - 2) - 1) + c
}, easeInCubic:function (a, b, c, d, e) {
    return d * (b /= e) * b * b + c
}, easeOutCubic:function (a, b, c, d, e) {
    return d * ((b = b / e - 1) * b * b + 1) + c
}, easeInOutCubic:function (a, b, c, d, e) {
    if ((b /= e / 2) < 1)return d / 2 * b * b * b + c;
    return d / 2 * ((b -= 2) * b * b + 2) + c
}, easeInQuart:function (a, b, c, d, e) {
    return d * (b /= e) * b * b * b + c
}, easeOutQuart:function (a, b, c, d, e) {
    return-d * ((b = b / e - 1) * b * b * b - 1) + c
}, easeInOutQuart:function (a, b, c, d, e) {
    if ((b /= e / 2) < 1)return d / 2 * b * b * b * b + c;
    return-d / 2 * ((b -= 2) * b * b * b - 2) + c
}, easeInQuint:function (a, b, c, d, e) {
    return d * (b /= e) * b * b * b * b + c
}, easeOutQuint:function (a, b, c, d, e) {
    return d * ((b = b / e - 1) * b * b * b * b + 1) + c
}, easeInOutQuint:function (a, b, c, d, e) {
    if ((b /= e / 2) < 1)return d / 2 * b * b * b * b * b + c;
    return d / 2 * ((b -= 2) * b * b * b * b + 2) + c
}, easeInSine:function (a, b, c, d, e) {
    return-d * Math.cos(b / e * (Math.PI / 2)) + d + c
}, easeOutSine:function (a, b, c, d, e) {
    return d * Math.sin(b / e * (Math.PI / 2)) + c
}, easeInOutSine:function (a, b, c, d, e) {
    return-d / 2 * (Math.cos(Math.PI * b / e) - 1) + c
}, easeInExpo:function (a, b, c, d, e) {
    return b == 0 ? c : d * Math.pow(2, 10 * (b / e - 1)) + c
}, easeOutExpo:function (a, b, c, d, e) {
    return b == e ? c + d : d * (-Math.pow(2, -10 * b / e) + 1) + c
}, easeInOutExpo:function (a, b, c, d, e) {
    if (b == 0)return c;
    if (b == e)return c + d;
    if ((b /= e / 2) < 1)return d / 2 * Math.pow(2, 10 * (b - 1)) + c;
    return d / 2 * (-Math.pow(2, -10 * --b) + 2) + c
}, easeInCirc:function (a, b, c, d, e) {
    return-d * (Math.sqrt(1 - (b /= e) * b) - 1) + c
}, easeOutCirc:function (a, b, c, d, e) {
    return d * Math.sqrt(1 - (b = b / e - 1) * b) + c
}, easeInOutCirc:function (a, b, c, d, e) {
    if ((b /= e / 2) < 1)return-d / 2 * (Math.sqrt(1 - b * b) - 1) + c;
    return d / 2 * (Math.sqrt(1 - (b -= 2) * b) + 1) + c
}, easeInElastic:function (a, b, c, d, e) {
    var f = 1.70158, g = 0, h = d;
    if (b == 0)return c;
    if ((b /= e) == 1)return c + d;
    g || (g = e * .3);
    if (h < Math.abs(d)) {
        h = d;
        var f = g / 4
    } else var f = g / (2 * Math.PI) * Math.asin(d / h);
    return-(h * Math.pow(2, 10 * (b -= 1)) * Math.sin((b * e - f) * 2 * Math.PI / g)) + c
}, easeOutElastic:function (a, b, c, d, e) {
    var f = 1.70158, g = 0, h = d;
    if (b == 0)return c;
    if ((b /= e) == 1)return c + d;
    g || (g = e * .3);
    if (h < Math.abs(d)) {
        h = d;
        var f = g / 4
    } else var f = g / (2 * Math.PI) * Math.asin(d / h);
    return h * Math.pow(2, -10 * b) * Math.sin((b * e - f) * 2 * Math.PI / g) + d + c
}, easeInOutElastic:function (a, b, c, d, e) {
    var f = 1.70158, g = 0, h = d;
    if (b == 0)return c;
    if ((b /= e / 2) == 2)return c + d;
    g || (g = e * .3 * 1.5);
    if (h < Math.abs(d)) {
        h = d;
        var f = g / 4
    } else var f = g / (2 * Math.PI) * Math.asin(d / h);
    if (b < 1)return-0.5 * h * Math.pow(2, 10 * (b -= 1)) * Math.sin((b * e - f) * 2 * Math.PI / g) + c;
    return h * Math.pow(2, -10 * (b -= 1)) * Math.sin((b * e - f) * 2 * Math.PI / g) * .5 + d + c
}, easeInBack:function (a, b, c, d, e, f) {
    f == undefined && (f = 1.70158);
    return d * (b /= e) * b * ((f + 1) * b - f) + c
}, easeOutBack:function (a, b, c, d, e, f) {
    f == undefined && (f = 1.70158);
    return d * ((b = b / e - 1) * b * ((f + 1) * b + f) + 1) + c
}, easeInOutBack:function (a, b, c, d, e, f) {
    f == undefined && (f = 1.70158);
    if ((b /= e / 2) < 1)return d / 2 * b * b * (((f *= 1.525) + 1) * b - f) + c;
    return d / 2 * ((b -= 2) * b * (((f *= 1.525) + 1) * b + f) + 2) + c
}, easeInBounce:function (a, b, c, d, e) {
    return d - jQuery.easing.easeOutBounce(a, e - b, 0, d, e) + c
}, easeOutBounce:function (a, b, c, d, e) {
    return(b /= e) < 1 / 2.75 ? d * 7.5625 * b * b + c : b < 2 / 2.75 ? d * (7.5625 * (b -= 1.5 / 2.75) * b + .75) + c : b < 2.5 / 2.75 ? d * (7.5625 * (b -= 2.25 / 2.75) * b + .9375) + c : d * (7.5625 * (b -= 2.625 / 2.75) * b + .984375) + c
}, easeInOutBounce:function (a, b, c, d, e) {
    if (b < e / 2)return jQuery.easing.easeInBounce(a, b * 2, 0, d, e) * .5 + c;
    return jQuery.easing.easeOutBounce(a, b * 2 - e, 0, d, e) * .5 + d * .5 + c
}}), function (a) {
    function k() {
        if (!i()) {
            a("#facebox_overlay").fadeOut(200, function () {
                a("#facebox_overlay").removeClass("facebox_overlayBG"), a("#facebox_overlay").addClass("facebox_hide"), a("#facebox_overlay").remove()
            });
            return!1
        }
    }

    function j() {
        if (!i()) {
            a("#facebox_overlay").length == 0 && a("body").append('<div id="facebox_overlay" class="facebox_hide"></div>'), a("#facebox_overlay").hide().addClass("facebox_overlayBG").css("opacity", a.facebox.settings.opacity).click(
                function () {
                    a(document).trigger("close.facebox")
                }).fadeIn(200);
            return!1
        }
    }

    function i() {
        return a.facebox.settings.overlay == !1 || a.facebox.settings.opacity === null
    }

    function h(b, c) {
        a.get(b, function (b) {
            a.facebox.reveal(b, c)
        })
    }

    function g(b, c) {
        var d = new Image;
        d.onload = function () {
            a.facebox.reveal('<div class="image"><img src="' + d.src + '" /></div>', c)
        }, d.src = b
    }

    function f(b, c) {
        if (b.match(/#/)) {
            var d = window.location.href.split("#")[0], e = b.replace(d, "");
            if (e == "#")return;
            a.facebox.reveal(a(e).html(), c)
        } else b.match(a.facebox.settings.imageTypesRegexp) ? g(b, c) : h(b, c)
    }

    function e() {
        var b = a.facebox.settings;
        b.loadingImage = b.loading_image || b.loadingImage, b.closeImage = b.close_image || b.closeImage, b.imageTypes = b.image_types || b.imageTypes, b.faceboxHtml = b.facebox_html || b.faceboxHtml
    }

    function d() {
        var a;
        self.innerHeight ? a = self.innerHeight : document.documentElement && document.documentElement.clientHeight ? a = document.documentElement.clientHeight : document.body && (a = document.body.clientHeight);
        return a
    }

    function c() {
        var a, b;
        self.pageYOffset ? (b = self.pageYOffset, a = self.pageXOffset) : document.documentElement && document.documentElement.scrollTop ? (b = document.documentElement.scrollTop, a = document.documentElement.scrollLeft) : document.body && (b = document.body.scrollTop, a = document.body.scrollLeft);
        return[a, b]
    }

    function b(b) {
        if (a.facebox.settings.inited)return!0;
        a.facebox.settings.inited = !0, a(document).trigger("init.facebox"), e();
        var c = a.facebox.settings.imageTypes.join("|");
        a.facebox.settings.imageTypesRegexp = new RegExp(".(" + c + ")$", "i"), b && a.extend(a.facebox.settings, b), a("body").append(a.facebox.settings.faceboxHtml);
        var d = [new Image, new Image];
        d[0].src = a.facebox.settings.closeImage, d[1].src = a.facebox.settings.loadingImage, a("#facebox").find(".b:first, .bl").each(function () {
            d.push(new Image), d.slice(-1).src = a(this).css("background-image").replace(/url\((.+)\)/, "$1")
        }), a("#facebox .close").click(a.facebox.close).append('<img src="' + a.facebox.settings.closeImage + '" class="close_image" title="close">')
    }

    a.facebox = function (b, c) {
        a.facebox.loading(), b.ajax ? h(b.ajax, c) : b.image ? g(b.image, c) : b.div ? f(b.div, c) : a.isFunction(b) ? b.call(a) : a.facebox.reveal(b, c)
    }, a.extend(a.facebox, {settings:{opacity:.2, overlay:!0, loadingImage:"/facebox/loading.gif", closeImage:"/facebox/closelabel.png", imageTypes:["png", "jpg", "jpeg", "gif"], faceboxHtml:'\n    <div id="facebox" style="display:none;"> \n      <div class="popup"> \n        <div class="content"> \n        </div> \n        <a href="#" class="close"></a> \n      </div> \n    </div>'}, loading:function () {
        b();
        if (a("#facebox .loading").length == 1)return!0;
        j(), a("#facebox .content").empty().append('<div class="loading"><img src="' + a.facebox.settings.loadingImage + '"/></div>'), a("#facebox").show().css({top:c()[1] + d() / 10, left:a(window).width() / 2 - a("#facebox .popup").outerWidth() / 2}), a(document).bind("keydown.facebox", function (b) {
            b.keyCode == 27 && a.facebox.close();
            return!0
        }), a(document).trigger("loading.facebox")
    }, reveal:function (b, c) {
        a(document).trigger("beforeReveal.facebox"), c && a("#facebox .content").addClass(c), a("#facebox .content").append(b), a("#facebox .loading").remove(), a("#facebox .popup").children().fadeIn("normal"), a("#facebox").css("left", a(window).width() / 2 - a("#facebox .popup").outerWidth() / 2), a(document).trigger("reveal.facebox").trigger("afterReveal.facebox")
    }, close:function () {
        a(document).trigger("close.facebox");
        return!1
    }}), a.fn.facebox = function (c) {
        function d() {
            a.facebox.loading(!0);
            var b = this.rel.match(/facebox\[?\.(\w+)\]?/);
            b && (b = b[1]), f(this.href, b);
            return!1
        }

        if (a(this).length != 0) {
            b(c);
            return this.bind("click.facebox", d)
        }
    }, a(document).bind("close.facebox", function () {
        a(document).unbind("keydown.facebox"), a("#facebox").fadeOut(function () {
            a("#facebox .content").removeClass().addClass("content"), a("#facebox .loading").remove(), a(document).trigger("afterClose.facebox")
        }), k()
    })
}(jQuery), function (a) {
    a.fn.fancyplace = function (b) {
        var c = a.extend({}, a.fn.fancyplace.defaults, b);
        return this.each(function () {
            var b = a(this).hide(), c = a("#" + b.attr("for"));
            c.focus(function () {
                b.hide()
            }), c.blur(function () {
                a.trim(c.val()) == "" && b.show()
            }), c.blur()
        })
    }, a.fn.fancyplace.defaults = {}
}(jQuery), function ($) {
    function submitHandler() {
        var a = this.formPluginId, b = $.fn.ajaxForm.optionHash[a];
        $(this).ajaxSubmit(b);
        return!1
    }

    function clickHandler(a) {
        var b = this.form;
        b.clk = this;
        if (this.type == "image")if (a.offsetX != undefined)b.clk_x = a.offsetX, b.clk_y = a.offsetY; else if (typeof $.fn.offset == "function") {
            var c = $(this).offset();
            b.clk_x = a.pageX - c.left, b.clk_y = a.pageY - c.top
        } else b.clk_x = a.pageX - this.offsetLeft, b.clk_y = a.pageY - this.offsetTop;
        setTimeout(function () {
            b.clk = b.clk_x = b.clk_y = null
        }, 10)
    }

    $.fn.ajaxSubmit = function (options) {
        function fileUpload() {
            function toXml(a, b) {
                window.ActiveXObject ? (b = new ActiveXObject("Microsoft.XMLDOM"), b.async = "false", b.loadXML(a)) : b = (new DOMParser).parseFromString(a, "text/xml");
                return b && b.documentElement && b.documentElement.tagName != "parsererror" ? b : null
            }

            function cb() {
                if (!(cbInvoked++)) {
                    io.detachEvent ? io.detachEvent("onload", cb) : io.removeEventListener("load", cb, !1);
                    var ok = !0;
                    try {
                        if (timedOut)throw"timeout";
                        var data, doc;
                        doc = io.contentWindow ? io.contentWindow.document : io.contentDocument ? io.contentDocument : io.document, xhr.responseText = doc.body ? doc.body.innerHTML : null, xhr.responseXML = doc.XMLDocument ? doc.XMLDocument : doc;
                        if (opts.dataType == "json" || opts.dataType == "script") {
                            var ta = doc.getElementsByTagName("textarea")[0];
                            data = ta ? ta.value : xhr.responseText, opts.dataType == "json" ? eval("data = " + data) : $.globalEval(data)
                        } else opts.dataType == "xml" ? (data = xhr.responseXML, !data && xhr.responseText != null && (data = toXml(xhr.responseText))) : data = xhr.responseText
                    } catch (e) {
                        ok = !1, $.handleError(opts, xhr, "error", e)
                    }
                    ok && (opts.success(data, "success"), g && $.event.trigger("ajaxSuccess", [xhr, opts])), g && $.event.trigger("ajaxComplete", [xhr, opts]), g && !--$.active && $.event.trigger("ajaxStop"), opts.complete && opts.complete(xhr, ok ? "success" : "error"), setTimeout(function () {
                        $io.remove(), xhr.responseXML = null
                    }, 100)
                }
            }

            var form = $form[0], opts = $.extend({}, $.ajaxSettings, options), id = "jqFormIO" + $.fn.ajaxSubmit.counter++, $io = $('<iframe id="' + id + '" name="' + id + '" />'), io = $io[0], op8 = $.browser.opera && window.opera.version() < 9;
            if ($.browser.msie || op8)io.src = 'javascript:false;document.write("");';
            $io.css({position:"absolute", top:"-1000px", left:"-1000px"});
            var xhr = {responseText:null, responseXML:null, status:0, statusText:"n/a", getAllResponseHeaders:function () {
            }, getResponseHeader:function () {
            }, setRequestHeader:function () {
            }}, g = opts.global;
            g && !($.active++) && $.event.trigger("ajaxStart"), g && $.event.trigger("ajaxSend", [xhr, opts]);
            var cbInvoked = 0, timedOut = 0;
            setTimeout(function () {
                var a = form.encoding ? "encoding" : "enctype", b = $form.attr("target"), c = $form.attr("action");
                $form.attr({target:id, method:"POST", action:opts.url}), form[a] = "multipart/form-data", opts.timeout && setTimeout(function () {
                    timedOut = !0, cb()
                }, opts.timeout), $io.appendTo("body"), io.attachEvent ? io.attachEvent("onload", cb) : io.addEventListener("load", cb, !1), form.submit(), $form.attr({action:c, target:b})
            }, 10)
        }

        typeof options == "function" && (options = {success:options}), options = $.extend({url:this.attr("action") || window.location.toString(), type:this.attr("method") || "GET"}, options || {});
        var veto = {};
        $.event.trigger("form.pre.serialize", [this, options, veto]);
        if (veto.veto)return this;
        var a = this.formToArray(options.semantic);
        if (options.data)for (var n in options.data)a.push({name:n, value:options.data[n]});
        if (options.beforeSubmit && options.beforeSubmit(a, this, options) === !1)return this;
        $.event.trigger("form.submit.validate", [a, this, options, veto]);
        if (veto.veto)return this;
        var q = $.param(a);
        options.type.toUpperCase() == "GET" ? (options.url += (options.url.indexOf("?") >= 0 ? "&" : "?") + q, options.data = null) : options.data = q;
        var $form = this, callbacks = [];
        options.resetForm && callbacks.push(function () {
            $form.resetForm()
        }), options.clearForm && callbacks.push(function () {
            $form.clearForm()
        });
        if (!options.dataType && options.target) {
            var oldSuccess = options.success || function () {
            };
            callbacks.push(function (a) {
                this.evalScripts ? $(options.target).attr("innerHTML", a).evalScripts().each(oldSuccess, arguments) : $(options.target).html(a).each(oldSuccess, arguments)
            })
        } else options.success && callbacks.push(options.success);
        options.success = function (a, b) {
            for (var c = 0, d = callbacks.length; c < d; c++)callbacks[c](a, b, $form)
        };
        var files = $("input:file", this).fieldValue(), found = !1;
        for (var j = 0; j < files.length; j++)files[j] && (found = !0);
        options.iframe || found ? $.browser.safari && options.closeKeepAlive ? $.get(options.closeKeepAlive, fileUpload) : fileUpload() : $.ajax(options), $.event.trigger("form.submit.notify", [this, options]);
        return this
    }, $.fn.ajaxSubmit.counter = 0, $.fn.ajaxForm = function (a) {
        return this.ajaxFormUnbind().submit(submitHandler).each(function () {
            this.formPluginId = $.fn.ajaxForm.counter++, $.fn.ajaxForm.optionHash[this.formPluginId] = a, $(":submit,input:image", this).click(clickHandler)
        })
    }, $.fn.ajaxForm.counter = 1, $.fn.ajaxForm.optionHash = {}, $.fn.ajaxFormUnbind = function () {
        this.unbind("submit", submitHandler);
        return this.each(function () {
            $(":submit,input:image", this).unbind("click", clickHandler)
        })
    }, $.fn.formToArray = function (a) {
        var b = [];
        if (this.length == 0)return b;
        var c = this[0], d = a ? c.getElementsByTagName("*") : c.elements;
        if (!d)return b;
        for (var e = 0, f = d.length; e < f; e++) {
            var g = d[e], h = g.name;
            if (!h)continue;
            if (a && c.clk && g.type == "image") {
                !g.disabled && c.clk == g && b.push({name:h + ".x", value:c.clk_x}, {name:h + ".y", value:c.clk_y});
                continue
            }
            var i = $.fieldValue(g, !0);
            if (i && i.constructor == Array)for (var j = 0, k = i.length; j < k; j++)b.push({name:h, value:i[j]}); else i !== null && typeof i != "undefined" && b.push({name:h, value:i})
        }
        if (!a && c.clk) {
            var l = c.getElementsByTagName("input");
            for (var e = 0, f = l.length; e < f; e++) {
                var m = l[e], h = m.name;
                h && !m.disabled && m.type == "image" && c.clk == m && b.push({name:h + ".x", value:c.clk_x}, {name:h + ".y", value:c.clk_y})
            }
        }
        return b
    }, $.fn.formSerialize = function (a) {
        return $.param(this.formToArray(a))
    }, $.fn.fieldSerialize = function (a) {
        var b = [];
        this.each(function () {
            var c = this.name;
            if (!!c) {
                var d = $.fieldValue(this, a);
                if (d && d.constructor == Array)for (var e = 0, f = d.length; e < f; e++)b.push({name:c, value:d[e]}); else d !== null && typeof d != "undefined" && b.push({name:this.name, value:d})
            }
        });
        return $.param(b)
    }, $.fn.fieldValue = function (a) {
        for (var b = [], c = 0, d = this.length; c < d; c++) {
            var e = this[c], f = $.fieldValue(e, a);
            if (f === null || typeof f == "undefined" || f.constructor == Array && !f.length)continue;
            f.constructor == Array ? $.merge(b, f) : b.push(f)
        }
        return b
    }, $.fieldValue = function (a, b) {
        var c = a.name, d = a.type, e = a.tagName.toLowerCase();
        typeof b == "undefined" && (b = !0);
        if (b && (!c || a.disabled || d == "reset" || d == "button" || (d == "checkbox" || d == "radio") && !a.checked || (d == "submit" || d == "image") && a.form && a.form.clk != a || e == "select" && a.selectedIndex == -1))return null;
        if (e == "select") {
            var f = a.selectedIndex;
            if (f < 0)return null;
            var g = [], h = a.options, i = d == "select-one", j = i ? f + 1 : h.length;
            for (var k = i ? f : 0; k < j; k++) {
                var l = h[k];
                if (l.selected) {
                    var m = $.browser.msie && !l.attributes.value.specified ? l.text : l.value;
                    if (i)return m;
                    g.push(m)
                }
            }
            return g
        }
        return a.value
    }, $.fn.clearForm = function () {
        return this.each(function () {
            $("input,select,textarea", this).clearFields()
        })
    }, $.fn.clearFields = $.fn.clearInputs = function () {
        return this.each(function () {
            var a = this.type, b = this.tagName.toLowerCase();
            a == "text" || a == "password" || b == "textarea" ? this.value = "" : a == "checkbox" || a == "radio" ? this.checked = !1 : b == "select" && (this.selectedIndex = -1)
        })
    }, $.fn.resetForm = function () {
        return this.each(function () {
            (typeof this.reset == "function" || typeof this.reset == "object" && !this.reset.nodeType) && this.reset()
        })
    }, $.fn.enable = function (a) {
        a == undefined && (a = !0);
        return this.each(function () {
            this.disabled = !a
        })
    }, $.fn.select = function (a) {
        a == undefined && (a = !0);
        return this.each(function () {
            var b = this.type;
            if (b == "checkbox" || b == "radio")this.checked = a; else if (this.tagName.toLowerCase() == "option") {
                var c = $(this).parent("select");
                a && c[0] && c[0].type == "select-one" && c.find("option").select(!1), this.selected = a
            }
        })
    }
}(jQuery), function (a) {
    a.fn.gfmPreview = function (b) {
        b = b || {};
        var c = a("<div>").attr("class", "gfm-preview").text("Preview goes here"), d = this;
        d.after(c);
        var e = !1;
        d.keyup(function () {
            e = !0
        }), setInterval(function () {
            if (e) {
                e = !1;
                var b = d.val();
                a.post("/preview", {text:b}, function (a) {
                    c.html(a)
                })
            }
        }, 2e3)
    }
}(jQuery), function (a) {
    a.fn.gfmPreview = function (b) {
        var c = a.extend({}, a.fn.gfmPreview.defaults, b);
        return this.each(function () {
            var b = !1, d = a(this), e = a("<div>").attr("class", "gfm-preview").text("Preview goes here"), f = c.outputContainer || e;
            c.outputContainer == null && d.after(e);
            var g = !1;
            d.keyup(function () {
                g = !0, b || (c.onInit.call(this), b = !0)
            });
            var h = setInterval(function () {
                if (g) {
                    g = !1;
                    var b = d.val();
                    a.post("/preview", {text:b}, function (a) {
                        f.html(a)
                    })
                }
            }, c.refresh)
        })
    }, a.fn.gfmPreview.defaults = {outputContainer:null, refresh:2e3, onInit:function () {
    }}
}(jQuery), function (a) {
    a.fn.assigneeFilter = function (b) {
        function f(a) {
            c.find(".current").removeClass("current"), c.find(":checked").removeAttr("checked"), a.addClass("current"), a.find(":radio").attr("checked", "checked")
        }

        var c = this, d = c.find("li"), e = d.map(function () {
            return a(this).text().toLowerCase()
        });
        c.find(".js-assignee-filter-submit").live("click", function (a) {
            b(a), a.preventDefault()
        }), c.find(".js-assignee-filter").keydown(
            function (a) {
                switch (a.which) {
                    case 9:
                    case 38:
                    case 40:
                        return!1;
                    case 13:
                        b(a);
                        return!1
                }
            }).keyup(function (b) {
            c.find(".selected").removeClass("selected");
            var g = c.find(".current:visible"), h = null;
            switch (b.which) {
                case 9:
                case 16:
                case 17:
                case 18:
                case 91:
                case 93:
                case 13:
                    c.find(".current label").trigger("click");
                    return!1;
                case 38:
                case 40:
                    if (g.length == 0) {
                        f(c.find("li:visible:first"));
                        return!1
                    }
                    h = b.which == 38 ? g.prevAll(":visible:first") : g.nextAll(":visible:first"), h.length && f(h);
                    return!1
            }
            var i = a.trim(a(this).val().toLowerCase()), j = [];
            if (!i) {
                c.find(".current").removeClass("current");
                return d.show()
            }
            d.hide(), e.each(function (a) {
                var b = this.score(i);
                b > 0 && j.push([b, a])
            }), a.each(j.sort(function (a, b) {
                return b[0] - a[0]
            }), function () {
                a(d[this[1]]).show()
            }), c.find(".current:visible").length == 0 && f(c.find("li:visible:first"))
        });
        return c
    }
}(jQuery), function (a) {
    a.fn.cardsSelect = function (b) {
        var c = a.extend({}, a.fn.cardsSelect.defaults, b);
        return this.each(function () {
            var b = a(this), c = b.next("dl.form").find("input[type=text]"), d = b.find(".card"), e = b.find("input[name='billing[type]']"), f = function (b) {
                d.each(function () {
                    var c = a(this);
                    c.attr("data-name") == b ? c.removeClass("disabled") : c.addClass("disabled"), e.val(b)
                })
            };
            c.bind("keyup blur",
                function () {
                    var b = a(this).val();
                    b.match(/^5[1-5]/) ? f("master") : b.match(/^4/) ? f("visa") : b.match(/^3(4|7)/) ? f("american_express") : b.match(/^6011/) ? f("discover") : b.match(/^(3|2131|1800)/) ? f("jcb") : b.match(/^(30[0-5]|36|38)/) ? f("diners") : (d.removeClass("disabled"), e.val(""))
                }).keyup()
        })
    }, a.fn.cardsSelect.defaults = {}
}(jQuery), $.fn.contextButton = function (a, b) {
    return $(this).delegate(a, "click", function (a) {
        var c = $(this), d = $.extend({contextPaneSelector:c.attr("data-context-pane"), anchorTo:"left"}, b), e = $(d.contextPaneSelector), f = function () {
            $(document).unbind("keydown.context-button"), $("#context-overlay").remove(), e.hide(), c.removeClass("selected")
        };
        if (e.is(":visible"))f(); else {
            var g = c.offset(), h;
            d.anchorTo == "left" ? h = {left:g.left, top:g.top + c.outerHeight(!0) + 5} : d.anchorTo == "right" && (h = {left:g.left - (e.outerWidth(!0) - c.outerWidth(!0)), top:g.top + c.outerHeight(!0) + 5}), e.css(h), $(document).bind("keydown.context-button", function (a) {
                a.keyCode == 27 && c.click()
            }), $("body").append('<div id="context-overlay"></div>'), $("#context-overlay").click(f).css("position", "fixed").css("top", 0).css("left", 0).css("height", "100%").css("width", "100%"), e.show(), c.addClass("selected"), c.trigger("show.context-button")
        }
        e.find("a.close").live("click", f), e.bind("close.context-button", f)
    })
}, $(document).contextButton(".js-context-button"), function (a) {
    function b(a) {
        var b = a.toString(10);
        return Array(2 - b.length + 1).join("0") + b
    }

    a.toISO8601 = function (a) {
        return a.getUTCFullYear() + "-" + b(a.getUTCMonth() + 1) + "-" + b(a.getUTCDate()) + "T" + b(a.getUTCHours()) + ":" + b(a.getUTCMinutes()) + ":" + b(a.getUTCSeconds())
    }, a.parseISO8601 = function (a) {
        a = (a || "").replace(/-/, "/").replace(/-/, "/").replace(/T/, " ").replace(/Z/, " UTC").replace(/([\+-]\d\d)\:?(\d\d)/, " $1$2");
        var b = new Date(a);
        return isNaN(b) ? null : b
    };
    var c = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], d = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"], e = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"], f = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    a.strftime = function (a, g) {
        var h = a.getDay(), i = a.getMonth(), j = a.getHours(), k = a.getMinutes();
        return g.replace(/\%([aAbBcdHImMpSwyY])/g, function (g) {
            switch (g.substr(1, 1)) {
                case"a":
                    return c[h];
                case"A":
                    return d[h];
                case"b":
                    return e[i];
                case"B":
                    return f[i];
                case"c":
                    return a.toString();
                case"d":
                    return b(a.getDate());
                case"H":
                    return b(j);
                case"I":
                    return b((j + 12) % 12);
                case"m":
                    return b(i + 1);
                case"M":
                    return b(k);
                case"p":
                    return j > 12 ? "PM" : "AM";
                case"S":
                    return b(a.getSeconds());
                case"w":
                    return h;
                case"y":
                    return b(a.getFullYear() % 100);
                case"Y":
                    return a.getFullYear().toString()
            }
        })
    }, a.distanceOfTimeInWords = function (b, c) {
        c || (c = new Date);
        var d = parseInt((c.getTime() - b.getTime()) / 1e3);
        if (d < 60)return"just now";
        if (d < 120)return"about a minute ago";
        if (d < 2700)return parseInt(d / 60).toString() + " minutes ago";
        if (d < 7200)return"about an hour ago";
        if (d < 86400)return"about " + parseInt(d / 3600).toString() + " hours ago";
        if (d < 172800)return"1 day ago";
        var e = parseInt(d / 86400).toString();
        return e > 5 ? a.strftime(b, "%B %d, %Y") : e + " days ago"
    }
}(jQuery), function (a, b) {
    function c(b) {
        return!a(b).parents().andSelf().filter(
            function () {
                return a.curCSS(this, "visibility") === "hidden" || a.expr.filters.hidden(this)
            }).length
    }

    a.ui = a.ui || {}, a.ui.version || (a.extend(a.ui, {version:"1.8.10", keyCode:{ALT:18, BACKSPACE:8, CAPS_LOCK:20, COMMA:188, COMMAND:91, COMMAND_LEFT:91, COMMAND_RIGHT:93, CONTROL:17, DELETE:46, DOWN:40, END:35, ENTER:13, ESCAPE:27, HOME:36, INSERT:45, LEFT:37, MENU:93, NUMPAD_ADD:107, NUMPAD_DECIMAL:110, NUMPAD_DIVIDE:111, NUMPAD_ENTER:108, NUMPAD_MULTIPLY:106, NUMPAD_SUBTRACT:109, PAGE_DOWN:34, PAGE_UP:33, PERIOD:190, RIGHT:39, SHIFT:16, SPACE:32, TAB:9, UP:38, WINDOWS:91}}), a.fn.extend({_focus:a.fn.focus, focus:function (b, c) {
        return typeof b == "number" ? this.each(function () {
            var d = this;
            setTimeout(function () {
                a(d).focus(), c && c.call(d)
            }, b)
        }) : this._focus.apply(this, arguments)
    }, scrollParent:function () {
        var b;
        b = a.browser.msie && /(static|relative)/.test(this.css("position")) || /absolute/.test(this.css("position")) ? this.parents().filter(
            function () {
                return/(relative|absolute|fixed)/.test(a.curCSS(this, "position", 1)) && /(auto|scroll)/.test(a.curCSS(this, "overflow", 1) + a.curCSS(this, "overflow-y", 1) + a.curCSS(this, "overflow-x", 1))
            }).eq(0) : this.parents().filter(
            function () {
                return/(auto|scroll)/.test(a.curCSS(this, "overflow", 1) + a.curCSS(this, "overflow-y", 1) + a.curCSS(this, "overflow-x", 1))
            }).eq(0);
        return/fixed/.test(this.css("position")) || !b.length ? a(document) : b
    }, zIndex:function (c) {
        if (c !== b)return this.css("zIndex", c);
        if (this.length) {
            c = a(this[0]);
            for (var d; c.length && c[0] !== document;) {
                d = c.css("position");
                if (d === "absolute" || d === "relative" || d === "fixed") {
                    d = parseInt(c.css("zIndex"), 10);
                    if (!isNaN(d) && d !== 0)return d
                }
                c = c.parent()
            }
        }
        return 0
    }, disableSelection:function () {
        return this.bind((a.support.selectstart ? "selectstart" : "mousedown") + ".ui-disableSelection", function (a) {
            a.preventDefault()
        })
    }, enableSelection:function () {
        return this.unbind(".ui-disableSelection")
    }}), a.each(["Width", "Height"], function (c, d) {
        function e(b, c, d, e) {
            a.each(f, function () {
                c -= parseFloat(a.curCSS(b, "padding" + this, !0)) || 0, d && (c -= parseFloat(a.curCSS(b, "border" + this + "Width", !0)) || 0), e && (c -= parseFloat(a.curCSS(b, "margin" + this, !0)) || 0)
            });
            return c
        }

        var f = d === "Width" ? ["Left", "Right"] : ["Top", "Bottom"], g = d.toLowerCase(), h = {innerWidth:a.fn.innerWidth, innerHeight:a.fn.innerHeight, outerWidth:a.fn.outerWidth, outerHeight:a.fn.outerHeight};
        a.fn["inner" + d] = function (c) {
            if (c === b)return h["inner" + d].call(this);
            return this.each(function () {
                a(this).css(g, e(this, c) + "px")
            })
        }, a.fn["outer" + d] = function (b, c) {
            if (typeof b != "number")return h["outer" + d].call(this, b);
            return this.each(function () {
                a(this).css(g, e(this, b, !0, c) + "px")
            })
        }
    }), a.extend(a.expr[":"], {data:function (b, c, d) {
        return!!a.data(b, d[3])
    }, focusable:function (b) {
        var d = b.nodeName.toLowerCase(), e = a.attr(b, "tabindex");
        if ("area" === d) {
            d = b.parentNode, e = d.name;
            if (!b.href || !e || d.nodeName.toLowerCase() !== "map")return!1;
            b = a("img[usemap=#" + e + "]")[0];
            return!!b && c(b)
        }
        return(/input|select|textarea|button|object/.test(d) ? !b.disabled : "a" == d ? b.href || !isNaN(e) : !isNaN(e)) && c(b)
    }, tabbable:function (b) {
        var c = a.attr(b, "tabindex");
        return(isNaN(c) || c >= 0) && a(b).is(":focusable")
    }}), a(function () {
        var b = document.body, c = b.appendChild(c = document.createElement("div"));
        a.extend(c.style, {minHeight:"100px", height:"auto", padding:0, borderWidth:0}), a.support.minHeight = c.offsetHeight === 100, a.support.selectstart = "onselectstart"in c, b.removeChild(c).style.display = "none"
    }), a.extend(a.ui, {plugin:{add:function (b, c, d) {
        b = a.ui[b].prototype;
        for (var e in d)b.plugins[e] = b.plugins[e] || [], b.plugins[e].push([c, d[e]])
    }, call:function (a, b, c) {
        if ((b = a.plugins[b]) && a.element[0].parentNode)for (var d = 0; d < b.length; d++)a.options[b[d][0]] && b[d][1].apply(a.element, c)
    }}, contains:function (a, b) {
        return document.compareDocumentPosition ? a.compareDocumentPosition(b) & 16 : a !== b && a.contains(b)
    }, hasScroll:function (b, c) {
        if (a(b).css("overflow") === "hidden")return!1;
        c = c && c === "left" ? "scrollLeft" : "scrollTop";
        var d = !1;
        if (b[c] > 0)return!0;
        b[c] = 1, d = b[c] > 0, b[c] = 0;
        return d
    }, isOverAxis:function (a, b, c) {
        return a > b && a < b + c
    }, isOver:function (b, c, d, e, f, g) {
        return a.ui.isOverAxis(b, d, f) && a.ui.isOverAxis(c, e, g)
    }}))
}(jQuery), function (a, b) {
    if (a.cleanData) {
        var c = a.cleanData;
        a.cleanData = function (b) {
            for (var d = 0, e; (e = b[d]) != null; d++)a(e).triggerHandler("remove");
            c(b)
        }
    } else {
        var d = a.fn.remove;
        a.fn.remove = function (b, c) {
            return this.each(function () {
                c || (!b || a.filter(b, [this]).length) && a("*", this).add([this]).each(function () {
                    a(this).triggerHandler("remove")
                });
                return d.call(a(this), b, c)
            })
        }
    }
    a.widget = function (b, c, d) {
        var e = b.split(".")[0], f;
        b = b.split(".")[1], f = e + "-" + b, d || (d = c, c = a.Widget), a.expr[":"][f] = function (c) {
            return!!a.data(c, b)
        }, a[e] = a[e] || {}, a[e][b] = function (a, b) {
            arguments.length && this._createWidget(a, b)
        }, c = new c, c.options = a.extend(!0, {}, c.options), a[e][b].prototype = a.extend(!0, c, {namespace:e, widgetName:b, widgetEventPrefix:a[e][b].prototype.widgetEventPrefix || b, widgetBaseClass:f}, d), a.widget.bridge(b, a[e][b])
    }, a.widget.bridge = function (c, d) {
        a.fn[c] = function (e) {
            var f = typeof e == "string", g = Array.prototype.slice.call(arguments, 1), h = this;
            e = !f && g.length ? a.extend.apply(null, [!0, e].concat(g)) : e;
            if (f && e.charAt(0) === "_")return h;
            f ? this.each(function () {
                var d = a.data(this, c), f = d && a.isFunction(d[e]) ? d[e].apply(d, g) : d;
                if (f !== d && f !== b) {
                    h = f;
                    return!1
                }
            }) : this.each(function () {
                var b = a.data(this, c);
                b ? b.option(e || {})._init() : a.data(this, c, new d(e, this))
            });
            return h
        }
    }, a.Widget = function (a, b) {
        arguments.length && this._createWidget(a, b)
    }, a.Widget.prototype = {widgetName:"widget", widgetEventPrefix:"", options:{disabled:!1}, _createWidget:function (b, c) {
        a.data(c, this.widgetName, this), this.element = a(c), this.options = a.extend(!0, {}, this.options, this._getCreateOptions(), b);
        var d = this;
        this.element.bind("remove." + this.widgetName, function () {
            d.destroy()
        }), this._create(), this._trigger("create"), this._init()
    }, _getCreateOptions:function () {
        return a.metadata && a.metadata.get(this.element[0])[this.widgetName]
    }, _create:function () {
    }, _init:function () {
    }, destroy:function () {
        this.element.unbind("." + this.widgetName).removeData(this.widgetName), this.widget().unbind("." + this.widgetName).removeAttr("aria-disabled").removeClass(this.widgetBaseClass + "-disabled ui-state-disabled")
    }, widget:function () {
        return this.element
    }, option:function (c, d) {
        var e = c;
        if (arguments.length === 0)return a.extend({}, this.options);
        if (typeof c == "string") {
            if (d === b)return this.options[c];
            e = {}, e[c] = d
        }
        this._setOptions(e);
        return this
    }, _setOptions:function (b) {
        var c = this;
        a.each(b, function (a, b) {
            c._setOption(a, b)
        });
        return this
    }, _setOption:function (a, b) {
        this.options[a] = b, a === "disabled" && this.widget()[b ? "addClass" : "removeClass"](this.widgetBaseClass + "-disabled ui-state-disabled").attr("aria-disabled", b);
        return this
    }, enable:function () {
        return this._setOption("disabled", !1)
    }, disable:function () {
        return this._setOption("disabled", !0)
    }, _trigger:function (b, c, d) {
        var e = this.options[b];
        c = a.Event(c), c.type = (b === this.widgetEventPrefix ? b : this.widgetEventPrefix + b).toLowerCase(), d = d || {};
        if (c.originalEvent) {
            b = a.event.props.length;
            for (var f; b;)f = a.event.props[--b], c[f] = c.originalEvent[f]
        }
        this.element.trigger(c, d);
        return!(a.isFunction(e) && e.call(this.element[0], c, d) === !1 || c.isDefaultPrevented())
    }}
}(jQuery), function (a) {
    a.widget("ui.mouse", {options:{cancel:":input,option", distance:1, delay:0}, _mouseInit:function () {
        var b = this;
        this.element.bind("mousedown." + this.widgetName,
            function (a) {
                return b._mouseDown(a)
            }).bind("click." + this.widgetName, function (d) {
            if (!0 === a.data(d.target, b.widgetName + ".preventClickEvent")) {
                a.removeData(d.target, b.widgetName + ".preventClickEvent"), d.stopImmediatePropagation();
                return!1
            }
        }), this.started = !1
    }, _mouseDestroy:function () {
        this.element.unbind("." + this.widgetName)
    }, _mouseDown:function (b) {
        b.originalEvent = b.originalEvent || {};
        if (!b.originalEvent.mouseHandled) {
            this._mouseStarted && this._mouseUp(b), this._mouseDownEvent = b;
            var d = this, e = b.which == 1, f = typeof this.options.cancel == "string" ? a(b.target).parents().add(b.target).filter(this.options.cancel).length : !1;
            if (!e || f || !this._mouseCapture(b))return!0;
            this.mouseDelayMet = !this.options.delay, this.mouseDelayMet || (this._mouseDelayTimer = setTimeout(function () {
                d.mouseDelayMet = !0
            }, this.options.delay));
            if (this._mouseDistanceMet(b) && this._mouseDelayMet(b)) {
                this._mouseStarted = this._mouseStart(b) !== !1;
                if (!this._mouseStarted) {
                    b.preventDefault();
                    return!0
                }
            }
            this._mouseMoveDelegate = function (a) {
                return d._mouseMove(a)
            }, this._mouseUpDelegate = function (a) {
                return d._mouseUp(a)
            }, a(document).bind("mousemove." + this.widgetName, this._mouseMoveDelegate).bind("mouseup." + this.widgetName, this._mouseUpDelegate), b.preventDefault();
            return b.originalEvent.mouseHandled = !0
        }
    }, _mouseMove:function (b) {
        if (a.browser.msie && !(document.documentMode >= 9) && !b.button)return this._mouseUp(b);
        if (this._mouseStarted) {
            this._mouseDrag(b);
            return b.preventDefault()
        }
        this._mouseDistanceMet(b) && this._mouseDelayMet(b) && ((this._mouseStarted = this._mouseStart(this._mouseDownEvent, b) !== !1) ? this._mouseDrag(b) : this._mouseUp(b));
        return!this._mouseStarted
    }, _mouseUp:function (b) {
        a(document).unbind("mousemove." + this.widgetName, this._mouseMoveDelegate).unbind("mouseup." + this.widgetName, this._mouseUpDelegate), this._mouseStarted && (this._mouseStarted = !1, b.target == this._mouseDownEvent.target && a.data(b.target, this.widgetName + ".preventClickEvent", !0), this._mouseStop(b));
        return!1
    }, _mouseDistanceMet:function (a) {
        return Math.max(Math.abs(this._mouseDownEvent.pageX - a.pageX), Math.abs(this._mouseDownEvent.pageY - a.pageY)) >= this.options.distance
    }, _mouseDelayMet:function () {
        return this.mouseDelayMet
    }, _mouseStart:function () {
    }, _mouseDrag:function () {
    }, _mouseStop:function () {
    }, _mouseCapture:function () {
        return!0
    }})
}(jQuery), function (a) {
    a.ui = a.ui || {};
    var b = /left|center|right/, c = /top|center|bottom/, d = a.fn.position, e = a.fn.offset;
    a.fn.position = function (e) {
        if (!e || !e.of)return d.apply(this, arguments);
        e = a.extend({}, e);
        var f = a(e.of), g = f[0], h = (e.collision || "flip").split(" "), i = e.offset ? e.offset.split(" ") : [0, 0], j, k, l;
        g.nodeType === 9 ? (j = f.width(), k = f.height(), l = {top:0, left:0}) : g.setTimeout ? (j = f.width(), k = f.height(), l = {top:f.scrollTop(), left:f.scrollLeft()}) : g.preventDefault ? (e.at = "left top", j = k = 0, l = {top:e.of.pageY, left:e.of.pageX}) : (j = f.outerWidth(), k = f.outerHeight(), l = f.offset()), a.each(["my", "at"], function () {
            var a = (e[this] || "").split(" ");
            a.length === 1 && (a = b.test(a[0]) ? a.concat(["center"]) : c.test(a[0]) ? ["center"].concat(a) : ["center", "center"]), a[0] = b.test(a[0]) ? a[0] : "center", a[1] = c.test(a[1]) ? a[1] : "center", e[this] = a
        }), h.length === 1 && (h[1] = h[0]), i[0] = parseInt(i[0], 10) || 0, i.length === 1 && (i[1] = i[0]), i[1] = parseInt(i[1], 10) || 0, e.at[0] === "right" ? l.left += j : e.at[0] === "center" && (l.left += j / 2), e.at[1] === "bottom" ? l.top += k : e.at[1] === "center" && (l.top += k / 2), l.left += i[0], l.top += i[1];
        return this.each(function () {
            var b = a(this), c = b.outerWidth(), d = b.outerHeight(), f = parseInt(a.curCSS(this, "marginLeft", !0)) || 0, g = parseInt(a.curCSS(this, "marginTop", !0)) || 0, m = c + f + (parseInt(a.curCSS(this, "marginRight", !0)) || 0), n = d + g + (parseInt(a.curCSS(this, "marginBottom", !0)) || 0), o = a.extend({}, l), p;
            e.my[0] === "right" ? o.left -= c : e.my[0] === "center" && (o.left -= c / 2), e.my[1] === "bottom" ? o.top -= d : e.my[1] === "center" && (o.top -= d / 2), o.left = Math.round(o.left), o.top = Math.round(o.top), p = {left:o.left - f, top:o.top - g}, a.each(["left", "top"], function (b, f) {
                a.ui.position[h[b]] && a.ui.position[h[b]][f](o, {targetWidth:j, targetHeight:k, elemWidth:c, elemHeight:d, collisionPosition:p, collisionWidth:m, collisionHeight:n, offset:i, my:e.my, at:e.at})
            }), a.fn.bgiframe && b.bgiframe(), b.offset(a.extend(o, {using:e.using}))
        })
    }, a.ui.position = {fit:{left:function (b, c) {
        var d = a(window);
        d = c.collisionPosition.left + c.collisionWidth - d.width() - d.scrollLeft(), b.left = d > 0 ? b.left - d : Math.max(b.left - c.collisionPosition.left, b.left)
    }, top:function (b, c) {
        var d = a(window);
        d = c.collisionPosition.top + c.collisionHeight - d.height() - d.scrollTop(), b.top = d > 0 ? b.top - d : Math.max(b.top - c.collisionPosition.top, b.top)
    }}, flip:{left:function (b, c) {
        if (c.at[0] !== "center") {
            var d = a(window);
            d = c.collisionPosition.left + c.collisionWidth - d.width() - d.scrollLeft();
            var e = c.my[0] === "left" ? -c.elemWidth : c.my[0] === "right" ? c.elemWidth : 0, f = c.at[0] === "left" ? c.targetWidth : -c.targetWidth, g = -2 * c.offset[0];
            b.left += c.collisionPosition.left < 0 ? e + f + g : d > 0 ? e + f + g : 0
        }
    }, top:function (b, c) {
        if (c.at[1] !== "center") {
            var d = a(window);
            d = c.collisionPosition.top + c.collisionHeight - d.height() - d.scrollTop();
            var e = c.my[1] === "top" ? -c.elemHeight : c.my[1] === "bottom" ? c.elemHeight : 0, f = c.at[1] === "top" ? c.targetHeight : -c.targetHeight, g = -2 * c.offset[1];
            b.top += c.collisionPosition.top < 0 ? e + f + g : d > 0 ? e + f + g : 0
        }
    }}}, a.offset.setOffset || (a.offset.setOffset = function (b, c) {
        /static/.test(a.curCSS(b, "position")) && (b.style.position = "relative");
        var d = a(b), e = d.offset(), f = parseInt(a.curCSS(b, "top", !0), 10) || 0, g = parseInt(a.curCSS(b, "left", !0), 10) || 0;
        e = {top:c.top - e.top + f, left:c.left - e.left + g}, "using"in c ? c.using.call(b, e) : d.css(e)
    }, a.fn.offset = function (b) {
        var c = this[0];
        if (!c || !c.ownerDocument)return null;
        if (b)return this.each(function () {
            a.offset.setOffset(this, b)
        });
        return e.call(this)
    })
}(jQuery), function (a) {
    a.widget("ui.draggable", a.ui.mouse, {widgetEventPrefix:"drag", options:{addClasses:!0, appendTo:"parent", axis:!1, connectToSortable:!1, containment:!1, cursor:"auto", cursorAt:!1, grid:!1, handle:!1, helper:"original", iframeFix:!1, opacity:!1, refreshPositions:!1, revert:!1, revertDuration:500, scope:"default", scroll:!0, scrollSensitivity:20, scrollSpeed:20, snap:!1, snapMode:"both", snapTolerance:20, stack:!1, zIndex:!1}, _create:function () {
        this.options.helper == "original" && !/^(?:r|a|f)/.test(this.element.css("position")) && (this.element[0].style.position = "relative"), this.options.addClasses && this.element.addClass("ui-draggable"), this.options.disabled && this.element.addClass("ui-draggable-disabled"), this._mouseInit()
    }, destroy:function () {
        if (this.element.data("draggable")) {
            this.element.removeData("draggable").unbind(".draggable").removeClass("ui-draggable ui-draggable-dragging ui-draggable-disabled"), this._mouseDestroy();
            return this
        }
    }, _mouseCapture:function (b) {
        var c = this.options;
        if (this.helper || c.disabled || a(b.target).is(".ui-resizable-handle"))return!1;
        this.handle = this._getHandle(b);
        if (!this.handle)return!1;
        return!0
    }, _mouseStart:function (b) {
        var c = this.options;
        this.helper = this._createHelper(b), this._cacheHelperProportions(), a.ui.ddmanager && (a.ui.ddmanager.current = this), this._cacheMargins(), this.cssPosition = this.helper.css("position"), this.scrollParent = this.helper.scrollParent(), this.offset = this.positionAbs = this.element.offset(), this.offset = {top:this.offset.top - this.margins.top, left:this.offset.left - this.margins.left}, a.extend(this.offset, {click:{left:b.pageX - this.offset.left, top:b.pageY - this.offset.top}, parent:this._getParentOffset(), relative:this._getRelativeOffset()}), this.originalPosition = this.position = this._generatePosition(b), this.originalPageX = b.pageX, this.originalPageY = b.pageY, c.cursorAt && this._adjustOffsetFromHelper(c.cursorAt), c.containment && this._setContainment();
        if (this._trigger("start", b) === !1) {
            this._clear();
            return!1
        }
        this._cacheHelperProportions(), a.ui.ddmanager && !c.dropBehaviour && a.ui.ddmanager.prepareOffsets(this, b), this.helper.addClass("ui-draggable-dragging"), this._mouseDrag(b, !0);
        return!0
    }, _mouseDrag:function (b, c) {
        this.position = this._generatePosition(b), this.positionAbs = this._convertPositionTo("absolute");
        if (!c) {
            c = this._uiHash();
            if (this._trigger("drag", b, c) === !1) {
                this._mouseUp({});
                return!1
            }
            this.position = c.position
        }
        if (!this.options.axis || this.options.axis != "y")this.helper[0].style.left = this.position.left + "px";
        if (!this.options.axis || this.options.axis != "x")this.helper[0].style.top = this.position.top + "px";
        a.ui.ddmanager && a.ui.ddmanager.drag(this, b);
        return!1
    }, _mouseStop:function (b) {
        var c = !1;
        a.ui.ddmanager && !this.options.dropBehaviour && (c = a.ui.ddmanager.drop(this, b)), this.dropped && (c = this.dropped, this.dropped = !1);
        if ((!this.element[0] || !this.element[0].parentNode) && this.options.helper == "original")return!1;
        if (this.options.revert == "invalid" && !c || this.options.revert == "valid" && c || this.options.revert === !0 || a.isFunction(this.options.revert) && this.options.revert.call(this.element, c)) {
            var e = this;
            a(this.helper).animate(this.originalPosition, parseInt(this.options.revertDuration, 10), function () {
                e._trigger("stop", b) !== !1 && e._clear()
            })
        } else this._trigger("stop", b) !== !1 && this._clear();
        return!1
    }, cancel:function () {
        this.helper.is(".ui-draggable-dragging") ? this._mouseUp({}) : this._clear();
        return this
    }, _getHandle:function (b) {
        var c = !this.options.handle || !a(this.options.handle, this.element).length ? !0 : !1;
        a(this.options.handle, this.element).find("*").andSelf().each(function () {
            this == b.target && (c = !0)
        });
        return c
    }, _createHelper:function (b) {
        var c = this.options;
        b = a.isFunction(c.helper) ? a(c.helper.apply(this.element[0], [b])) : c.helper == "clone" ? this.element.clone() : this.element, b.parents("body").length || b.appendTo(c.appendTo == "parent" ? this.element[0].parentNode : c.appendTo), b[0] != this.element[0] && !/(fixed|absolute)/.test(b.css("position")) && b.css("position", "absolute");
        return b
    }, _adjustOffsetFromHelper:function (b) {
        typeof b == "string" && (b = b.split(" ")), a.isArray(b) && (b = {left:+b[0], top:+b[1] || 0}), "left"in b && (this.offset.click.left = b.left + this.margins.left), "right"in b && (this.offset.click.left = this.helperProportions.width - b.right + this.margins.left), "top"in b && (this.offset.click.top = b.top + this.margins.top), "bottom"in b && (this.offset.click.top = this.helperProportions.height - b.bottom + this.margins.top)
    }, _getParentOffset:function () {
        this.offsetParent = this.helper.offsetParent();
        var b = this.offsetParent.offset();
        this.cssPosition == "absolute" && this.scrollParent[0] != document && a.ui.contains(this.scrollParent[0], this.offsetParent[0]) && (b.left += this.scrollParent.scrollLeft(), b.top += this.scrollParent.scrollTop());
        if (this.offsetParent[0] == document.body || this.offsetParent[0].tagName && this.offsetParent[0].tagName.toLowerCase() == "html" && a.browser.msie)b = {top:0, left:0};
        return{top:b.top + (parseInt(this.offsetParent.css("borderTopWidth"), 10) || 0), left:b.left + (parseInt(this.offsetParent.css("borderLeftWidth"), 10) || 0)}
    }, _getRelativeOffset:function () {
        if (this.cssPosition == "relative") {
            var a = this.element.position();
            return{top:a.top - (parseInt(this.helper.css("top"), 10) || 0) + this.scrollParent.scrollTop(), left:a.left - (parseInt(this.helper.css("left"), 10) || 0) + this.scrollParent.scrollLeft()}
        }
        return{top:0, left:0}
    }, _cacheMargins:function () {
        this.margins = {left:parseInt(this.element.css("marginLeft"), 10) || 0, top:parseInt(this.element.css("marginTop"), 10) || 0}
    }, _cacheHelperProportions:function () {
        this.helperProportions = {width:this.helper.outerWidth(), height:this.helper.outerHeight()}
    }, _setContainment:function () {
        var b = this.options;
        b.containment == "parent" && (b.containment = this.helper[0].parentNode);
        if (b.containment == "document" || b.containment == "window")this.containment = [(b.containment == "document" ? 0 : a(window).scrollLeft()) - this.offset.relative.left - this.offset.parent.left, (b.containment == "document" ? 0 : a(window).scrollTop()) - this.offset.relative.top - this.offset.parent.top, (b.containment == "document" ? 0 : a(window).scrollLeft()) + a(b.containment == "document" ? document : window).width() - this.helperProportions.width - this.margins.left, (b.containment == "document" ? 0 : a(window).scrollTop()) + (a(b.containment == "document" ? document : window).height() || document.body.parentNode.scrollHeight) - this.helperProportions.height - this.margins.top];
        if (!/^(document|window|parent)$/.test(b.containment) && b.containment.constructor != Array) {
            var c = a(b.containment)[0];
            if (c) {
                b = a(b.containment).offset();
                var e = a(c).css("overflow") != "hidden";
                this.containment = [b.left + (parseInt(a(c).css("borderLeftWidth"), 10) || 0) + (parseInt(a(c).css("paddingLeft"), 10) || 0) - this.margins.left, b.top + (parseInt(a(c).css("borderTopWidth"), 10) || 0) + (parseInt(a(c).css("paddingTop"), 10) || 0) - this.margins.top, b.left + (e ? Math.max(c.scrollWidth, c.offsetWidth) : c.offsetWidth) - (parseInt(a(c).css("borderLeftWidth"), 10) || 0) - (parseInt(a(c).css("paddingRight"), 10) || 0) - this.helperProportions.width - this.margins.left, b.top + (e ? Math.max(c.scrollHeight, c.offsetHeight) : c.offsetHeight) - (parseInt(a(c).css("borderTopWidth"), 10) || 0) - (parseInt(a(c).css("paddingBottom"), 10) || 0) - this.helperProportions.height - this.margins.top]
            }
        } else b.containment.constructor == Array && (this.containment = b.containment)
    }, _convertPositionTo:function (b, c) {
        c || (c = this.position), b = b == "absolute" ? 1 : -1;
        var e = this.cssPosition == "absolute" && (this.scrollParent[0] == document || !a.ui.contains(this.scrollParent[0], this.offsetParent[0])) ? this.offsetParent : this.scrollParent, f = /(html|body)/i.test(e[0].tagName);
        return{top:c.top + this.offset.relative.top * b + this.offset.parent.top * b - (a.browser.safari && a.browser.version < 526 && this.cssPosition == "fixed" ? 0 : (this.cssPosition == "fixed" ? -this.scrollParent.scrollTop() : f ? 0 : e.scrollTop()) * b), left:c.left + this.offset.relative.left * b + this.offset.parent.left * b - (a.browser.safari && a.browser.version < 526 && this.cssPosition == "fixed" ? 0 : (this.cssPosition == "fixed" ? -this.scrollParent.scrollLeft() : f ? 0 : e.scrollLeft()) * b)}
    }, _generatePosition:function (b) {
        var c = this.options, e = this.cssPosition == "absolute" && (this.scrollParent[0] == document || !a.ui.contains(this.scrollParent[0], this.offsetParent[0])) ? this.offsetParent : this.scrollParent, f = /(html|body)/i.test(e[0].tagName), g = b.pageX, h = b.pageY;
        this.originalPosition && (this.containment && (b.pageX - this.offset.click.left < this.containment[0] && (g = this.containment[0] + this.offset.click.left), b.pageY - this.offset.click.top < this.containment[1] && (h = this.containment[1] + this.offset.click.top), b.pageX - this.offset.click.left > this.containment[2] && (g = this.containment[2] + this.offset.click.left), b.pageY - this.offset.click.top > this.containment[3] && (h = this.containment[3] + this.offset.click.top)), c.grid && (h = this.originalPageY + Math.round((h - this.originalPageY) / c.grid[1]) * c.grid[1], h = this.containment ? h - this.offset.click.top < this.containment[1] || h - this.offset.click.top > this.containment[3] ? h - this.offset.click.top < this.containment[1] ? h + c.grid[1] : h - c.grid[1] : h : h, g = this.originalPageX + Math.round((g - this.originalPageX) / c.grid[0]) * c.grid[0], g = this.containment ? g - this.offset.click.left < this.containment[0] || g - this.offset.click.left > this.containment[2] ? g - this.offset.click.left < this.containment[0] ? g + c.grid[0] : g - c.grid[0] : g : g));
        return{top:h - this.offset.click.top - this.offset.relative.top - this.offset.parent.top + (a.browser.safari && a.browser.version < 526 && this.cssPosition == "fixed" ? 0 : this.cssPosition == "fixed" ? -this.scrollParent.scrollTop() : f ? 0 : e.scrollTop()), left:g - this.offset.click.left - this.offset.relative.left - this.offset.parent.left + (a.browser.safari && a.browser.version < 526 && this.cssPosition == "fixed" ? 0 : this.cssPosition == "fixed" ? -this.scrollParent.scrollLeft() : f ? 0 : e.scrollLeft())}
    }, _clear:function () {
        this.helper.removeClass("ui-draggable-dragging"), this.helper[0] != this.element[0] && !this.cancelHelperRemoval && this.helper.remove(), this.helper = null, this.cancelHelperRemoval = !1
    }, _trigger:function (b, c, e) {
        e = e || this._uiHash(), a.ui.plugin.call(this, b, [c, e]), b == "drag" && (this.positionAbs = this._convertPositionTo("absolute"));
        return a.Widget.prototype._trigger.call(this, b, c, e)
    }, plugins:{}, _uiHash:function () {
        return{helper:this.helper, position:this.position, originalPosition:this.originalPosition, offset:this.positionAbs}
    }}), a.extend(a.ui.draggable, {version:"1.8.10"}), a.ui.plugin.add("draggable", "connectToSortable", {start:function (b, c) {
        var e = a(this).data("draggable"), f = e.options, g = a.extend({}, c, {item:e.element});
        e.sortables = [], a(f.connectToSortable).each(function () {
            var c = a.data(this, "sortable");
            c && !c.options.disabled && (e.sortables.push({instance:c, shouldRevert:c.options.revert}), c._refreshItems(), c._trigger("activate", b, g))
        })
    }, stop:function (b, c) {
        var e = a(this).data("draggable"), f = a.extend({}, c, {item:e.element});
        a.each(e.sortables, function () {
            this.instance.isOver ? (this.instance.isOver = 0, e.cancelHelperRemoval = !0, this.instance.cancelHelperRemoval = !1, this.shouldRevert && (this.instance.options.revert = !0), this.instance._mouseStop(b), this.instance.options.helper = this.instance.options._helper, e.options.helper == "original" && this.instance.currentItem.css({top:"auto", left:"auto"})) : (this.instance.cancelHelperRemoval = !1, this.instance._trigger("deactivate", b, f))
        })
    }, drag:function (b, c) {
        var e = a(this).data("draggable"), f = this;
        a.each(e.sortables, function () {
            this.instance.positionAbs = e.positionAbs, this.instance.helperProportions = e.helperProportions, this.instance.offset.click = e.offset.click, this.instance._intersectsWith(this.instance.containerCache) ? (this.instance.isOver || (this.instance.isOver = 1, this.instance.currentItem = a(f).clone().appendTo(this.instance.element).data("sortable-item", !0), this.instance.options._helper = this.instance.options.helper, this.instance.options.helper = function () {
                return c.helper[0]
            }, b.target = this.instance.currentItem[0], this.instance._mouseCapture(b, !0), this.instance._mouseStart(b, !0, !0), this.instance.offset.click.top = e.offset.click.top, this.instance.offset.click.left = e.offset.click.left, this.instance.offset.parent.left -= e.offset.parent.left - this.instance.offset.parent.left, this.instance.offset.parent.top -= e.offset.parent.top - this.instance.offset.parent.top, e._trigger("toSortable", b), e.dropped = this.instance.element, e.currentItem = e.element, this.instance.fromOutside = e), this.instance.currentItem && this.instance._mouseDrag(b)) : this.instance.isOver && (this.instance.isOver = 0, this.instance.cancelHelperRemoval = !0, this.instance.options.revert = !1, this.instance._trigger("out", b, this.instance._uiHash(this.instance)), this.instance._mouseStop(b, !0), this.instance.options.helper = this.instance.options._helper, this.instance.currentItem.remove(), this.instance.placeholder && this.instance.placeholder.remove(), e._trigger("fromSortable", b), e.dropped = !1)
        })
    }}), a.ui.plugin.add("draggable", "cursor", {start:function () {
        var b = a("body"), c = a(this).data("draggable").options;
        b.css("cursor") && (c._cursor = b.css("cursor")), b.css("cursor", c.cursor)
    }, stop:function () {
        var b = a(this).data("draggable").options;
        b._cursor && a("body").css("cursor", b._cursor)
    }}), a.ui.plugin.add("draggable", "iframeFix", {start:function () {
        var b = a(this).data("draggable").options;
        a(b.iframeFix === !0 ? "iframe" : b.iframeFix).each(function () {
            a('<div class="ui-draggable-iframeFix" style="background: #fff;"></div>').css({width:this.offsetWidth + "px", height:this.offsetHeight + "px", position:"absolute", opacity:"0.001", zIndex:1e3}).css(a(this).offset()).appendTo("body")
        })
    }, stop:function () {
        a("div.ui-draggable-iframeFix").each(function () {
            this.parentNode.removeChild(this)
        })
    }}), a.ui.plugin.add("draggable", "opacity", {start:function (b, c) {
        b = a(c.helper), c = a(this).data("draggable").options, b.css("opacity") && (c._opacity = b.css("opacity")), b.css("opacity", c.opacity)
    }, stop:function (b, c) {
        b = a(this).data("draggable").options, b._opacity && a(c.helper).css("opacity", b._opacity)
    }}), a.ui.plugin.add("draggable", "scroll", {start:function () {
        var b = a(this).data("draggable");
        b.scrollParent[0] != document && b.scrollParent[0].tagName != "HTML" && (b.overflowOffset = b.scrollParent.offset())
    }, drag:function (b) {
        var c = a(this).data("draggable"), e = c.options, f = !1;
        if (c.scrollParent[0] != document && c.scrollParent[0].tagName != "HTML") {
            if (!e.axis || e.axis != "x")c.overflowOffset.top + c.scrollParent[0].offsetHeight - b.pageY < e.scrollSensitivity ? c.scrollParent[0].scrollTop = f = c.scrollParent[0].scrollTop + e.scrollSpeed : b.pageY - c.overflowOffset.top < e.scrollSensitivity && (c.scrollParent[0].scrollTop = f = c.scrollParent[0].scrollTop - e.scrollSpeed);
            if (!e.axis || e.axis != "y")c.overflowOffset.left + c.scrollParent[0].offsetWidth - b.pageX < e.scrollSensitivity ? c.scrollParent[0].scrollLeft = f = c.scrollParent[0].scrollLeft + e.scrollSpeed : b.pageX - c.overflowOffset.left < e.scrollSensitivity && (c.scrollParent[0].scrollLeft = f = c.scrollParent[0].scrollLeft - e.scrollSpeed)
        } else {
            if (!e.axis || e.axis != "x")b.pageY - a(document).scrollTop() < e.scrollSensitivity ? f = a(document).scrollTop(a(document).scrollTop() - e.scrollSpeed) : a(window).height() - (b.pageY - a(document).scrollTop()) < e.scrollSensitivity && (f = a(document).scrollTop(a(document).scrollTop() + e.scrollSpeed));
            if (!e.axis || e.axis != "y")b.pageX - a(document).scrollLeft() < e.scrollSensitivity ? f = a(document).scrollLeft(a(document).scrollLeft() - e.scrollSpeed) : a(window).width() - (b.pageX - a(document).scrollLeft()) < e.scrollSensitivity && (f = a(document).scrollLeft(a(document).scrollLeft() + e.scrollSpeed))
        }
        f !== !1 && a.ui.ddmanager && !e.dropBehaviour && a.ui.ddmanager.prepareOffsets(c, b)
    }}), a.ui.plugin.add("draggable", "snap", {start:function () {
        var b = a(this).data("draggable"), c = b.options;
        b.snapElements = [], a(c.snap.constructor != String ? c.snap.items || ":data(draggable)" : c.snap).each(function () {
            var c = a(this), e = c.offset();
            this != b.element[0] && b.snapElements.push({item:this, width:c.outerWidth(), height:c.outerHeight(), top:e.top, left:e.left})
        })
    }, drag:function (b, c) {
        for (var e = a(this).data("draggable"), f = e.options, g = f.snapTolerance, h = c.offset.left, i = h + e.helperProportions.width, j = c.offset.top, k = j + e.helperProportions.height, l = e.snapElements.length - 1; l >= 0; l--) {
            var m = e.snapElements[l].left, n = m + e.snapElements[l].width, o = e.snapElements[l].top, p = o + e.snapElements[l].height;
            if (m - g < h && h < n + g && o - g < j && j < p + g || m - g < h && h < n + g && o - g < k && k < p + g || m - g < i && i < n + g && o - g < j && j < p + g || m - g < i && i < n + g && o - g < k && k < p + g) {
                if (f.snapMode != "inner") {
                    var q = Math.abs(o - k) <= g, r = Math.abs(p - j) <= g, s = Math.abs(m - i) <= g, t = Math.abs(n - h) <= g;
                    q && (c.position.top = e._convertPositionTo("relative", {top:o - e.helperProportions.height, left:0}).top - e.margins.top), r && (c.position.top = e._convertPositionTo("relative", {top:p, left:0}).top - e.margins.top), s && (c.position.left = e._convertPositionTo("relative", {top:0, left:m - e.helperProportions.width}).left - e.margins.left), t && (c.position.left = e._convertPositionTo("relative", {top:0, left:n}).left - e.margins.left)
                }
                var u = q || r || s || t;
                f.snapMode != "outer" && (q = Math.abs(o - j) <= g, r = Math.abs(p - k) <= g, s = Math.abs(m - h) <= g, t = Math.abs(n - i) <= g, q && (c.position.top = e._convertPositionTo("relative", {top:o, left:0}).top - e.margins.top), r && (c.position.top = e._convertPositionTo("relative", {top:p - e.helperProportions.height, left:0}).top - e.margins.top), s && (c.position.left = e._convertPositionTo("relative", {top:0, left:m}).left - e.margins.left), t && (c.position.left = e._convertPositionTo("relative", {top:0, left:n - e.helperProportions.width}).left - e.margins.left)), !e.snapElements[l].snapping && (q || r || s || t || u) && e.options.snap.snap && e.options.snap.snap.call(e.element, b, a.extend(e._uiHash(), {snapItem:e.snapElements[l].item})), e.snapElements[l].snapping = q || r || s || t || u
            } else e.snapElements[l].snapping && e.options.snap.release && e.options.snap.release.call(e.element, b, a.extend(e._uiHash(), {snapItem:e.snapElements[l].item})), e.snapElements[l].snapping = !1
        }
    }}), a.ui.plugin.add("draggable", "stack", {start:function () {
        var b = a(this).data("draggable").options;
        b = a.makeArray(a(b.stack)).sort(function (b, c) {
            return(parseInt(a(b).css("zIndex"), 10) || 0) - (parseInt(a(c).css("zIndex"), 10) || 0)
        });
        if (b.length) {
            var c = parseInt(b[0].style.zIndex) || 0;
            a(b).each(function (a) {
                this.style.zIndex = c + a
            }), this[0].style.zIndex = c + b.length
        }
    }}), a.ui.plugin.add("draggable", "zIndex", {start:function (b, c) {
        b = a(c.helper), c = a(this).data("draggable").options, b.css("zIndex") && (c._zIndex = b.css("zIndex")), b.css("zIndex", c.zIndex)
    }, stop:function (b, c) {
        b = a(this).data("draggable").options, b._zIndex && a(c.helper).css("zIndex", b._zIndex)
    }})
}(jQuery), function (a) {
    a.widget("ui.droppable", {widgetEventPrefix:"drop", options:{accept:"*", activeClass:!1, addClasses:!0, greedy:!1, hoverClass:!1, scope:"default", tolerance:"intersect"}, _create:function () {
        var b = this.options, c = b.accept;
        this.isover = 0, this.isout = 1, this.accept = a.isFunction(c) ? c : function (a) {
            return a.is(c)
        }, this.proportions = {width:this.element[0].offsetWidth, height:this.element[0].offsetHeight}, a.ui.ddmanager.droppables[b.scope] = a.ui.ddmanager.droppables[b.scope] || [], a.ui.ddmanager.droppables[b.scope].push(this), b.addClasses && this.element.addClass("ui-droppable")
    }, destroy:function () {
        for (var b = a.ui.ddmanager.droppables[this.options.scope], c = 0; c < b.length; c++)b[c] == this && b.splice(c, 1);
        this.element.removeClass("ui-droppable ui-droppable-disabled").removeData("droppable").unbind(".droppable");
        return this
    }, _setOption:function (b, c) {
        b == "accept" && (this.accept = a.isFunction(c) ? c : function (a) {
            return a.is(c)
        }), a.Widget.prototype._setOption.apply(this, arguments)
    }, _activate:function (b) {
        var c = a.ui.ddmanager.current;
        this.options.activeClass && this.element.addClass(this.options.activeClass), c && this._trigger("activate", b, this.ui(c))
    }, _deactivate:function (b) {
        var c = a.ui.ddmanager.current;
        this.options.activeClass && this.element.removeClass(this.options.activeClass), c && this._trigger("deactivate", b, this.ui(c))
    }, _over:function (b) {
        var c = a.ui.ddmanager.current;
        !!c && (c.currentItem || c.element)[0] != this.element[0] && this.accept.call(this.element[0], c.currentItem || c.element) && (this.options.hoverClass && this.element.addClass(this.options.hoverClass), this._trigger("over", b, this.ui(c)))
    }, _out:function (b) {
        var c = a.ui.ddmanager.current;
        !!c && (c.currentItem || c.element)[0] != this.element[0] && this.accept.call(this.element[0], c.currentItem || c.element) && (this.options.hoverClass && this.element.removeClass(this.options.hoverClass), this._trigger("out", b, this.ui(c)))
    }, _drop:function (b, c) {
        var e = c || a.ui.ddmanager.current;
        if (!e || (e.currentItem || e.element)[0] == this.element[0])return!1;
        var f = !1;
        this.element.find(":data(droppable)").not(".ui-draggable-dragging").each(function () {
            var b = a.data(this, "droppable");
            if (b.options.greedy && !b.options.disabled && b.options.scope == e.options.scope && b.accept.call(b.element[0], e.currentItem || e.element) && a.ui.intersect(e, a.extend(b, {offset:b.element.offset()}), b.options.tolerance)) {
                f = !0;
                return!1
            }
        });
        if (f)return!1;
        if (this.accept.call(this.element[0], e.currentItem || e.element)) {
            this.options.activeClass && this.element.removeClass(this.options.activeClass), this.options.hoverClass && this.element.removeClass(this.options.hoverClass), this._trigger("drop", b, this.ui(e));
            return this.element
        }
        return!1
    }, ui:function (a) {
        return{draggable:a.currentItem || a.element, helper:a.helper, position:a.position, offset:a.positionAbs}
    }}), a.extend(a.ui.droppable, {version:"1.8.10"}), a.ui.intersect = function (b, c, e) {
        if (!c.offset)return!1;
        var f = (b.positionAbs || b.position.absolute).left, g = f + b.helperProportions.width, h = (b.positionAbs || b.position.absolute).top, i = h + b.helperProportions.height, j = c.offset.left, k = j + c.proportions.width, l = c.offset.top, m = l + c.proportions.height;
        switch (e) {
            case"fit":
                return j <= f && g <= k && l <= h && i <= m;
            case"intersect":
                return j < f + b.helperProportions.width / 2 && g - b.helperProportions.width / 2 < k && l < h + b.helperProportions.height / 2 && i - b.helperProportions.height / 2 < m;
            case"pointer":
                return a.ui.isOver((b.positionAbs || b.position.absolute).top + (b.clickOffset || b.offset.click).top, (b.positionAbs || b.position.absolute).left + (b.clickOffset || b.offset.click).left, l, j, c.proportions.height, c.proportions.width);
            case"touch":
                return(h >= l && h <= m || i >= l && i <= m || h < l && i > m) && (f >= j && f <= k || g >= j && g <= k || f < j && g > k);
            default:
                return!1
        }
    }, a.ui.ddmanager = {current:null, droppables:{"default":[]}, prepareOffsets:function (b, c) {
        var e = a.ui.ddmanager.droppables[b.options.scope] || [], f = c ? c.type : null, g = (b.currentItem || b.element).find(":data(droppable)").andSelf(), h = 0;
        a:for (; h < e.length; h++)if (!(e[h].options.disabled || b && !e[h].accept.call(e[h].element[0], b.currentItem || b.element))) {
            for (var i = 0; i < g.length; i++)if (g[i] == e[h].element[0]) {
                e[h].proportions.height = 0;
                continue a
            }
            e[h].visible = e[h].element.css("display") != "none", e[h].visible && (e[h].offset = e[h].element.offset(), e[h].proportions = {width:e[h].element[0].offsetWidth, height:e[h].element[0].offsetHeight}, f == "mousedown" && e[h]._activate.call(e[h], c))
        }
    }, drop:function (b, c) {
        var e = !1;
        a.each(a.ui.ddmanager.droppables[b.options.scope] || [], function () {
            this.options && (!this.options.disabled && this.visible && a.ui.intersect(b, this, this.options.tolerance) && (e = e || this._drop.call(this, c)), !this.options.disabled && this.visible && this.accept.call(this.element[0], b.currentItem || b.element) && (this.isout = 1, this.isover = 0, this._deactivate.call(this, c)))
        });
        return e
    }, drag:function (b, c) {
        b.options.refreshPositions && a.ui.ddmanager.prepareOffsets(b, c), a.each(a.ui.ddmanager.droppables[b.options.scope] || [], function () {
            if (!(this.options.disabled || this.greedyChild || !this.visible)) {
                var e = a.ui.intersect(b, this, this.options.tolerance);
                if (e = !e && this.isover == 1 ? "isout" : e && this.isover == 0 ? "isover" : null) {
                    var f;
                    if (this.options.greedy) {
                        var g = this.element.parents(":data(droppable):eq(0)");
                        g.length && (f = a.data(g[0], "droppable"), f.greedyChild = e == "isover" ? 1 : 0)
                    }
                    f && e == "isover" && (f.isover = 0, f.isout = 1, f._out.call(f, c)), this[e] = 1, this[e == "isout" ? "isover" : "isout"] = 0, this[e == "isover" ? "_over" : "_out"].call(this, c), f && e == "isout" && (f.isout = 0, f.isover = 1, f._over.call(f, c))
                }
            }
        })
    }}
}(jQuery), function (a) {
    a.fn.editableComment = function () {
        a(this).delegate(".comment .edit-button", "click", function (b) {
            var c = a(this).closest(".comment");
            c.addClass("editing"), c.find(".js-autosize").trigger("resize.dynSiz");
            return!1
        }), a(this).delegate(".comment .delete-button", "click", function (b) {
            var c = a(this).closest(".comment"), d = a(this).closest(".js-comment-container");
            d.length || (d = c), confirm("Are you sure you want to delete this?") && (c.addClass("loading"), c.find("button").attr("disabled", !0), c.find(".minibutton").addClass("disabled"), a.ajax({type:"DELETE", url:c.find(".form-content form").attr("action"), complete:function () {
                c.removeClass("loading"), c.find("button").removeAttr("disabled"), c.find(".minibutton").removeClass("disabled")
            }, success:function () {
                d.fadeOut(function () {
                    c.removeClass("editing")
                })
            }, error:function () {
                c.addClass("error")
            }}));
            return!1
        }), a(this).delegate(".comment .cancel", "click", function () {
            a(this).closest(".comment").removeClass("editing");
            return!1
        }), a(this).delegate(".comment .form-content form", "submit", function () {
            var b = a(this).closest(".comment");
            b.addClass("loading"), b.find("button").attr("disabled", !0), b.find(".minibutton").addClass("disabled"), a.ajax({type:"PUT", url:b.find(".form-content form").attr("action"), dataType:"json", data:a(this).serialize(), complete:function () {
                b.removeClass("loading"), b.find("button").removeAttr("disabled"), b.find(".minibutton").removeClass("disabled")
            }, success:function (a) {
                a.title && b.find(".content-title").html(a.title), b.find(".formatted-content .content-body").html(a.body), b.removeClass("editing")
            }, error:function () {
                b.addClass("error")
            }});
            return!1
        })
    }
}(jQuery), function (a) {
    a.fn.enticeToAction = function (b) {
        var c = a.extend({}, a.fn.enticeToAction.defaults, b);
        return this.each(function () {
            var b = a(this);
            b.addClass("entice"), b.attr("title", c.title);
            switch (c.direction) {
                case"downwards":
                    var d = "n";
                case"upwards":
                    var d = "s";
                case"rightwards":
                    var d = "w";
                case"leftwards":
                    var d = "e"
            }
            b.tipsy({gravity:d}), this.onclick = function () {
                return!1
            }
        })
    }, a.fn.enticeToAction.defaults = {title:"You must be logged in to use this feature", direction:"downwards"}
}(jQuery), function (a) {
    a.fn.errorify = function (b, c) {
        var d = a.extend({}, a.fn.errorify.defaults, c);
        return this.each(function () {
            var c = a(this);
            c.addClass("error"), c.find("p.note").hide(), c.find("dd.error").remove();
            var d = a("<dd>").addClass("error").text(b);
            c.append(d)
        })
    }, a.fn.errorify.defaults = {}, a.fn.unErrorify = function (b) {
        var c = a.extend({}, a.fn.unErrorify.defaults, b);
        return this.each(function () {
            var b = a(this);
            b.removeClass("error"), b.find("p.note").show(), b.find("dd.error").remove()
        })
    }, a.fn.unErrorify.defaults = {}
}(jQuery), $(document).ready(function () {
    $(document.body).trigger("pageUpdate")
}), $(document).bind("end.pjax", function (a) {
    $(a.target).trigger("pageUpdate")
}), $.fn.pageUpdate = function (a) {
    $(this).bind("pageUpdate", function (b) {
        a.apply(b.target, arguments)
    })
}, function (a) {
    a.fn.previewableCommentForm = function (b) {
        var c = a.extend({}, a.fn.previewableCommentForm.defaults, b);
        return this.each(function () {
            var b = a(this);
            if (!b.hasClass("previewable-comment-form-attached")) {
                b.addClass("previewable-comment-form-attached");
                var d = b.find("textarea"), e = b.find(".content-body"), f = b.prev(".comment-form-error"), g = b.find(".form-actions button"), h = d.val(), i = b.attr("data-repository"), j = !1, k = null, l = a.merge(b.find(".preview-dirty"), d);
                l.blur(function () {
                    h != d.val() && (j = !0, h = d.val()), m()
                });
                var m = function () {
                    if (!!j) {
                        if (a.trim(h) == "") {
                            e.html("<p>Nothing to preview</p>");
                            return
                        }
                        e.html("<p>Loading preview&hellip;</p>"), k && k.abort();
                        var b = a.extend({text:h, repository:i}, c.previewOptions);
                        k = a.post(c.previewUrl, b, function (a) {
                            e.html(a), c.onSuccess.call(e)
                        })
                    }
                };
                a.trim(h) == "" && e.html("<p>Nothing to preview</p>"), f.length > 0 && b.closest("form").submit(function () {
                    f.hide();
                    if (a.trim(d.val()) == "") {
                        f.show();
                        return!1
                    }
                    g.attr("disabled", "disabled")
                })
            }
        })
    }, a.fn.previewableCommentForm.defaults = {previewUrl:"/preview", previewOptions:{}, onSuccess:function () {
    }}
}(jQuery), function (a) {
    a.fn.redirector = function (b) {
        var c = a.extend({}, a.fn.redirector.defaults, b);
        this.length != 0 && a.smartPoller(c.time, function (b) {
            a.getJSON(c.url, function (a) {
                a ? b() : window.location = c.to
            })
        })
    }, a.fn.redirector.defaults = {time:100, url:null, to:"/"}
}(jQuery), function (a) {
    a.fn.repoInlineEdit = function (b) {
        var c = a.extend({}, a.fn.repoInlineEdit.defaults, b);
        return this.each(function () {
            var b = a(this), d = a("#" + b.attr("rel")), e = function () {
                a.trim(b.text()) == "" ? c.is_owner ? b.html(a("#pl-" + c.name).html()) : b.remove() : c.is_owner && b.find("p:last-child").append(' <em class="placeholder edit-text">click to edit</em>')
            };
            e(), c.is_owner && (b.addClass("editable-text"), b.click(function (c) {
                a(c.target).is("a") || (b.hide(), d.show().find("input").focus())
            }), d.find(".cancel").click(function () {
                b.show(), d.hide();
                return!1
            }), d.find("form").submit(function () {
                a.fn.repoInlineEdit.load(), d.css({opacity:.4});
                var f = a(this), g = f.serialize();
                a.post(f.attr("action"), g, function (f, g) {
                    if (g == "success") {
                        if (c.name == "homepage") {
                            var h = f.match(/^https?:/) ? f : "http://" + f;
                            b.html(a('<a rel="nofollow"/>').attr("href", h).text(f))
                        } else b.html(a.simpleFormat(f));
                        e(), d.hide(), b.show(), a.fn.repoInlineEdit.endLoad()
                    }
                    d.css({opacity:1})
                });
                return!1
            }))
        })
    }, a.fn.repoInlineEdit.defaults = {is_owner:!1, name:"description"}, a.fn.repoInlineEdit.load = function () {
        a("#repo_details_loader").show()
    }, a.fn.repoInlineEdit.endLoad = function () {
        a("#repo_details_loader").hide()
    }, a.simpleFormat = function (b) {
        b = a("<div>").text(b).html(), b = b.replace(/\r\n?/, "\n"), b = b.replace(/\n\n+/, "</p>\n\n<p>"), b = b.replace(/([^\n]\n)(?=[^\n])/, "<br />");
        return"<p>" + b + "</p>"
    }
}(jQuery), function (a) {
    a.fn.repoList = function (b) {
        var c = a.extend({}, a.fn.repoList.defaults, b);
        return this.each(function () {
            var b = a(this), d = b.find(".repo_list"), e = b.find(".show-more"), f = b.find(".filter_input").val(""), g = f.val(), h = e.length == 0 ? !0 : !1, i = null, j = !1;
            e.click(function () {
                if (j)return!1;
                var b = e.spin();
                j = !0, a(c.selector).load(c.ajaxUrl, function () {
                    h = !0, b.parents(".repos").find(".filter_selected").click(), b.stopSpin()
                }), b.hide();
                return!1
            });
            var k = function () {
                var a = d.children("li");
                i ? (a.hide(), d.find("li." + i).show()) : a.show(), f.val() != "" && a.filter(":not(:Contains('" + f.val() + "'))").hide()
            };
            b.find(".repo_filter").click(function () {
                var c = a(this);
                b.find(".repo_filterer a").removeClass("filter_selected"), c.addClass("filter_selected"), i = c.attr("rel"), h ? k() : e.click();
                return!1
            });
            var l = "placeholder"in document.createElement("input"), m = function () {
                l || (f.val() == "" ? f.addClass("placeholder") : f.removeClass("placeholder"))
            };
            f.bind("keyup blur click", function () {
                this.value != g && (g = this.value, h ? k() : e.click(), m())
            }), m()
        })
    }, a.fn.repoList.defaults = {selector:"#repo_listing", ajaxUrl:"/dashboard/ajax_your_repos"}
}(jQuery), $.fn.selectableList = function (a, b) {
    return $(this).each(function () {
        var c = $(this), d = $.extend({toggleClassName:"selected", wrapperSelector:"a", mutuallyExclusive:!1, itemParentSelector:"li", enableShiftSelect:!1, ignoreLinks:!1}, b);
        c.delegate(a + " " + d.itemParentSelector + " " + d.wrapperSelector, "click", function (b) {
            if (b.which > 1 || b.metaKey || d.ignoreLinks && $(b.target).closest("a").length)return!0;
            var e = $(this), f = e.find(":checkbox, :radio"), g = c.find(a + " ." + d.toggleClassName), h = c.find(a + " *[data-last]");
            !e.is(":checkbox, :radio") && b.target != f[0] && (f.attr("checked") && !f.is(":radio") ? f.attr("checked", !1) : f.attr("checked", !0)), d.mutuallyExclusive && g.removeClass(d.toggleClassName), e.toggleClass(d.toggleClassName), f.change();
            if (d.enableShiftSelect && b.shiftKey && g.length > 0 && h.length > 0) {
                var i = h.offset().top, j = e.offset().top, k = "#" + e.attr("id"), l = $, m = $, n = $;
                i > j ? l = h.prevUntil(k) : i < j && (l = h.nextUntil(k)), m = l.find(":checkbox"), n = l.find(":checked"), n.length == m.length ? (l.removeClass(d.toggleClassName), m.attr("checked", !1)) : (l.addClass(d.toggleClassName), m.attr("checked", !0))
            }
            h.removeAttr("data-last"), e.attr("data-last", !0)
        }), c.delegate(a + " li :checkbox," + a + " li :radio", "change", function (b) {
            var e = $(this), f = e.closest(d.wrapperSelector);
            d.mutuallyExclusive && c.find(a + " ." + d.toggleClassName).removeClass(d.toggleClassName), $(this).attr("checked") ? f.addClass(d.toggleClassName) : f.removeClass(d.toggleClassName)
        });
        return c.find(a)
    })
}, $.fn.sortableHeader = function (a, b) {
    return $(this).each(function () {
        var c = $(this), d = $.extend({itemSelector:"li", ascendingClass:"asc", descendingClass:"desc"}, b);
        c.delegate(a + " " + d.itemSelector, "click", function (a) {
            a.preventDefault();
            var b = $(this);
            b.hasClass(d.ascendingClass) ? (b.removeClass(d.ascendingClass), b.addClass(d.descendingClass)) : b.hasClass(d.descendingClass) ? (b.removeClass(d.descendingClass), b.addClass(d.ascendingClass)) : (b.parent().find("." + d.ascendingClass + ", ." + d.descendingClass).removeClass(d.ascendingClass + " " + d.descendingClass), b.addClass(d.descendingClass))
        })
    })
}, function (a) {
    a.fn.hardTabs = function (b) {
        var c = a.extend({}, a.fn.hardTabs.defaults, b);
        a(this).hasClass("js-large-data-tabs") && (c.optimizeLargeContents = !0);
        var d = function (b) {
            if (c.optimizeLargeContents) {
                if (b[0] == null)return a();
                b.is(":visible") && !b[0].style.width && b.css({width:b.width() + "px"});
                return b.css({position:"absolute", left:"-9999px"})
            }
            return b.hide()
        }, e = function (b) {
            if (c.optimizeLargeContents) {
                if (b[0] == null)return a();
                b.is(":visible") || b.show();
                return b.css({position:"", left:""})
            }
            return b.show()
        };
        return this.each(function () {
            var b = a(this), c = a(), f = a();
            b.find("a.selected").length == 0 && a(b.find("a")[0]).addClass("selected"), b.find("a").each(function () {
                var g = a(this), h = a.fn.hardTabs.findLastPathSegment(g.attr("href")), i = g.attr("data-container-id") ? g.attr("data-container-id") : h, j = a("#" + i);
                d(j);
                var k = function (h) {
                    if (h.which == 2 || h.metaKey)return!0;
                    j = a("#" + i);
                    if (j.length == 0)return!0;
                    d(f), c.removeClass("selected"), f = e(j), c = g.addClass("selected"), "replaceState"in window.history && h != "stop-url-change" && window.history.replaceState(null, document.title, g.attr("href")), b.trigger("tabChanged", {link:g});
                    return!1
                };
                g.click(k), a('.js-secondary-hard-link[href="' + g.attr("href") + '"]').click(k), g.hasClass("selected") && k("stop-url-change")
            })
        })
    }, a.fn.hardTabs.defaults = {optimizeLargeContents:!1}, a.fn.hardTabs.findLastPathSegment = function (a) {
        a == null && (a = document.location.pathname), a = a.replace(/\?.+|#.+/, "");
        var b = a.match(/[^\/]+\/?$/);
        b.length == 0 && alert("Invalid tab link!");
        return b[0].replace("/", "")
    }
}(jQuery), function (a) {
    function d(a) {
        var d = b[a.which], e, f = "";
        a.ctrlKey && d !== "ctrl" && (f += "ctrl+"), a.altKey && d !== "alt" && (f += "alt+"), a.metaKey && !a.ctrlKey && d !== "meta" && (f += "meta+");
        return a.shiftKey ? (e = c[a.which]) ? "" + f + e : d === "shift" ? "" + f + "shift" : d ? "" + f + "shift+" + d : null : d ? "" + f + d : null
    }

    var b = {8:"backspace", 9:"tab", 13:"enter", 16:"shift", 17:"ctrl", 18:"alt", 19:"pause", 20:"capslock", 27:"esc", 32:"space", 33:"pageup", 34:"pagedown", 35:"end", 36:"home", 37:"left", 38:"up", 39:"right", 40:"down", 45:"insert", 46:"del", 48:"0", 49:"1", 50:"2", 51:"3", 52:"4", 53:"5", 54:"6", 55:"7", 56:"8", 57:"9", 65:"a", 66:"b", 67:"c", 68:"d", 69:"e", 70:"f", 71:"g", 72:"h", 73:"i", 74:"j", 75:"k", 76:"l", 77:"m", 78:"n", 79:"o", 80:"p", 81:"q", 82:"r", 83:"s", 84:"t", 85:"u", 86:"v", 87:"w", 88:"x", 89:"y", 90:"z", 91:"meta", 93:"meta", 96:"0", 97:"1", 98:"2", 99:"3", 100:"4", 101:"5", 102:"6", 103:"7", 104:"8", 105:"9", 106:"*", 107:"+", 109:"-", 110:".", 111:"/", 112:"f1", 113:"f2", 114:"f3", 115:"f4", 116:"f5", 117:"f6", 118:"f7", 119:"f8", 120:"f9", 121:"f10", 122:"f11", 123:"f12", 144:"numlock", 145:"scroll", 186:";", 187:"=", 188:",", 189:"-", 190:".", 191:"/", 192:"`", 219:"[", 220:"\\", 221:"]", 222:"'"}, c = {48:")", 49:"!", 50:"@", 51:"#", 52:"$", 53:"%", 54:"^", 55:"&", 56:"*", 57:"(", 65:"A", 66:"B", 67:"C", 68:"D", 69:"E", 70:"F", 71:"G", 72:"H", 73:"I", 74:"J", 75:"K", 76:"L", 77:"M", 78:"N", 79:"O", 80:"P", 81:"Q", 82:"R", 83:"S", 84:"T", 85:"U", 86:"V", 87:"W", 88:"X", 89:"Y", 90:"Z", 186:":", 187:"+", 188:"<", 189:"_", 190:">", 191:"?", 192:"~", 219:"{", 220:"|", 221:"}", 222:'"'};
    a.browser.mozilla && (c[0] = "?"), a.each(["keydown", "keyup", "keypress"], function () {
        a.event.special[this] = {add:function (b) {
            if (typeof b.data == "string") {
                var c = b.handler, e = b.data;
                b.handler = function (b) {
                    if (this === b.target || !a(b.target).is(":input"))if (e === d(b))return c.apply(this, arguments)
                }
            }
        }}
    }), globalMappings = {}, a(document).bind("keydown.hotkey", function (b) {
        if (!a(b.target).is(":input")) {
            var c = d(b), e = globalMappings[c];
            if (c && e)return e.apply(this, arguments)
        }
    }), a.hotkeys = function (a) {
        for (key in a)globalMappings[key] = a[key];
        return this
    }, a.hotkey = function (a, b) {
        globalMappings[a] = b;
        return this
    }
}(jQuery), function ($) {
    $.fn.editable = function (a, b) {
        var c = {target:a, name:"value", id:"id", type:"text", width:"auto", height:"auto", event:"click", onblur:"cancel", loadtype:"GET", loadtext:"Loading...", placeholder:"Click to edit", submittype:"post", loaddata:{}, submitdata:{}};
        b && $.extend(c, b);
        var d = $.editable.types[c.type].plugin || function () {
        }, e = $.editable.types[c.type].submit || function () {
        }, f = $.editable.types[c.type].buttons || $.editable.types.defaults.buttons, g = $.editable.types[c.type].content || $.editable.types.defaults.content, h = $.editable.types[c.type].element || $.editable.types.defaults.element, i = c.callback || function () {
        };
        $.isFunction($(this)[c.event]) || ($.fn[c.event] = function (a) {
            return a ? this.bind(c.event, a) : this.trigger(c.event)
        }), $(this).attr("title", c.tooltip), c.autowidth = "auto" == c.width, c.autoheight = "auto" == c.height;
        return this.each(function () {
            $.trim($(this).html()) || $(this).html(c.placeholder), $(this)[c.event](function (a) {
                function o() {
                    $(b).html(b.revert), b.editing = !1, $.trim($(b).html()) || $(b).html(c.placeholder)
                }

                var b = this;
                if (!b.editing) {
                    $(b).css("visibility", "hidden"), c.width != "none" && (c.width = c.autowidth ? $(b).width() : c.width), c.height != "none" && (c.height = c.autoheight ? $(b).height() : c.height), $(this).css("visibility", ""), $(this).html().toLowerCase().replace(/;/, "") == c.placeholder.toLowerCase().replace(/;/, "") && $(this).html(""), b.editing = !0, b.revert = $(b).html(), $(b).html("");
                    var j = $("<form/>");
                    c.cssclass && ("inherit" == c.cssclass ? j.attr("class", $(b).attr("class")) : j.attr("class", c.cssclass)), c.style && ("inherit" == c.style ? (j.attr("style", $(b).attr("style")), j.css("display", $(b).css("display"))) : j.attr("style", c.style));
                    var k = h.apply(j, [c, b]), l;
                    if (c.loadurl) {
                        var m = setTimeout(function () {
                            k.disabled = !0, g.apply(j, [c.loadtext, c, b])
                        }, 100), n = {};
                        n[c.id] = b.id, $.isFunction(c.loaddata) ? $.extend(n, c.loaddata.apply(b, [b.revert, c])) : $.extend(n, c.loaddata), $.ajax({type:c.loadtype, url:c.loadurl, data:n, async:!1, success:function (a) {
                            window.clearTimeout(m), l = a, k.disabled = !1
                        }})
                    } else c.data ? (l = c.data, $.isFunction(c.data) && (l = c.data.apply(b, [b.revert, c]))) : l = b.revert;
                    g.apply(j, [l, c, b]), k.attr("name", c.name), f.apply(j, [c, b]), d.apply(j, [c, b]), $(b).append(j), $(":input:visible:enabled:first", j).focus(), c.select && k.select(), k.keydown(function (a) {
                        a.keyCode == 27 && (k.blur(), a.preventDefault(), o())
                    });
                    var m;
                    "cancel" == c.onblur ? k.blur(function (a) {
                        m = setTimeout(o, 500)
                    }) : "submit" == c.onblur ? k.blur(function (a) {
                        j.submit()
                    }) : $.isFunction(c.onblur) ? k.blur(function (a) {
                        c.onblur.apply(b, [k.val(), c])
                    }) : k.blur(function (a) {
                    }), j.submit(function (a) {
                        m && clearTimeout(m), a.preventDefault(), e.apply(j, [c, b]);
                        if ($.isFunction(c.target)) {
                            var d = c.target.apply(b, [k.val(), c]);
                            $(b).html(d), b.editing = !1, i.apply(b, [b.innerHTML, c]), $.trim($(b).html()) || $(b).html(c.placeholder)
                        } else {
                            var f = {};
                            f[c.name] = k.val(), f[c.id] = b.id, $.isFunction(c.submitdata) ? $.extend(f, c.submitdata.apply(b, [b.revert, c])) : $.extend(f, c.submitdata), $(b).html(c.indicator), $.ajax({type:c.submittype, url:c.target, data:f, success:function (a) {
                                $(b).html(a), b.editing = !1, i.apply(b, [b.innerHTML, c]), $.trim($(b).html()) || $(b).html(c.placeholder)
                            }})
                        }
                        return!1
                    }), $(b).bind("reset", o)
                }
            })
        })
    }, $.editable = {types:{defaults:{element:function (a, b) {
        var c = $('<input type="hidden">');
        $(this).append(c);
        return c
    }, content:function (a, b, c) {
        $(":input:first", this).val(a)
    }, buttons:function (a, b) {
        if (a.submit) {
            var c = $('<input type="submit">');
            c.val(a.submit), $(this).append(c)
        }
        if (a.cancel) {
            var d = $('<input type="button">');
            d.val(a.cancel), $(this).append(d), $(d).click(function () {
                $(b).html(b.revert), b.editing = !1
            })
        }
    }}, text:{element:function (a, b) {
        var c = $("<input>");
        a.width != "none" && c.width(a.width), a.height != "none" && c.height(a.height), c.attr("autocomplete", "off"), $(this).append(c);
        return c
    }}, textarea:{element:function (a, b) {
        var c = $("<textarea>");
        a.rows ? c.attr("rows", a.rows) : c.height(a.height), a.cols ? c.attr("cols", a.cols) : c.width(a.width), $(this).append(c);
        return c
    }}, select:{element:function (a, b) {
        var c = $("<select>");
        $(this).append(c);
        return c
    }, content:function (string, settings, original) {
        if (String == string.constructor) {
            eval("var json = " + string);
            for (var key in json) {
                if (!json.hasOwnProperty(key))continue;
                if ("selected" == key)continue;
                var option = $("<option>").val(key).append(json[key]);
                $("select", this).append(option)
            }
        }
        $("select", this).children().each(function () {
            $(this).val() == json.selected && $(this).attr("selected", "selected")
        })
    }}}, addInputType:function (a, b) {
        $.editable.types[a] = b
    }}
}(jQuery), function (a) {
    a.keys = {escape:27, tab:9, space:32, enter:13, backspace:8, scroll:145, capslock:20, numlock:144, pause:19, insert:45, home:36, del:46, end:35, pageup:33, pagedown:34, left:37, up:38, right:39, down:40, "-":109, f1:112, f2:113, f3:114, f4:115, f5:116, f6:117, f7:118, f8:119, f9:120, f10:121, f11:122, f12:123, "/":191}
}(jQuery), function (a) {
    a(".js-oneclick").live("click", function (b) {
        b.preventDefault();
        var c = a(this), d = c.attr("data-afterclick") || "Loading…";
        if (c.attr("disabled"))return!0;
        c.attr("disabled", "disabled"), setTimeout(function () {
            c.find("span").length > 0 ? c.find("span").text(d) : c.text(d)
        }, 50), a(this).parents("form").submit();
        return!0
    })
}(jQuery), function (a) {
    a.fn.pjax = function (b, c) {
        c ? c.container = b : c = a.isPlainObject(b) ? b : {container:b};
        if (typeof c.container != "string")throw"pjax container must be a string selector!";
        return this.live("click", function (b) {
            if (b.which > 1 || b.metaKey)return!0;
            var d = {url:this.href, container:a(this).attr("data-pjax"), clickedElement:a(this)};
            a.pjax(a.extend({}, d, c)), b.preventDefault()
        })
    }, a.pjax = function (b) {
        var c = a(b.container), d = b.success || a.noop;
        delete b.success;
        if (typeof b.container != "string")throw"pjax container must be a string selector!";
        var e = {timeout:650, push:!0, replace:!1, data:{_pjax:!0}, type:"GET", dataType:"html", beforeSend:function (a) {
            c.trigger("start.pjax"), a.setRequestHeader("X-PJAX", "true")
        }, error:function () {
            window.location = b.url
        }, complete:function () {
            c.trigger("end.pjax")
        }, success:function (e) {
            if (!a.trim(e) || /<html/i.test(e))return window.location = b.url;
            c.html(e);
            var f = document.title, g = a.trim(c.find("title").remove().text());
            g && (document.title = g);
            var h = {pjax:b.container, timeout:b.timeout}, i = a.param(b.data);
            i != "_pjax=true" && (h.url = b.url + (/\?/.test(b.url) ? "&" : "?") + i), b.replace ? window.history.replaceState(h, document.title, b.url) : b.push && (a.pjax.active || (window.history.replaceState(a.extend({}, h, {url:null}), f), a.pjax.active = !0), window.history.pushState(h, document.title, b.url)), (b.replace || b.push) && window._gaq && _gaq.push(["_trackPageview"]);
            var j = window.location.hash.toString();
            j !== "" && (window.location.hash = "", window.location.hash = j), d.apply(this, arguments)
        }};
        b = a.extend(!0, {}, e, b), a.isFunction(b.url) && (b.url = b.url());
        var f = a.pjax.xhr;
        f && f.readyState < 4 && (f.onreadystatechange = a.noop, f.abort()), a.pjax.xhr = a.ajax(b), a(document).trigger("pjax", a.pjax.xhr, b);
        return a.pjax.xhr
    };
    var b = "state"in window.history, c = location.href;
    a(window).bind("popstate", function (d) {
        var e = !b && location.href == c;
        b = !0;
        if (!e) {
            var f = d.state;
            if (f && f.pjax) {
                var g = f.pjax;
                a(g + "").length ? a.pjax({url:f.url || location.href, container:g, push:!1, timeout:f.timeout}) : window.location = location.href
            }
        }
    }), a.inArray("state", a.event.props) < 0 && a.event.props.push("state"), a.support.pjax = window.history && window.history.pushState, a.support.pjax || (a.pjax = function (b) {
        window.location = a.isFunction(b.url) ? b.url() : b.url
    }, a.fn.pjax = function () {
        return this
    })
}(jQuery);
var Primer = definePrimer(window.jQuery);
(function (a) {
    function b(a, b) {
        var c = a.find("a");
        if (c.length > 1) {
            var d = c.filter(".selected"), e = c.get().indexOf(d.get(0));
            e = e + b, e >= c.length ? e = 0 : e < 0 && (e = c.length - 1), d.removeClass("selected"), c.eq(e).addClass("selected");
            return!0
        }
    }

    a.fn.quicksearch = function (c) {
        var d = a.extend({url:null, delay:150, spinner:null, insertSpinner:null, loading:a(".quicksearch-loading")}, c);
        d.insertSpinner && !d.spinner && (d.spinner = a('<img src="' + GitHub.Ajax.spinner + '" alt="" class="spinner" />'));
        var e = function (a) {
            return d.results.html(a).show()
        };
        d.results.delegate("a", "mouseover", function (b) {
            var c = a(this);
            c.hasClass("selected") || (d.results.find("a.selected").removeClass("selected"), c.addClass("selected"))
        });
        return this.each(function () {
            function g() {
                d.insertSpinner && d.spinner.hide(), c.trigger("quicksearch.loaded")
            }

            function f() {
                d.insertSpinner && (d.spinner.parent().length || d.insertSpinner.call(c, d.spinner), d.spinner.show()), c.trigger("quicksearch.loading"), d.loading && e(d.loading.html())
            }

            var c = a(this);
            c.autocompleteField({url:d.url || c.attr("data-url"), dataType:d.dataType, delay:d.delay, useCache:!0, minLength:2}).bind("keyup",
                function (a) {
                    a.which != 13 && c.val().length >= 2 && d.results.is(":empty") && f()
                }).bind("autocomplete.beforesend",
                function (a, b) {
                    f()
                }).bind("autocomplete.finish",
                function (a, b) {
                    e(b || {}), g()
                }).bind("autocomplete.clear",
                function (a) {
                    d.results.html("").hide(), g()
                }).bind("focus",
                function (a) {
                    c.val() && c.trigger("keyup")
                }).bind("blur",
                function (a) {
                    setTimeout(function () {
                        c.trigger("autocomplete.clear")
                    }, 150)
                }).bind("keydown", "up",
                function () {
                    if (b(d.results, -1))return!1
                }).bind("keydown", "down",
                function () {
                    if (b(d.results, 1))return!1
                }).bind("keydown", "enter",
                function () {
                    var b, c = d.results.find("a.selected");
                    if (c.length) {
                        a(this).blur(), c.hasClass("initial") ? c.closest("form").submit() : window.location = c.attr("href");
                        return!1
                    }
                    a(this).trigger("autocomplete.clear")
                }).bind("keydown", "esc", function () {
                a(this).blur();
                return!1
            })
        })
    }
})(jQuery), function (a) {
    a.put = function (a, b, c, d) {
        var e = null;
        jQuery.isFunction(b) && (c = b, b = {}), jQuery.isPlainObject(c) && (e = c.error, c = c.success);
        return jQuery.ajax({type:"PUT", url:a, data:b, success:c, error:e, dataType:d})
    }, a.del = function (a, b, c, d) {
        var e = null;
        jQuery.isFunction(b) && (c = b, b = {}), jQuery.isPlainObject(c) && (e = c.error, c = c.success);
        return jQuery.ajax({type:"DELETE", url:a, data:b, success:c, error:e, dataType:d})
    }
}(jQuery), function (a) {
    a.smartPoller = function (b, c) {
        a.isFunction(b) && (c = b, b = 1e3), function d() {
            setTimeout(function () {
                c.call(this, d)
            }, b), b = b * 1.1
        }()
    }
}(jQuery), jQuery.fn.tabs = function () {
    var a = function (a) {
        return/#([a-z][\w.:-]*)$/i.exec(a)[1]
    }, b = window.location.hash.substr(1);
    return this.each(function () {
        var c = null, d = null;
        $(this).find("li a").each(function () {
            var b = $("#" + a(this.href));
            b != [] && (b.hide(), $(this).click(function () {
                var a = $(this), e = function () {
                    d && d.hide(), c && c.removeClass("selected"), c = a.addClass("selected"), d = b.show().trigger("tabChanged", {link:c})
                };
                a.attr("ajax") ? (a.addClass("loading"), $.ajax({url:a.attr("ajax"), success:function (c) {
                    b.html(c), a.removeClass("loading"), a[0].removeAttribute("ajax"), e()
                }, failure:function (a) {
                    alert("An error occured, please reload the page")
                }})) : e();
                return!1
            }), $(this).hasClass("selected") && $(this).click())
        }), $(this).find("li a[href='#" + b + "']").click(), d == null && $($(this).find("li a")[0]).click()
    })
}, function (a) {
    var b = function () {
        var a = typeof document.selection != "undefined" && typeof document.selection.createRange != "undefined";
        return{getSelectionRange:function (b) {
            var c, d, e, f, g, h;
            b.focus();
            if (typeof b.selectionStart != "undefined")c = b.selectionStart, d = b.selectionEnd; else {
                if (!a)throw"Unable to get selection range.";
                e = document.selection.createRange(), f = e.text.length;
                if (e.parentElement() !== b)throw"Unable to get selection range.";
                b.type === "textarea" ? (g = e.duplicate(), g.moveToElementText(b), g.setEndPoint("EndToEnd", e), c = g.text.length - f) : (h = b.createTextRange(), h.setEndPoint("EndToStart", e), c = h.text.length), d = c + f
            }
            return{start:c, end:d}
        }, getSelectionStart:function (a) {
            return this.getSelectionRange(a).start
        }, getSelectionEnd:function (a) {
            return this.getSelectionRange(a).end
        }, setSelectionRange:function (b, c, d) {
            var e, f;
            b.focus(), typeof d == "undefined" && (d = c);
            if (typeof b.selectionStart != "undefined")b.setSelectionRange(c, d); else if (a)e = b.value, f = b.createTextRange(), d -= c + e.slice(c + 1, d).split("\n").length - 1, c -= e.slice(0, c).split("\n").length - 1, f.move("character", c), f.moveEnd("character", d), f.select(); else throw"Unable to set selection range."
        }, getSelectedText:function (a) {
            var b = this.getSelectionRange(a);
            return a.value.substring(b.start, b.end)
        }, insertText:function (a, b, c, d, e) {
            d = d || c;
            var f = b.length, g = c + f, h = a.value.substring(0, c), i = a.value.substr(d);
            a.value = h + b + i, e === !0 ? this.setSelectionRange(a, c, g) : this.setSelectionRange(a, g)
        }, replaceSelectedText:function (a, b, c) {
            var d = this.getSelectionRange(a);
            this.insertText(a, b, d.start, d.end, c)
        }, wrapSelectedText:function (a, b, c, d) {
            var e = b + this.getSelectedText(a) + c;
            this.replaceSelectedText(a, e, d)
        }}
    }();
    window.Selection = b, a.fn.extend({getSelectionRange:function () {
        return b.getSelectionRange(this[0])
    }, getSelectionStart:function () {
        return b.getSelectionStart(this[0])
    }, getSelectionEnd:function () {
        return b.getSelectionEnd(this[0])
    }, getSelectedText:function () {
        return b.getSelectedText(this[0])
    }, setSelectionRange:function (a, c) {
        return this.each(function () {
            b.setSelectionRange(this, a, c)
        })
    }, insertText:function (a, c, d, e) {
        return this.each(function () {
            b.insertText(this, a, c, d, e)
        })
    }, replaceSelectedText:function (a, c) {
        return this.each(function () {
            b.replaceSelectedText(this, a, c)
        })
    }, wrapSelectedText:function (a, c, d) {
        return this.each(function () {
            b.wrapSelectedText(this, a, c, d)
        })
    }})
}(jQuery), function (a) {
    a.fn.tipsy = function (b) {
        b = a.extend({fade:!1, gravity:"n", title:"title", fallback:""}, b || {});
        var c = null;
        this.hover(function () {
            a.data(this, "cancel.tipsy", !0);
            var c = a.data(this, "active.tipsy");
            c || (c = a('<div class="tipsy"><div class="tipsy-inner"/></div>'), c.css({position:"absolute", zIndex:1e5}), a.data(this, "active.tipsy", c)), (this.hasAttribute("title") || !this.hasAttribute("original-title")) && a(this).attr("original-title", a(this).attr("title") || "").removeAttr("title");
            var d;
            typeof b.title == "string" ? d = a(this).attr(b.title == "title" ? "original-title" : b.title) : typeof b.title == "function" && (d = b.title.call(this)), c.find(".tipsy-inner").html(d || b.fallback);
            var e = a.extend({}, a(this).offset(), {width:this.offsetWidth, height:this.offsetHeight});
            c.get(0).className = "tipsy", c.remove().css({top:0, left:0, visibility:"hidden", display:"block"}).appendTo(document.body);
            var f = c[0].offsetWidth, g = c[0].offsetHeight, h = typeof b.gravity == "function" ? b.gravity.call(this) : b.gravity;
            switch (h.charAt(0)) {
                case"n":
                    c.css({top:e.top + e.height, left:e.left + e.width / 2 - f / 2}).addClass("tipsy-north");
                    break;
                case"s":
                    c.css({top:e.top - g, left:e.left + e.width / 2 - f / 2}).addClass("tipsy-south");
                    break;
                case"e":
                    c.css({top:e.top + e.height / 2 - g / 2, left:e.left - f}).addClass("tipsy-east");
                    break;
                case"w":
                    c.css({top:e.top + e.height / 2 - g / 2, left:e.left + e.width}).addClass("tipsy-west")
            }
            b.fade ? c.css({opacity:0, display:"block", visibility:"visible"}).animate({opacity:.8}) : c.css({visibility:"visible"})
        }, function () {
            a.data(this, "cancel.tipsy", !1);
            var c = this;
            setTimeout(function () {
                if (!a.data(this, "cancel.tipsy")) {
                    var d = a.data(c, "active.tipsy");
                    b.fade ? d.stop().fadeOut(function () {
                        a(this).remove()
                    }) : d.remove()
                }
            }, 100)
        }), this.bind("tipsy.reload", function () {
            this.hasAttribute("title") && a(this).attr("original-title", a(this).attr("title") || "").removeAttr("title");
            var c;
            typeof b.title == "string" ? c = a(this).attr(b.title == "title" ? "original-title" : b.title) : typeof b.title == "function" && (c = b.title.call(this));
            var d = a.data(this, "active.tipsy");
            d.find(".tipsy-inner").text(c || b.fallback);
            var e = a.extend({}, a(this).offset(), {width:this.offsetWidth, height:this.offsetHeight}), f = d[0].offsetWidth, g = d[0].offsetHeight, h = typeof b.gravity == "function" ? b.gravity.call(this) : b.gravity;
            switch (h.charAt(0)) {
                case"n":
                    d.css({top:e.top + e.height, left:e.left + e.width / 2 - f / 2});
                    break;
                case"s":
                    d.css({top:e.top - g, left:e.left + e.width / 2 - f / 2});
                    break;
                case"e":
                    d.css({top:e.top + e.height / 2 - g / 2, left:e.left - f});
                    break;
                case"w":
                    d.css({top:e.top + e.height / 2 - g / 2, left:e.left + e.width})
            }
        })
    }, a.fn.tipsy.autoNS = function () {
        return a(this).offset().top > a(document).scrollTop() + a(window).height() / 2 ? "s" : "n"
    }
}(jQuery), function (a) {
    function e(a) {
        return"tagName"in a ? a : a.parentNode
    }

    try {
        window.document.createEvent("TouchEvent")
    } catch (b) {
        return!1
    }
    var c = {}, d;
    a(document).ready(function () {
        a(document.body).bind("touchstart",
            function (a) {
                var b = Date.now(), f = b - (c.last || b);
                c.target = e(a.originalEvent.touches[0].target), d && clearTimeout(d), c.x1 = a.originalEvent.touches[0].pageX, f > 0 && f <= 250 && (c.isDoubleTap = !0), c.last = b
            }).bind("touchmove",
            function (a) {
                c.x2 = a.originalEvent.touches[0].pageX
            }).bind("touchend",
            function (b) {
                c.isDoubleTap ? (a(c.target).trigger("doubleTap"), c = {}) : c.x2 > 0 ? (Math.abs(c.x1 - c.x2) > 30 && a(c.target).trigger("swipe") && a(c.target).trigger("swipe" + (c.x1 - c.x2 > 0 ? "Left" : "Right")), c.x1 = c.x2 = c.last = 0) : "last"in c && (d = setTimeout(function () {
                    d = null, a(c.target).trigger("tap"), c = {}
                }, 250))
            }).bind("touchcancel", function () {
            c = {}
        })
    }), ["swipe", "swipeLeft", "swipeRight", "doubleTap", "tap"].forEach(function (b) {
        a.fn[b] = function (a) {
            return this.bind(b, a)
        }
    })
}(jQuery), jQuery.fn.truncate = function (a, b) {
    function e(a) {
        d && a.style.removeAttribute("filter")
    }

    b = jQuery.extend({chars:/\s/, trail:["...", ""]}, b);
    var c = {}, d = $.browser.msie;
    return this.each(function () {
        var d = jQuery(this), f = d.html().replace(/\r\n/gim, ""), g = f, h = /<\/?[^<>]*\/?>/gim, i, j = {}, k = $("*").index(this);
        while ((i = h.exec(g)) != null)j[i.index] = i[0];
        g = jQuery.trim(g.split(h).join(""));
        if (g.length > a) {
            var l;
            while (a < g.length) {
                l = g.charAt(a);
                if (l.match(b.chars)) {
                    g = g.substring(0, a);
                    break
                }
                a--
            }
            if (f.search(h) != -1) {
                var m = 0;
                for (eachEl in j)g = [g.substring(0, eachEl), j[eachEl], g.substring(eachEl, g.length)].join(""), eachEl < g.length && (m = g.length);
                d.html([g.substring(0, m), g.substring(m, g.length).replace(/<(\w+)[^>]*>.*<\/\1>/gim, "").replace(/<(br|hr|img|input)[^<>]*\/?>/gim, "")].join(""))
            } else d.html(g);
            c[k] = f, d.html(["<div class='truncate_less'>", d.html(), b.trail[0], "</div>"].join("")).find(".truncate_show", this).click(function () {
                d.find(".truncate_more").length == 0 && d.append(["<div class='truncate_more' style='display: none;'>", c[k], b.trail[1], "</div>"].join("")).find(".truncate_hide").click(function () {
                    d.find(".truncate_more").css("background", "#fff").fadeOut("normal", function () {
                        d.find(".truncate_less").css("background", "#fff").fadeIn("normal", function () {
                            e(this), $(this).css("background", "none")
                        }), e(this)
                    });
                    return!1
                }), d.find(".truncate_less").fadeOut("normal", function () {
                    d.find(".truncate_more").fadeIn("normal", function () {
                        e(this)
                    }), e(this)
                }), jQuery(".truncate_show", d).click(function () {
                    d.find(".truncate_less").css("background", "#fff").fadeOut("normal", function () {
                        d.find(".truncate_more").css("background", "#fff").fadeIn("normal", function () {
                            e(this), $(this).css("background", "none")
                        }), e(this)
                    });
                    return!1
                });
                return!1
            })
        }
    })
}, function (a) {
    var b = [], c = a(window).width(), d = a(window).height();
    a(window).resize(function () {
        c = a(window).width(), d = a(window).height()
    }), a.fn.plaxify = function (a) {
        var c = {xRange:0, yRange:0, invert:!1}, d = this.position();
        for (var e in a)c[e] == 0 && (c[e] = a[e]);
        c.obj = this, c.startX = d.left, c.startY = d.top, c.invert == !1 ? (c.startX -= Math.floor(c.xRange / 2), c.startY -= Math.floor(c.yRange / 2)) : (c.startX += Math.floor(c.xRange / 2), c.startY += Math.floor(c.yRange / 2)), b.push(c)
    }, a.plax = {listLayers:function () {
        console.log(b)
    }, enable:function () {
        a(document).mousemove(function (e) {
            var f = e.pageX, g = e.pageY, h = Math.round(f / c * 100) / 100, i = Math.round(g / d * 100) / 100;
            a.each(b, function (a, b) {
                b.invert != !0 ? (b.obj.css("left", b.startX + b.xRange * h), b.obj.css("top", b.startY + b.yRange * i)) : (b.obj.css("left", b.startX - b.xRange * h), b.obj.css("top", b.startY - b.yRange * i))
            })
        })
    }, disable:function () {
        clearTimeout(timer)
    }}
}(jQuery), String.prototype.score = function (a, b) {
    var c = 0, d = a.length, e = this, f = e.length, g, h, i = 1, j;
    if (e == a)return 1;
    for (var k = 0, l, m, n, o, p, q; k < d; ++k) {
        n = a[k], o = e.indexOf(n.toLowerCase()), p = e.indexOf(n.toUpperCase()), q = Math.min(o, p), m = q > -1 ? q : Math.max(o, p);
        if (m === -1) {
            if (b) {
                i += 1 - b;
                break
            }
            return 0
        }
        l = .1, e[m] === n && (l += .1), m === 0 && (l += .6, k === 0 && (g = 1)), e.charAt(m - 1) === " " && (l += .8), e = e.substring(m + 1, f), c += l
    }
    h = c / d, j = (h * (d / f) + h) / 2, j = j / i, g && j + .15 < 1 && (j += .15);
    return j
}, GitHub.gravatar = function (a, b) {
    b = b || 35;
    var c = location.protocol == "https:" ? "https://secure.gravatar.com" : "http://gravatar.com", d = location.protocol == "https:" ? "https" : "http";
    return'<img src="' + c + "/avatar/" + a + "?s=140&d=" + d + '%3A%2F%2Fgithub.com%2Fimages%2Fgravatars%2Fgravatar-140.png" width="' + b + '" height="' + b + '" />'
}, Function.prototype.delay = function (a) {
    return setTimeout(this, a)
}, String.prototype.capitalize = function () {
    return this.replace(/\w+/g, function (a) {
        return a.charAt(0).toUpperCase() + a.substr(1).toLowerCase()
    })
}, jQuery.expr[":"].Contains = function (a, b, c) {
    return(a.textContent || a.innerText || "").toLowerCase().indexOf(c[3].toLowerCase()) >= 0
}, $.fn.scrollTo = function (a, b) {
    var c, d;
    typeof a == "number" || !a ? (b = a, c = this, d = "html,body") : (c = a, d = this);
    var e = $(c).offset().top - 30;
    $(d).animate({scrollTop:e}, b || 1e3);
    return this
}, $.fn.spin = function () {
    return this.after('<img src="' + GitHub.Ajax.spinner + '" id="spinner"/>')
}, $.fn.stopSpin = function () {
    $("#spinner").remove();
    return this
}, $.fn.contextLoader = function (a) {
    var b = '<div class="context-loader">Sending Request&hellip;</div>';
    return this.after($(b).css("top", a))
}, GitHub.Ajax = {}, GitHub.Ajax.spinner = (GitHub.assetHost || "") + "/images/modules/ajax/indicator.gif", GitHub.Ajax.error = (GitHub.assetHost || "") + "/images/modules/ajax/error.png", $(function () {
    function b() {
        $("#facebox .cheatsheet:visible").length ? $.facebox.close() : $.facebox({div:"#markdown-help"}, "cheatsheet")
    }

    $(".previewable-comment-form").previewableCommentForm(), $(".cards_select").cardsSelect(), $(document).bind("reveal.facebox", function () {
        $(".cards_select").cardsSelect()
    }), $(".js-entice").each(function () {
        $(this).enticeToAction({title:$(this).attr("data-entice")})
    }), $("textarea.js-autosize").autoResize({animateDuration:300, extraSpace:10}), $(".flash .close").click(function () {
        $(this).closest(".flash").fadeOut(300)
    }), $(".tooltipped").each(function () {
        var a = $(this), b = a.hasClass("downwards") ? "n" : "s";
        b = a.hasClass("rightwards") ? "w" : b, b = a.hasClass("leftwards") ? "e" : b, a.tipsy({gravity:b})
    }), $(".toggle_link").click(function () {
        $($(this).attr("href")).toggle();
        return!1
    }), $(".hide_alert").live("click", function () {
        $("#site_alert").slideUp(), $.cookie("hide_alert_vote", "t", {expires:7, path:"/"});
        return!1
    }), $(".hide_div").click(function () {
        $(this).parents("div:first").fadeOut();
        return!1
    });
    var a = $("#login_field");
    a.val() ? a.length && $("#password").focus() : a.focus(), $("#versions_select").change(function () {
        location.href = this.value
    }), $(document).bind("loading.facebox", function () {
        $(".clippy").hide()
    }), $(document).bind("reveal.facebox", function () {
        $("#facebox .clippy").show()
    }), $(document).bind("close.facebox", function () {
        $(".clippy").show()
    }), $(".pjax a").pjax(".site:first"), $(".js-date-input").date_input(), $.fn.truncate && $(".truncate").bind("truncate",
        function () {
            $(this).truncate(50, {chars:/.*/})
        }).trigger("truncate"), $.hotkeys({s:function () {
        c.focus();
        return!1
    }, "?":function () {
        $(document).one("reveal.facebox", function () {
            $(".js-see-all-keyboard-shortcuts").click(function () {
                $(this).remove(), $("#facebox :hidden").show();
                return!1
            })
        }), $.facebox({div:"#keyboard_shortcuts_pane"}, "shortcuts")
    }, m:function () {
        b()
    }}), $(".gfm-help").click(function (a) {
        a.preventDefault(), b()
    });
    var c = $(".topsearch input[name=q]");
    if ("_auth_token"in window) {
        var d = window.location.pathname, e = window._auth_token, f = "&request_uri=" + encodeURIComponent(d) + "&authenticity_token=" + encodeURIComponent(e);
        $.ajaxSetup({beforeSend:function (a, b) {
            a.setRequestHeader("Accept", "text/javascript"), b.data ? b.data += f : b.data || (b.data = f, a.setRequestHeader("Content-Type", b.contentType))
        }})
    } else $.ajaxSetup({beforeSend:function (a, b) {
        a.setRequestHeader("Accept", "text/javascript")
    }});
    $("button, .minibutton").live("mousedown",
        function () {
            $(this).addClass("mousedown")
        }).live("mouseup mouseleave", function () {
        $(this).removeClass("mousedown")
    }), $("ul.inline-tabs").tabs(), $(".js-hard-tabs").hardTabs(), BaconPlayer.sm2 = "/javascripts/soundmanager/sm2.js";
    var g = !1, h = !1, i = !1, j = function () {
        i || g && h && (i = !0, $(document.body).addClass("usingMouse"))
    };
    $(document).mousemove(function () {
        g = !0, j()
    }), $(document).mousedown(function () {
        h = !0, j()
    }), $("button.classy, a.button.classy").mousedown(
        function () {
            $(this).addClass("mousedown")
        }).bind("mouseup mouseleave", function () {
        $(this).removeClass("mousedown")
    }), $(".js-placeholder-field label.placeholder").fancyplace(), $(document).editableComment()
}), $.fn.facebox && $(document).pageUpdate(function () {
    $(this).find("a[rel*=facebox]").facebox()
}), $.extend($.facebox.settings, {loadingImage:(GitHub.assetHost || "") + "/images/modules/facebox/loading.gif", closeImage:(GitHub.assetHost || "") + "/images/modules/facebox/closelabel.png"}), GitHub.Autocomplete = function () {
}, GitHub.Autocomplete.gravatars = {}, GitHub.Autocomplete.visibilities = {}, GitHub.Autocomplete.acceptable = function (a) {
    a.result(function (a, b) {
        var c = $(this);
        setTimeout(function () {
            c.val() && (c.addClass("ac-accept"), c.data("accept-val", c.val()))
        }, 30)
    }), a.keypress(function (a) {
        $(this).data("accept-val") != $(this).val() && $(this).removeClass("ac-accept")
    }), a.keydown(function (a) {
        $(this).data("accept-val") != $(this).val() && $(this).removeClass("ac-accept")
    }), a.keyup(function (a) {
        $(this).data("accept-val") != $(this).val() && $(this).removeClass("ac-accept")
    }), a.parents("form:first").submit(function () {
        $(this).removeClass("ac-accept")
    })
}, GitHub.Autocomplete.prototype = {usersURL:"/autocomplete/users", reposURL:"/autocomplete/repos", myReposURL:"/autocomplete/repos/mine", branchesURL:"/autocomplete/branches", settings:{}, repos:function (a) {
    a = $(a);
    if (!$.fn.autocomplete || a.length == 0)return a;
    var b = a.autocomplete(this.reposURL, $.extend({delay:10, width:210, minChars:2, selectFirst:!1, formatItem:function (a) {
        a = a[0].split(" ");
        var b = a[0], c = a[1];
        GitHub.Autocomplete.visibilities[b] = c;
        return b
    }, formatResult:function (a) {
        return a[0].split(" ")[0]
    }, autoResult:!0}, this.settings));
    GitHub.Autocomplete.acceptable(b);
    return b
}, myRepos:function (a) {
    a = $(a);
    if (!$.fn.autocomplete || a.length == 0)return a;
    if (!github_user)return a;
    return a.autocomplete(this.myReposURL, $.extend({delay:10, width:210, selectFirst:!1, formatItem:function (a) {
        a = a[0].split(" ");
        var b = a[0], c = a[1];
        GitHub.Autocomplete.visibilities[b] = c;
        return b
    }, formatResult:function (a) {
        return a[0].split(" ")[0]
    }}, this.settings)).result(
        function (a, b, c) {
            window.location = "/" + b[0].split(" ")[0];
            return!1
        }).keydown(
        function (b) {
            if (!/\//.test(a.val()) && b.keyCode == 9) {
                var c = $(".ac_results li:first").text();
                if (c) {
                    a.val(c), window.location = "/" + c;
                    return!1
                }
            }
        }).end()
}, users:function (a) {
    a = $(a);
    if (!$.fn.autocomplete || a.length == 0)return a;
    var b = a.autocomplete(this.usersURL, $.extend({delay:10, minChars:1, formatItem:function (a) {
        a = a[0].split(" ");
        var b = a[0], c = GitHub.gravatar(a[1], 20);
        GitHub.Autocomplete.gravatars[b] = c;
        return c + " " + b
    }, formatResult:function (a) {
        return a[0].split(" ")[0]
    }, autoResult:!0}, this.settings));
    GitHub.Autocomplete.acceptable(b);
    return b
}, branches:function (a, b) {
    a = $(a);
    if (!$.fn.autocomplete || a.length == 0)return a;
    b || (b = {}), b = $.extend({extraParams:{repository:GitHub.nameWithOwner, current:GitHub.currentRef}, matchCase:!0, minChars:0, matchContains:!0, selectFirst:!0, autoResult:!0}, b);
    var c = a.autocomplete(this.branchesURL, $.extend(this.settings, b));
    GitHub.Autocomplete.acceptable(c);
    return c
}}, $.userAutocomplete = function () {
    $(".autocompleter, .user-autocompleter").userAutocomplete()
}, $.fn.userAutocomplete = function () {
    return(new GitHub.Autocomplete).users(this)
}, $.repoAutocomplete = function () {
}, $.fn.repoAutocomplete = function () {
    return(new GitHub.Autocomplete).repos(this)
}, $.myReposAutocomplete = function () {
    $(".my_repos_autocompleter").myReposAutocomplete()
}, $.fn.myReposAutocomplete = function () {
    return(new GitHub.Autocomplete).myRepos(this)
}, $.fn.branchesAutocomplete = function (a) {
    return(new GitHub.Autocomplete).branches(this, a)
}, $(function () {
    $.userAutocomplete(), $.myReposAutocomplete()
}), GitHub || (GitHub = {}), GitHub.Blob || (GitHub.Blob = {}), GitHub.Blob.highlightLines = function (a) {
    var b, c;
    $(".line").css("background-color", "transparent"), a ? (b = $(this).attr("rel"), a.shiftKey && (b = window.location.hash.replace(/-\d+/, "") + "-" + b.replace(/\D/g, "")), window.location.hash = b) : b = window.location.hash;
    if (c = b.match(/#?(?:L|-)(\d+)/g)) {
        c = $.map(c, function (a) {
            return parseInt(a.replace(/\D/g, ""))
        });
        if (c.length == 1)return $("#LC" + c[0]).css("background-color", "#ffc");
        for (var d = c[0]; d <= c[1]; d++)$("#LC" + d).css("background-color", "#ffc");
        $("#LC" + c[0]).scrollTo(1)
    }
    return!1
}, GitHub.Blob.scrollToHilightedLine = function () {
    var a, b = window.location.hash;
    if (a = b.match(/^#?(?:L|-)(\d+)$/g))a = $.map(a, function (a) {
        return parseInt(a.replace(/\D/g, ""))
    }), $("#L" + a[0]).scrollTo(1)
}, GitHub.Blob.show = function () {
    $.hotkeys({e:function () {
        $(".file-edit-link").hasClass("js-edit-link-disabled") || (window.location = $(".file-edit-link").attr("href"))
    }, l:function () {
        $(document).one("reveal.facebox", function () {
            var a = $("#facebox").find(":text");
            a.focus(), $("#facebox form").submit(function () {
                window.location = "#L" + parseInt(a.val()), GitHub.Blob.highlightLines(), a.blur(), $(document).trigger("close.facebox");
                return!1
            })
        }), $.facebox({div:"#jump-to-line"});
        return!1
    }});
    if (!GitHub.loggedIn || !GitHub.currentRef)$(".file-edit-link").enticeToAction({title:"You must be logged in and on a branch to make or propose changes", direction:"leftwards"}), $(".file-edit-link").addClass("js-edit-link-disabled"); else if (GitHub.loggedIn && GitHub.currentRef) {
        var a = $(".file-edit-link"), b = a[0];
        if (b) {
            b.href = b.href.replace("__current_ref__", GitHub.currentRef);
            if (!GitHub.hasWriteAccess) {
                var c = $(".file-edit-link > span");
                c.text("Fork and edit this file"), a.attr("title", "Clicking this button will automatically fork this project so you can edit the file"), a.tipsy({gravity:"e"})
            }
        }
    }
}, $(function () {
    $(".page-blob").length > 0 && (GitHub.Blob.scrollToHilightedLine(), GitHub.Blob.highlightLines(), GitHub.Blob.show()), $(".line_numbers span[rel]").live("mousedown", GitHub.Blob.highlightLines), $(".file-edit-link").live("click", function () {
        if ($(this).hasClass("entice"))return!1;
        return!0
    }), $("#cancel-blob-editing").live("click", function () {
        $(".blob-editor").remove(), $("#readme").show(), $("#files").children().show();
        return!1
    }), $(".file").delegate(".linkable-line-number", "click", function (a) {
        document.location.hash = this.id;
        return!1
    })
}), $(function () {
    window.editor = new GitHub.CodeEditor(".file-editor-textarea"), $(editor.div).bind("toggleFullscreen", function () {
        $("#files").toggleClass("fullscreen"), $(".subnav-bar").toggle(), $(".js-commit-form").toggle()
    })
}), $(function () {
    var a = 2, b = 7, c = 30, d = 1e4;
    $(".diverge-widget").each(function () {
        var d = $(this), e = new Date(d.attr("last-updated")), f = (new Date - e) / 1e3 / 3600 / 24;
        f <= a ? d.addClass("hot") : f <= b ? d.addClass("fresh") : f <= c ? d.addClass("stale") : d.addClass("old")
    })
}), function (a) {
    a.hotkeys({y:function () {
        var b = a("link[rel='canonical']").attr("href"), c = a("title");
        b && (b = b + location.hash, window.history && "pushState"in window.history ? window.history.pushState({}, c, b) : window.location.href = b)
    }})
}(jQuery), GitHub.CodeEditor = function (a) {
    if (!!window.ace) {
        this.textarea = $(a);
        if (this.textarea.length == 0)return;
        this.frame = {width:this.textarea.width(), height:this.textarea.height()};
        var b = this.textarea.text(), c = this.textarea.attr("data-language");
        this.ace = this.createEditor(b), this.setTheme("twilight"), this.ace.setShowPrintMargin(!1), this.setMode(c), this.setUseSoftTabs(this.usesSoftTabs(b)), this.setTabSize(this.useSoftTabs ? this.guessTabSize(b) : 8), this.setupKeyBindings(), this.setupFormBindings(), this.setupHacks(), this.useSoftTabs ? console.log("indent: %d", this.tabSize) : console.log("indent: \\t")
    }
}, GitHub.CodeEditor.prototype = {modeMap:{"c++":"c_cpp", coffeescript:"coffee", "objective-c":"c_cpp"}, frame:{width:0, height:0}, code:function () {
    return this.ace.getSession().getValue()
}, setCode:function (a) {
    return this.ace.getSession().setValue(a)
}, createEditor:function (a) {
    this.div = this.swapTextareaWithEditorDiv(a);
    return ace.edit(this.div[0])
}, guessTabSize:function (a) {
    var b = /^( +)[^*]/im.exec(a || this.code());
    return b ? b[1].length : 2
}, modeNameForLanguage:function (a) {
    if (!a)return"text";
    a = a.toLowerCase();
    return this.modeMap[a] || a
}, modeForLanguage:function (a) {
    if (!!a) {
        var b = this.modeNameForLanguage(a);
        console.log("mode: %s", b);
        try {
            return require("ace/mode/" + b).Mode
        } catch (c) {
            return null
        }
    }
}, swapTextareaWithEditorDiv:function (a) {
    this.textarea.hide();
    return $('<div id="ace-editor">').css("height", this.frame.height).css("width", this.frame.width).text(a).insertAfter(this.textarea)
}, setMode:function (a) {
    var b = this.modeForLanguage(a);
    b && this.ace.getSession().setMode(new b)
}, setupFormBindings:function () {
    var a = this;
    a.textarea.parents("form").bind("submit", function () {
        a.textarea.text(a.code())
    })
}, setupHacks:function () {
    $(".ace_gutter").css("height", this.frame.height)
}, setupKeyBindings:function () {
    var a = this, b = require("pilot/canon");
    b.addCommand({name:"fullscreen", bindKey:{win:"Ctrl-Return", mac:"Command-Return", sender:"editor"}, exec:function () {
        a.toggleFullscreen()
    }})
}, setUseSoftTabs:function (a) {
    this.useSoftTabs = a, this.ace.getSession().setUseSoftTabs(a)
}, setTabSize:function (a) {
    this.tabSize = a, this.ace.getSession().setTabSize(a)
}, setTheme:function (a) {
    var b = this.div[0].className.split(" ");
    for (var c in b)/
    ace - /.test(b[c])&&this.div.removeClass(b[c]);this.div.addClass("ace-"+a)},toggleFullscreen:function(){this.fullscreen?(this.fullscreen=!1,this.div.trigger("exitFullscreen"),$("#ace-editor").css("height",this.frame.height),$("#ace-editor").css("width",this.frame.width),$(".ace_gutter").css("height",this.frame.height)):(this.fullscreen=!0,this.div.trigger("enterFullscreen"),$("#ace-editor").css("height",null),$("#ace-editor").css("width",null),$(".ace_gutter").css("height",null)),this.div.toggleClass("fullscreen"),this.div.trigger("toggleFullscreen"),this.ace.resize()},usesSoftTabs:function(a){return!/ ^\t / m.test(a || this.code())
}}, Comment = {enhanceEmailToggles:function () {
    $(".email-hidden-toggle").each(function () {
        var a = $(this), b = a.find("a"), c = a.next(".email-hidden-reply");
        b.click(function () {
            c.is(":visible") ? (c.hide(), b.html("Show quoted text")) : (c.show(), b.html("Hide quoted text"));
            return!1
        })
    })
}}, $(Comment.enhanceEmailToggles), GitHub.G_vmlCanvasManager, GitHub.Commit = {dumpEmptyClass:function () {
    $(this).removeClass("empty")
}, addEmptyClass:function () {
    !$(this).data("clicked") && $(this).text() == "0" && $(this).addClass("empty")
}, highlightLine:function () {
    $(this).parent().css("background", "#ffc")
}, unhighlightLine:function () {
    $(this).data("clicked") || $(this).parent().css("background", "")
}, jumpToHashFile:function () {
    if (!!window.location.hash) {
        var a, b, c = window.location.hash.substr(1);
        if (/^diff-\d+$/.test(c))return;
        if (c.match(/^r\d+$/) && (b = $("#files #" + c)).length > 0) {
            console.log("jumping to review comment", b), $(b).addClass("selected"), $("html,body").animate({scrollTop:b.offset().top - 200}, 1);
            return
        }
        (a = c.match(/(.+)-P(\d+)$/) || c.match(/(.+)/)) && (b = GitHub.Commit.files[a[1]]) && (a[2] ? (b = $(b).closest(".file").find('tr[data-position="' + a[2] + '"] pre'), b.length > 0 && (b.scrollTo(1), setTimeout(function () {
            GitHub.Commit.highlightLine.call(b)
        }, 50))) : $(b).closest(".file").scrollTo(1))
    }
}, onHashChange:function () {
    window.location.hash != GitHub.Commit.oldHash && (GitHub.Commit.oldHash = window.location.hash, GitHub.Commit.jumpToHashFile())
}}, $(function () {
    function c(a) {
        a.find(".inline-comment-form").show().find("textarea").focus(), a.find(".show-inline-comment-form a").hide()
    }

    var a = {};
    $("#files.diff-view > .file > .meta").each(function () {
        a[$(this).attr("data-path")] = this
    }), GitHub.Commit.files = a;
    var b = function (a) {
        a.find("ul.inline-tabs").tabs(), a.find(".show-inline-comment-form a").click(function () {
            a.find(".inline-comment-form").show().find("textarea").focus(), $(this).hide();
            return!1
        }), a.delegate(".close-form", "click", function () {
            a.find(".inline-comment-form").hide(), a.find(".commit-comment", ".review-comment").length > 0 ? a.find(".show-inline-comment-form a").show() : (console.log(a), a.remove());
            return!1
        });
        var b = a.find(".previewable-comment-form").previewableCommentForm().closest("form");
        b.submit(function () {
            b.find(".ajaxindicator").show(), b.find("button").attr("disabled", "disabled"), b.ajaxSubmit({success:function (a) {
                var c = b.closest(".clipper"), d = c.find(".comment-holder");
                d.length == 0 && (d = c.prepend($('<div class="inset comment-holder"></div>')).find(".comment-holder")), a = $(a), d.append(a), a.trigger("pageUpdate"), b.find("textarea").val(""), b.find(".ajaxindicator").hide(), b.find("button").attr("disabled", ""), c.find(".inline-comment-form").hide(), c.find(".show-inline-comment-form a").show();
                var e = c.closest(".inline-comments").find(".comment-count .counter");
                e.text(parseInt(e.text().replace(",", "")) + 1), $(c.closest(".file-box, .file")).trigger("commentChange", a)
            }});
            return!1
        })
    };
    "onhashchange"in window ? ($(window).bind("hashchange", GitHub.Commit.onHashChange), GitHub.Commit.onHashChange()) : setInterval(GitHub.Commit.onHashChange, 50), $(".inline-review-comment tr.inline-comments").each(function () {
        b($(this))
    }), $("#diff-comment-data > table").each(function () {
        var c = $(this).attr("data-path"), d = $(this).attr("data-position"), e = $(a[c]).closest(".file"), f = e.find('.data table tr[data-position="' + d + '"]');
        f.after($(this).find("tr").detach()), b(f.next("tr.inline-comments")), e.find(".show-inline-comments-toggle").closest("li").show()
    }), $("#diff-comment-data > div").each(function () {
        var b = $(this).attr("data-path");
        $(a[b]).closest(".file").find(".file-comments-place-holder").replaceWith($(this).detach())
    }), $('.inline-comment-form div[id^="write_bucket_"]').live("tabChanged", function () {
        var a = $(this);
        setTimeout(function () {
            a.find("textarea").focus()
        }, 13)
    }), $(".add-bubble").live("click", function () {
        var a = $(this).closest("tr"), d = a.next("tr.inline-comments");
        d.length > 0 ? c(d) : $.get($(this).attr("remote"), function (e) {
            a.after(e), d = a.next("tr.inline-comments"), b(d), c(d)
        })
    }), $("#files .show-inline-comments-toggle").change(
        function () {
            this.checked ? $(this).closest(".file").find("tr.inline-comments").show() : $(this).closest(".file").find("tr.inline-comments").hide()
        }).change(), $("#inline_comments_toggle input").change(
        function () {
            this.checked ? $("#comments").removeClass("only-commit-comments") : $("#comments").addClass("only-commit-comments")
        }).change(), $(".js-show-suppressed-diff").click(function () {
        $(this).parent().next().show(), $(this).parent().hide();
        return!1
    }), $(".js-commit-link, .js-tree-link, .js-parent-link").each(function () {
        var a = $(this).attr("href");
        $.hotkey($(this).attr("data-key"), function () {
            window.location = a
        })
    })
}), $(function () {
    if ($("#files .image").length) {
        var a = $("#files .file:has(.onion-skin)");
        $.each(a, function (b, c) {
            function F() {
                var a = y / x * 100 + "%";
                d.find(".progress-bar").animate({width:a}, 250, "easeOutQuart")
            }

            function E() {
                var a = 858, b = Math.max(z.width, A.width), c = Math.max(z.height, A.height), i = 1, j = 1, v = 1, x = 1;
                z.marginHoriz = Math.floor((b - z.width) / 2), z.marginVert = Math.floor((c - z.height) / 2), A.marginHoriz = Math.floor((b - A.width) / 2), A.marginVert = Math.floor((c - A.height) / 2), b > (a - 30) / 2 && (i = (a - 30) / 2 / b), k.attr({width:z.width * i, height:z.height * i}), l.attr({width:A.width * i, height:A.height * i}), e.find(".deleted-frame").css({margin:z.marginVert * i + "px " + z.marginHoriz * i + "px", width:z.width * i + 2, height:z.height * i + 2}), e.find(".added-frame").css({margin:A.marginVert * i + "px " + A.marginHoriz * i + "px", width:A.width * i + 2, height:A.height * i + 2}), e.find(".aWMeta").eq(0).text(A.width + "px"), e.find(".aHMeta").eq(0).text(A.height + "px"), e.find(".dWMeta").eq(0).text(z.width + "px"), e.find(".dHMeta").eq(0).text(z.height + "px"), A.width != z.width && (e.find(".aWMeta").eq(0).addClass("a-green"), e.find(".dWMeta").eq(0).addClass("d-red")), A.height != z.height && (e.find(".aHMeta").eq(0).addClass("a-green"), e.find(".dHMeta").eq(0).addClass("d-red")), b > a - 12 && (j = (a - 12) / b), m.attr({width:z.width * j, height:z.height * j}), n.attr({width:A.width * j, height:A.height * j}), f.find(".deleted-frame").css({margin:z.marginVert * j + "px " + z.marginHoriz * j + "px", width:z.width * j + 2, height:z.height * j + 2}), f.find(".added-frame").css({margin:A.marginVert * j + "px " + A.marginHoriz * j + "px", width:A.width * j + 2, height:A.height * j + 2}), f.find(".swipe-shell").css({width:b * j + 3 + "px", height:c * j + 4 + "px"}), f.find(".swipe-frame").css({width:b * j + 18 + "px", height:c * j + 30 + "px"}), f.find(".swipe-bar").draggable({axis:"x", containment:"parent", drag:function (a, c) {
                    var e = Math.round(c.position.left / (parseInt(d.find(".swipe-frame").css("width")) - 15) * 1e4) / 1e4, f = b * j + 3;
                    d.find(".swipe .swipe-shell").css("width", f - f * e)
                }}), b > a - 12 && (v = (a - 12) / b), o.attr({width:z.width * v, height:z.height * v}), p.attr({width:A.width * v, height:A.height * v}), g.find(".deleted-frame").css({margin:z.marginVert * v + "px " + z.marginHoriz * v + "px", width:z.width * v + 2, height:z.height * v + 2}), g.find(".added-frame").css({margin:A.marginVert * v + "px " + A.marginHoriz * v + "px", width:A.width * v + 2, height:A.height * v + 2}), g.find(".onion-skin-frame").css({width:b * v + 4 + "px", height:c * v + 30 + "px"}), d.find(".dragger").css("left", "262px"), d.find(".dragger").draggable({axis:"x", containment:"parent", drag:function (a, b) {
                    var c = Math.round(b.position.left / 262 * 100) / 100;
                    d.find(".onion-skin .added-frame").css("opacity", c), d.find(".onion-skin .added-frame img").css("opacity", c)
                }}), b > a - 4 && (x = (a - 4) / b), q[0].getContext && (q.attr({width:b * x, height:c * x}), r.attr({width:b * x, height:c * x}), h.find(".added-frame").css({width:b * x + 2, height:c * x + 2}), h.find(".deleted-frame").css({width:b * x + 2, height:c * x + 2}), s.drawImage(z, z.marginHoriz * x, z.marginVert * x, z.width * x, z.height * x), t.drawImage(A, A.marginHoriz * x, A.marginVert * x, A.width * x, A.height * x), t.blendOnto(s, "difference")), e.css("height", c * i + 30), f.css("height", c * j + 30), g.css("height", c * j + 30), h.css("height", c * j + 30), u.children().removeClass("disabled"), D(w)
            }

            function D(a) {
                var b = u.find(".active"), c = u.find(".active").first().index(), d = v.eq(c), e = u.children().eq(a);
                if (e.hasClass("active") == !1 && e.hasClass("disabled") == !1) {
                    b.removeClass("active"), e.addClass("active");
                    if (e.is(":visible")) {
                        var f = e.position(), g = e.outerWidth(), h = String(f.left + g / 2) + "px 0px";
                        u.css("background-image", "url(/images/modules/commit/menu_arrow.gif)"), u.animate({backgroundPosition:h}, 250, "easeOutQuart")
                    }
                    y >= 2 && (actualHeight = d.css("height"), animHeight = v.eq(a).css("height"), d.animate({height:animHeight, opacity:"hide"}, 250, "easeOutQuart", function () {
                        d.css("height", actualHeight), v.eq(a).fadeIn(250)
                    }))
                }
            }

            function C() {
                y++, F();
                if (y >= x) {
                    var a = d.find(".progress");
                    a.is(":visible") ? a.fadeOut(250, function () {
                        E()
                    }) : (a.hide(), E())
                }
            }

            function B() {
                return!!document.createElement("canvas").getContext
            }

            var d = a.eq(b), e = d.find(".two-up").eq(0), f = d.find(".swipe").eq(0), g = d.find(".onion-skin").eq(0), h = d.find(".difference").eq(0), i = d.find(".deleted"), j = d.find(".added"), k = i.eq(0), l = j.eq(0), m = i.eq(1), n = j.eq(1), o = i.eq(2), p = j.eq(2), q = d.find("canvas.deleted").eq(0), r = d.find("canvas.added").eq(0), s, t, u = d.find("ul.menu"), v = d.find(".view"), w = 0, x = d.find(".asset").length, y = 0, z = new Image, A = new Image;
            q[0].getContext ? (s = q[0].getContext("2d"), t = r[0].getContext("2d")) : u.children().eq(3).addClass("hidden"), d.find(".two-up").hide(), d.find(".two-up p").removeClass("hidden"), d.find(".progress").removeClass("hidden"), d.find(".view-modes").removeClass("hidden"), z.src = d.find(".deleted").first().attr("src"), A.src = d.find(".added").first().attr("src"), k.attr("src", z.src).load(function () {
                C()
            }), l.attr("src", A.src).load(function () {
                C()
            }), m.attr("src", z.src).load(function () {
                C()
            }), n.attr("src", A.src).load(function () {
                C()
            }), o.attr("src", z.src).load(function () {
                C()
            }), p.attr("src", A.src).load(function () {
                C()
            }), u.children("li").click(function () {
                D($(this).index())
            })
        })
    }
}), GitHub.Commits = {elements:[], current:null, selected:function () {
    return $(this.elements).eq(this.current)
}, select:function (a) {
    this.current = a, $(".selected").removeClass("selected");
    return this.elements.eq(a).addClass("selected")
}, next:function () {
    if (this.current !== null) {
        if (this.elements.length - 1 == this.current)return;
        var a = this.select(++this.current);
        a.offset().top - $(window).scrollTop() + 50 > $(window).height() && a.scrollTo(200)
    } else this.select(0)
}, prev:function () {
    if (!this.current) {
        this.elements.eq(0).removeClass("selected");
        return this.current = null
    }
    var a = this.select(--this.current);
    a.offset().top - $(window).scrollTop() < 0 && a.scrollTo(200)
}, link:function (a) {
    if (GitHub.Commits.current === null)return!1;
    window.location = GitHub.Commits.selected().find("[data-key=" + a + "]").attr("href")
}}, $(function () {
    GitHub.Commits.elements = $(".commit"), $(".page-commits").length && $.hotkeys({c:function () {
        GitHub.Commits.link("c")
    }, enter:function () {
        GitHub.Commits.link("c")
    }, o:function () {
        GitHub.Commits.link("c")
    }, p:function () {
        GitHub.Commits.link("p")
    }, t:function () {
        GitHub.Commits.link("t")
    }, j:function () {
        GitHub.Commits.next()
    }, k:function () {
        GitHub.Commits.prev()
    }})
}), $(function () {
    $("#imma_student").click(function () {
        $("#student_contact").slideToggle();
        return!1
    }), $("#imma_teacher").click(function () {
        $("#teacher_contact").slideToggle();
        return!1
    }), $("#imma_school_admin").click(function () {
        $("#school_admin_contact").slideToggle();
        return!1
    })
}), $(function () {
    $(".contextswitch").each(function () {
        var a = $(this), b = a.find(".toggle");
        b.click(function () {
            a.hasClass("nochoices") || a.toggleClass("activated")
        })
    })
}), $(function () {
    $("#your_repos").repoList({selector:"#repo_listing", ajaxUrl:"/dashboard/ajax_your_repos"}), $("#watched_repos").repoList({selector:"#watched_repo_listing", ajaxUrl:"/dashboard/ajax_watched_repos"}), $("#org_your_repos").length > 0 && $("#org_your_repos").repoList({selector:"#repo_listing", ajaxUrl:location.pathname + "/ajax_your_repos"}), $(".reveal_commits, .hide_commits").live("click", function () {
        var a = $(this).parents(".details");
        a.find(".reveal, .hide_commits, .commits").toggle();
        return!1
    }), $(".octofication .hide a").click(function () {
        $.post(this.href, null, function () {
            $(".octofication").fadeOut()
        });
        return!1
    }), $(".dashboard-notice .dismiss").click(function () {
        var a = $(this).closest(".dashboard-notice");
        $.del(this.href, null, function () {
            a.fadeOut()
        });
        return!1
    }), $(".js-dismiss-bootcamp").click(function () {
        var a = $(this).closest(".bootcamp");
        $.post(this.href, null, function () {
            a.fadeOut()
        });
        return!1
    })
}), Date._isoRegexp = /(\d{4,})(?:-(\d{1,2})(?:-(\d{1,2})(?:[T ](\d{1,2}):(\d{1,2})(?::(\d{1,2})(?:\.(\d+))?)?(?:(Z)|([+-])(\d{1,2})(?::(\d{1,2}))?)?)?)?)?/, Date.parseISO8601 = function (a) {
    a = a + "";
    if (typeof a != "string" || a.length === 0)return null;
    var b = a.match(Date._isoRegexp);
    if (typeof b == "undefined" || b === null)return null;
    var c, d, e, f, g, h, i;
    c = parseInt(b[1], 10);
    if (typeof b[2] == "undefined" || b[2] === "")return new Date(c);
    d = parseInt(b[2], 10) - 1, e = parseInt(b[3], 10);
    if (typeof b[4] == "undefined" || b[4] === "")return new Date(c, d, e);
    f = parseInt(b[4], 10), g = parseInt(b[5], 10), h = typeof b[6] != "undefined" && b[6] !== "" ? parseInt(b[6], 10) : 0, typeof b[7] != "undefined" && b[7] !== "" ? i = Math.round(1e3 * parseFloat("0." + b[7])) : i = 0;
    if ((typeof b[8] == "undefined" || b[8] === "") && (typeof b[9] == "undefined" || b[9] === ""))return new Date(c, d, e, f, g, h, i);
    var j;
    typeof b[9] != "undefined" && b[9] !== "" ? (j = parseInt(b[10], 10) * 36e5, typeof b[11] != "undefined" && b[11] !== "" && (j += parseInt(b[11], 10) * 6e4), b[9] == "-" && (j = -j)) : j = 0;
    return new Date(Date.UTC(c, d, e, f, g, h, i) - j)
}, $(function () {
    if ($(".repohead").length != 0) {
        var a = $("#repo_details"), b = GitHub.hasAdminAccess, c = GitHub.watchingRepo, d = GitHub.hasForked, e = $("#repository_description"), f = $("#repository_homepage");
        $(".pledgie").length > 0 && $("#repo_details").addClass("pledgified"), $(".repohead input[type=search]"), b && ($(".editable-only").show(), $(".for-owner").show()), d ? $(".for-forked").show() : $(".for-notforked").show(), github_user && GitHub.hasForkOfRepo && GitHub.hasForkOfRepo != "" && ($(".for-hasfork").show(), $("#your_fork_button").attr("href", "/" + GitHub.hasForkOfRepo), $("ul.repo-stats li.forks").addClass("forked").find("a").attr("title", "Forks — You have a fork")), $("#download_button").attr("href", GitHub.downloadRepo), e.repoInlineEdit({name:"description", is_owner:b}), f.repoInlineEdit({name:"homepage", is_owner:b}), $(".subnav-bar").length != 0 && $(".repohead").removeClass("emptyrepohead"), c ? ($("#unwatch_button").show(), $("ul.repo-stats li.watchers").addClass("watching").find("a").attr("title", "Watchers — You're Watching")) : $("#watch_button").show(), github_user || ($("#watch_button").enticeToAction(), $("#fork_button").enticeToAction());
        if (!github_user)return;
        GitHub.hasWriteAccess && $("#pull_request_item").show()
    }
}), $(function () {
    var a = $("#url_box");
    if (a.length != 0) {
        var b = a.find("ul.clone-urls a"), c = $("#url_field"), d = $("#url_description strong"), e = $("#url_box_clippy"), f = $();
        b.click(function () {
            var a = $(this);
            c.val(a.attr("href")), e.text(a.attr("href")), d.text(a.attr("data-permissions")), f.removeClass("selected"), f = a.parent("li").addClass("selected");
            return!1
        }), $(b[0]).click(), c.mouseup(function () {
            this.select()
        })
    }
}), GitHub.Uploader = {hasFlash:!1, hasFileAPI:!1, fallbackEnabled:!0, fallbackFileSaved:!1, uploadForm:null, defaultRow:null, files:{}, init:function () {
    this.uploadForm = $("#upload_form"), this.defaultRow = this.uploadForm.find("tr.default"), this.uploadForm.submit(GitHub.Uploader.uploadFormSubmitted), GitHub.Uploader.Flash.init(), GitHub.Uploader.File.init()
}, disableFallback:function () {
    !this.fallbackEnabled || (this.defaultRow.addClass("fallback-disabled"), this.defaultRow.find("input[type=text]").attr("disabled", "disabled"), this.defaultRow.find("button").attr("disabled", "disabled"), this.fallbackEnabled = !1)
}, uploadFormSubmitted:function () {
    var a = GitHub.Uploader;
    if (a.fallbackEnabled) {
        if (a.fallbackFileSaved)return!0;
        var b = a.uploadForm.find(".html-file-field").val();
        b = b.replace("C:\\fakepath\\", "");
        if (b == "")return!1;
        var c = "application/octet-stream";
        typeof FileList != "undefined" && (c = a.uploadForm.find("input[type=file]")[0].files[0].type);
        var d = new GitHub.UploadFile({name:b, size:1, type:c, row:a.defaultRow});
        a.saveFile(d);
        return!1
    }
    return!1
}, addFileRow:function (a) {
    var b = this.uploadForm.find("tr.template"), c = b.clone().css("display", "").addClass("filechosen").removeClass("template");
    a.row = c, this.files[a.id] = a, a.row.find(".js-waiting").hide(), a.row.find(".js-filename").text(a.name.substr(0, 12)).attr("title", a.name).tipsy(), a.row.find(".js-filesize").text(Math.round(a.size / 1048576 * 10) / 10 + "MB"), a.row.find(".js-start-upload").click(function () {
        if (a.row.hasClass("error"))return!1;
        GitHub.Uploader.saveFile(a);
        return!1
    }), this.defaultRow.before(c)
}, showUploadStarted:function (a) {
    a.row.find(".js-label").text("Uploading…0%")
}, showProgress:function (a, b) {
    a.row.find(".description label").text("Upload in progress… " + b + "%")
}, showSuccess:function (a) {
    a.row.addClass("succeeded"), a.row.find(".js-label").text("Upload complete!"), a.row.find("button").remove(), $.get(document.location.href, function (a) {
        $(".nodownloads").fadeOut(), $("#uploaded_downloads").hide().html(a).fadeIn()
    })
}, saveFile:function (a) {
    a.row.addClass("uploading"), a.row.find(".js-label").text("Preparing upload"), a.row.find(".js-description").attr("disabled", "disabled"), a.row.find("button").attr("disabled", "disabled").find("span").text("Uploading…"), this.uploadForm.find(".js-not-waiting").hide(), this.uploadForm.find(".js-waiting").show();
    var b = this.uploadForm.attr("prepare_action");
    $.ajax({type:"POST", url:b, data:{file_size:a.size, file_name:a.name, content_type:a.type, description:a.row.find(".js-description").val(), redirect:this.fallbackEnabled}, datatype:"json", success:function (b) {
        GitHub.Uploader.fileSaveSucceeded(a, b)
    }, error:function (b, c, d) {
        b.status == 422 ? GitHub.Uploader.fileSaveFailed(a, b.responseText) : GitHub.Uploader.fileSaveFailed(a)
    }, complete:function (a, b) {
        GitHub.Uploader.uploadForm.find(".js-not-waiting").show(), GitHub.Uploader.uploadForm.find(".js-waiting").hide()
    }})
}, fileSaveSucceeded:function (a, b) {
    a.params.key = b.path, a.params.acl = b.acl, a.params.Filename = a.name, a.params.policy = b.policy, a.params.AWSAccessKeyId = b.accesskeyid, a.params.signature = b.signature, a.params["Content-Type"] = b.mime_type, a.uploader == "flash" && (a.params.success_action_status = "201", GitHub.Uploader.Flash.upload(a)), this.fallbackEnabled && (a.params.redirect = b.redirect, this.fallbackFileSaved = !0, $("#s3_redirect").val(a.params.redirect), $("#s3_key").val(a.params.key), $("#s3_acl").val(a.params.acl), $("#s3_filename").val(a.params.Filename), $("#s3_policy").val(a.params.policy), $("#s3_accesskeyid").val(a.params.AWSAccessKeyId), $("#s3_signature").val(a.params.signature), $("#s3_mime_type").val(a.params["Content-Type"]), this.uploadForm.submit())
}, fileSaveFailed:function (a, b) {
    b == null && (b = "Something went wrong that shouldn't have. Please try again or contact support if the problem persists."), a.row.addClass("error"), a.row.find(".js-label").text(b), a.row.find("button").attr("disabled", "").addClass("danger").find("span").text("Remove"), a.row.find("button").click(function (b) {
        a.row.remove();
        return!1
    })
}}, GitHub.UploadFile = function (a) {
    this.id = a.id, this.name = a.name, this.row = a.row, this.size = a.size, this.type = a.type, this.uploader = a.uploader, this.params = {}
}, GitHub.Uploader.Flash = {swfupload:null, init:function () {
    if (typeof SWFUpload == "undefined")return!1;
    this.swfupload = new SWFUpload({upload_url:GitHub.Uploader.uploadForm.attr("action"), file_post_name:"file", flash_url:"/flash/swfupload.swf", button_cursor:SWFUpload.CURSOR.HAND, button_window_mode:SWFUpload.WINDOW_MODE.TRANSPARENT, button_placeholder_id:"flash_choose_file_btn", swfupload_loaded_handler:this.flashLoaded, file_queued_handler:this.fileQueued, upload_start_handler:this.uploadStarted, upload_progress_handler:this.uploadProgress, upload_error_handler:this.uploadFailure, upload_success_handler:this.uploadSuccess})
}, upload:function (a) {
    this.swfupload.setPostParams(a.params), this.swfupload.startUpload(a.id)
}, flashLoaded:function () {
    GitHub.Uploader.hasFlash = !0, GitHub.Uploader.disableFallback(), GitHub.Uploader.uploadForm.addClass("swfupload-ready")
}, fileQueued:function (a) {
    var b = new GitHub.UploadFile({id:a.id, name:a.name, size:a.size, type:a.type, uploader:"flash"});
    GitHub.Uploader.addFileRow(b)
}, uploadStarted:function (a) {
    var b = GitHub.Uploader.files[a.id];
    GitHub.Uploader.showUploadStarted(b)
}, uploadProgress:function (a, b, c) {
    var d = GitHub.Uploader.files[a.id], e = Math.round(b / c * 100);
    GitHub.Uploader.showProgress(d, e)
}, uploadSuccess:function (a, b, c) {
    var d = GitHub.Uploader.files[a.id];
    GitHub.Uploader.showSuccess(d)
}, uploadFailure:function (a, b, c) {
    var d = GitHub.Uploader.files[a.id];
    GitHub.Uploader.fileSaveFailed(d, null)
}}, GitHub.Uploader.File = {init:function () {
    if (typeof DataTransfer == "undefined")return!1;
    if (!("files"in DataTransfer.prototype))return!1;
    var a = !1, b = document.createElement("div");
    "ondragenter"in b && "ondragover"in b && "ondrop"in b && (a = !0), a || (b.setAttribute("ondragenter", ""), b.setAttribute("ondragover", ""), b.setAttribute("ondrop", ""), typeof b.ondragenter == "function" && typeof b.ondragover == "function" && typeof b.ondrop == "function" && (a = !0));
    if (!a)return!1;
    GitHub.Uploader.hasFileAPI = !0
}}, $(function () {
    GitHub.Uploader.init(), $(".page-downloads .manage-button").live("click", function () {
        $("#manual_downloads").toggleClass("managing");
        return!1
    })
}), GitHub.editableGenerator = function (a) {
    return function (b, c) {
        var d = {id:"field", tooltip:"Click to edit!", indicator:"Saving...", data:function (a) {
            return $(c).attr("data") || a
        }, style:"display: inline", onblur:"submit", callback:function () {
            (function () {
                $(c).attr("data") && $(c).attr("data", $(c).text()), $(c).trigger("truncate").next().show(), $(c).trigger("afterSave.editableGenerator")
            }).delay(20)
        }};
        return $(this).editable($(this).attr("rel"), $.extend({}, d, a))
    }
}, $(function () {
    $(".edit_link").click(function () {
        $(this).prev().trigger("click");
        return!1
    })
}), $(function () {
    var a = function () {
        $(this).hide().prev().show()
    };
    $(".git_url_facebox").click(function () {
        $.facebox($($(this).attr("rel")).html(), "tip");
        return!1
    }), $(".repo span.edit").each(GitHub.editableGenerator({width:"350px"})), $(".repo span.editarea").each(GitHub.editableGenerator({type:"textarea", width:"550px", height:"100px", cancel:"Cancel", submit:"OK"})), $("span.edit, span.editarea").click(function () {
        $(this).next().hide()
    }), $("#run_postreceive_test").click(function () {
        $.post(location.href + "/test_postreceive", {}), $.facebox($("#postreceive_test").text());
        return!1
    }), $("#repository_postreceive_url").bind("afterSave.editableGenerator", function () {
        $("#repository_postreceive_url").text().slice(0, 4) == "http" ? $("#run_postreceive_test").show() : $("#run_postreceive_test").hide()
    }), $(".toggle_watch").click(function () {
        if (!github_user)return!0;
        $("#watch_button, #unwatch_button").toggle(), $.post($(this).attr("href"), {});
        return!1
    }), $(".watch_button, .unwatch_button").click(function () {
        if (!github_user)return!0;
        $.post($(this).attr("href"), {}), $(this).parent().find(".watch_button, .unwatch_button").toggle();
        return!1
    }), $("#donation_creation_in_progress").length > 0 && $("#activate_pledgie_button").attr("title", "We're creating your Pledgie account. We'll PM you when it's ready!").find("span").text("Creating account..."), $(".pagehead .nspr .btn-pull-request").click(function () {
        GitHub.metric("Hit Pull Request Button", {"Pull Request Type":"New School", Action:GitHub.currentAction, "Ref Type":GitHub.revType});
        return!0
    }), $(".test_hook").click(function () {
        var a = $(this), b = a.prev(".test_hook_message");
        b.text("Sending payload...");
        var c = a.attr("href");
        $.post(c, {name:a.attr("rel") || ""}, function () {
            b.text("Payload deployed")
        });
        return!1
    }), $(".add_postreceive_url").click(function () {
        var a = $(this).prev("dl.form").clone();
        console.log(a), a.find("input").val(""), $(this).before(a);
        return!1
    }), $(".remove_postreceive_url").live("click", function () {
        if ($(this).closest(".fields").find("dl.form").length < 2) {
            alert("You cannot remove the last post-receive URL");
            return!1
        }
        $(this).closest("dl.form").remove();
        return!1
    }), $(".unlock_branch").click(function () {
        var a = location.pathname.split("/"), b = "/" + a[1] + "/" + a[2] + "/unlock_branch/" + a[4], c = $(this).parents(".notification");
        $(this).spin().remove();
        var d = this;
        $.post(b, function () {
            c.hide()
        });
        return!1
    });
    if ($("#edit_repo").length > 0) {
        var b = $("#change_default_branch"), c = b.find("select"), d = c.val();
        c.change(function () {
            b.removeClass("success").removeClass("error").addClass("loading"), $.put(b.closest("form").attr("action"), {field:"repository_master_branch", value:c.val()}, {success:function () {
                b.removeClass("loading").addClass("success"), d = c.val()
            }, error:function () {
                c.val(d), b.removeClass("loading").addClass("error")
            }})
        }), $(".addon.feature").each(function () {
            var a = $(this);
            a.find(":checkbox").change(function () {
                var b = this;
                a.removeClass("success").removeClass("error").addClass("loading"), $.put(a.closest("form").attr("action"), {field:b.name, value:b.checked ? 1 : 0}, {success:function () {
                    a.removeClass("loading").addClass("success")
                }, error:function () {
                    b.checked = !b.checked, a.removeClass("loading").addClass("error")
                }})
            })
        }), $("#pages_toggle :checkbox").change(function () {
            $.facebox({div:"#pages_box"}), this.checked = !this.checked
        }), $("#autoresponse_toggle :checkbox").change(function () {
            if (!this.checked) {
                var a = $(this).closest(".addon");
                a.removeClass("success").removeClass("error").addClass("loading"), $.put(window.location.pathname.replace("edit", "update_pull_request_auto_response"), {success:function () {
                    a.removeClass("loading").addClass("success"), a.find(".editlink").remove()
                }})
            } else $.facebox({div:"#auto_response_editor"}), this.checked = !this.checked
        });
        var e = function () {
            debug("Setting data.completed to %s", $(this).val()), $(this).data("completed", $(this).val())
        };
        $("#push_pull_collabs input.ac-add-user-input").userAutocomplete().result(e), $("#push_pull_collabs form").submit(function () {
            var a = $(this).find(":text"), b = a.val();
            debug("Trying to add %s...", b);
            if (!b || !a.data("completed"))return!1;
            var c = function (a) {
                a != null ? $("#push_pull_collabs .error").text(a).show() : $("#push_pull_collabs .error").hide()
            };
            c(), $.ajax({url:this.action, data:{member:b}, type:"POST", dataType:"json", success:function (b) {
                a.val("").removeClass("ac-accept"), b.error ? c(b.error) : $("#push_pull_collabs ul.usernames").append(b.html)
            }, error:function () {
                c("An unidentfied error occurred, try again?")
            }});
            return!1
        }), $("#push_pull_collabs .remove-user").live("click", function () {
            $.del(this.href), $(this).closest("li").remove();
            return!1
        }), $("#teams form").submit(function () {
            var a = $(this).find("select"), b = a.val(), c = function (a) {
                a != null ? $("#push_pull_collabs .error").text(a).show() : $("#push_pull_collabs .error").hide()
            };
            if (b == "") {
                c("You must select a team");
                return!1
            }
            c(), $.ajax({url:this.action, data:{team:b}, type:"POST", dataType:"json", success:function (b) {
                a.val(""), b.error ? c(b.error) : $("#teams ul.teams").append(b.html)
            }, error:function () {
                c("An unidentfied error occurred, try again?")
            }});
            return!1
        }), $("#teams .remove-team").live("click", function () {
            $.del(this.href), $(this).closest("li").remove();
            return!1
        }), $(".repohead").is(".vis-public") ? $(".private-only").hide() : $(".public-only").hide();
        var f = $("#toggle_visibility");
        f.find("input[type=radio]").change(function (a) {
            if ($(this).attr("value") == "public") {
                a.preventDefault(), $("input[value=private]").attr("checked", "checked"), $.facebox({div:"#gopublic_confirm"}), $("#facebox .gopublic_button").click(function () {
                    var a = $("#toggle_visibility input[value=public]");
                    a.attr("checked", "checked"), g(a), $.facebox.close()
                }), $("#facebox .footer").hide();
                return!1
            }
            if ($(this).attr("value") == "private") {
                if (!confirm("Are you POSITIVE you want to make this public repository private?  All public watchers will be removed.")) {
                    $("input[value=public]").attr("checked", "checked");
                    return!1
                }
                g($(this))
            }
        });
        var g = function (a) {
            var b = $("#toggle_visibility");
            b.removeClass("success").removeClass("error").addClass("loading"), $.ajax({type:"POST", url:b.closest("form").attr("action"), success:function () {
                $(".repohead").is(".vis-public") ? ($(".repohead").removeClass("vis-public").addClass("vis-private"), $(".private-only").show(), $(".public-only").hide()) : ($(".repohead").removeClass("vis-private").addClass("vis-public"), $(".private-only").hide(), $(".public-only").show()), b.removeClass("loading").addClass("success")
            }, error:function () {
                a.checked = !1, b.removeClass("loading").addClass("error")
            }})
        };
        $("#copy_permissions ul li a").click(function () {
            $(this).parents("form").submit();
            return!1
        }), $("#delete_repo").click(function () {
            var a = "Are you sure you want to delete this repository?  There is no going back.";
            return confirm(a)
        }), $("#reveal_delete_repo_info").click(function () {
            $(this).toggle(), $("#delete_repo_info").toggle();
            return!1
        }), $(document).bind("reveal.facebox", function () {
            $("#facebox .renaming_to_field").val($("#rename_field").val()), $("#facebox .transfer_to_field").val($("#transfer_field").val())
        })
    }
}), Gollum = {encloseStrategy:function (a, b, c) {
    return{type:"enclose", content:b, prefix:a, suffix:c}
}, prefixStrategy:function (a, b, c) {
    return{type:"prefixLine", prefix:a, content:b, newline:c}
}, enclose:function (a, b, c) {
    var d = Gollum.Formats[b][c], e = a.getSelectionRange();
    e.start == e.end ? (a.insertText(d.prefix + d.content + d.suffix, e.start, e.start, !1), a.setSelectionRange(e.start + d.prefix.length, e.start + d.prefix.length + d.content.length)) : a.insertText(d.prefix + a.getSelectedText() + d.suffix, e.start, e.end, !1)
}, prefix:function (a, b, c) {
    var d = Gollum.Formats[b][c], e = a.getSelectionRange(), f = a.getSelectedText(), g = d.prefix;
    if (d.newline) {
        a.setSelectionRange(e.start - 1, e.start);
        var h = a.getSelectedText();
        h != "\n" && (g = "\n" + g)
    }
    e.start == e.end ? (a.insertText(g + d.content, e.start, e.start, !1), a.setSelectionRange(e.start + g.length, e.start + g.length + d.content.length)) : a.insertText(g + f + "\n", e.start, e.end, !1)
}}, Gollum.Formats = {asciidoc:{bold:Gollum.encloseStrategy("*", "bold text", "*"), italic:Gollum.encloseStrategy("_", "italic text", "_"), ul:Gollum.prefixStrategy("* ", "Bullet list item", !0), ol:Gollum.prefixStrategy(". ", "Numbered list item", !0)}, creole:{bold:Gollum.encloseStrategy("**", "bold text", "**"), italic:Gollum.encloseStrategy("//", "italic text", "//"), ul:Gollum.prefixStrategy("* ", "Bullet list item", !0), ol:Gollum.prefixStrategy("# ", "Numbered list item", !0)}, gollum:{link:Gollum.encloseStrategy("[[", "Page Name", "]]"), image:Gollum.encloseStrategy("[[", "/path/to/image.png", "]]")}, markdown:{bold:Gollum.encloseStrategy("**", "bold text", "**"), italic:Gollum.encloseStrategy("*", "italic text", "*"), ul:Gollum.prefixStrategy("* ", "Bullet list item", !0), ol:Gollum.prefixStrategy("1. ", "Numbered list item", !0)}, org:{bold:Gollum.encloseStrategy("*", "bold text", "*"), italic:Gollum.encloseStrategy("/", "italic text", "/"), ul:Gollum.prefixStrategy("- ", "Bullet list item", !0), ol:Gollum.prefixStrategy("1. ", "Numbered list item", !0)}, pod:{bold:Gollum.encloseStrategy("B<", "bold text", ">"), italic:Gollum.encloseStrategy("I<", "italic text", ">"), ul:Gollum.prefixStrategy("=item * ", "Bullet list item", !0), ol:Gollum.prefixStrategy("=item 1. ", "Numbered list item", !0)}, rest:{bold:Gollum.encloseStrategy("**", "bold text", "**"), italic:Gollum.encloseStrategy("*", "italic text", "*"), ul:Gollum.prefixStrategy("* ", "Bullet list item", !0), ol:Gollum.prefixStrategy("1. ", "Numbered list item", !0)}, rdoc:{bold:Gollum.encloseStrategy("*", "bold text", "*"), italic:Gollum.encloseStrategy("_", "italic text", "_"), ul:Gollum.prefixStrategy("* ", "Bullet list item", !0), ol:Gollum.prefixStrategy("1. ", "Numbered list item", !0)}, textile:{bold:Gollum.encloseStrategy("*", "bold text", "*"), italic:Gollum.encloseStrategy("_", "italic text", "_"), ul:Gollum.prefixStrategy("* ", "Bullet list item", !0), ol:Gollum.prefixStrategy("# ", "Numbered list item", !0)}}, $(function () {
    $("#editbar .link").click(function () {
        var a = $("#guides .write textarea"), c = b();
        Gollum.enclose(a, "gollum", "link")
    }), $("#editbar .image").click(function () {
        var a = $("#guides .write textarea"), c = b();
        Gollum.enclose(a, "gollum", "image")
    }), $("#editbar .bold").click(function () {
        var a = $("#guides .write textarea"), b = $("#guides .write select#wiki_format option:selected").attr("value");
        Gollum.enclose(a, b, "bold")
    }), $("#editbar .italic").click(function () {
        var a = $("#guides .write textarea"), c = b();
        Gollum.enclose(a, c, "italic")
    }), $("#editbar .ul").click(function () {
        var a = $("#guides .write textarea"), c = b();
        Gollum.prefix(a, c, "ul")
    }), $("#editbar .ol").click(function () {
        var a = $("#guides .write textarea"), c = b();
        Gollum.prefix(a, c, "ol")
    }), $("#editbar .tab.help a").click(function () {
        if ($(this).hasClass("open"))$(this).removeClass("open"), $("#editbar .sections").slideUp(); else {
            $(this).addClass("open");
            if (!$("#editbar .sections .toc .current").get(0)) {
                var b = $("#editbar .sections .toc .headers").get(0);
                a.call(b)
            }
            $("#editbar .sections").slideDown()
        }
        return!1
    }), $("#guides .write select#wiki_format").change(function () {
        var b = $("#editbar .sections .toc div.current").get(0);
        a.call(b)
    });
    var a = function () {
        $("#editbar .sections .toc div").removeClass("current"), $(this).addClass("current"), $("#editbar .sections .page").removeClass("current");
        var a = $(this).attr("class").split(" "), c = a[0], d = b();
        $(this).hasClass("gollum") ? $("#editbar .sections .page." + c).addClass("current") : $("#editbar .sections .page." + c + "." + d).addClass("current");
        return!1
    }, b = function () {
        return $("#guides .write select#wiki_format option:selected").val()
    };
    $("#editbar .sections .toc div").click(a)
}), $(function () {
    $(".ejection").each(function () {
        var a = $(this), b = a.find(".confirming"), c = a.find(".ejecting").hide();
        b.find("button, .button").click(function () {
            b.hide(), c.show();
            return!1
        }), c.find(".cancel").click(function () {
            c.hide(), b.show();
            return!1
        })
    })
}), $(function () {
    !$.support.pjax || $(".trending-repositories .times a").live("click",
        function (a) {
            $(".trending-repositories .ranked-repositories").fadeTo(200, .5), $(".trending-repositories .trending-heading").contextLoader(28), a.preventDefault()
        }).pjax(".trending-repositories", {data:{trending:!0}, timeout:null, error:function (a, b) {
        $(".trending-repositories .context-loader").remove(), $(".trending-repositories .ranked-repositories").fadeTo(0, 1), $(".trending-repositories ol").empty().append("<li>Something went wrong: " + b + "</li>")
    }})
}), $(function () {
    var a = $(".community .bigcount"), b = function () {
        var b = a.width() + parseInt(a.css("padding-left")) + parseInt(a.css("padding-right"));
        a.css("margin-left", "-" + b / 2 + "px"), a.fadeIn()
    };
    a.length > 0 && setTimeout(b, 500);
    var c = $(".js-slidy-highlight");
    if (c.length > 0) {
        var d = c.find("li.highlight"), e = d.width() / 2;
        e += -1;
        var f = function (a) {
            var b = a.closest("li"), c = b.position(), d = c.left + b.width() / 2 - e;
            d += parseInt(b.css("margin-left"));
            return d
        };
        c.bind("tabChanged", function (a, b) {
            var c = f(b.link);
            d.animate({left:c}, 300)
        });
        var g = f(c.find(".selected"));
        d.css({left:g})
    }
}), GitHub || (GitHub = {}), GitHub.FileEditForkPoller = function (a, b) {
    var c = $(b || document).find(".check-for-fork");
    if (c.length != 0) {
        var d = $(b || document).find("#submit-file");
        d.attr("disabled", "disabled"), c.show();
        var e = "/" + github_user + "/" + GitHub.repoName + "/check";
        $.smartPoller(a || 2e3, function (a) {
            $.ajax({url:e, error:function (b, d, e) {
                b.status == 404 ? a() : c.html('<img src="/images/modules/ajax/error.png"> Something went wrong. Please fork the project, then edit this file.')
            }, success:function (a, b, e) {
                c.hide(), d.removeAttr("disabled")
            }})
        })
    }
}, $(function () {
    GitHub.FileEditForkPoller()
}), $(function () {
    function d() {
        var a = $("table#queue tr.not-applied").length, b = $("#head-sha").text();
        if (a > 0) {
            var c = $("#total-commits").text();
            $("#current-commit").text(c - a + 1);
            var e = $("table#queue tr.not-applied:first"), f = e.attr("name");
            $(".date", e).html("applying"), $(".icons", e).html('<img src="/images/modules/ajax/indicator.gif" alt="Processing" />'), $.post("patch/" + b + "/" + f, function (a) {
                e.removeClass("not-applied"), a == "NOPE" ? (e.addClass("unclean_failure"), $(".date", e).html("failed"), $(".icons", e).html('<img src="/images/icons/exclamation.png" alt="Failed" />')) : ($("#head-sha").text(a), e.addClass("clean"), $(".date", e).html("applied"), $(".apply-status", e).attr("value", "1"), $(".icons", e).html('<img src="/images/modules/dashboard/news/commit.png" alt="Applied" />')), d()
            })
        } else $("#new-head-sha").attr("value", b), $("#finalize").show()
    }

    function b() {
        var a = $("#forkqueue .untested").length, c = $("#head-sha").text();
        if (a > 0) {
            var d = $("#forkqueue .untested:first"), e = d.attr("name");
            $(".icons", d).html('<img src="/images/modules/ajax/indicator.gif" alt="Processing" />'), $.get("forkqueue/applies/" + c + "/" + e, function (a) {
                d.removeClass("untested"), a == "NOPE" ? (d.addClass("unclean"), $(".icons", d).html("")) : a == "YUP" ? (d.addClass("clean"), $(".icons", d).html("")) : $(".icons", d).html("err"), b()
            })
        }
    }

    var a = $("#forkqueue #head-sha").text();
    $("#forkqueue .untested:first").each(function () {
        b()
    }), $(".action-choice").change(function (a) {
        var b = $(this).attr("value");
        if (b == "ignore") {
            var c = $(this).parents("form"), d = c.find("tr:not(:first)"), e = c.find("input:checked");
            e.each(function (a, b) {
                var c = $(b).attr("ref");
                $(b).parents("tr").children(".icons").html("ignoring..."), $.post("forkqueue/ignore/" + c, {})
            });
            var f = d.length == e.length ? c : e.parents("tr");
            f.fadeOut("normal", function () {
                $(this).remove()
            })
        } else if (b == "apply") {
            var c = $(this).parents("form");
            c.submit()
        }
        $(this).children(".default").attr("selected", 1)
    });
    var c = [];
    $("#forkqueue input[type=checkbox]").click(function (a) {
        var b = $(this).attr("class").match(/^r-(\d+)-(\d+)$/), d = parseInt(b[1]), e = parseInt(b[2]);
        if (a.shiftKey && c.length > 0) {
            var f = c[c.length - 1], g = f.match(/^r-(\d+)-(\d+)$/), h = parseInt(g[1]), i = parseInt(g[2]);
            if (d == h) {
                var j = $(this).attr("checked") == !0, k = [e, i].sort(), l = k[0], m = k[1];
                for (var n = l; n < m; n++)j == !0 ? $("#forkqueue input.r-" + d + "-" + n).attr("checked", "true") : $("#forkqueue input.r-" + d + "-" + n).removeAttr("checked")
            }
        }
        c.push($(this).attr("class"))
    }), $("#forkqueue a.select_all").click(function () {
        $(this).removeClass("select_all");
        var a = $(this).attr("class");
        $(this).addClass("select_all"), $("#forkqueue tr." + a + " input[type=checkbox]").attr("checked", "true"), c = [];
        return!1
    }), $("#forkqueue a.select_none").click(function () {
        $(this).removeClass("select_none");
        var a = $(this).attr("class");
        $(this).addClass("select_none"), $("#forkqueue tr." + a + " input[type=checkbox]").removeAttr("checked"), c = [];
        return!1
    }), $("table#queue tr.not-applied:first").each(function () {
        d()
    }), $("#change-branch").click(function () {
        $("#int-info").hide(), $("#int-change").show();
        return!1
    }), $("#change-branch-nevermind").click(function () {
        $("#int-change").hide(), $("#int-info").show();
        return!1
    }), $(".js-fq-new-version").each(function () {
        var a = $("#fq-repo").text();
        console.log("repo:", a);
        var b = $(this).hasClass("reload");
        $.smartPoller(function (c) {
            $.getJSON("/cache/network_current/" + a, function (a) {
                a && a.current ? (b && window.location.reload(!0), $(".js-fq-polling").hide(), $(".js-fq-new-version").show()) : c()
            })
        })
    })
}), $(function () {
    var a, b = $("#js-help-sidebar .js-topic");
    $("#js-help-sidebar .js-guides li").hide(), $("#js-help-sidebar .js-topic h3 a").click(function () {
        var c = $(this).parents(".js-topic"), d = c.find(".js-guides li");
        a != c.index() ? (b.eq(a) && b.eq(a).find(".js-guides li").toggle(100), a = c.index(), d.toggle(100)) : (a = undefined, d.toggle(100));
        return!1
    }), $(".help-search .search-box").focus(function () {
        $(this).css("background-position", "0px -25px")
    }), $(".help-search .search-box").focusout(function () {
        $(this).val() == "" && $(this).css("background-position", "0px 0px")
    })
}), $(function () {
    if ($(".business .logos").length > 0) {
        var a = [
            ["Shopify", "shopify.png", "http://shopify.com/"],
            ["CustomInk", "customink.png", "http://customink.com/"],
            ["Pivotal Labs", "pivotallabs.png", "http://pivotallabs.com/"],
            ["FiveRuns", "fiveruns.png", "http://fiveruns.com/"],
            ["PeepCode", "peepcode.png", "http://peepcode.com/"],
            ["Frogmetrics", "frogmetrics.png", "http://frogmetrics.com/"],
            ["Upstream", "upstream.png", "http://upstream-berlin.com/"],
            ["Terralien", "terralien.png", "http://terralien.com/"],
            ["Planet Argon", "planetargon.png", "http://planetargon.com/"],
            ["Tightrope Media Systems", "tightropemediasystems.png", "http://trms.com/"],
            ["Rubaidh", "rubaidh.png", "http://rubaidh.com/"],
            ["Iterative Design", "iterativedesigns.png", "http://iterativedesigns.com/"],
            ["GiraffeSoft", "giraffesoft.png", "http://giraffesoft.com/"],
            ["Evil Martians", "evilmartians.png", "http://evilmartians.com/"],
            ["Crimson Jet", "crimsonjet.png", "http://crimsonjet.com/"],
            ["Alonetone", "alonetone.png", "http://alonetone.com/"],
            ["EntryWay", "entryway.png", "http://entryway.net/"],
            ["Fingertips", "fingertips.png", "http://fngtps.com/"],
            ["Run Code Run", "runcoderun.png", "http://runcoderun.com/"],
            ["Be a Magpie", "beamagpie.png", "http://be-a-magpie.com/"],
            ["Rocket Rentals", "rocketrentals.png", "http://rocket-rentals.de/"],
            ["Connected Flow", "connectedflow.png", "http://connectedflow.com/"],
            ["Dwellicious", "dwellicious.png", "http://dwellicious.com/"],
            ["Assay Depot", "assaydepot.png", "http://www.assaydepot.com/"],
            ["Centro", "centro.png", "http://www.centro.net/"],
            ["Debuggable Ltd.", "debuggable.png", "http://debuggable.com/"],
            ["Blogage.de", "blogage.png", "http://blogage.de/"],
            ["ThoughtBot", "thoughtbot.png", "http://www.thoughtbot.com/"],
            ["Viget Labs", "vigetlabs.png", "http://www.viget.com/"],
            ["RateMyArea", "ratemyarea.png", "http://www.ratemyarea.com/"],
            ["Abloom", "abloom.png", "http://abloom.at/"],
            ["LinkingPaths", "linkingpaths.png", "http://www.linkingpaths.com/"],
            ["MIKAMAI", "mikamai.png", "http://mikamai.com/"],
            ["BEKK", "bekk.png", "http://www.bekk.no/"],
            ["Reductive Labs", "reductivelabs.png", "http://www.reductivelabs.com/"],
            ["Sexbyfood", "sexbyfood.png", "http://www.sexbyfood.com/"],
            ["Factorial, LLC", "yfactorial.png", "http://yfactorial.com/"],
            ["SnapMyLife", "snapmylife.png", "http://www.snapmylife.com/"],
            ["Scrumy", "scrumy.png", "http://scrumy.com/"],
            ["TinyMassive", "tinymassive.png", "http://www.tinymassive.com/"],
            ["SOCIALTEXT", "socialtext.png", "http://www.socialtext.com/"],
            ["All-Seeing Interactive", "allseeinginteractive.png", "http://allseeing-i.com/"],
            ["Howcast", "howcast.png", "http://www.howcast.com/"],
            ["Relevance Inc", "relevance.png", "http://thinkrelevance.com/"],
            ["Nitobi Software Inc", "nitobi.png", "http://www.nitobi.com/"],
            ["99designs", "99designs.png", "http://99designs.com/"],
            ["EdgeCase, LLC", "edgecase.png", "http://edgecase.com"],
            ["Plinky", "plinky.png", "http://www.plinky.com/"],
            ["One Design Company", "onedesigncompany.png", "http://onedesigncompany.com/"],
            ["CollectiveIdea", "collectiveidea.png", "http://collectiveidea.com/"],
            ["Stateful Labs", "statefullabs.png", "http://stateful.net/"],
            ["High Groove Studios", "highgroove.png", "http://highgroove.com/"],
            ["Exceptional", "exceptional.png", "http://www.getexceptional.com/"],
            ["DealBase", "dealbase.png", "http://www.dealbase.com/"],
            ["Silver Needle", "silverneedle.png", "http://silverneedlesoft.com/"],
            ["No Kahuna", "nokahuna.png", "http://nokahuna.com/"],
            ["Double Encore", "doubleencore.png", "http://www.doubleencore.com/"],
            ["Yahoo", "yahoo.gif", "http://yahoo.com/"],
            ["EMI Group Limited", "emi.png", "http://emi.com/"],
            ["TechCrunch", "techcrunch.png", "http://techcrunch.com/"],
            ["WePlay", "weplay.png", "http://weplay.com/"]
        ], b = function () {
            var b = $(".business .logos table");
            $.each(a, function (a, c) {
                b.append('<tr><td><a href="' + c[2] + '" rel="nofollow"><img src="http://assets' + a % 4 + ".github.com/images/modules/home/customers/" + c[1] + '" alt="' + c[0] + '" /></a></td></tr>')
            });
            var c = parseInt($(".business .slide").css("top")), d = $(".business .logos td").length - 4, e = 0, f = function () {
                e += 1;
                var a = parseInt($(".business .slide").css("top"));
                Math.abs(a + d * 75) < 25 ? ($(".business .slide").css("top", 0), e = 0) : $(".business .slide").animate({top:"-" + e * 75 + "px"}, 1500)
            };
            setInterval(f, 3e3)
        };
        setTimeout(b, 1e3)
    }
}), $(function () {
    var a = {success:function () {
        $.smartPoller(3e3, function (a) {
            $.getJSON($("#new_import").attr("action") + "/grab_authors", {}, function (b) {
                if (b == !1)return a();
                b.length == 0 ? ($("#new_import input[type=submit]").attr("disabled", "").val("Import SVN Authors").show(), alert("No authors were returned, please try a different URL")) : ($.each(b, function (a, b) {
                    var c = $('<tr><td><input type="text" readonly="readonly" value="' + b + '" name="svn_authors[]" /></td><td><input type="text" class="git_author" name="git_authors[]"/></td></tr>');
                    c.appendTo("#authors-list")
                }), $("#import-submit").show()), $("#wait").slideUp(), $("#import_repo").show(), $("#author_entry").slideDown()
            })
        })
    }, beforeSubmit:function (a, b) {
        var c = $("#svn_url").val();
        if (!c.match(/^https?:\/\//) && !c.match(/^svn:\/\//)) {
            alert("Please enter a valid subversion url");
            return!1
        }
        b.find("input[type=submit]").hide(), $("#authors").slideDown()
    }};
    $("#new_import").ajaxForm(a), $("#import-submit").click(function () {
        $(this).attr("disabled", "disabled");
        var a = !1, b = $("#authors-list input.git_author[value=]").size(), c = $("#authors-list input.git_author").size() - b;
        b > 0 && c > 0 && (alert("You must either fill in all author names or none."), a = !0), $("#authors-list input.git_author").each(function () {
            var b = $(this).val();
            !a && b != "" && !/^[^<]+<[^>]+>$/.test(b) && (alert("'" + b + "' is not a valid git author.  Authors must match the format 'User Name <user@domain>'"), a = !0)
        });
        if (a) {
            $("#import-submit").attr("disabled", "");
            return!1
        }
        $("form#new_repository").submit()
    })
}), $(function () {
    $(".cancel-compose").click(function () {
        window.location = "/inbox";
        return!1
    }), $("#inbox .del a").click(function () {
        var a = $(this), b = a.parents(".item"), c = b.attr("data-type") == "message" ? "inbox" : "notification", d = ".js-" + c + "-count";
        a.find("img").attr("src", GitHub.Ajax.spinner), $.ajax({type:"DELETE", url:a.attr("rel"), error:function () {
            a.find("img").attr("src", GitHub.Ajax.error)
        }, success:function () {
            if (b.is(".unread")) {
                var a = parseInt($(d + ":first").text());
                a > 0 && $(d).text(a -= 1), a == 0 && $(d).each(function () {
                    var a = $(this);
                    a.is(".new") ? a.removeClass("new") : a.parent().is(".new") && a.parent().removeClass("new")
                })
            }
            b.remove()
        }});
        return!1
    }), $("#reveal_deleted").click(function () {
        $(this).parent().hide(), $(".hidden_message").show();
        return!1
    })
}), $(function () {
    $("#impact_graph").length > 0 && GitHub.ImpactGraph.drawImpactGraph()
}), GitHub.ImpactGraph = {colors:null, data:null, chunkVerticalSpace:2, initColors:function (a) {
    seedColors = [
        [222, 0, 0],
        [255, 141, 0],
        [255, 227, 0],
        [38, 198, 0],
        [0, 224, 226],
        [0, 33, 226],
        [218, 0, 226]
    ], this.colors = [];
    var b = 0;
    for (var c in a) {
        var d = seedColors[b % 7];
        b > 6 && (d = [this.randColorValue(d[0]), this.randColorValue(d[1]), this.randColorValue(d[2])]), this.colors.push(d), b += 1
    }
}, drawImpactGraph:function () {
    var a = {}, b = $("#impact_graph").attr("rel"), c = this;
    $.smartPoller(function (d) {
        $.getJSON("/" + b + "/graphs/impact_data", function (b) {
            if (b && b.authors) {
                c.initColors(b.authors);
                var e = c.createCanvas(b);
                b = c.padChunks(b), c.data = b, $.each(b.buckets, function (b, d) {
                    c.drawBucket(a, d, b)
                }), c.drawAll(e, b, a), c.authorHint()
            } else d()
        })
    })
}, createCanvas:function (a) {
    var b = a.buckets.length * 50 * 2 - 50, c = 0;
    for (var d in a.buckets) {
        var e = a.buckets[d], f = 0;
        for (var g in e.i) {
            var h = e.i[g];
            f += this.normalizeImpact(h[1]) + this.chunkVerticalSpace
        }
        f > c && (c = f)
    }
    $("#impact_graph div").remove();
    var i = $("#impact_graph");
    i.height(c + 50).css("border", "1px solid #aaa"), $("#caption").show(), i.append('<canvas width="' + b + '" height="' + (c + 30) + '"></canvas>');
    var j = $("#impact_graph canvas")[0];
    return j.getContext("2d")
}, padChunks:function (a) {
    for (var b in a.authors) {
        var c = this.findFirst(b, a), d = this.findLast(b, a);
        for (var e = c + 1; e < d; e++)this.bucketHasAuthor(a.buckets[e], b) || a.buckets[e].i.push([b, 0])
    }
    return a
}, bucketHasAuthor:function (a, b) {
    for (var c = 0; c < a.i.length; c++)if (a.i[c][0] == parseInt(b))return!0;
    return!1
}, findFirst:function (a, b) {
    for (var c = 0; c < b.buckets.length; c++)if (this.bucketHasAuthor(b.buckets[c], a))return c
}, findLast:function (a, b) {
    for (var c = b.buckets.length - 1; c >= 0; c--)if (this.bucketHasAuthor(b.buckets[c], a))return c
}, colorFor:function (a) {
    var b = this.colors[a];
    return"rgb(" + b[0] + "," + b[1] + "," + b[2] + ")"
}, randColorValue:function (a) {
    var b = Math.round(Math.random() * 100) - 50, c = a + b;
    c > 255 && (c = 255), c < 0 && (c = 0);
    return c
}, drawBucket:function (a, b, c) {
    var d = 0, e = this;
    $.each(b.i, function (b, f) {
        var g = f[0], h = e.normalizeImpact(f[1]);
        a[g] || (a[g] = []), a[g].push([c * 100, d, 50, h, f[1]]), d = d + h + e.chunkVerticalSpace
    })
}, normalizeImpact:function (a) {
    return a <= 9 ? a + 1 : a <= 5e3 ? Math.round(10 + a / 50) : Math.round(100 + Math.log(a) * 10)
}, drawAll:function (a, b, c) {
    this.drawStreams(a, c, null), this.drawDates(b)
}, drawStreams:function (a, b, c) {
    a.clearRect(0, 0, 1e4, 500), $(".activator").remove();
    for (var d in b)d != c && this.drawStream(d, b, a, !0);
    c != null && this.drawStream(c, b, a, !1)
}, drawStream:function (a, b, c, d) {
    c.fillStyle = this.colorFor(a), chunks = b[a];
    for (var e = 0; e < chunks.length; e++) {
        var f = chunks[e];
        c.fillRect(f[0], f[1], f[2], f[3]), d && this.placeActivator(a, b, c, f[0], f[1], f[2], f[3], f[4]), e != 0 && (c.beginPath(), c.moveTo(previousChunk[0] + 50, previousChunk[1]), c.bezierCurveTo(previousChunk[0] + 75, previousChunk[1], f[0] - 25, f[1], f[0], f[1]), c.lineTo(f[0], f[1] + f[3]), c.bezierCurveTo(f[0] - 25, f[1] + f[3], previousChunk[0] + 75, previousChunk[1] + previousChunk[3], previousChunk[0] + 50, previousChunk[1] + previousChunk[3]), c.fill()), previousChunk = f
    }
}, drawStats:function (a, b) {
    chunks = b[a];
    for (var c = 0; c < chunks.length; c++) {
        var d = chunks[c], e = d[4];
        e > 10 && this.drawStat(e, d[0], d[1] + d[3] / 2)
    }
}, drawStat:function (a, b, c) {
    var d = "";
    d += "position: absolute;", d += "left: " + b + "px;", d += "top: " + c + "px;", d += "width: 50px;", d += "text-align: center;", d += "color: #fff;", d += "font-size: 9px;", d += "z-index: 0;", $("#impact_graph").append('<p class="stat" style="' + d + '">' + a + "</p>")
}, drawDate:function (a, b, c) {
    c += 3;
    var d = "";
    d += "position: absolute;", d += "left: " + b + "px;", d += "top: " + c + "px;", d += "width: 50px;", d += "text-align: center;", d += "color: #888;", d += "font-size: 9px;", $("#impact_graph").append('<p style="' + d + '">' + a + "</p>")
}, placeActivator:function (a, b, c, d, e, f, g, h) {
    e += 5;
    var i = "";
    i += "position: absolute;", i += "left: " + d + "px;", i += "top: " + e + "px;", i += "width: " + f + "px;", i += "height: " + g + "px;", i += "z-index: 100;", i += "cursor: pointer;";
    var j = "a" + d + "-" + e;
    $("#impact_graph").append('<div class="activator" id="' + j + '" style="' + i + '">&nbsp;</div>');
    var k = this;
    $("#" + j).mouseover(
        function (b) {
            $(b.target).css("background-color", "black").css("opacity", "0.08"), k.drawAuthor(a)
        }).mouseout(
        function (a) {
            $(a.target).css("background-color", "transparent"), k.clearAuthor(), k.authorHint()
        }).mousedown(function () {
        $(".stat").remove(), k.clearAuthor(), k.drawStreams(c, b, a), k.drawStats(a, b), k.drawSelectedAuthor(a), k.authorHint()
    })
}, drawDates:function (a) {
    var b = this;
    $.each(a.buckets, function (a, c) {
        var d = 0;
        $.each(c.i, function (a, c) {
            d += b.normalizeImpact(c[1]) + 1
        });
        var e = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"], f = new Date;
        f.setTime(c.d * 1e3);
        var g = "" + f.getDate() + " " + e[f.getMonth()] + " " + f.getFullYear();
        b.drawDate(g, a * 100, d + 7)
    })
}, authorText:function (a, b, c) {
    var d = null;
    c < 25 ? d = "selected_author_text" : d = "author_text";
    var e = "";
    e += "position: absolute;", e += "left: " + b + "px;", e += "top: " + c + "px;", e += "width: 920px;", e += "color: #444;", e += "font-size: 18px;", $("#impact_legend").append('<p id="' + d + '" style="' + e + '">' + a + "</p>")
}, authorHint:function () {
    this.authorText('<span style="color: #aaa;">mouse over the graph for more details</span>', 0, 30)
}, drawAuthor:function (a) {
    this.clearAuthor();
    var b = $("#impact_legend canvas")[0].getContext("2d");
    b.fillStyle = this.colorFor(a), b.strokeStyle = "#888888", b.fillRect(0, 30, 20, 20), b.strokeRect(.5, 30.5, 19, 19);
    var c = this.data.authors[a].n;
    this.authorText(c + ' <span style="color: #aaa;">(click for more info)</span>', 25, 30)
}, drawSelectedAuthor:function (a) {
    this.clearSelectedAuthor();
    var b = $("#impact_legend canvas")[0].getContext("2d");
    b.fillStyle = this.colorFor(a), b.strokeStyle = "#000000", b.fillRect(0, 0, 20, 20), b.strokeRect(.5, .5, 19, 19);
    var c = this.data.authors[a], d = c.n, e = c.c, f = c.a, g = c.d;
    this.authorText(d + " (" + e + " commits, " + f + " additions, " + g + " deletions)", 25, 0)
}, clearAuthor:function () {
    var a = $("#impact_legend canvas")[0].getContext("2d");
    a.clearRect(0, 30, 920, 20), $("#author_text").remove()
}, clearSelectedAuthor:function () {
    var a = $("#impact_legend canvas")[0].getContext("2d");
    a.clearRect(0, 0, 920, 20), $("#selected_author_text").remove()
}}, GitHub.BaseBrowser = {pagingLimit:99, showingClosed:!1, showingOpen:!0, showingRead:!0, activeSort:["created", "desc"], currentPage:1, initialized:!1, errored:!1, lastUrl:null, lastPage:1, listings:$(), openListings:$(), closedListings:$(), unreadListings:$(), filteredListings:$(), activeIssue:$(), listingsElement:null, noneShownElement:null, errorElement:null, loaderElement:null, titleElement:null, footerElement:null, sortElements:null, pagingElement:null, init:function (a) {
    var b = this;
    this.wrapper = $(a);
    if (this.initialized)return alert("Only one IssueBrowser per page can exist");
    if (this.wrapper.length == 0)return!1;
    this.listingsElement = this.wrapper.find(".listings"), this.noneShownElement = this.wrapper.find(".none"), this.errorElement = this.wrapper.find(".error"), this.loaderElement = this.wrapper.find(".context-loader"), this.titleElement = this.wrapper.find("h2"), this.footerElement = this.wrapper.find(".footerbar-text"), this.pagingElement = this.wrapper.find(".paging"), $.hotkeys({j:function () {
        b.cursorDown()
    }, k:function () {
        b.cursorUp()
    }, o:function () {
        b.showIssue()
    }, enter:function () {
        b.showIssue()
    }});
    var c = this.wrapper.find("ul.filters li");
    c.each(function () {
        var a = $(this);
        switch (a.attr("data-filter")) {
            case"open":
                b.showingOpen && a.addClass("selected"), a.click(function () {
                    a.toggleClass("selected"), b.showOpen(a.hasClass("selected"))
                });
                break;
            case"closed":
                b.showingClosed && a.addClass("selected"), a.click(function () {
                    a.toggleClass("selected"), b.showClosed(a.hasClass("selected"))
                });
                break;
            case"read":
                b.showingRead && a.addClass("selected"), a.click(function () {
                    a.toggleClass("selected"), b.showRead(a.hasClass("selected"))
                })
        }
    }), this.sortElements = this.wrapper.find("ul.sorts li");
    var d = null;
    this.sortElements.each(function () {
        var a = $(this);
        a.attr("data-sort") == b.activeSort[0] && (d = a.addClass(b.activeSort[1])), a.click(function () {
            var a = $(this);
            d && d.attr("data-sort") != a.attr("data-sort") && d.removeClass("asc").removeClass("desc"), a.hasClass("desc") ? (b.sortBy(a.attr("data-sort"), "asc"), a.removeClass("desc").addClass("asc")) : (b.sortBy(a.attr("data-sort"), "desc"), a.removeClass("asc").addClass("desc")), d = a
        })
    }), this.pagingElement.find(".button-pager").click(function () {
        b.showMore();
        return!1
    }), this.setupMouseActions(), this.initNavigation(), this.initialized = !0;
    var e = this.listingsElement.find(".preloaded-content");
    e.length > 0 && (this.selectedLink = $(this.wrapper.find('a[href="' + e.attr("data-url") + '"]').get(0)), this.selectedLink.addClass("selected"), this.lastUrl = this.selectedLink.attr("href"), this.render(this.listingsElement.innerHTML))
}, setupMouseActions:function () {
    var a = this;
    this.listingsElement.delegate(".listing", "mouseover", function (b) {
        a.activeIssue.removeClass("active"), a.activeIssue = $(this).addClass("active")
    })
}, initNavigation:function () {
    var a = this;
    this.selectedLink = null, this.wrapper.find("ul.bignav a, ul.smallnav a").click(function (b) {
        var c = $(this);
        if (b.which == 2 || b.metaKey)return!0;
        "replaceState"in window.history && !c.hasClass("js-stateless") && window.history.replaceState(null, document.title, c.attr("href"));
        if (a.selectedLink && c.attr("href") == a.selectedLink.attr("href") && !a.errored)return!1;
        a.remoteUpdate(c.attr("href")), a.selectedLink && a.selectedLink.removeClass("selected"), a.selectedLink = $(this).addClass("selected");
        return!1
    });
    var b = this.wrapper.find(".filterbox input"), c = this.wrapper.find("ul.smallnav"), d = c.find("li"), e = function () {
        d.show(), b.val() != "" && d.filter(":not(:Contains('" + b.val() + "'))").hide()
    }, f = b.val();
    b.bind("keyup blur click", function () {
        this.value != f && (f = this.value, e())
    })
}, getPulls:function (a, b) {
    var c = this;
    b == undefined && (b = {}), a != this.lastUrl && (this.currentPage = 1), this.startLoading(), $.ajax({url:a, data:b, success:function (d) {
        c.errored = !1, c.cancelLoading(), c.errorElement.hide(), c.lastPage == b.page || b.page == 1 || b.page == undefined ? c.render(d) : c.render(d, !0), c.lastUrl = a, b.page && (c.lastPage = b.page)
    }, error:function () {
        c.errored = !0, c.showError()
    }})
}, startLoading:function () {
    this.listingsElement.fadeTo(200, .5), this.noneShownElement.is(":visible") && this.noneShownElement.fadeTo(200, .5), this.loaderElement.show()
}, cancelLoading:function () {
    this.listingsElement.fadeTo(200, 1), this.noneShownElement.is(":visible") && this.noneShownElement.fadeTo(200, 1), this.loaderElement.hide()
}, showError:function () {
    this.cancelLoading(), this.listings && this.listings.hide(), this.noneShownElement.hide(), this.errorElement.show()
}, render:function (a, b) {
    b == undefined && (b = !1), b ? this.listingsElement.append(a) : this.listingsElement.html(a), this.listings = this.listingsElement.find(".listing"), this.listings.trigger("pageUpdate"), this.currentPage == 1 && this.listings.length >= this.pagingLimit && (this.pagingElement.show(), $(this.listings[this.listings.length - 1]).remove(), this.listings = this.listingsElement.find(".listing"));
    if (b) {
        this.pagingElement.hide();
        var c = $("<div>").append(a).find(".listing");
        c > this.pagingLimit && (this.pagingElement.show(), $(this.listings[this.listings.length - 1]).remove(), this.listings = this.listingsElement.find(".listing"))
    }
    this.closedListings = this.listings.filter("[data-state=closed]"), this.openListings = this.listings.filter("[data-state=open]"), this.readListings = this.listings.filter("[data-read=1]"), this.setCounts(this.openListings.length, this.closedListings.length), this.update()
}, plural:function (a) {
    return a == 1 ? "request" : "requests"
}, setCounts:function (a, b) {
    var c = a + " open " + this.plural(a), d = a + " open " + this.plural(a) + " and " + b + " closed " + this.plural(b);
    this.titleElement.text(c), this.footerElement.text(d)
}, showOpen:function (a) {
    this.currentPage = 1, a ? this.showingOpen = !0 : this.showingOpen = !1, this.remoteUpdate()
}, showRead:function (a) {
    a ? this.showingRead = !0 : this.showingRead = !1, this.update()
}, showClosed:function (a) {
    this.currentPage = 1, a ? this.showingClosed = !0 : this.showingClosed = !1, this.remoteUpdate()
}, showMore:function () {
    this.currentPage++, this.remoteUpdate();
    return!0
}, sortBy:function (a, b) {
    this.activeSort = [a, b], this.currentPage = 1;
    return this.remoteUpdate()
}, cursorToDefault:function () {
    this.activeIssue.removeClass("active"), this.activeIssue = $(this.listings.filter(":visible").get(0)).addClass("active"), this.adjustViewForCursor()
}, cursorUp:function () {
    var a = this.activeIssue.prev(".listing");
    while (!a.is(":visible") && a.length != 0)a = a.prev(".listing");
    a.length != 0 && (this.activeIssue.removeClass("active"), this.activeIssue = a.addClass("active"), this.adjustViewForCursor())
}, cursorDown:function () {
    var a = this.activeIssue.next(".listing");
    while (!a.is(":visible") && a.length != 0)a = a.next(".listing");
    a.length != 0 && (this.activeIssue.removeClass("active"), this.activeIssue = a.addClass("active"), this.adjustViewForCursor())
}, adjustViewForCursor:function () {
    var a = this.activeIssue;
    !a.offset() || (a.offset().top - $(window).scrollTop() + 20 > $(window).height() ? a.scrollTo(10) : a.offset().top - $(window).scrollTop() < 0 && $("html,body").animate({scrollTop:a.offset().top - $(window).height()}, 200))
}, showIssue:function () {
    document.location = this.activeIssue.find("h3 a").attr("href")
}, update:function () {
    if (this.listings != null) {
        this.listings.show(), this.showingClosed || this.closedListings.hide(), this.showingOpen || this.openListings.hide(), this.showingRead || this.readListings.hide(), this.filteredListings.hide();
        var a = this.listings.filter(":visible").length;
        a == 0 ? this.noneShownElement.show() : this.noneShownElement.hide(), this.cursorToDefault()
    }
}, remoteUpdate:function (a) {
    a || (a = this.lastUrl);
    var b = {sort:this.activeSort[0], direction:this.activeSort[1], page:this.currentPage, exclude:["none"]};
    if (!this.showingClosed || !this.showingOpen)this.showingOpen || b.exclude.push("open"), this.showingClosed || b.exclude.push("closed"), b.exclude = b.exclude.join(",");
    this.getPulls(a, b)
}}, GitHub.PullRequestBrowser = {}, jQuery.extend(!0, GitHub.PullRequestBrowser, GitHub.BaseBrowser), $(function () {
    $("#js-issue-list").length > 0 && GitHub.PullRequestBrowser.init("#js-issue-list")
}), $(function () {
    var a = $("#issues_next");
    if (a.length != 0) {
        var b = function (a, b) {
            $.pjax({container:a, timeout:null, url:b})
        };
        $(".js-editable-labels-container .js-manage-labels").live("click", function () {
            var a = $(this), b = a.closest(".js-editable-labels-container"), c = b.find(".js-editable-labels-show"), d = b.find(".js-editable-labels-edit");
            c.is(":visible") ? (c.hide(), d.show(), a.addClass("selected"), $(document).bind("keydown.manage-labels", function (b) {
                b.keyCode == 27 && a.click()
            })) : (d.hide(), c.show(), a.removeClass("selected"), $(document).unbind("keydown.manage-labels"));
            return!1
        }), $(".js-custom-color-field a").live("click", function () {
            var a = $(this).closest(".js-custom-color-field");
            a.find(".field").show();
            return!1
        }), $(".js-custom-color-field input[type=text]").live("keyup", function () {
            var a = $(this).closest(".js-custom-color-field"), b = $(this).val();
            b.length == 6 && (a.find(".field").find("input[type=radio]").val(b).attr("checked", "checked"), a.find("a").html("Custom color: <strong>#" + b + "</strong>"))
        }), $(".js-new-label-form .js-label-field").live("focus", function () {
            $(this).closest(".js-new-label-form").find(".js-color-chooser-fade-in").fadeIn(300)
        });
        var c = function () {
            var a = (new RegExp("page=([^&#]+)")).exec(window.location.search);
            return a ? parseInt(a[1]) : 1
        }, d = a.find("#issues_list");
        if (d.length > 0) {
            var e = d.attr("data-params");
            e && !location.search && "replaceState"in window.history && window.history.replaceState(null, document.title, location.pathname + "?" + e), d.bind("start.pjax",
                function (a) {
                    d.find(".context-loader").show(), d.find(".issues").fadeTo(200, .5)
                }).bind("end.pjax", function (a) {
                d.find(".issues").fadeTo(200, 1), d.find(".context-loader").hide()
            });
            var f = function (a) {
                a || (a = {});
                var b = {labels:[], sort:"", direction:"", state:"", page:a.preservePage ? c() : 1}, e = d.find(".milestone-context").attr("data-selected-milestone");
                e != "" && e != null && (b.milestone = e), d.find(".sidebar ul.labels").find(".selected").each(function (a, c) {
                    b.labels.push($(c).attr("data-label"))
                }), b.labels = b.labels.join(","), b.labels == "" && delete b.labels;
                var f = d.find(".main .filterbar ul.sorts").find(".asc, .desc");
                b.sort = f.attr("data-sort"), b.direction = f.attr("class"), b.state = d.find(".main .filterbar ul.filters").find(".selected").attr("data-filter");
                var g = d.find("ul.bignav").find(".selected").attr("href");
                return g + "?" + $.param(b)
            }, g = [".sidebar ul.bignav a", ".sidebar ul.labels a", ".main .filterbar ul.filters li", ".main .filterbar ul.sorts li", ".milestone-context .pane-selector .milestone"];
            d.find(g.join(",")).pjax(d.selector, {timeout:null, url:f}), d.delegate(".pagination a, #clear-active-filters", "click", function (a) {
                a.preventDefault(), b(d.selector, $(this).attr("href"))
            }), d.selectableList(".sidebar ul.bignav", {mutuallyExclusive:!0}), d.selectableList(".sidebar ul.labels"), d.selectableList(".main .filterbar ul.filters", {wrapperSelector:"", mutuallyExclusive:!0}), d.selectableList(".js-selectable-issues", {wrapperSelector:"", itemParentSelector:".issue", enableShiftSelect:!0, ignoreLinks:!0}), d.sortableHeader(".main .filterbar ul.sorts"), d.contextButton(".sidebar .milestone .js-milestone-context", {contextPaneSelector:".milestone-context"}), d.delegate(".milestone-context .pane-selector .milestone", "click", function (a) {
                var b = $(this);
                b.closest(".milestone-context").attr("data-selected-milestone", b.attr("data-milestone")), b.closest(".milestone-context").trigger("close")
            }), d.delegate(".issues table", "click", function (a) {
                var b = $(a.target);
                if (a.which > 1 || a.metaKey || b.closest("a").length)return!0;
                var c = $(this), e = c.find(".issue.selected"), f = d.find(".issues .actions .buttons");
                e.length > 0 ? (f.addClass("activated"), f.removeClass("deactivated")) : (f.removeClass("activated"), f.addClass("deactivated")), c.find(".issue.active").removeClass("active"), b.closest(".issue").addClass("active")
            }), d.find(":checked").removeAttr("checked");
            var h = "active", i = function (a) {
                var c = {issues:[]};
                d.find(".issues :checked").each(function (a, b) {
                    c.issues.push($(b).val())
                }), $.ajax({url:a || d.find(".issues .btn-close").attr("data-url"), method:"put", data:$.param(c), success:function (a, c, e) {
                    b(d.selector, f({preservePage:!0}))
                }})
            }, j = function () {
                var a = d.find(".issues ." + h), b = d.find(".issues .issue:first"), c = d.find(".issues .issue:last");
                a.length > 0 ? a[0] == c[0] ? (a.removeClass(h), b.addClass(h)) : a.removeClass(h).next().addClass(h) : d.find(".issues .issue:first").addClass("active")
            }, k = function () {
                var a = d.find(".issues ." + h), b = d.find(".issues .issue:first"), c = d.find(".issues .issue:last");
                a.length > 0 ? a[0] == b[0] ? (a.removeClass(h), c.addClass(h)) : a.removeClass(h).prev().addClass(h) : d.find(".issues .issue:last").addClass(h)
            }, l = function () {
                var a = d.find(".issues ." + h);
                a.length > 0 && (window.location = a.find(".info h3 a").attr("href"))
            }, m = function () {
                var a = d.find(".issues ." + h);
                a.length > 0 && a.click()
            }, n = function () {
                window.location = a.find(".btn-new-issue").attr("href")
            }, o = function (a) {
                a.preventDefault(), $("#new_label_form .namefield").focus()
            };
            $.hotkeys({e:i, j:j, k:k, o:l, enter:l, x:m, c:n, l:o});
            var p = "#issues_list .label-context";
            d.delegate(".label-context button.update-labels", "click", function (a) {
                var c = $(this), e = {labels:[], issues:[]};
                d.find(".label-context ul.labels :checked").each(function (a, b) {
                    e.labels.push($(b).val())
                }), d.find(".issues :checked").each(function (a, b) {
                    e.issues.push($(b).val())
                }), $(this).closest(".label-context").trigger("close"), $.ajax({url:d.find(".label-context ul.labels").attr("data-url"), method:"put", data:e, complete:function (a, c) {
                    b(d.selector, f({preservePage:!0}))
                }})
            }), d.selectableList(".label-context ul.labels"), d.delegate(".issues .btn-close, .issues .btn-reopen", "click", function (a) {
                i($(this).attr("data-url"))
            }), d.delegate(".issues .btn-label", "click", function (b) {
                var c = d.find(".issues :checked").closest(".issue").find(".label");
                a.find(p + " .label a.selected").removeClass("selected"), a.find(p + " :checked").attr("checked", !1), c.each(function (b, c) {
                    var d = $(c).attr("data-name");
                    a.find(p + " .label[data-name=" + d + "] a").addClass("selected"), a.find(p + " .label[data-name=" + d + "] :checkbox").attr("checked", !0)
                })
            }), d.contextButton(".issues .btn-label", {contextPaneSelector:p}), d.contextButton(".issues .btn-assignee", {contextPaneSelector:".assignee-assignment-context"}), d.contextButton(".issues .btn-milestone", {contextPaneSelector:".milestone-assignment-context"});
            var q = function (a) {
                var c = $(a.target).closest(".assignee-assignment-context").find(":checked"), e = {issues:[], assignee:c.val()};
                d.find(".issues :checked").each(function (a, b) {
                    e.issues.push($(b).val())
                }), $.ajax({url:c.attr("data-url"), method:"put", data:$.param(e), success:function (a, c, e) {
                    b(d.selector, f({preservePage:!0}))
                }})
            };
            d.delegate(".issues .btn-assignee", "click", function (a) {
                var b = $(".assignee-assignment-context");
                b.data("applied") != !0 && (b.data("applied", !0), b.assigneeFilter(q))
            }), d.delegate(".assignee-assignment-context :radio", "change", q), d.delegate(".milestone-assignment-context input[type=radio]", "change", function (a) {
                var c = $(this), e = {issues:[], milestone:c.val()};
                d.find(".issues :checked").each(function (a, b) {
                    e.issues.push($(b).val())
                }), $.ajax({url:c.attr("data-url"), method:"put", data:$.param(e), success:function (a, c, e) {
                    b(d.selector, f({preservePage:!0}))
                }})
            }), d.selectableList("ul.color-chooser", {wrapperSelector:"li.color", mutuallyExclusive:!0}), d.delegate("ul.color-chooser li.color", "click", function (a) {
                var b = $(this).find("input[type=radio]").val(), c = $("#custom_label_text");
                c.text(c.attr("data-orig"))
            }), d.delegate(g.join(","), "click", function (a) {
                if (!window.history || !window.history.pushState)a.preventDefault(), window.location = f()
            })
        }
        var r = a.find("#milestone_list");
        if (r.length > 0) {
            r.bind("start.pjax",
                function (a) {
                    r.find(".context-loader").show(), r.find(".milestones").fadeTo(200, .5)
                }).bind("end.pjax", function (a) {
                r.find(".milestones").fadeTo(200, 1), r.find(".context-loader").hide()
            });
            var g = [".sidebar ul.bignav a", ".main .filterbar ul.filters li", ".main .filterbar ul.sorts li"];
            r.delegate(g.join(","), "click", function (a) {
                if (a.which == 1 && !a.metaKey) {
                    a.preventDefault();
                    var c = $(this).attr("href") || $(this).attr("data-href");
                    b(r.selector, c)
                }
            }), r.selectableList(".sidebar ul.bignav", {mutuallyExclusive:!0}), r.selectableList(".main .filterbar ul.filters", {wrapperSelector:"", mutuallyExclusive:!0}), r.sortableHeader(".main .filterbar ul.sorts")
        }
    }
}), $(function () {
    var a = $("#issues_next #js-new-issue-form");
    if (a.length != 0) {
        a.selectableList("ul.labels");
        var b = function (b) {
            var c = a.find("input.title");
            c.val().length > 0 ? (c.addClass("valid"), $(".js-title-missing-error").hide()) : (c.removeClass("valid"), $(".js-title-missing-error").show())
        };
        a.bind("submit", function (a) {
            b();
            if ($(".js-title-missing-error").is(":visible"))return!1
        }), a.find("input.title").keyup(b).change(b), a.contextButton(".js-milestone-context-button", {contextPaneSelector:".js-milestone-context", anchorTo:"right"});
        var c = a.find(".js-milestone-context"), d = a.find(".infobar .milestone .text");
        c.find("label").click(function () {
            var a = $(this).find("input[type=radio]");
            a.val() == "" ? d.html("No milestone") : d.html("Milestone: <strong>" + $(this).find("h4").text())
        }), a.contextButton(".js-assignee-context-button", {contextPaneSelector:".js-assignee-context", anchorTo:"left"}).bind("show.context-button", function () {
            $(".context-pane:visible :text").focus()
        });
        var e = a.find(".js-assignee-context"), f = a.find(".infobar .assignee .text");
        e.assigneeFilter(function () {
            e.find(".current").click()
        }), e.find(".selector-item").click(function () {
            var a = $(this).find("input[type=radio]");
            a.val() == "" ? f.html("No one is assigned") : f.html("Assignee: <strong>" + $(this).find("h4").html())
        }), a.find(".js-pane-radio-selector").each(function () {
            var a = $(this), b = a.closest(".context-pane");
            a.find("label").click(function () {
                var c = $(this);
                a.find(".selected").removeClass("selected"), c.addClass("selected"), b.trigger("close")
            })
        })
    }
}), $(function () {
    var a = $("#issues_next #issues_search");
    if (a.length != 0) {
        var b = $("#js-issues-quicksearch").val();
        a.find("input[type=radio], select").change(function (a) {
            var c = $(this).closest("form");
            c.find("#search_q").val(b), c.submit()
        })
    }
}), $(function () {
    var a = $("#issues_next #show_issue");
    if (a.length != 0) {
        var b = function (a) {
            window.location = $("#to_isssues_list").attr("href")
        }, c = function () {
            $("#issues_next .btn-close-issue").click()
        }, d = function () {
            window.location = $("#issues_next .btn-new-issue").attr("href")
        };
        $.hotkeys({u:b, e:c, c:d}), a.contextButton(".js-assignee-context", {contextPaneSelector:".assignee-context"}).bind("show.context-button", function () {
            $(".context-pane:visible :text").focus()
        }), a.find(".assignee-context").assigneeFilter(function () {
            a.find(".assignee-context form").submit()
        }), a.contextButton(".js-milestone-context", {contextPaneSelector:".milestone-context", anchorTo:"right"}), a.find(".milestone-selector .selector-item").click(function () {
            var a = $(this).find("input[type=radio]");
            a[0].checked = !0, a.trigger("change")
        }), a.contextButton(".js-label-context", {contextPaneSelector:".label-context", anchorTo:"right"}), a.selectableList(".js-selectable-labels");
        var e = a.find(".js-filterable-labels li"), f = a.find(".js-label-filter");
        f.keyup(function () {
            var a = $(this).val();
            a != "" && a != null ? e.each(function () {
                var b = $(this), c = b.text().toLowerCase();
                c.score(a) > 0 ? b.show() : b.hide()
            }) : e.each(function () {
                $(this).show()
            })
        });
        var g = a.find(".js-autosubmitting-labels");
        g.find("input[type=checkbox]").change(function () {
            $.post(g.attr("action"), g.serialize(), function (a) {
                $(".discussion-stats .labels").html(a.labels)
            }, "json")
        });
        var h = $(".js-pane-selector-autosubmit");
        h.delegate("input[type=radio]", "change", function () {
            var a = $(this);
            a.closest("form").submit()
        }), $(".pull-participation a").click(function () {
            $("#issue_comment_form *[tabindex=1]").focus()
        });
        var i = function (a) {
            a.discussionStats && $(".discussion-stats").html(a.discussionStats), a.discussion && $(".discussion-timeline > .new-comments").append(a.discussion), a.formActionBar && $("#issue_comment_form .action-bar").html(a.formActionBar), a.formActions && $("#issue_comment_form .form-actions").html(a.formActions), $("#show_issue").trigger("pageUpdate")
        };
        $("#issue_comment_form .action-bar .minibutton").live("click", function () {
            var a = $("#issue_comment_form");
            $(this).addClass("disabled"), $.ajax({type:"POST", url:$(this).attr("href") + ".json", dataType:"json", success:i});
            return!1
        });
        var j;
        $("#issue_comment_form button").live("click", function () {
            j = $(this).attr("name") == "comment_and_close" ? "1" : ""
        }), $("body").delegate("#issue_comment_form", "submit", function (a) {
            var b = $(this), c = b.serialize() + "&comment_and_close=" + j;
            if ($.trim(b.find('textarea[name="comment[body]"]').val()) == "")return!1;
            b.find(".form-actions button").attr("disabled", "true"), $.ajax({type:"POST", url:b.attr("action") + ".json", data:c, dataType:"json", success:function (a) {
                i(a), b.find("textarea").val("").blur(), b.find("a[action=write]").click(), b.find(".form-actions button").attr("disabled", !1)
            }});
            return!1
        })
    }
});
var location_with_hash = location.pathname + location.hash, matches = location_with_hash.match(/#issue\/(\d+)(\/comment\/(\d+))?/);
if (matches) {
    var issue_number = matches[1], comment_id = matches[3];
    issue_number && (comment_id ? window.location = location_with_hash.replace(/\/?#issue\/\d+\/comment\/\d+/, "/" + issue_number + "#issuecomment-" + comment_id) : window.location = location_with_hash.replace(/\/?#issue\/\d+/, "/" + issue_number))
}
jQuery(function (a) {
    var b = a("#issues_next");
    if (b.length != 0) {
        var c = function (b) {
            b.preventDefault(), a("#js-issues-quicksearch").focus()
        };
        a.hotkeys({"/":c});
        var d = a("#js-issues-quicksearch");
        if (d.length > 0) {
            var e = b.find(".btn-new-issue"), f = d.offset();
            b.find(".search .autocomplete-results").css({left:d.position().left, top:d.outerHeight(!0) + 5, width:e.offset().left - f.left + e.outerWidth(!0)}), d.quicksearch({results:b.find(".search .autocomplete-results"), insertSpinner:function (a) {
                d.closest("form").prepend(a)
            }}).bind("focus",
                function (b) {
                    a(this).closest(".fieldwrap").addClass("focused")
                }).bind("blur",
                function (b) {
                    a(this).closest(".fieldwrap").removeClass("focused")
                }).css({outline:"none"})
        }
    }
}), $(function () {
    var a = $(".github-jobs-promotion");
    a.get(0) != null && (a.css({visibility:"hidden"}), window.jobsWidgetCallback = function (b) {
        var c = Math.floor(Math.random() * b.jobs.length), d = b.jobs[c];
        a.find(".job-link").attr("href", d.url), a.find(".job-company").text(d.company), a.find(".job-position").text(d.position), a.find(".job-location").text(d.location), a.css({visibility:"visible"})
    }, $.getScript(a.attr("url")))
}), $(function () {
    $("#add_key_action").click(function () {
        $(this).toggle(), $("#new_key_form_wrap").toggle().find(":text").focus();
        return!1
    }), $(".edit_key_action").live("click", function () {
        var a = $(this).attr("href");
        $.facebox(function () {
            $.get(a, function (a) {
                $.facebox(a), $("#facebox .footer").hide()
            })
        });
        return!1
    }), $("#cancel_add_key").click(function () {
        $("#add_key_action").toggle(), $("#new_key_form_wrap").toggle().find("textarea").val(""), $("#new_key").find(":text").val(""), $("#new_key .error_box").remove();
        return!1
    }), $(".cancel_edit_key").live("click", function () {
        $.facebox.close(), $("#new_key .error_box").remove();
        return!1
    }), $(".delete_key").live("click", function () {
        if (confirm("Are you sure you want to delete this key?")) {
            $.ajax({type:"POST", data:{_method:"delete"}, url:$(this).attr("href")});
            var a = $(this).parents("ul");
            $(this).parent().remove()
        }
        return!1
    }), $("body").delegate("form.key_editing", "submit", function (a) {
        var b = this;
        $(b).find(".error_box").remove(), $(b).find(":submit").attr("disabled", !0).spin(), $(b).ajaxSubmit(function (a) {
            a.substring(0, 3) == "<li" ? ($(b).attr("id").substring(0, 4) == "edit" ? ($("#" + $(b).attr("id").substring(5)).replaceWith(a), $.facebox.close()) : ($("ul.public_keys").append(a), $("#add_key_action").toggle(), $("#new_key_form_wrap").toggle()), $(b).find("textarea").val(""), $(b).find(":text").val("")) : $(b).append(a), $(b).find(":submit").attr("disabled", !1).stopSpin()
        });
        return!1
    })
}), GitHub = GitHub || {}, GitHub.metric = function (a, b) {
    if (!window.mpq)return GitHub.metric = $.noop;
    b ? mpq.push([b.type || "track", a, b]) : mpq.push(["track", a])
}, GitHub.trackClick = function (a, b, c) {
    if (!window.mpq)return GitHub.trackClick = $.noop;
    $(a).click(function () {
        c = $.isFunction(c) ? c.call(this) : c, GitHub.metric(b, c);
        return!0
    })
}, $(function () {
    var a = GitHub.trackClick;
    a("#entice-signup-button", "Entice banner clicked"), a("#coupon-redeem-link", "Clicked Dec 2010 Sale Notice"), a("#watch_button", "Watched Repo", {repo:GitHub.nameWithRepo}), a("#unwatch_button", "Unwatched Repo", {repo:GitHub.nameWithRepo}), a(".btn-follow", "Followed User", function () {
        return{user:$(this).attr("data-user")}
    }), a(".btn-unfollow", "Unfollowed User", function () {
        return{user:$(this).attr("data-user")}
    })
}), DateInput.prototype.resetDate = function () {
    $(".date_selector .selected").removeClass("selected"), this.changeInput("")
}, $(function () {
    $("input.js-date-input").each(function () {
        var a = new DateInput(this);
        a.hide = $.noop, a.show(), $(this).hide(), $(".date_selector").addClass("no_shadow")
    }), $("label.js-date-input a").click(function (a) {
        var b = $("input.js-date-input").data("datePicker");
        b.resetDate()
    })
});
var Network = defineNetwork(window.jQuery);
$(function () {
    $("#organization-transforming").redirector({url:"/organizations/transforming?user=" + github_user, to:"/login"}), $("#members_bucket .remove-user").click(function () {
        var a, b = $(this), c = b.parents("li:first").find(".login").text(), d = "Are you POSITIVE you want to remove " + c + " from " + "your organization?";
        if (!confirm(d))return!1;
        b.spin().remove(), a = $("#spinner").addClass("remove"), $.del(b.attr("href"), function () {
            a.parent().remove()
        });
        return!1
    })
}), $(function () {
    if (!$("body").hasClass("page-account"))return!1;
    var a = $("#add_email_action a"), b = $("#cancel_add_email"), c = $("#add_email_form_wrap"), d = $(".add-emails-form .error_box");
    a.click(function () {
        $(this).toggle(), c.fadeIn(200).find(":text").focus();
        return!1
    }), b.click(function () {
        a.toggle(), c.hide().find(":text").val(""), d.hide();
        return!1
    }), $(".delete_email").live("click", function () {
        if ($("ul.user_emails li.email").length == 1) {
            $.facebox("You must always have at least one email address.  If you want to delete this address, add a new one first.");
            return!1
        }
        $.post($(this).attr("href"), {email:$(this).prev().text()}), $(this).parent().remove();
        return!1
    }), $(".delete_connection").live("click", function () {
        $.post($(this).attr("href"), {_method:"delete"}), $(this).parent().remove();
        return!1
    }), $("ul.user_emails li.email").length > 0 && $("#add_email_form").submit(function () {
        $("#add_email_form :submit").attr("disabled", !0).spin();
        var a = this;
        $(this).ajaxSubmit(function (b) {
            b ? $("ul.user_emails").append(b) : d.show(), $("#add_email_form :submit").attr("disabled", !1).stopSpin(), $(a).find(":text").val("").focus()
        });
        return!1
    }), $(".user_toggle").click(function () {
        var a = {};
        a[this.name] = this.checked ? "1" : "0", a._method = "put", $.post("/account", a), $("#notify_save").show(), setTimeout("$('#notify_save').fadeOut()", 1e3)
    }), $("dl.form.autosave").autosaveField(), $("button.dummy").click(function () {
        $(this).prev(".success").show().fadeOut(5e3);
        return!1
    }), $(".js-preview-job-profile").click(function () {
        $.get("/preview", {text:$("#user_profile_bio").val()}, function (a) {
            $.facebox(a, "job-profile-preview")
        });
        return!1
    }), $(".js-leave-collaborated-repo", $("#facebox")[0]).live("click", function (a) {
        var b = $(this).parents("form").attr("data-repo"), c = $('ul.repositories li[data-repo="' + b + '"]'), d = $(this).parents("div.full-button");
        d.addClass("no-bg"), d.html('<img src="/images/modules/ajax/indicator.gif">'), $.ajax({url:"/account/leave_repo/" + b, type:"POST", success:function () {
            $.facebox.close(), c.fadeOut()
        }, error:function () {
            d.html('<img src="/images/modules/ajax/error.png">')
        }}), a.preventDefault();
        return!1
    }), $("body").delegate(".change-gravatar-email form", "submit", function () {
        var a = $(this), b = a.find("button").attr("disabled", !0), c = a.find(".spinner").html('<img src="/images/modules/ajax/indicator.gif"/>');
        $.ajax({url:a.attr("action"), type:"PUT", data:{email:a.find("input").val()}, success:function (b) {
            c.html('<img src="/images/modules/ajax/success.png"/>'), a.find(".error").text("");
            var d = $(".change-gravatar-email .gravatar img").attr("src");
            $(".change-gravatar-email .gravatar img").attr("src", d.replace(/[a-f0-9]{32}/, b)), $(document).unbind("close.facebox").bind("close.facebox", function () {
                window.location = window.location
            })
        }, error:function (b) {
            c.html('<img src="/images/modules/ajax/error.png"/>'), a.find(".error").text(b.responseText)
        }, complete:function () {
            b.attr("disabled", !1)
        }});
        return!1
    })
}), $(function () {
    if ($(".page-billing, .page-account").length == 0)return!1;
    $(".js-coupon-click-onload").click(), $(".js-add-cc").click(function () {
        $(document).one("reveal.facebox", function () {
            $("#facebox .js-thanks, #facebox .rule:first").hide()
        }), $.facebox({div:this.href});
        return!1
    }), $(".js-close-facebox").live("click", function () {
        $(document).trigger("close.facebox")
    }), $(".js-edit-org-select-billing").click(function () {
        $("a[href=#billing_bucket]").click();
        return!1
    });
    var a = $("table.upgrades");
    if (a.length == 0)return!1;
    a.find(".choose_plan").click(function () {
        var a = $(this).closest("tr").attr("data-name");
        $(".js-new-plan-name-val").val(a), $(".js-new-plan-name").text(a), a == "free" ? $(".js-new-plan-card-on-file").hide() : $(".js-new-plan-card-on-file").show()
    }), $("body").delegate(".js-coupon-form", "submit", function () {
        $(this).find("button").attr("disabled", !0).after(' <img src="/images/modules/ajax/indicator.gif">'), $.ajax({url:this.action, type:this.method, data:{code:$(this).find(":text").val()}, error:function (a) {
            $("#facebox .content").html(a.responseText)
        }, success:function (a) {
            $("#facebox .content").html(a), $(document).unbind("close.facebox").bind("close.facebox", function () {
                var a = window.location.pathname;
                window.location = /organizations/.test(a) ? a : "/account/billing"
            })
        }});
        return!1
    }), $(".selected .choose_plan").click()
}), $(function () {
    if (!$("body").hasClass("page-compare"))return!1;
    var a = null;
    $(".compare-range .commit-ref.to").click(function () {
        a = "end", $.facebox({div:"#compare_chooser"});
        return!1
    }), $(".compare-range .commit-ref.from").click(function () {
        a = "start", $.facebox({div:"#compare_chooser"});
        return!1
    });
    var b = function () {
        var b = $("#facebox .ref-autocompleter"), c = $("#facebox button.choose-end"), d = $("#facebox button.refresh");
        b.val(a == "start" ? comparisonBase : comparisonHead), $("#facebox .mode-upper").text(e(a)), $("#facebox .mode-lower").text(a), a == "start" ? c.show() : c.hide()
    }, c = function () {
        var c = $("#facebox .ref-autocompleter");
        if (c.length != 0) {
            var d = $("#facebox .commit-preview-holder"), e = $("#facebox button.refresh"), f = $(".compare-range").attr("url-base");
            b(), e.click(function () {
                a == "start" ? comparisonBase = c.val() : comparisonHead = c.val(), $(document).trigger("close.facebox"), document.location = f + comparisonBase + "..." + comparisonHead;
                return!1
            }), c.click(function () {
                this.focus(), this.select();
                return!1
            });
            var g = !1, h = null, i = function () {
                g && h.abort(), g = !0, h = $.get(d.attr("url_base") + c.val(), null, function (a) {
                    a.length > 0 && (d.html(a), d.find("a").attr("target", "_blank"), d.trigger("pageUpdate")), g = !1
                })
            };
            i();
            var j = c.val(), k = null, l = function () {
                j != c.val() || k == c.val() ? j = c.val() : (i(), k = c.val())
            };
            c.keyup(function () {
                j = this.value, setTimeout(l, 1e3)
            }), c.click()
        }
    };
    $(document).bind("reveal.facebox", c);
    var d = window.location.hash.substr(1);
    (/^diff-/.test(d) || /^L\d+/.test(d)) && $("li a[href='#files_bucket']").click();
    var e = function (a) {
        return a.charAt(0).toUpperCase() + a.slice(1)
    }
}), $(function () {
    function c() {
        var a = b.find("input.title");
        a.val().length > 0 ? (a.addClass("valid"), b.find(".js-title-missing-error").hide()) : (a.removeClass("valid"), b.find(".js-title-missing-error").show())
    }

    if (!$("body").hasClass("page-newpullrequest"))return!1;
    $(".pull-form a[action=preview]").click(function () {
        var a = $(".pull-form .content-body"), b = $(".pull-form").attr("data-preview-url"), c = $(this).closest("form");
        a.html("<p>Loading preview ...</p>"), $.post(b, c.serialize(), function (b) {
            a.html(b)
        })
    });
    var a = $(".btn-change");
    a.data("expand-text", a.text()), a.data("collapse-text", a.attr("data-collapse-text")), a.data("state", "collapsed"), $(".editor-expander").click(function () {
        a.data("state") == "collapsed" ? (a.find("span").text(a.data("collapse-text")), a.data("state", "expanded"), $(".range-editor").slideDown("fast"), $(".pull-form-main .form-actions button").hide(), $(".pull-tabs, .tab-content").css({opacity:.45})) : (a.find("span").text(a.data("expand-text")), a.data("state", "collapsed"), $(".range-editor").slideUp("fast"), $(".pull-form-main .form-actions button").show(), $(".pull-tabs, .tab-content").css({opacity:1}));
        return!1
    });
    var b = $(".new-pull-request form");
    b.submit(function () {
        if (!b.attr("data-update")) {
            c();
            if ($(".js-title-missing-error").is(":visible"))return!1;
            GitHub.metric("Sent Pull Request", {"Pull Request Type":"New School", Action:GitHub.currentAction, "Ref Type":GitHub.revType})
        }
    }), $("button#update_commit_range").click(function () {
        b.attr("data-update", "yes"), b.attr("action", "/" + GitHub.nameWithOwner + "/pull/new"), b.submit()
    }), $(".range-editor").find("input, select").keypress(function (a) {
        a.keyCode == 13 && a.preventDefault()
    }), $(".js-refchooser").each(function () {
        $(this).refChooser({change:function () {
            $(this).attr("data-ref-valid", !1), $("button#update_commit_range").attr("disabled", !0)
        }, found:function () {
            $(this).attr("data-ref-valid", !0), $(".js-refchooser[data-ref-valid=false]").length == 0 && $("button#update_commit_range").removeAttr("disabled")
        }});
        var a = $(this).find(".js-ref"), b = $(this).find("select"), c = a.branchesAutocomplete({extraParams:{repository:b.val()}});
        b.change(function () {
            c.flushCache(), c.setOptions({extraParams:{repository:$(this).val()}}), c.click()
        }), a.focus(function () {
            window.setTimeout(function () {
                a.selection(0, a.val().length)
            }, 1)
        })
    })
}), function (a) {
    a.fn.refChooser = function (b) {
        var c = a.extend({}, a.fn.refChooser.defaults, b);
        return this.each(function () {
            var b = this, d = a(this), e = d.find(".js-source"), f = d.find(".js-ref"), g = d.find(".js-commit-preview"), h = d.attr("data-preview-url-base"), i = {repo:d.attr("data-error-repoo")}, j = !1, k = null, l = function () {
                if (e.val() == "")g.html('<p class="error">' + i.repo + "</p>"), c.missing.call(d); else {
                    var l = h + e.val().split("/")[0] + ":" + f.val();
                    j && k.abort(), j = !0, k = a.get(l, null, function (a) {
                        a.length > 0 && (g.html(a), g.trigger("pageUpdate"), g.find(".error").length == 0 ? c.found.call(b) : c.missing.call(b)), j = !1
                    })
                }
            }, m = f.val();
            f.keyup(function () {
                this.value != m && (c.change.call(b), m = this.value, l())
            });
            var n = e.val();
            e.change(function () {
                this.value != n && (c.change.call(b), n = this.value, l())
            })
        })
    }, a.fn.refChooser.defaults = {found:function () {
    }, change:function () {
    }, missing:function () {
    }}
}(jQuery), $(function () {
    if (!$("body").hasClass("page-notifications"))return!1;
    $("table.notifications input[type=checkbox]").change(function () {
        $.post("/account/toggle_notification", {_method:"put", enable:this.checked ? "true" : "false", notification_action:this.value})
    }), $("button.dummy").click(function () {
        $(this).prev(".success").show().fadeOut(5e3);
        return!1
    }), $(".user_toggle").click(function () {
        var a = this.checked, b = {};
        b[this.name] = this.checked ? "1" : "0", b._method = "put", $.post("/account", b, function () {
            a ? $("#notifications_global_wrapper").removeClass("ignored") : $("#notifications_global_wrapper").addClass("ignored")
        })
    })
}), $(function () {
    if (!$("body").hasClass("page-profile"))return!1;
    var a = $("ul.repositories>li"), b = $(".repo-filter input").val(""), c = b.val(), d = null, e = function () {
        a.show(), b.val() != "" && a.filter(":not(:Contains('" + b.val() + "'))").hide()
    };
    b.bind("keyup blur click", function () {
        this.value != c && (c = this.value, e())
    }), $("ul.repositories>li.simple").each(function () {
        var a = $(this), b = a.find("p.description").html();
        $.trim(b) != "" && a.find("h3").attr("title", b).tipsy({gravity:"w"})
    });
    var f = $("ul#placeholder-members li").remove();
    f.length > 0 && $("ul.org-members").prepend(f)
}), $(function () {
    if (!$("body").hasClass("page-pullrequest"))return!1;
    $(".file, .file-box").live("commentChange", function (a) {
        $(a.target).closest("#discussion_bucket").length > 0 ? $("#files_bucket").remove() : $("#discussion_bucket").remove()
    }), $("#reply-to-pr").click(function () {
        $("#comment_body").focus()
    }), $("#pull_closed_warning a").click(function () {
        $("#pull_closed_warning").hide(), $("#pull_comment_form").show();
        return!1
    }), $(".pull-participation a").click(function () {
        $("#pull_comment_form *[tabindex=1]").focus()
    });
    var a = $(".js-toggle-merging");
    if (a.length > 0) {
        var b = $(".js-shown-merging"), c = $(".js-shown-notmerging");
        a.click(function () {
            b.is(":visible") ? (b.hide(), c.show()) : (b.show(), c.hide());
            return!1
        })
    }
    $(".mergeable").contextButton(".js-merge-help", {contextPaneSelector:".merge-help-context", anchorTo:"left"});
    var d = $("#js-mergeable-unknown");
    if (d.length > 0 && d.is(":visible")) {
        var e = d.attr("data-pull-num");
        $.smartPoller(function (a) {
            $.getJSON("/" + GitHub.nameWithOwner + "/pull/" + e + "/mergeable", function (b) {
                b === !0 ? (d.hide(), $("#js-mergeable-clean").show()) : b === !1 ? (d.hide(), $("#js-mergeable-dirty").show()) : a()
            })
        })
    }
}), $(function () {
    $(".ajax_paginate a").live("click", function () {
        var a = $(this).parent(".ajax_paginate");
        if (a.hasClass("loading"))return!1;
        a.addClass("loading"), $.ajax({url:$(this).attr("href"), complete:function () {
            a.removeClass("loading")
        }, success:function (b) {
            a.replaceWith(b), a.parent().trigger("pageUpdate")
        }});
        return!1
    })
}), $(function () {
    $(".graph .bars").each(function (a) {
        var b = this;
        if (!!$(b).is(":visible")) {
            var c = function (a) {
                new ParticipationGraph(b, a)
            }, d = $(this).attr("rel");
            $.get(d, null, c, "text")
        }
    })
}), ParticipationGraph = function (a, b) {
    this.BAR_WIDTH = 7, this.allCommits = null, this.ownerCommits = null, this.primer = new Primer(a, 416, 20), this.data = b, this.readData(), this.draw()
}, ParticipationGraph.prototype = {readData:function () {
    var a = this.data.split("\n");
    this.allCommits = a[0] ? this.base64BytesToIntArray(a[0]) : "", this.ownerCommits = a[1] ? this.base64BytesToIntArray(a[1]) : ""
}, max:function (a) {
    var b = a[0];
    for (var c = 1; c < a.length; c++)a[c] > b && (b = a[c]);
    return b
}, integerize:function (a) {
    var b = [];
    for (var c = 0; c < a.length; c++)b.push(parseInt(a[c]));
    return b
}, base64ByteToInt:function (a) {
    var b = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!-";
    return b.indexOf(a)
}, base64BytesToIntArray:function (a) {
    var b = [], c;
    for (var d = 0; d < a.length; d++)d % 2 == 0 ? c = 64 * this.base64ByteToInt(a.charAt(d)) : (c = c + this.base64ByteToInt(a.charAt(d)), b.push(c));
    return b
}, draw:function () {
    var a = this.max(this.allCommits), b;
    a >= 20 ? b = 19 / a : b = 1;
    var c = new Primer.Layer;
    c.bind(this.primer);
    for (var d = 0; d < this.allCommits.length; d++) {
        var e = new Primer.Layer;
        e.bind(this.primer), e.setFillStyle("#CACACA");
        var f = this.allCommits[d] * b;
        e.fillRect(d * (this.BAR_WIDTH + 1), 20 - f, this.BAR_WIDTH, f), c.addChild(e)
    }
    var g = new Primer.Layer;
    g.bind(this.primer);
    for (var d = 0; d < this.ownerCommits.length; d++) {
        var e = new Primer.Layer;
        e.bind(this.primer), e.setFillStyle("#336699");
        var f = this.ownerCommits[d] * b;
        e.fillRect(d * (this.BAR_WIDTH + 1), 20 - f, this.BAR_WIDTH, f), g.addChild(e)
    }
    this.primer.addChild(c), this.primer.addChild(g)
}}, $(function () {
    var a = $("table.upgrades");
    if (a.length == 0)return!1;
    var b = a.find("tr.current"), c = $("#plan"), d = $("#credit_card_fields"), e = function (b) {
        newPlan = b, a.find("tr.selected").removeClass("selected"), b.addClass("selected"), a.addClass("selected"), c.val(newPlan.attr("data-name")), newPlan.attr("data-cost") == 0 ? d.hide() : d.show()
    };
    a.find(".choose_plan").click(function () {
        e($(this).closest("tr"));
        return!1
    }), $(".selected .choose_plan").click()
}), function () {
    function a(a) {
        $(a || document).find("time.js-relative-date").each(function () {
            var a = $.parseISO8601($(this).attr("datetime"));
            a && $(this).text($.distanceOfTimeInWords(a))
        })
    }

    $(document).pageUpdate(function () {
        a(this)
    }), $(function () {
        setInterval(a, 6e4)
    })
}(), $(function () {
    $(".plan").dblclick(function () {
        var a = $(this).find("a.classy");
        a.length > 0 && (document.location = a.attr("href"))
    }), $("#signup_form").submit(function () {
        $("#signup_button").attr("disabled", !0).find("span").text("Creating your GitHub account...")
    }), $("dl.form.autocheck").each(function () {
        var a = $(this);
        a.find("input").blur(function () {
            var b = $(this);
            if (!!$.trim(b.val())) {
                if (!b.attr("check-url"))return;
                b.css("background-image", 'url("/images/modules/ajax/indicator.gif")'), $.ajax({type:"POST", url:b.attr("check-url"), data:{value:b.val()}, success:function () {
                    b.next().is(".note") && b.next().find("strong").text(b.val()), a.unErrorify(), b.css("background-image", 'url("/images/modules/ajax/success.png")')
                }, error:function (c) {
                    a.errorify(c.responseText), b.css("background-image", 'url("/images/modules/ajax/error.png")')
                }})
            }
        })
    })
}), GitHub.spy = function (a) {
    var b = {path:"/", expires:1}, c = a.repo;
    c != "" && ($.cookie("spy_repo", c, b), $.cookie("spy_repo_at", new Date, b))
}, $(function () {
    var a = $(".js-subscription");
    if (a.length != 0) {
        var b = $(".js-subscription-off"), c = $(".js-subscription-on"), d = $(".js-subscription-settings"), e = "ignored";
        a.live("click", function () {
            var a = $(this), f = d.attr("data-method") || "POST";
            $.ajax({type:f, url:a.attr("href"), dataType:"text", success:function (a) {
                a == "on" ? (c.show(), b.hide(), d.removeClass(e)) : (b.show(), c.hide(), d.addClass(e))
            }});
            return!1
        })
    }
}), GitHub.Team = function (a) {
    this.url = window.location.pathname, this.orgUrl = this.url.split(/\/(teams|invite)/)[0], a && (this.url = this.orgUrl + "/teams/" + a)
}, GitHub.Team.prototype = {name:function () {
    return $("#team-name").val()
}, newRecord:function () {
    return!/\/invite/.test(location.pathname) && !/\d/.test(location.pathname)
}, addMember:function (a) {
    return/\//.test(a) ? this.addRepo(a) : this.addUser(a)
}, repos:function () {
    return $.makeArray($(".repositories li:visible a span").map(function () {
        return $(this).text()
    }))
}, addRepo:function (a) {
    debug("Adding repo %s", a);
    if (!a || $.inArray(a, this.repos()) > -1)return!1;
    this.addRepoAjax(a);
    var b = $(".repositories").find("li:first").clone(), c = b.find("input[type=hidden]");
    b.find("a").attr("href", "/" + a).text(a), b.find(".remove-repository").attr("data-repo", a), GitHub.Autocomplete.visibilities[a] == "private" && b.addClass("private"), c.length > 0 && c.val(a).attr("disabled", !1), $(".repositories").append(b.show());
    return!0
}, addRepoAjax:function (a) {
    this.newRecord() || (debug("Ajaxily adding %s", a), $.post(this.url + "/repo/" + a))
}, removeRepo:function (a) {
    debug("Removing %s", a);
    if (!a || $.inArray(a, this.repos()) == -1)return!1;
    var b = $(".repositories li:visible a").filter(function () {
        return $(this).find("span").text() == a
    }), c = function () {
        b.parents("li:first").remove()
    }, d = function () {
        b.parent().find(".remove-repository").show().removeClass("remove").html('<img class="dingus" src="/images/modules/ajax/error.png">').end().find(".spinner").hide()
    };
    this.newRecord() ? c() : (b.parent().find(".remove-repository").after('<img class="dingus spinner" src="/images/modules/ajax/indicator.gif"/>').hide(), this.removeRepoAjax(a, c, d));
    return!0
}, removeRepoAjax:function (a, b, c) {
    this.newRecord() || (debug("Ajaxily removing %s", a), $.del(this.url + "/repo/" + a, {}, {success:b, error:c}))
}, users:function () {
    return $.makeArray($(".usernames li:visible").map(function () {
        return $(this).find("a:first").text()
    }))
}, addUser:function (a) {
    debug("Adding %s", a);
    if (!a || $.inArray(a, this.users()) > -1)return!1;
    this.addUserAjax(a);
    var b = $(".usernames").find("li:first").clone(), c = GitHub.Autocomplete.gravatars[a], d = b.find("input[type=hidden]");
    c && b.find("img").replaceWith(c), b.find("a").attr("href", "/" + a).text(a), d.length > 0 && d.val(a).attr("disabled", !1), $(".usernames").append(b.show());
    return!0
}, removeUser:function (a) {
    debug("Removing %s", a);
    if (!a || $.inArray(a, this.users()) == -1)return!1;
    var b = $(".usernames li:visible a:contains(" + a + ")"), c = function () {
        b.parents("li:first").remove()
    };
    this.newRecord() ? c() : (b.parent().find(".remove-user").spin().remove(), $("#spinner").addClass("remove"), this.removeUserAjax(a, c));
    return!0
}, addUserAjax:function (a) {
    this.newRecord() || (debug("Ajaxily adding %s", a), $.post(this.url + "/member/" + a))
}, removeUserAjax:function (a, b) {
    this.newRecord() || (debug("Ajaxily removing %s", a), $.del(this.url + "/member/" + a, b))
}}, $(function () {
    if (!!GitHub.currentTeam) {
        var a = function () {
            debug("Setting data.completed to %s", $(this).val()), $(this).data("completed", $(this).val())
        }, b = GitHub.currentTeam, c = new GitHub.Autocomplete;
        c.settings.selectFirst = !0, c.reposURL = b.orgUrl + "/autocomplete/repos", c.repos($(".add-repository-form input")).result(a), $(".remove-repository").live("click", function () {
            b.removeRepo($(this).attr("data-repo"));
            return!1
        }), $(".add-username-form input").userAutocomplete().result(a), $(".remove-user").live("click", function () {
            b.removeUser($(this).prev().text());
            return!1
        }), $(".add-username-form button, .add-repository-form button").click(function () {
            var a = $(this).parent(), c = a.find(":text"), d = c.val();
            debug("Trying to add %s...", d);
            if (!d || !c.data("completed"))return!1;
            c.val("").removeClass("ac-accept"), b.addMember(d);
            return!1
        }), $(".add-username-form :text, .add-repository-form :text").keypress(function (a) {
            if (a.keyCode == $.keys.enter) {
                $(this).next("button").click();
                return!1
            }
            a.keyCode != $.keys.tab && (debug("Clearing data.completed (was %s)", $(this).data("completed") || "null"), $(this).data("completed", null))
        })
    }
}), $(function () {
    $(".remove-team").click(function () {
        if (!confirm("Are you POSITIVE you want to remove this team?"))return!1;
        var a = $(this).parents("li.team");
        $.del(this.href, function () {
            a.remove()
        }), $(this).spin().remove();
        return!1
    })
}), $(function () {
    var a = $.cookie("tracker"), b = null;
    a == null && (b = document.referrer ? document.referrer : "direct");
    var c = getParams();
    c.utm_campaign && $.trim(c.utm_campaign) != "" && (b = c.utm_campaign), c.referral_code && $.trim(c.referral_code) != "" && (b = c.referral_code), b != null && $.cookie("tracker", b, {expires:7, path:"/"})
}), GitHub || (GitHub = {}), GitHub.Tree || (GitHub.Tree = {}), GitHub.Tree.rewriteSHAsInLinksWithRef = function (a) {
    !GitHub.currentRef || $(a || ".breadcrumb a, .tree-browser .content a").each(function () {
        if (!/skiptree/.test(this.className)) {
            this.href = this.href.replace(/[0-9a-f]{40}/, GitHub.currentRef);
            var a = "/" + GitHub.nameWithOwner + "/tree/" + GitHub.masterBranch;
            (new RegExp(a + "$")).test(this.href) && (this.href = "/" + GitHub.nameWithOwner)
        }
    })
}, GitHub.CachedCommitDataPoller = function (a, b) {
    var c = $(b || document).find(".js-loading-commit-data");
    if (c.length != 0) {
        var d, e, f, g, h = "/" + GitHub.nameWithOwner + "/commit/", i = "/" + GitHub.nameWithOwner + "/cache/commits/" + GitHub.currentTreeSHA + "?path=" + encodeURIComponent(GitHub.currentPath) + "&commit_sha=" + GitHub.commitSHA;
        $.smartPoller(a || 2e3, function (a) {
            $.ajax({url:i, dataType:"json", error:function (b) {
                b.status == 201 ? a() : c.html('<img src="/images/modules/ajax/error.png"> Something went wrong.')
            }, success:function (a, c, d) {
                debug("success: %s", i);
                for (var e in a) {
                    if ($("#" + e).length == 0)continue;
                    var j = $("#" + e).parents("tr:first");
                    j.find(".age").html('<time class="js-relative-date" datetime="' + $.toISO8601(new Date(a[e].date)) + '">' + a[e].date + "</time>"), f = j.find(".message"), f.html(a[e].message), f.html('<a href="' + h + a[e].commit + '" class="message">' + f.html() + "</a>"), a[e].login ? g = '<a href="/' + a[e].login + '">' + a[e].login + "</a>" : g = a[e].author, f.html(f.html() + " [" + g + "]")
                }
                $(b || document.body).trigger("pageUpdate")
            }})
        })
    }
}, $(document).pageUpdate(function () {
    $("#slider .frame-center #readme").length > 0 ? $("#read_more").show() : $("#read_more").hide()
}), $(function () {
    $("#download_button").click(function () {
        var a = $(this).attr("href");
        $.facebox(function () {
            $.get(a, function (a) {
                $.facebox(a), $("#facebox .footer").hide()
            })
        });
        return!1
    }), $(".pagehead .subnav-bar")[0] && $(".pagehead .subnav-bar a[data-name]").live("mousedown", function () {
        if (GitHub.actionName == "show") {
            var a = $(this).attr("data-name"), b = "/" + GitHub.nameWithOwner + "/" + GitHub.controllerName + "/" + a;
            GitHub.currentPath != "" && (b += "/" + GitHub.currentPath), b != $(this).attr("href") && $(this).attr("href", b)
        }
    }), GitHub.CachedCommitDataPoller(), GitHub.Tree.rewriteSHAsInLinksWithRef()
}), GitHub || (GitHub = {}), GitHub.TreeFinder = function () {
    if ($("#slider").length != 0) {
        var a = this;
        $.hotkeys({t:function () {
            a.show();
            return!1
        }});
        var b = new Image;
        GitHub.assetHost ? b.src = GitHub.assetHost + "/images/modules/ajax/spinner.gif" : b.src = "/images/modules/ajax/spinner.gif"
    }
}, GitHub.TreeFinder.prototype = {fileList:null, recentFiles:[], currentFinder:null, currentInput:null, show:function () {
    if (!this.currentFinder) {
        var a = this, b;
        a.currentFinder = $(".tree-finder").clone().show(), a.currentInput = a.currentFinder.find("input"), slider.slideForwardToLoading(), b = a.currentFinder.find(".breadcrumb").detach().addClass("js-tree-finder-breadcrumb"), $("#slider .breadcrumb:visible").hide().after(b), $("#slider").bind("slid", function () {
            $("#slider .frame-center").is(":not(.tree-finder)") && a.hide()
        }), a.attachBehaviors()
    }
}, hide:function () {
    if (!!this.currentFinder) {
        var a = this;
        a.currentInput.blur(), a.currentFinder.remove(), $(".js-tree-finder-breadcrumb").remove(), a.currentFinder = a.currentInput = null, $("#slider").unbind("slid")
    }
}, attachBehaviors:function () {
    var a = this, b = !0, c = null, d = null;
    a.loadFileList(), $(".js-dismiss-tree-list-help").live("click", function () {
        $.post(this.getAttribute("href")), $(this).closest(".octotip").fadeOut(function () {
            $(".tree-finder .octotip").remove()
        }), a.currentInput.focus();
        return!1
    }), $("tbody.js-results-list tr", a.currentFinder).live("mouseover", function (c) {
        !b || (a.currentFinder && a.currentFinder.find("tr.current").removeClass("current"), $(this).addClass("current"))
    }), a.currentFinder.find(".js-results-list").delegate("a", "click", function () {
        var b = $(this).text(), c = $.inArray(b, a.recentFiles);
        c > -1 && a.recentFiles.splice(c, 1), a.recentFiles.unshift(b), a.currentInput.blur(), $(document).unbind("keydown.treeFinder");
        if (slider.enabled)return!0;
        document.location = $(this).attr("href")
    }), $("tr td.icon", a.currentFinder).live("click", function () {
        $(this).parents("tr:first").find("td a").click()
    }), $(document).bind("keydown.treeFinder", function (a) {
        if (a.keyCode == 27) {
            !slider.sliding && $("#slider .frame-center").is(".tree-finder") && (slider.slideBackTo(location.pathname), $(document).unbind("keydown.treeFinder"));
            return!1
        }
    }), a.currentInput.focus().keyup(
        function () {
            c && clearTimeout(c), c = setTimeout(function () {
                c = null, b = !0
            }, 250)
        }).keydown(function (c) {
        function g(a) {
            if (e.length == 0)return!1;
            f = a == "up" ? e.prev("tr") : e.next("tr");
            if (f.length) {
                b = !1, e.removeClass("current"), f.addClass("current");
                var c = 100, d = $(window), g = d.height(), h = f.offset().top - c, i = f.offset().top + f.outerHeight() + c;
                h < d.scrollTop() ? d.scrollTop() > c && d.scrollTop(h) : i > d.scrollTop() + g && d.scrollTop(i - g)
            }
            return!1
        }

        var e = a.currentFinder.find("tr.current"), f = null;
        switch (c.which) {
            case 9:
            case 16:
            case 17:
            case 18:
            case 91:
            case 93:
                return!1;
            case 78:
                if (c.ctrlKey)return g("down");
                return;
            case 80:
                if (c.ctrlKey)return g("up");
                return;
            case 38:
                return g("up");
            case 40:
                return g("down");
            case 13:
                if (e.length == 0)return!1;
                e.find("a").click();
                return!1
        }
        d && clearTimeout(d), d = setTimeout(function () {
            d = null, a.updateResults()
        }, 100)
    })
}, loadFileList:function () {
    var a = this, b = function () {
        a.loadedFileList()
    };
    a.fileList ? b() : $.ajax({url:"/" + GitHub.nameWithOwner + "/tree-list/" + GitHub.commitSHA, error:function (c) {
        a.currentFinder && (a.fileList = [], a.currentFinder.find(".js-no-results th").text("Something went wrong"), b())
    }, success:function (c, d, e) {
        c ? a.fileList = $.trim(c).split("\n") : a.fileList = [], b()
    }})
}, loadedFileList:function () {
    var a = this;
    !a.currentFinder || ($("#slider .frame-center").replaceWith(a.currentFinder), a.updateResults())
}, updateResults:function () {
    var a = this;
    if (a.currentFinder && a.fileList) {
        var b = a.currentInput.val(), c = [], d = a.currentFinder.find(".js-results-list"), e = "", f = 0;
        b ? c = a.findMatchingFiles(b) : a.recentFiles.length ? (c = a.recentFiles.slice(1, 6), c.length < 20 && (c = c.concat(a.fileList.slice(0, 20 - c.length)))) : c = a.fileList;
        if (c.length <= 0)d[0].innerHTML = "", a.currentFinder.find(".js-no-results").show(), a.currentFinder.find(".js-header").hide(); else {
            a.currentFinder.find(".js-no-results").hide(), a.currentFinder.find(".js-header").show(), c = c.slice(0, 50);
            var g, h = this.regexpForQuery(b), i = function (a, b) {
                return b % 2 == 1 ? "<b>" + a + "</b>" : a
            };
            for (f = 0; f < c.length; f++)g = (c[f].match(h) || []).slice(1).map(i).join(""), e += '<tr><td class="icon"><img src="/images/icons/txt.png"></td><td><a class="js-slide-to" href="/' + GitHub.nameWithOwner + "/blob/" + (GitHub.currentRef || GitHub.commitSHA) + "/" + c[f] + '">' + g + "</a></td></tr>";
            d[0].innerHTML = e, d.find("tr:first").addClass("current")
        }
    }
}, findMatchingFiles:function (a) {
    if (!a)return[];
    var b = this, c = [], d = 0, e, f, g, h;
    a = a.toLowerCase(), e = this.regexpForQuery(a);
    for (d = 0; d < b.fileList.length; d++) {
        f = b.fileList[d], g = f.toLowerCase();
        if (f.match(/^vendor\/(cache|rails|gems)/))continue;
        if (f.match(/(dot_git|\.git\/)/))continue;
        if (f.match(/MathJax/))continue;
        g.match(e) && (h = g.score(a), h > 0 && (a.match("/") || (g.match("/") ? h += g.replace(/^.*\//, "").score(a) : h *= 2), c.push([h, f])))
    }
    return $.map(c.sort(function (a, b) {
        return b[0] - a[0]
    }), function (a) {
        return a[1]
    })
}, regexpForQuery:function (a) {
    var b = "+.*?[]{}()^$|\\".replace(/(.)/g, "\\$1"), c = new RegExp("\\(([" + b + "])\\)", "g");
    return new RegExp("(.*)" + a.toLowerCase().replace(/(.)/g, "($1)(.*?)").replace(c, "(\\$1)") + "$", "i")
}}, $(function () {
    window.treeFinder = new GitHub.TreeFinder
}), GitHub || (GitHub = {}), GitHub.TreeSlider = function () {
    if (!!window.history && !!window.history.pushState) {
        if ($("#slider").length == 0)return;
        if (navigator.userAgent.match(/(iPod|iPhone|iPad)/))return;
        var a = this;
        a.enabled = !0, $("#slider a.js-slide-to, .breadcrumb a").live("click", function (b) {
            return a.clickHandler(b)
        }), $(window).bind("popstate", function (b) {
            a.popStateHandler(b.originalEvent)
        })
    }
}, GitHub.TreeSlider.prototype = {enabled:!1, sliding:!1, slideSpeed:400, frameForPath:function (a) {
    return $('.frame[data-path="' + a + '"]')
}, frameForURL:function (a) {
    return this.frameForPath(this.pathFromURL(a))
}, pathFromURL:function (a) {
    var b = new RegExp("/(tree|blob)/[^/]+/"), c = a.split(b)[2] || "/";
    c.slice(c.length - 1, c.length) != "/" && (c = c + "/");
    return unescape(c)
}, scrollToBreadcrumb:function () {
    this.visibleInBrowser(".breadcrumb:visible") || $(".breadcrumb:visible").scrollTo(50)
}, visibleInBrowser:function (a) {
    var b = $(window).scrollTop(), c = b + $(window).height(), d = $(a).offset().top, e = d + $(a).height();
    return e >= b && d <= c
}, clickHandler:function (a) {
    if (a.which == 2 || a.metaKey || a.ctrlKey)return!0;
    if (this.sliding)return!1;
    var b = a.target.href, c = this.pathFromURL(b);
    window.history.pushState({path:c}, "", b), typeof _gaq != "undefined" && _gaq.push(["_trackPageview"]), this.slideTo(b);
    return!1
}, popStateHandler:function (a) {
    this.slideTo(location.pathname)
}, doneSliding:function () {
    $("#slider").trigger("pageUpdate");
    if (!!this.sliding) {
        this.sliding = !1, $("#slider .frame-center").nextAll(".frame").hide(), $("#slider .frame-center").prevAll(".frame").css("visibility", "hidden");
        var a = $(".frame-loading:visible");
        a.length ? a.removeClass("frame-loading") : $("#slider").trigger("slid")
    }
}, slideTo:function (a) {
    var b = this.pathFromURL(a), c = this.frameForPath(b), d = $("#slider .frame-center").attr("data-path") || "";
    c.is(".frame-center") || (d == "/" || b.split("/").length > d.split("/").length ? this.slideForwardTo(a) : this.slideBackTo(a))
}, slideForwardTo:function (a) {
    debug("Sliding forward to %s", a);
    var b = this.frameForURL(a);
    if (b.length)this.slideForwardToFrame(b); else {
        var c = this.slideForwardToLoading();
        this.loadFrame(a, function (a) {
            c.replaceWith($(a).find(".frame-center"))
        })
    }
}, slideForwardToFrame:function (a) {
    if (!this.sliding) {
        this.sliding = !0;
        var b = this;
        $("#slider .frame-center").after(a.css("marginLeft", 0)).addClass("frame").removeClass("frame-center").animate({marginLeft:"-1200px"}, this.slideSpeed, function () {
            b.doneSliding()
        }), this.makeCenterFrame(a), this.setFrameTitle(a), this.setFrameCanonicalURL(a)
    }
}, slideForwardToLoading:function () {
    var a = $(".frame-loading").clone();
    a.find("img").hide(), setTimeout(function () {
        a.find("img").show()
    }, 500), $(".frames").append(a), this.slideForwardToFrame(a);
    return a
}, slideBackTo:function (a) {
    debug("Sliding back to %s", a);
    var b = this.frameForURL(a);
    if (b.length)this.slideBackToFrame(b); else {
        var c = this.slideBackToLoading(), d = this.pathFromURL(a);
        this.loadFrame(a, function (a) {
            c.removeClass("frame-loading").empty().append($(a).find(".frame-center").contents()).attr("data-path", d)
        })
    }
}, slideBackToFrame:function (a) {
    if (!this.sliding) {
        this.sliding = !0, $("#slider .frame-center").before(a.css("marginLeft", "-1200px")).addClass("frame").removeClass("frame-center");
        var b = this;
        a.animate({marginLeft:"0"}, this.slideSpeed, function () {
            b.doneSliding()
        }), this.makeCenterFrame(a), this.setFrameTitle(a), this.setFrameCanonicalURL(a)
    }
}, slideBackToLoading:function () {
    var a = $(".frame-loading").clone();
    a.find("img").hide(), setTimeout(function () {
        a.find("img").show()
    }, 350), $(".frames").prepend(a.show()), slider.slideBackToFrame(a);
    return a
}, makeCenterFrame:function (a) {
    a.css("visibility", "visible").show().addClass("frame-center"), this.scrollToBreadcrumb();
    var b = $('.breadcrumb[data-path="' + a.attr("data-path") + '"]');
    b.length > 0 && ($(".breadcrumb:visible").hide(), b.show());
    var c = $('.announce[data-path="' + a.attr("data-path") + '"]');
    $(".announce").fadeOut(), c.length > 0 && c.fadeIn();
    var d = $(".js-ufo[data-path=" + a.attr("data-path") + "]");
    $(".js-ufo").fadeOut(), d.length > 0 && d.fadeIn(), GitHub.currentPath = this.pathFromURL(location.pathname).replace(/\/$/, "")
}, setFrameTitle:function (a) {
    var b = a.attr("data-path");
    if (!!b && b.length != 0) {
        var c = unescape(unescape(GitHub.currentRef)), b = unescape(b.slice(0, b.length - 1));
        b.length > 0 ? document.title = b + " at " + c + " from " + GitHub.nameWithOwner + " - GitHub" : document.title = GitHub.nameWithOwner + " at " + c + " - GitHub"
    }
}, setFrameCanonicalURL:function (a) {
    var b = a.attr("data-canonical-url");
    b && $("link[rel=canonical]").attr("href", b)
}, loadFrame:function (a, b) {
    debug("Loading " + a + "?slide=1");
    var c = this;
    $.ajax({url:a + "?slide=1", cache:!1, success:function (d) {
        b.call(this, d), $("#slider").trigger("slid"), $("#slider .breadcrumb").hide().last().after($(d).find(".breadcrumb"));
        var e = c.frameForURL(a);
        e.trigger("pageUpdate"), GitHub.Tree.rewriteSHAsInLinksWithRef(), GitHub.CachedCommitDataPoller(50, e), GitHub.Blob.show(), c.setFrameTitle(e), c.setFrameCanonicalURL(e)
    }, error:function () {
        $("#slider .frame-center").html("<h3>Something went wrong.</h3>")
    }, complete:function () {
        c.sliding = !1
    }})
}}, $(function () {
    window.slider = new GitHub.TreeSlider
}), $.fn.ufo = function () {
    if (this.length) {
        var a = this.find("canvas").get(0), b = JSON.parse(this.find("div").text());
        GitHub.UFO.drawFont(a, b)
    }
    return this
}, GitHub.UFO = {drawFont:function (a, b) {
    var c = a.getContext("2d");
    for (var d = 0; d < b.length; d++) {
        c.save();
        var e = d % 9 * 100, f = Math.floor(d / 9) * 100;
        c.translate(e + 10, f + 80), c.scale(.1, -0.1);
        var g = new GitHub.UFO.Glif(c, b[d]);
        g.draw(), c.restore()
    }
}}, GitHub.UFO.Glif = function (a, b) {
    this.ctx = a, this.contours = b
}, GitHub.UFO.Glif.prototype = {draw:function () {
    this.ctx.beginPath();
    for (var a = 0; a < this.contours.length; a++)this.drawContour(this.contours[a]);
    this.ctx.fillStyle = "black", this.ctx.fill()
}, drawContour:function (a) {
    for (var b = 0; b < a.length; b++)b == 0 ? this.moveVertex(a[b]) : this.drawVertex(a[b]);
    this.drawVertex(a[0])
}, moveVertex:function (a) {
    this.ctx.moveTo(a[0], a[1])
}, drawVertex:function (a) {
    a.length == 2 ? this.ctx.lineTo(a[0], a[1]) : a.length == 4 ? this.ctx.quadraticCurveTo(a[2], a[3], a[0], a[1]) : a.length == 6 && this.ctx.bezierCurveTo(a[2], a[3], a[4], a[5], a[0], a[1])
}}, $(document).ready(function () {
    $(".glif_diff").each(function (el) {
        var sha = $(this).attr("rel"), ctx = this.getContext("2d"), data = eval("glif_" + sha), glif = new GitHub.UFO.Glif(ctx, data);
        ctx.translate(0, 240), ctx.scale(.333, -0.333), glif.draw()
    })
}), $(document).pageUpdate(function () {
    $(this).find(".js-ufo").ufo()
}), $(function () {
    $("a.follow").click(function () {
        $.post(this.href, {}), $(this).parent().find(".follow").toggle();
        return!1
    }), $(".js-repo-filter").repoList(), $("#inline_visible_repos").click(function () {
        var a = $(this).spin(), b = window.location + "/ajax_public_repos";
        $(".projects").load(b, function () {
            a.stopSpin(), $(".repositories").trigger("pageUpdate")
        }), a.hide();
        return!1
    }), GitHub.editableGenerator && $("#dashboard span.edit").each(GitHub.editableGenerator({width:"200px", submittype:"put"})), $("#edit_user .info .rename").click(function () {
        $("#edit_user .username").toggle(), $("#user_rename").toggle();
        return!1
    }), $("#user_rename > input[type=submit]").click(function () {
        if (!confirm(GitHub.rename_confirmation()))return!1
    }), $("#reveal_cancel_info").click(function () {
        $(this).toggle(), $("#cancel_info").toggle();
        return!1
    }), $("#cancel_plan").submit(function () {
        var a = "Are you POSITIVE you want to delete this account? There is absolutely NO going back. All repositories, comments, wiki pages - everything will be gone. Please consider downgrading the account's plan.";
        return confirm(a)
    }), window.location.href.match(/account\/upgrade$/) && $("#change_plan_toggle").click(), $(".userpage .actions").contextButton(".btn-user-context", {contextPaneSelector:".user-context", anchorTo:"right"})
}), $(function () {
    function b() {
        var c = $("#current-version").val();
        c && $.get("_current", function (d) {
            c == d ? setTimeout(b, 5e3) : a || ($("#gollum-error-message").text("Someone has edited the wiki since you started. Please reload this page and re-apply your changes."), $("#gollum-error-message").show(), $("#gollum-editor-submit").attr("disabled", "disabled"), $("#gollum-editor-submit").attr("value", "Cannot Save, Someone Else Has Edited"))
        })
    }

    $("#see-more-elsewhere").click(function () {
        $(".seen-elsewhere").show(), $(this).remove();
        return!1
    });
    var a = !1;
    $("#gollum-editor-body").each(b), $("#gollum-editor-submit").click(function () {
        a = !0
    });
    var c = [];
    $("form#history input[type=submit]").attr("disabled", !0), $("form#history input[type=checkbox]").change(function () {
        var a = $(this).val(), b = $.inArray(a, c);
        if (b > -1)c.splice(b, 1); else {
            c.push(a);
            if (c.length > 2) {
                var d = c.shift();
                $("input[value=" + d + "]").attr("checked", !1)
            }
        }
        $("form#history tr.commit").removeClass("selected"), $("form#history input[type=submit]").attr("disabled", !0);
        if (c.length == 2) {
            $("form#history input[type=submit]").attr("disabled", !1);
            var e = !1;
            $("form#history tr.commit").each(function () {
                e && $(this).addClass("selected"), $(this).find("input:checked").length > 0 && (e = !e), e && $(this).addClass("selected")
            })
        }
    })
})