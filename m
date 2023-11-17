Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF11BC072A2
	for <ath11k@archiver.kernel.org>; Fri, 17 Nov 2023 09:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L0Vq1p/4bnOJYHf7+hj6eNirULQKXXGCMEWojFiirNI=; b=IH6xzp8/TtC0kl
	jyxnT78N+Sf7Qq/xR8pQEn4U5vBYnkCKDYxP75MKgpyBk8vPo7efHcQ/8c46rWyRMk6V7ikKXIVDz
	KcDlk8mM5XuPpAtr/Rs6GDyjgiBMoa7RBtT33pqdLoqcmhbhuxiSPte+11PIKCDJ05ofxpqCM67P1
	gwYu9pxxxD3QpDT2qYlrQ09XuJla+NpSYXxp7Xuwi/cBtQZKd7LW4K1yWyyAbFqc3CHtt8OJSXcAX
	9A+Z4uv26ZHHrA7xGGPlTqb3repVBTw+JaBUJXikKHO+gIyHCj2XAMEkXxJ/isHlldJS19c0CZXlf
	cZQxhTtsr06d4Z4cRcYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vCZ-0065La-2J;
	Fri, 17 Nov 2023 09:31:51 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vCW-0065Jv-2y
	for ath11k@lists.infradead.org;
	Fri, 17 Nov 2023 09:31:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3vBy-0002W0-M9; Fri, 17 Nov 2023 10:31:14 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3vBv-009e8J-Bm; Fri, 17 Nov 2023 10:31:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r3vBv-002yjW-1I; Fri, 17 Nov 2023 10:31:11 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	kernel@pengutronix.de,
	Jiri Slaby <jirislaby@kernel.org>,
	Nick Kossifidis <mickflemm@gmail.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	=?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	Loic Poulain <loic.poulain@linaro.org>,
	wcn36xx@lists.infradead.org,
	Arend van Spriel <aspriel@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jisoo Jang <jisoo.jang@yonsei.ac.kr>,
	brcm80211-dev-list.pdl@broadcom.com,
	SHA-cyfmac-dev-list@infineon.com,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Wang Yufen <wangyufen@huawei.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH wifi-next 0/6] wifi: Convert to platform remove callback returning void
Date: Fri, 17 Nov 2023 10:30:57 +0100
Message-ID: <20231117093056.873834-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=F9Oxsx0QIJmkT38mUHzi9AwJy4rp6SebAFM9G77g8Jw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlVzLRhZMpN9DscQc/Acv1vmk3igI2Pvvo9Tzoe 5Cxm2rYGeWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZVcy0QAKCRCPgPtYfRL+ TkkIB/9uaICn2CG/t+EHavYz+BD1rZTP1jDpIOy2VAQCFDCmPISU+qpaURWrMPloUJigTbMxhsy a8mKyOTQ1bpLexlOJwAf7P38lZYzZQnIc5jyBa3tI1YQXbMAeBzFP1SahXKBenwwYgEGyA+LryF zS7i6Npvf74UQox7GVqjcYQv1p5mQkb20j/2BHEhMZHNhrOM4VwNqMtmQkAggBrFG5lyXKpQs06 Yq13B4hO1mkEHFrzPrfZRzsYuxdlnYJrSQ0APgQuhbYPgcHKzLwEcPV0wH8CxVgJeLKMY+zq80c 5PvZhGx4TCKCmUY2Jkhdep9dzBu/zH23irbSifSzvsTBm9A+
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_013148_956884_699748C2 
X-CRM114-Status: UNSURE (   6.79  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgp0aGlzIHNlcmllcyBjb252ZXJ0cyB0aGUgcGxhdGZvcm0gZHJpdmVycyBiZWxvdyBk
cml2ZXJzL25ldC93aXJlbGVzcyB0bwptYWtlIHVzZSBvZiAucmVtb3ZlX25ldygpLgoKU2VlIGNv
bW1pdCA1YzVhNzY4MGU2N2IgKCJwbGF0Zm9ybTogUHJvdmlkZSBhIHJlbW92ZSBjYWxsYmFjayB0
aGF0CnJldHVybnMgbm8gdmFsdWUiKSBmb3IgYW4gZXh0ZW5kZWQgZXhwbGFuYXRpb24gYW5kIHRo
ZSBldmVudHVhbCBnb2FsLgpUaGUgVEw7RFI7IGlzIHRvIG1ha2UgaXQgaGFyZGVyIGZvciBkcml2
ZXIgYXV0aG9ycyB0byBsZWFrIHJlc291cmNlcwp3aXRob3V0IG5vdGljaW5nLgoKQmVzdCByZWdh
cmRzClV3ZQoKVXdlIEtsZWluZS1Lw7ZuaWcgKDYpOgogIHdpZmk6IGF0aDExazogQ29udmVydCB0
byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICB3aWZpOiBhdGg1azog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICB3aWZp
OiBhdGg5azogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZv
aWQKICB3aWZpOiB3Y24zNnh4OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayBy
ZXR1cm5pbmcgdm9pZAogIHdpZmk6IGJyY21mbWFjOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92
ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIHdpZmk6IG10NzY6IENvbnZlcnQgdG8gcGxhdGZv
cm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCgogZHJpdmVycy9uZXQvd2lyZWxlc3Mv
YXRoL2F0aDExay9haGIuYyAgICAgICAgICAgICAgICAgICAgIHwgNiArKy0tLS0KIGRyaXZlcnMv
bmV0L3dpcmVsZXNzL2F0aC9hdGg1ay9haGIuYyAgICAgICAgICAgICAgICAgICAgICB8IDggKysr
LS0tLS0KIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGg5ay9haGIuYyAgICAgICAgICAgICAg
ICAgICAgICB8IDYgKystLS0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvd2NuMzZ4eC9tYWlu
LmMgICAgICAgICAgICAgICAgICAgfCA2ICsrLS0tLQogZHJpdmVycy9uZXQvd2lyZWxlc3MvYnJv
YWRjb20vYnJjbTgwMjExL2JyY21mbWFjL2NvbW1vbi5jIHwgNiArKy0tLS0KIGRyaXZlcnMvbmV0
L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3NjAzL3NvYy5jICAgICAgICAgICB8IDcgKystLS0t
LQogZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc2MTUvc29jLmMgICAgICAg
ICAgIHwgNiArKy0tLS0KIGRyaXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3OTE1
L3NvYy5jICAgICAgICAgICB8IDYgKystLS0tCiA4IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlv
bnMoKyksIDM0IGRlbGV0aW9ucygtKQoKYmFzZS1jb21taXQ6IGVmZjk5ZDhlZGJlZDc5MTgzMTcz
MzFlYmQxZTM2NWQ4ZTk1NWQ2NWUKLS0gCjIuNDIuMAoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0
CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
