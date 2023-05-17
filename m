Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD47C77B75
	for <ath11k@archiver.kernel.org>; Wed, 17 May 2023 11:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tu5/UdG4+fd0CZOEOzUXz3L0COnf9wjZDGrru8xNeU4=; b=rhLW5vRLY5/SzE
	Zr1zeQa0uo7zw32hGBAvKX4vPkAXaXY9+6q3Auk7Ml63WqRL/Y2Uo/wyej1vAGzFMEXFdWS3Cu7WH
	dTNr7qbIiJk0uuz/+xCAY6T1Q9ddIKWmtW8/p3m6lYGWRsKgPad/C+u308LRUgDlBcfdH/leuFROO
	ri0WUkIO6dEiEFF4oQskJkwjm56gWCX+xK73T156tY4rmerEHocmWcdPco0oiAcger/2UEjqybJ77
	c2X1DP+Fpr2SZwHn9UBFQ8pQ8/Sse2FbU2s71Uic86aYZzxifatZHYmikBGdL+b5aK84qYMVZUDUv
	xYAI09bUDqfOZGyHf8wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzExv-009X2A-2e;
	Wed, 17 May 2023 11:05:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzExt-009X1h-1Z
	for ath11k@lists.infradead.org;
	Wed, 17 May 2023 11:05:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0D08563A2E;
	Wed, 17 May 2023 11:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0D99C43321;
	Wed, 17 May 2023 11:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684321504;
	bh=dP7yShpUMKY1hlEFVakjZvlEQOr+IanDVhIYO9CmG5w=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=sYVd5TaLHaPo10KrzLin9+p+UZcAoZKhIB0zTnfJM7/tDjj2vQxqPnfkbpkAM5XRF
	 yvmTLmdAv72F8B2Y+gjCAO1XYQNSTXHJN3QiMpNZqi7oqOkGx2+RSze+BxiWbydQBL
	 rYlmk8K+8VlkuNP5OXxRxbYvyXQAHsQDGI/L3zhw/CpJL09omAQBBP3DQWyytuPbOn
	 OVNkVLBvBe6n+fPagVJiSoAFJlfbV5i09g10Fku9u5aU59aSs+zx+yxdlbnGxrfJYI
	 o+CDHbWACrq+ubGB54hIIudG4ITIKhR3Vi7MlyWQxuPjEAoXVZtc3t2rI4URVE3pL4
	 F7QEZsJf6fO/w==
From: Kalle Valo <kvalo@kernel.org>
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-pci@vger.kernel.org,  Bjorn Helgaas <bhelgaas@google.com>,
  Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
  Emmanuel Grumbach <emmanuel.grumbach@intel.com>,  "Rafael J . Wysocki"
 <rafael@kernel.org>,  Heiner Kallweit <hkallweit1@gmail.com>,  Lukas
 Wunner <lukas@wunner.de>,  "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Carl Huang <cjhuang@codeaurora.org>,
  ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org,
  netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,  Dean Luick
 <dean.luick@cornelisnetworks.com>,  Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,  stable@vger.kernel.org
Subject: Re: [PATCH v2 7/9] wifi: ath11k: Use RMW accessors for changing LNKCTL
References: <20230517105235.29176-1-ilpo.jarvinen@linux.intel.com>
	<20230517105235.29176-8-ilpo.jarvinen@linux.intel.com>
Date: Wed, 17 May 2023 14:04:57 +0300
In-Reply-To: <20230517105235.29176-8-ilpo.jarvinen@linux.intel.com> ("Ilpo
	\=\?utf-8\?Q\?J\=C3\=A4rvinen\=22's\?\= message of "Wed, 17 May 2023 13:52:33
 +0300")
Message-ID: <87wn17kyli.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_040505_565393_FFFA66B3 
X-CRM114-Status: GOOD (  10.53  )
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

SWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPiB3cml0ZXM6Cgo+
IERvbid0IGFzc3VtZSB0aGF0IG9ubHkgdGhlIGRyaXZlciB3b3VsZCBiZSBhY2Nlc3NpbmcgTE5L
Q1RMLiBBU1BNCj4gcG9saWN5IGNoYW5nZXMgY2FuIHRyaWdnZXIgd3JpdGUgdG8gTE5LQ1RMIG91
dHNpZGUgb2YgZHJpdmVyJ3MgY29udHJvbC4KPgo+IFVzZSBSTVcgY2FwYWJpbGl0eSBhY2Nlc3Nv
cnMgd2hpY2ggZG8gcHJvcGVyIGxvY2tpbmcgdG8gYXZvaWQgbG9zaW5nCj4gY29uY3VycmVudCB1
cGRhdGVzIHRvIHRoZSByZWdpc3RlciB2YWx1ZS4gT24gcmVzdG9yZSwgY2xlYXIgdGhlIEFTUE1D
Cj4gZmllbGQgcHJvcGVybHkuCj4KPiBGaXhlczogZTk2MDNmNGJkY2MwICgiYXRoMTFrOiBwY2k6
IGRpc2FibGUgQVNQTSBMMHNMcyBiZWZvcmUgZG93bmxvYWRpbmcgZmlybXdhcmUiKQo+IFN1Z2dl
c3RlZC1ieTogTHVrYXMgV3VubmVyIDxsdWthc0B3dW5uZXIuZGU+Cj4gU2lnbmVkLW9mZi1ieTog
SWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPgo+IENjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnCgpBY2tlZC1ieTogS2FsbGUgVmFsbyA8a3ZhbG9Aa2VybmVsLm9y
Zz4KCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtd2lyZWxl
c3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMv
ZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKLS0gCmF0aDExayBtYWlsaW5nIGxpc3QK
YXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hdGgxMWsK
