Return-Path: <SRS0=NPuH=H2=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068EBC433DB
	for <ath11k@archiver.kernel.org>; Wed, 24 Feb 2021 06:37:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7450A64DCF
	for <ath11k@archiver.kernel.org>; Wed, 24 Feb 2021 06:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7450A64DCF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PzJsP2Q3lQw8911b4itWkZU7zAhEIeTd92dktY3tbUg=; b=VWdt567D5CdBiXBenkqDtHN0k
	J0UAj1NEwjhbRZZZCHf7UU7KT80nP7RjIqcNpm/uNQ2paBuDbY9oQ6jIIX0qCLBBSny4dSBMpNlcr
	xvUnTA7CiLoq91q99I8t3foirJQpAd4pjlqGPdYuLZ+hBzT3oJjnBqgO6ZsY5YxMInfj+rWtG934a
	SHYho8Zl/zkMLJcqYJ+gC//1YRQLvCt6VWJn/plEzy2gzVevcAFCRlIzurxBscH+HSFsLIYEFrGTV
	V1w4cnbvqCJFrIk3Ujnmeo8T61wabhSNyQSstgCIcbCq97VyMLyEBLqp5CI3fdLIL0nTkLaCX6J9q
	aRYErNX9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEnnw-0003zn-36; Wed, 24 Feb 2021 06:37:48 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEnns-0003zN-28
 for ath11k@lists.infradead.org; Wed, 24 Feb 2021 06:37:46 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614148664; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=48yz8jIM52Gzthc3eIwA3MFNH39afr9/7f7lqtwUPCM=;
 b=g30qqi1VGSOY0e+vIYH36vpwc8PU/UMF8bfp0sXZA0wQrQ4TPXvbXknR5JELr1orJCRP+s0p
 189my179PVWby7TUaORKwK32kGtU4gfUazdbNM/+KIqj9bQ5tIUDFAlv00Kb/ihYqYFYHlxS
 ZDVPNGjSR2Gnfyw/7bJr8S4eJpE=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6035f431090a774287901683 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 06:37:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 853EFC43461; Wed, 24 Feb 2021 06:37:36 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 25611C433CA;
 Wed, 24 Feb 2021 06:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 25611C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: qmi: use %pad to format dma_addr_t
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210221182754.2071863-1-geert@linux-m68k.org>
References: <20210221182754.2071863-1-geert@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210224063736.853EFC43461@smtp.codeaurora.org>
Date: Wed, 24 Feb 2021 06:37:36 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_013744_825096_A0B6872C 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

R2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cgo+IElmIENP
TkZJR19BUkNIX0RNQV9BRERSX1RfNjRCSVQ9bjoKPiAKPiAgICAgZHJpdmVycy9uZXQvd2lyZWxl
c3MvYXRoL2F0aDExay9xbWkuYzogSW4gZnVuY3Rpb24g4oCYYXRoMTFrX3FtaV9yZXNwb25kX2Z3
X21lbV9yZXF1ZXN04oCZOgo+ICAgICBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTFrL3Ft
aS5jOjE2OTA6ODogd2FybmluZzogZm9ybWF0IOKAmCVsbHjigJkgZXhwZWN0cyBhcmd1bWVudCBv
ZiB0eXBlIOKAmGxvbmcgbG9uZyB1bnNpZ25lZCBpbnTigJksIGJ1dCBhcmd1bWVudCA1IGhhcyB0
eXBlIOKAmGRtYV9hZGRyX3TigJkge2FrYSDigJh1bnNpZ25lZCBpbnTigJl9IFstV2Zvcm1hdD1d
Cj4gICAgICAxNjkwIHwgICAgICAgICJxbWkgcmVxIG1lbV9zZWdbJWRdIDB4JWxseCAldSAldVxu
IiwgaSwKPiAJICB8ICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4K
PiAgICAgIDE2OTEgfCAgICAgICAgIGFiLT5xbWkudGFyZ2V0X21lbVtpXS5wYWRkciwKPiAJICB8
ICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gCSAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwKPiAJICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZG1h
X2FkZHJfdCB7YWthIHVuc2lnbmVkIGludH0KPiAgICAgZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRo
L2F0aDExay9kZWJ1Zy5oOjY0OjMwOiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmGF0
aDExa19kYmfigJkKPiAgICAgICAgNjQgfCAgIF9fYXRoMTFrX2RiZyhhciwgZGJnX21hc2ssIGZt
dCwgIyNfX1ZBX0FSR1NfXyk7IFwKPiAJICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xn5+Cj4gICAgIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMWsvcW1pLmM6MTY5MDozNDog
bm90ZTogZm9ybWF0IHN0cmluZyBpcyBkZWZpbmVkIGhlcmUKPiAgICAgIDE2OTAgfCAgICAgICAg
InFtaSByZXEgbWVtX3NlZ1slZF0gMHglbGx4ICV1ICV1XG4iLCBpLAo+IAkgIHwgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfn5+Xgo+IAkgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfAo+IAkgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbG9uZyBs
b25nIHVuc2lnbmVkIGludAo+IAkgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJXgK
PiAKPiBGaXhlczogZDUzOTVhNTQ4NjU5NjMwOCAoImF0aDExazogcW1pOiBhZGQgZGVidWcgbWVz
c2FnZSBmb3IgYWxsb2NhdGVkIG1lbW9yeSBzZWdtZW50IGFkZHJlc3NlcyBhbmQgc2l6ZXMiKQo+
IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+
CgpQYXRjaCBhcHBsaWVkIHRvIHdpcmVsZXNzLWRyaXZlcnMuZ2l0LCB0aGFua3MuCgplYmI5ZDM0
ZTA3M2QgYXRoMTFrOiBxbWk6IHVzZSAlcGFkIHRvIGZvcm1hdCBkbWFfYWRkcl90CgotLSAKaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL3BhdGNoLzIw
MjEwMjIxMTgyNzU0LjIwNzE4NjMtMS1nZWVydEBsaW51eC1tNjhrLm9yZy8KCmh0dHBzOi8vd2ly
ZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0
aW5ncGF0Y2hlcwoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFr
Cg==
