Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75487C77B75
	for <ath11k@archiver.kernel.org>; Wed, 17 May 2023 10:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sFlMHNTf1odQYFz/6/1SrsBtv34BqBwa7Wu7MXtuTwY=; b=XwTxRuIoKjDs67
	/pT4OrqIYE0QdtkJrIlSjgvty+vhJlDwakcfvN+UN5PSpulQworJbZ06UEKjnuVfXtJ0bJ/gSl8Ll
	uwPEyB5nkwF1hNRLLfyknKukhP3CWK2DrsB2trrr8VhzJRMLR+OvZlLNNLMo+o9jWMHeAbt1ofG7L
	e5l/g64lMqbVEkanElPICnNtoERK6f9AcSiAiw1tCFsYJt7SYh68tuMYnnrDfAE3Z7Cke21uTLiFm
	n1JouO2wap2YB+KWg/YaewMPNJScNu8vboUxs0rfWiMqsK1ldcCdhYAmj0J93SUwQ1/GZqNoE7bNO
	3uVPjRDk89D6zKxeRjNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEmy-009UsU-2B;
	Wed, 17 May 2023 10:53:48 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzEmv-009UrI-37
	for ath11k@lists.infradead.org;
	Wed, 17 May 2023 10:53:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684320825; x=1715856825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GAwPOA0tQmE3vBPrO0FLOM6LBo5LJsgKdd/0NNFNf9o=;
  b=oLCYhn4UkFX73tAq85pYOGbo+nSktinjW9dbrOWgECoRBLmqlrsY0+IM
   xKlQfzKBBRGLKjsIV5V/IURmndZgRnM6Gs1S0SA55lo2qBtv+OVgrUl8Y
   2/hx9cEjcIrkIKHEFNHDsGrs+Z7JiTJWOSuyiu+L30V0qQAAB6e1J6mnh
   VXWvgw0aCHBP8Fi3gK2IqPprqTIWTFDKn1mOXsvv5NMPjf+5LO8ICuEup
   LzvmOpa4ec1DAmJ4N/z2SajVISZOFbPRSSyg9hcSkfkD4sdy9yZYhIXrG
   aLF00wgAq4KWQBY4lhcr5fQsJVbdATE5BXOIo+Qx0k9ryB3VuSqv4qRhk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="438071763"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="438071763"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 03:53:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="734651211"
X-IronPort-AV: E=Sophos;i="5.99,281,1677571200"; 
   d="scan'208";a="734651211"
Received: from lnstern-mobl1.amr.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.251.221.185])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 03:53:38 -0700
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
Subject: [PATCH v2 7/9] wifi: ath11k: Use RMW accessors for changing LNKCTL
Date: Wed, 17 May 2023 13:52:33 +0300
Message-Id: <20230517105235.29176-8-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230517105235.29176-1-ilpo.jarvinen@linux.intel.com>
References: <20230517105235.29176-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_035346_016618_0C309D91 
X-CRM114-Status: GOOD (  11.40  )
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
bHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNvbT4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcK
LS0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3BjaS5jIHwgMTAgKysrKysrLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3BjaS5jIGIvZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDExay9wY2kuYwppbmRleCA3YjMzNzMxYTUwZWUuLjZiYTRjZWY2
YjFjNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9wY2kuYwor
KysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3BjaS5jCkBAIC01ODEsOCArNTgx
LDggQEAgc3RhdGljIHZvaWQgYXRoMTFrX3BjaV9hc3BtX2Rpc2FibGUoc3RydWN0IGF0aDExa19w
Y2kgKmFiX3BjaSkKIAkJICAgdTE2X2dldF9iaXRzKGFiX3BjaS0+bGlua19jdGwsIFBDSV9FWFBf
TE5LQ1RMX0FTUE1fTDEpKTsKIAogCS8qIGRpc2FibGUgTDBzIGFuZCBMMSAqLwotCXBjaWVfY2Fw
YWJpbGl0eV93cml0ZV93b3JkKGFiX3BjaS0+cGRldiwgUENJX0VYUF9MTktDVEwsCi0JCQkJICAg
YWJfcGNpLT5saW5rX2N0bCAmIH5QQ0lfRVhQX0xOS0NUTF9BU1BNQyk7CisJcGNpZV9jYXBhYmls
aXR5X2NsZWFyX3dvcmQoYWJfcGNpLT5wZGV2LCBQQ0lfRVhQX0xOS0NUTCwKKwkJCQkgICBQQ0lf
RVhQX0xOS0NUTF9BU1BNQyk7CiAKIAlzZXRfYml0KEFUSDExS19QQ0lfQVNQTV9SRVNUT1JFLCAm
YWJfcGNpLT5mbGFncyk7CiB9CkBAIC01OTAsOCArNTkwLDEwIEBAIHN0YXRpYyB2b2lkIGF0aDEx
a19wY2lfYXNwbV9kaXNhYmxlKHN0cnVjdCBhdGgxMWtfcGNpICphYl9wY2kpCiBzdGF0aWMgdm9p
ZCBhdGgxMWtfcGNpX2FzcG1fcmVzdG9yZShzdHJ1Y3QgYXRoMTFrX3BjaSAqYWJfcGNpKQogewog
CWlmICh0ZXN0X2FuZF9jbGVhcl9iaXQoQVRIMTFLX1BDSV9BU1BNX1JFU1RPUkUsICZhYl9wY2kt
PmZsYWdzKSkKLQkJcGNpZV9jYXBhYmlsaXR5X3dyaXRlX3dvcmQoYWJfcGNpLT5wZGV2LCBQQ0lf
RVhQX0xOS0NUTCwKLQkJCQkJICAgYWJfcGNpLT5saW5rX2N0bCk7CisJCXBjaWVfY2FwYWJpbGl0
eV9jbGVhcl9hbmRfc2V0X3dvcmQoYWJfcGNpLT5wZGV2LCBQQ0lfRVhQX0xOS0NUTCwKKwkJCQkJ
CSAgIFBDSV9FWFBfTE5LQ1RMX0FTUE1DLAorCQkJCQkJICAgYWJfcGNpLT5saW5rX2N0bCAmCisJ
CQkJCQkgICBQQ0lfRVhQX0xOS0NUTF9BU1BNQyk7CiB9CiAKIHN0YXRpYyBpbnQgYXRoMTFrX3Bj
aV9wb3dlcl91cChzdHJ1Y3QgYXRoMTFrX2Jhc2UgKmFiKQotLSAKMi4zMC4yCgoKLS0gCmF0aDEx
ayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
