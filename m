Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C523FC001DF
	for <ath11k@archiver.kernel.org>; Thu, 13 Jul 2023 12:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cS8x7mMKS9IB6wryMJjmy03U0Mo9eKIM/IFAXvPXECE=; b=0Wto+MWdE76gk0
	Hm3OSjlLtO6JvqAhEALJVSoRKzPNJ2t4fwgSDAeowHCSzVg3axJPsLXulnlPgWZCfqD5Q0Pz5+RAn
	Y/dTfwm9P57hyBTDZWYl9gC+2GUtIzjG/ycbsv6PJOa2abqdWAG4ue8Iiqq6EmxzMysaSrEG2VtTR
	rIbnrfF8N3OEEbRoBBE80yKDRU8PbR2uvjDFOyJUe3lg+XB6is6N0/CAW09H8+AdcNaw9MZcrJckc
	qjz6m/KB+36icl667bbxwJKre5qpRBv0QsVkkKZsmC+BiXUye9I8fWv/R5AJOigm67xM+kHAbZATm
	GISiUihrH4vcpg2ihSKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJviJ-003HFn-0X;
	Thu, 13 Jul 2023 12:46:31 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJviG-003HF4-2R
	for ath11k@lists.infradead.org;
	Thu, 13 Jul 2023 12:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689252388; x=1720788388;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w+Jctrt8GXsG54tgiviHTqhtp1nDe9dil2kNRqoIX1w=;
  b=XD6KWfh/oRoLkesvgA6wTEuCsXK6ca8mF9DdHqrs3EPvvbhGKtxNZ6ne
   txYg6CFrpymO3WhBKpWwCdXScxgyN75rPMaWjyV8icGQMDomyPJ+0cXOk
   hkwEmllbUZuJlAj66uOJCFvuHdFH//Exp4/lz+2GOm0ecJ10rUBdMMsEI
   te1zujAfpjRFELT44Tbb2AjsG7YZe8xJqd1THO4LU76SihqJYlp8nwisF
   N189P/Ytq6Oy5/52Z1lmpWQbheeIARrNGwmipC9LxQUskH8TsG+rgirl4
   l2fVxLPMVZbp8XrjGVORQlRtYfoJtIKRn6ANalAySpp3A1LYJjbCPmIdf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="367797000"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="367797000"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 05:46:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="757144492"
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="757144492"
Received: from ijarvine-mobl2.ger.corp.intel.com ([10.251.222.39])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 05:46:20 -0700
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
	Carl Huang <cjhuang@codeaurora.org>,
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dean Luick <dean.luick@cornelisnetworks.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Jonas=20Dre=C3=9Fler?= <verdre@v0yd.nl>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Simon Horman <simon.horman@corigine.com>,
	stable@vger.kernel.org
Subject: [PATCH v4 08/11] wifi: ath11k: Use RMW accessors for changing LNKCTL
Date: Thu, 13 Jul 2023 15:45:02 +0300
Message-Id: <20230713124505.94866-9-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230713124505.94866-1-ilpo.jarvinen@linux.intel.com>
References: <20230713124505.94866-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_054628_855618_6D69FE63 
X-CRM114-Status: GOOD (  11.75  )
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
bHBvLmphcnZpbmVuQGxpbnV4LmludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IFNpbW9uIEhvcm1hbiA8
c2ltb24uaG9ybWFuQGNvcmlnaW5lLmNvbT4KQWNrZWQtYnk6IEthbGxlIFZhbG8gPGt2YWxvQGtl
cm5lbC5vcmc+CkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVycy9uZXQvd2ly
ZWxlc3MvYXRoL2F0aDExay9wY2kuYyB8IDEwICsrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
d2lyZWxlc3MvYXRoL2F0aDExay9wY2kuYyBiL2RyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgx
MWsvcGNpLmMKaW5kZXggNzllMmNiZTgyNjM4Li5lYzQwYWRjMWNiMjMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvcGNpLmMKKysrIGIvZHJpdmVycy9uZXQvd2ly
ZWxlc3MvYXRoL2F0aDExay9wY2kuYwpAQCAtNTgxLDggKzU4MSw4IEBAIHN0YXRpYyB2b2lkIGF0
aDExa19wY2lfYXNwbV9kaXNhYmxlKHN0cnVjdCBhdGgxMWtfcGNpICphYl9wY2kpCiAJCSAgIHUx
Nl9nZXRfYml0cyhhYl9wY2ktPmxpbmtfY3RsLCBQQ0lfRVhQX0xOS0NUTF9BU1BNX0wxKSk7CiAK
IAkvKiBkaXNhYmxlIEwwcyBhbmQgTDEgKi8KLQlwY2llX2NhcGFiaWxpdHlfd3JpdGVfd29yZChh
Yl9wY2ktPnBkZXYsIFBDSV9FWFBfTE5LQ1RMLAotCQkJCSAgIGFiX3BjaS0+bGlua19jdGwgJiB+
UENJX0VYUF9MTktDVExfQVNQTUMpOworCXBjaWVfY2FwYWJpbGl0eV9jbGVhcl93b3JkKGFiX3Bj
aS0+cGRldiwgUENJX0VYUF9MTktDVEwsCisJCQkJICAgUENJX0VYUF9MTktDVExfQVNQTUMpOwog
CiAJc2V0X2JpdChBVEgxMUtfUENJX0FTUE1fUkVTVE9SRSwgJmFiX3BjaS0+ZmxhZ3MpOwogfQpA
QCAtNTkwLDggKzU5MCwxMCBAQCBzdGF0aWMgdm9pZCBhdGgxMWtfcGNpX2FzcG1fZGlzYWJsZShz
dHJ1Y3QgYXRoMTFrX3BjaSAqYWJfcGNpKQogc3RhdGljIHZvaWQgYXRoMTFrX3BjaV9hc3BtX3Jl
c3RvcmUoc3RydWN0IGF0aDExa19wY2kgKmFiX3BjaSkKIHsKIAlpZiAodGVzdF9hbmRfY2xlYXJf
Yml0KEFUSDExS19QQ0lfQVNQTV9SRVNUT1JFLCAmYWJfcGNpLT5mbGFncykpCi0JCXBjaWVfY2Fw
YWJpbGl0eV93cml0ZV93b3JkKGFiX3BjaS0+cGRldiwgUENJX0VYUF9MTktDVEwsCi0JCQkJCSAg
IGFiX3BjaS0+bGlua19jdGwpOworCQlwY2llX2NhcGFiaWxpdHlfY2xlYXJfYW5kX3NldF93b3Jk
KGFiX3BjaS0+cGRldiwgUENJX0VYUF9MTktDVEwsCisJCQkJCQkgICBQQ0lfRVhQX0xOS0NUTF9B
U1BNQywKKwkJCQkJCSAgIGFiX3BjaS0+bGlua19jdGwgJgorCQkJCQkJICAgUENJX0VYUF9MTktD
VExfQVNQTUMpOwogfQogCiBzdGF0aWMgaW50IGF0aDExa19wY2lfcG93ZXJfdXAoc3RydWN0IGF0
aDExa19iYXNlICphYikKLS0gCjIuMzAuMgoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDEx
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTFrCg==
