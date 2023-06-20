Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C8CEB64D7
	for <ath11k@archiver.kernel.org>; Tue, 20 Jun 2023 13:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Bu74PA5pu28LsPmcLPBcxKwv/4v8t1UGjJ0eTmBssE=; b=GZms6bmuz20ikg
	vYABh/RLf6ToUdaA1UIkzdWmuxxGhAVAfG5M4xI53PQZLo7aSvsrtngwjw3cI+gx+pbHwjgnx5ZwG
	qDb9ygHOvkAOEFk0ApgDHZ9cKNU2imK8ZPqWixYfA5OI6YC5uIIFG6z2ha7uO15OhmuKYm4UCdrbs
	fhWpH1tZjgNQrqv9SCD+U+GyatdcUi5iXZx/Ld/IrPUeds1kwTKK9SSPP9FdcLwKk6VdZdfBP7yXK
	yXRPfQzZjC/rqqO8eavSYfi8ow2/KF7229trqy+ksy9MuxmIDJ040xuCqUXURaZLB60ARz/3KGGdV
	uOCAX7VK5NQtJLw8YAvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBbhw-00BReJ-2L;
	Tue, 20 Jun 2023 13:47:44 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBbhu-00BRdE-0B
	for ath11k@lists.infradead.org;
	Tue, 20 Jun 2023 13:47:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687268862; x=1718804862;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l2FIHwo3Np9c91fb920QrJylVVkhLopg5AeL+jtiI/E=;
  b=Z+JYiaomBSg8T3dykIlK1GOacknYKZNOH0u8DUly7uzrB3jyYmGMuEOG
   2O5LZNSUk78Y2eAIBQOwkA2Y31HC9Aid49hXwDYvojq/vttrOBAOiXcv2
   m8Mr9QlrBvHzttvzz3LNX/6+hBI5SJsItq6X8PGHUskf3xGqsuXIeBDQi
   Oi4kQCo6yJkpfEgsbzkZrMt7g8CQQ0x58pKX758OwWuFyJ19+2jsW5qPI
   EmieYHzmllRUNZXJAg6c4ADXYkAoBr/XdewK6yC2rz6Tws3kgV3EJ7nGV
   LES2LJIJ6EzfvQz6wsptWT9G9tqNn8EbV0Ij5BIuNeMglOjghdnMy88dn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="362401564"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="362401564"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 06:47:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="827006948"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="827006948"
Received: from eshaanan-mobl.ger.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.61.137])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 06:47:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Carl Huang <cjhuang@codeaurora.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dean Luick <dean.luick@cornelisnetworks.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 08/10] wifi: ath11k: Use RMW accessors for changing LNKCTL
Date: Tue, 20 Jun 2023 16:46:22 +0300
Message-Id: <20230620134624.99688-9-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230620134624.99688-1-ilpo.jarvinen@linux.intel.com>
References: <20230620134624.99688-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_064742_156328_ECB5053E 
X-CRM114-Status: GOOD (  11.87  )
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

RG9uJ3QgYXNzdW1lIHRoYXQgb25seSB0aGUgZHJpdmVyIHdvdWxkIGJlIGFjY2Vzc2luZyBMTktD
VEwuIEFTUE0KcG9saWN5IGNoYW5nZXMgY2FuIHRyaWdnZXIgd3JpdGUgdG8gTE5LQ1RMIG91dHNp
ZGUgb2YgZHJpdmVyJ3MgY29udHJvbC4KClVzZSBSTVcgY2FwYWJpbGl0eSBhY2Nlc3NvcnMgd2hp
Y2ggZG8gcHJvcGVyIGxvY2tpbmcgdG8gYXZvaWQgbG9zaW5nCmNvbmN1cnJlbnQgdXBkYXRlcyB0
byB0aGUgcmVnaXN0ZXIgdmFsdWUuIE9uIHJlc3RvcmUsIGNsZWFyIHRoZSBBU1BNQwpmaWVsZCBw
cm9wZXJseS4KCkZpeGVzOiBlOTYwM2Y0YmRjYzAgKCJhdGgxMWs6IHBjaTogZGlzYWJsZSBBU1BN
IEwwc0xzIGJlZm9yZSBkb3dubG9hZGluZyBmaXJtd2FyZSIpClN1Z2dlc3RlZC1ieTogTHVrYXMg
V3VubmVyIDxsdWthc0B3dW5uZXIuZGU+ClNpZ25lZC1vZmYtYnk6IElscG8gSsOkcnZpbmVuIDxp
bHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNvbT4KQWNrZWQtYnk6IEthbGxlIFZhbG8gPGt2YWxv
QGtlcm5lbC5vcmc+CkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDExay9wY2kuYyB8IDEwICsrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDExay9wY2kuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9h
dGgxMWsvcGNpLmMKaW5kZXggN2IzMzczMWE1MGVlLi42YmE0Y2VmNmIxYzcgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvcGNpLmMKKysrIGIvZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDExay9wY2kuYwpAQCAtNTgxLDggKzU4MSw4IEBAIHN0YXRpYyB2b2lk
IGF0aDExa19wY2lfYXNwbV9kaXNhYmxlKHN0cnVjdCBhdGgxMWtfcGNpICphYl9wY2kpCiAJCSAg
IHUxNl9nZXRfYml0cyhhYl9wY2ktPmxpbmtfY3RsLCBQQ0lfRVhQX0xOS0NUTF9BU1BNX0wxKSk7
CiAKIAkvKiBkaXNhYmxlIEwwcyBhbmQgTDEgKi8KLQlwY2llX2NhcGFiaWxpdHlfd3JpdGVfd29y
ZChhYl9wY2ktPnBkZXYsIFBDSV9FWFBfTE5LQ1RMLAotCQkJCSAgIGFiX3BjaS0+bGlua19jdGwg
JiB+UENJX0VYUF9MTktDVExfQVNQTUMpOworCXBjaWVfY2FwYWJpbGl0eV9jbGVhcl93b3JkKGFi
X3BjaS0+cGRldiwgUENJX0VYUF9MTktDVEwsCisJCQkJICAgUENJX0VYUF9MTktDVExfQVNQTUMp
OwogCiAJc2V0X2JpdChBVEgxMUtfUENJX0FTUE1fUkVTVE9SRSwgJmFiX3BjaS0+ZmxhZ3MpOwog
fQpAQCAtNTkwLDggKzU5MCwxMCBAQCBzdGF0aWMgdm9pZCBhdGgxMWtfcGNpX2FzcG1fZGlzYWJs
ZShzdHJ1Y3QgYXRoMTFrX3BjaSAqYWJfcGNpKQogc3RhdGljIHZvaWQgYXRoMTFrX3BjaV9hc3Bt
X3Jlc3RvcmUoc3RydWN0IGF0aDExa19wY2kgKmFiX3BjaSkKIHsKIAlpZiAodGVzdF9hbmRfY2xl
YXJfYml0KEFUSDExS19QQ0lfQVNQTV9SRVNUT1JFLCAmYWJfcGNpLT5mbGFncykpCi0JCXBjaWVf
Y2FwYWJpbGl0eV93cml0ZV93b3JkKGFiX3BjaS0+cGRldiwgUENJX0VYUF9MTktDVEwsCi0JCQkJ
CSAgIGFiX3BjaS0+bGlua19jdGwpOworCQlwY2llX2NhcGFiaWxpdHlfY2xlYXJfYW5kX3NldF93
b3JkKGFiX3BjaS0+cGRldiwgUENJX0VYUF9MTktDVEwsCisJCQkJCQkgICBQQ0lfRVhQX0xOS0NU
TF9BU1BNQywKKwkJCQkJCSAgIGFiX3BjaS0+bGlua19jdGwgJgorCQkJCQkJICAgUENJX0VYUF9M
TktDVExfQVNQTUMpOwogfQogCiBzdGF0aWMgaW50IGF0aDExa19wY2lfcG93ZXJfdXAoc3RydWN0
IGF0aDExa19iYXNlICphYikKLS0gCjIuMzAuMgoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0
aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vYXRoMTFrCg==
