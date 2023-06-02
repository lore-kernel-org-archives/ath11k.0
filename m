Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA46C7EE2F
	for <ath11k@archiver.kernel.org>; Fri,  2 Jun 2023 11:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b78X19/nAH/rOvNVxxWCCfQVOkFgBQnQ/OosHZ0wIAQ=; b=S/WBVMkW+WCfTG
	8VfqSzQyR31cjRHIQqPavFUHdY1454onERRbyhSE1Jps2A2+J6Bk8ULu+pxP7Tq/QUaByfRjx6Dnp
	lS4sB1soUzVq65aBblfXRKg54AyvuJ4/74ymQrElXt8kGoToQd6OrS7R8o6JWliwUfyjscAasBUBs
	13D39vIS2o9ROSB5Xq3INAPNJ7dt6/QsPhuoD5LgDlzHYfvj6Gs25Ib4c6TeSl1EFZhrtbUuI+5Pn
	+KTvJzL8PXwZWRjqYBXWLm4Lk/MgVs5BP3IUHQM9pUQi9YiD9DaTrQ7lWfsz7Vsg8ogwLWivSjAlm
	ks9ZSMLhRCTwjwxgS1zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q53HG-006njX-2N;
	Fri, 02 Jun 2023 11:49:06 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q53HE-006ng4-02
	for ath11k@lists.infradead.org;
	Fri, 02 Jun 2023 11:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685706544; x=1717242544;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=56pRsAda1UvobTeyQtWYC5Q58IjfGAVi8hUctvKnaUY=;
  b=T1cv+Z/zHrf79NmnMy91IpOzSa2RFpqU8QjBvpk1brKJpRMrB+geFq1L
   eAMgrC7/7fMaeXKoIIzVrIbjFIQzKf63730iBAqdCD4L+VYIO9yKUND1q
   rXZSVIlnq5Z8oZ6kWZrKi/NItJl98XJkVOFiAoWFg4I+b7/tXB1fk3XQF
   Tg3DzZHDi5VhFnn6e4rop4oshnylG/DeP5GgCD1ENLbQCYQY4oWeJexA5
   4ufbAb6ymAcUB/UTLDfyELpy69jJI74CUKJFIauFwGW89JfpLoOzdcyHI
   PauzCkbwbYKfyrtke+S6nypQOF2lD9mrepKtpk8HoX3Lk5dgvDoAUTolc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358279765"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="358279765"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 04:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707819534"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="707819534"
Received: from rspatil-mobl3.gar.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.251.208.112])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 04:48:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [RFC PATCH v1 10/13] wifi: ath11k: Use pci_disable/enable_link_state()
Date: Fri,  2 Jun 2023 14:47:47 +0300
Message-Id: <20230602114751.19671-11-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230602114751.19671-1-ilpo.jarvinen@linux.intel.com>
References: <20230602114751.19671-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_044904_095521_8684EA8F 
X-CRM114-Status: GOOD (  11.37  )
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

YXRoMTFrIGRyaXZlciBhZGp1c3RzIEFTUE0gc3RhdGUgaXRzZWxmIHdoaWNoIGxlYXZlcyBBU1BN
IHNlcnZpY2UKZHJpdmVyIGluIFBDSSBjb3JlIHVuYXdhcmUgb2YgdGhlIGxpbmsgc3RhdGUgY2hh
bmdlcyB0aGUgZHJpdmVyCmltcGxlbWVudGVkLgoKQ2FsbCBwY2lfZGlzYWJsZV9saW5rX3N0YXRl
KCkgYW5kIHBjaV9lbmFibGVfbGlua19zdGF0ZSgpIGluc3RlYWQgb2YKYWRqdXN0aW5nIEFTUE1D
IGZpZWxkIGluIExOS0NUTCBkaXJlY3RseSBpbiB0aGUgZHJpdmVyIGFuZCBsZXQgUENJIGNvcmUK
aGFuZGxlIHRoZSBBU1BNIHN0YXRlIG1hbmFnZW1lbnQuCgpTaWduZWQtb2ZmLWJ5OiBJbHBvIErD
pHJ2aW5lbiA8aWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDExay9wY2kuYyB8IDEwICsrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDExay9wY2kuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9h
dGgxMWsvcGNpLmMKaW5kZXggNmJhNGNlZjZiMWM3Li5hOWVhYzUxNjU4ZjYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvcGNpLmMKKysrIGIvZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDExay9wY2kuYwpAQCAtNTgxLDE5ICs1ODEsMTUgQEAgc3RhdGljIHZv
aWQgYXRoMTFrX3BjaV9hc3BtX2Rpc2FibGUoc3RydWN0IGF0aDExa19wY2kgKmFiX3BjaSkKIAkJ
ICAgdTE2X2dldF9iaXRzKGFiX3BjaS0+bGlua19jdGwsIFBDSV9FWFBfTE5LQ1RMX0FTUE1fTDEp
KTsKIAogCS8qIGRpc2FibGUgTDBzIGFuZCBMMSAqLwotCXBjaWVfY2FwYWJpbGl0eV9jbGVhcl93
b3JkKGFiX3BjaS0+cGRldiwgUENJX0VYUF9MTktDVEwsCi0JCQkJICAgUENJX0VYUF9MTktDVExf
QVNQTUMpOwotCisJcGNpX2Rpc2FibGVfbGlua19zdGF0ZShhYl9wY2ktPnBkZXYsIFBDSUVfTElO
S19TVEFURV9MMFMgfCBQQ0lFX0xJTktfU1RBVEVfTDEpOwogCXNldF9iaXQoQVRIMTFLX1BDSV9B
U1BNX1JFU1RPUkUsICZhYl9wY2ktPmZsYWdzKTsKIH0KIAogc3RhdGljIHZvaWQgYXRoMTFrX3Bj
aV9hc3BtX3Jlc3RvcmUoc3RydWN0IGF0aDExa19wY2kgKmFiX3BjaSkKIHsKIAlpZiAodGVzdF9h
bmRfY2xlYXJfYml0KEFUSDExS19QQ0lfQVNQTV9SRVNUT1JFLCAmYWJfcGNpLT5mbGFncykpCi0J
CXBjaWVfY2FwYWJpbGl0eV9jbGVhcl9hbmRfc2V0X3dvcmQoYWJfcGNpLT5wZGV2LCBQQ0lfRVhQ
X0xOS0NUTCwKLQkJCQkJCSAgIFBDSV9FWFBfTE5LQ1RMX0FTUE1DLAotCQkJCQkJICAgYWJfcGNp
LT5saW5rX2N0bCAmCi0JCQkJCQkgICBQQ0lfRVhQX0xOS0NUTF9BU1BNQyk7CisJCXBjaV9lbmFi
bGVfbGlua19zdGF0ZShhYl9wY2ktPnBkZXYsIGFiX3BjaS0+bGlua19jdGwgJgorCQkJCSAgICAg
IChQQ0lFX0xJTktfU1RBVEVfTDBTIHwgUENJRV9MSU5LX1NUQVRFX0wxKSk7CiB9CiAKIHN0YXRp
YyBpbnQgYXRoMTFrX3BjaV9wb3dlcl91cChzdHJ1Y3QgYXRoMTFrX2Jhc2UgKmFiKQotLSAKMi4z
MC4yCgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
