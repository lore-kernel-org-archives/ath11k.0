Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F13C7EE22
	for <ath11k@archiver.kernel.org>; Thu, 11 May 2023 13:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9n5r2BRSz4U6AePYR/QPuk1526yntxuOds19OnZIM4M=; b=O1E1GhIbmP5irt
	v5OiHqJofnTzG4TdaPMeDbkYXMxE5fpdfsT8+9mEKwzhv5adECAD/T6wdTOCpckf0TQAgJwV2iMlg
	fyarjQmr1l+R0VVmNdOcYdbJODhNmYnz1fUCe6qh+K03ZpL3stAXsMemuZAzgfcanl4dt+8XQDOg5
	TTQHdiudr8krXwxgFO6lNbVyJ1TL3dq/dIf3mHti5fwdjh0E3taiRysydDyujq7oUdjEW1RlcHBDq
	WzQO5dyOPV2NB3m3ZT5s5BrxxpOCVQ+Dehnd46nTiY0z0v9jsAd3drEUQhsUd9MteYahg+/aT4oYQ
	XfJOg4Tz/PjOSEQyCgvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px69I-008q5K-0q;
	Thu, 11 May 2023 13:16:00 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px69F-008q4F-2V
	for ath11k@lists.infradead.org;
	Thu, 11 May 2023 13:15:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683810957; x=1715346957;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zAxNSgIqZEwmVaKE1U0kMXB6SpY1gyI1AhVmM1SO/rc=;
  b=b0rQbkchP8leGA+b69dG5zmAZCBPMYBnmPcYDKaRixgusP04rKFrCdhn
   0qIreeDaNr03kn+54kiSLXVB1eFVHWJDTS8WMpvJ7mfkX7mELSk0K4EgF
   HIoDqbMXqmE+1/UG92nrqUEu3yqRWdg4730VvHvlGyvQpaYUb1jg+7OqS
   tf3pY6oAkz+6M/eHM1aN8JW6N682VvTbCnhA1tID5ZErQj1Wz88WY6keR
   N2Bp1Qt74UfhnYaRMqZprIIjpERBWb+1SxKjD3DK1WU9x7R+Oo9wKs4z8
   rmS8L7auupSo+zj8G4EQKk0pRK3A6t0r4u1j1O87G+RQy/FgmNLnZsXy7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="378619736"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="378619736"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 06:15:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="650170118"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="650170118"
Received: from jsanche3-mobl1.ger.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.252.39.112])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 06:15:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
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
Subject: [PATCH 15/17] wifi: ath11k: Use pcie_lnkctl_clear_and_set() for changing LNKCTL
Date: Thu, 11 May 2023 16:14:39 +0300
Message-Id: <20230511131441.45704-16-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511131441.45704-1-ilpo.jarvinen@linux.intel.com>
References: <20230511131441.45704-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_061557_868570_314C0520 
X-CRM114-Status: GOOD (  12.60  )
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
ZGUgb2YgZHJpdmVyJ3MgY29udHJvbC4KClVzZSBwY2llX2xua2N0bF9jbGVhcl9hbmRfc2V0KCkg
d2hpY2ggZG9lcyBwcm9wZXIgbG9ja2luZyB0byBhdm9pZApsb3NpbmcgY29uY3VycmVudCB1cGRh
dGVzIHRvIHRoZSByZWdpc3RlciB2YWx1ZS4KClN1Z2dlc3RlZC1ieTogTHVrYXMgV3VubmVyIDxs
dWthc0B3dW5uZXIuZGU+ClNpZ25lZC1vZmYtYnk6IElscG8gSsOkcnZpbmVuIDxpbHBvLmphcnZp
bmVuQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFr
L3BjaS5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFr
L3BjaS5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9wY2kuYwppbmRleCA3YjMz
NzMxYTUwZWUuLmQwODg1ZDMwZGNiYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3Mv
YXRoL2F0aDExay9wY2kuYworKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3Bj
aS5jCkBAIC01ODEsOCArNTgxLDggQEAgc3RhdGljIHZvaWQgYXRoMTFrX3BjaV9hc3BtX2Rpc2Fi
bGUoc3RydWN0IGF0aDExa19wY2kgKmFiX3BjaSkKIAkJICAgdTE2X2dldF9iaXRzKGFiX3BjaS0+
bGlua19jdGwsIFBDSV9FWFBfTE5LQ1RMX0FTUE1fTDEpKTsKIAogCS8qIGRpc2FibGUgTDBzIGFu
ZCBMMSAqLwotCXBjaWVfY2FwYWJpbGl0eV93cml0ZV93b3JkKGFiX3BjaS0+cGRldiwgUENJX0VY
UF9MTktDVEwsCi0JCQkJICAgYWJfcGNpLT5saW5rX2N0bCAmIH5QQ0lfRVhQX0xOS0NUTF9BU1BN
Qyk7CisJcGNpZV9sbmtjdGxfY2xlYXJfYW5kX3NldChhYl9wY2ktPnBkZXYsCisJCQkJICBhYl9w
Y2ktPmxpbmtfY3RsICYgUENJX0VYUF9MTktDVExfQVNQTUMsIDApOwogCiAJc2V0X2JpdChBVEgx
MUtfUENJX0FTUE1fUkVTVE9SRSwgJmFiX3BjaS0+ZmxhZ3MpOwogfQpAQCAtNTkwLDggKzU5MCw4
IEBAIHN0YXRpYyB2b2lkIGF0aDExa19wY2lfYXNwbV9kaXNhYmxlKHN0cnVjdCBhdGgxMWtfcGNp
ICphYl9wY2kpCiBzdGF0aWMgdm9pZCBhdGgxMWtfcGNpX2FzcG1fcmVzdG9yZShzdHJ1Y3QgYXRo
MTFrX3BjaSAqYWJfcGNpKQogewogCWlmICh0ZXN0X2FuZF9jbGVhcl9iaXQoQVRIMTFLX1BDSV9B
U1BNX1JFU1RPUkUsICZhYl9wY2ktPmZsYWdzKSkKLQkJcGNpZV9jYXBhYmlsaXR5X3dyaXRlX3dv
cmQoYWJfcGNpLT5wZGV2LCBQQ0lfRVhQX0xOS0NUTCwKLQkJCQkJICAgYWJfcGNpLT5saW5rX2N0
bCk7CisJCXBjaWVfbG5rY3RsX2NsZWFyX2FuZF9zZXQoYWJfcGNpLT5wZGV2LCAwLAorCQkJCQkg
IGFiX3BjaS0+bGlua19jdGwgJiBQQ0lfRVhQX0xOS0NUTF9BU1BNQyk7CiB9CiAKIHN0YXRpYyBp
bnQgYXRoMTFrX3BjaV9wb3dlcl91cChzdHJ1Y3QgYXRoMTFrX2Jhc2UgKmFiKQotLSAKMi4zMC4y
CgoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
