Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55F4C636CC
	for <ath11k@archiver.kernel.org>; Mon, 13 Feb 2023 12:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mm8plIedm/ma1O1MQ2HXoXl5wD1kAB5P6mew9MpZAmA=; b=VGLbA/b8Bermhf5VSyaxw2rW71
	PLe0pjrosb1T12O1/dVpEcOIutHE6uXBCYaDk+vZeWzjMBUMe6Kf+y5Bns3rX8USZn26opgNYccOv
	mdFR7ZVIrmLjOYuFJ4g0H7W/IHtTOlFo8klxzcldbc5v2EJyWGPHD46oKoYU6+cf9ueXsdd8Z03/l
	Rd0d9fiRKySq3dceHNSflnoyn/2jJZAP+Ki1hK2Sbc592G2pitieK2vtmOISKnCTOJGkKqujeNfg7
	l+a/q5+JRFZqlKLNGQvGRrUEow4GsB6i5lK80qVUxyLjobgmBvYbPwpdHt34MHrlxyJ3gSO9BRTzf
	VXYBhing==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXsy-00Ecr4-Ur; Mon, 13 Feb 2023 12:24:44 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRXsv-00EcoK-Dl
	for ath11k@lists.infradead.org; Mon, 13 Feb 2023 12:24:43 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 89C31642ECB8;
	Mon, 13 Feb 2023 13:24:34 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 5JmuXyD4XZKA; Mon, 13 Feb 2023 13:24:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 05FC76323048;
	Mon, 13 Feb 2023 13:24:34 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vvfLvRO0uh4R; Mon, 13 Feb 2023 13:24:33 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id DC5F2642ECB8;
	Mon, 13 Feb 2023 13:24:33 +0100 (CET)
Date: Mon, 13 Feb 2023 13:24:33 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: kvalo <kvalo@kernel.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, 
	ath11k <ath11k@lists.infradead.org>
Message-ID: <370539199.123516.1676291073661.JavaMail.zimbra@nod.at>
In-Reply-To: <873579wze8.fsf@kernel.org>
References: <1263051271.53086.1674425560245.JavaMail.zimbra@nod.at> <873579wze8.fsf@kernel.org>
Subject: Re: Resume from hibernation fails due to ath11k_pci
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: Resume from hibernation fails due to ath11k_pci
Thread-Index: m1FCqBhgubupsnJMxfUBeHozk0YSRg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_042441_648253_4B4F28F6 
X-CRM114-Status: UNSURE (   5.90  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogImt2YWxvIiA8a3ZhbG9Aa2Vy
bmVsLm9yZz4KPiBSaWNoYXJkIFdlaW5iZXJnZXIgPHJpY2hhcmRAbm9kLmF0PiB3cml0ZXM6Cj4g
Cj4+IE9uIG15IHNoaW55IG5ldyBMZW5vdm8gVDE0cyByZXN1bWUgZnJvbSBoaWJlcm5hdGlvbiBh
bHdheXMgZmFpbHMsIGFuZCBjcmFzaGVzCj4+IHRoZSBrZXJuZWwuCj4+IExvb2tzIGxpa2UgYXRo
MTFrX3BjaSBpcyB1bmFibGUgdG8gcmVzdW1lIHRoZSBkZXZpY2UuCj4+IFRoaXMgaGFwcGVucyBh
bHNvIHdpdGggTGludXMnIHRyZWUgYXMgb2YgdG9kYXkuCj4gCj4gVW5mb3J0dW5hdGVseSBhIGtu
b3duIGlzc3VlIGluIGF0aDExayBidXQgbm8gZml4IGF2YWlsYWJsZToKPiAKPiBodHRwczovL2J1
Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcuY2dpP2lkPTIxNDY0OQoKU28gdGhlIGRldmljZSBp
cyB1bmFibGUgdG8gb3BlcmF0ZSBhZnRlciBlbnRlcmluZyBBQ1BJIFM0LgoKSXMgdGhpcyBhIGJ1
ZyBpbiB0aGUgTGludXggYXRoMTFrIGRyaXZlciBpdHNlbGYgb3IgbW9yZSBsaWtlbHkgYSBmaXJt
d2FyZQpjaGlwIGlzc3VlPwpJIGRpZG4ndCB2ZXJpZnkgd2hldGhlciByZXN1bWUgd29ya3Mgb24g
V2luZG93cyB0aG91Z2guCgpUaGFua3MsCi8vcmljaGFyZAoKLS0gCmF0aDExayBtYWlsaW5nIGxp
c3QKYXRoMTFrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMWsK
