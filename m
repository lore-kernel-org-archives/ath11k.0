Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA955C432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 08:20:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6608D610A7
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 08:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6608D610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kjC0toW216i80lDbMIcZ9dvRRuMmlF+TB7EbrYwc0G8=; b=H4axQabOClmgET
	QJGKOWcqLDZyI24FvumTdPCBo764i/PgTKyZZO2plbm4VDLC3yYhw/Te5Xjw4BzCZDKYq3QH3kqVN
	tsbnig3p/xoE5iCflv6sOe2FQmWOpeN2ZknvZPuPOe8esypnOcpX+Dgzpsdg1p+V5cPZoMfCgqPKx
	vrwVjHpN4xtflkj2p1ZwvOaF3y3M7bA5WSjXDkubnqyi+SOB2n1FLbyrHvPztBd+k6CwciNceBzNW
	czFTpBIJ2B+XWBbadH2m0p+TXoDbJPpmU/h40wYOL6gthQpSxJhTxNEpkmvHVEwEOrqcVo7fikt/l
	Ql0csmYcuoF8ScseYAhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJAcr-009XPH-DQ; Thu, 26 Aug 2021 08:20:41 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJAcl-009XOE-Fy
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 08:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=Xml5XgGGdB6PW/lKHY1O27jJUx5RVOjX8lRawK2JDs4=; 
 t=1629966035; x=1631175635; b=afep47vnTHFTO5qNlkltvSKEDtNgNXSxXE7iT5iw/BlfeKR
 rzaJrnKDaUfraYpZSHFCLruVzmMv+XxxmGrvNzeR+51rNiRuNJaovDdQE6cf/CR+FZFS1ugMkYAow
 5iqwCJTXahkAubEGlczWIUjdS8S3BRDmX5OSrrq689m95NRVEn/G1oykwV8F0ROIgXuxqklNZA8/P
 UZnZ5lc9r/xg5czoLwjje3FC8ci4XPEeuv+5N+3ys+/Rij02cRELBO+5oqsq0qXx14FPZ9xJy6ES8
 Yna3asVh5iEpnWSjYEwZOlVQLZDbErMDfqTcHKhGm7d8Sc9xMciqkjnMFjn4B4vg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mJAcj-00G4cy-W2; Thu, 26 Aug 2021 10:20:34 +0200
Message-ID: <6f10eb461590235014179b8b5c8996d407a51015.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/8] mac80211: add definition of regulatory info in 6
 GHz operation information
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 26 Aug 2021 10:20:33 +0200
In-Reply-To: <20210820122041.12157-3-wgong@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-3-wgong@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_012035_564296_CE004CE5 
X-CRM114-Status: UNSURE (   7.76  )
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

T24gRnJpLCAyMDIxLTA4LTIwIGF0IDA4OjIwIC0wNDAwLCBXZW4gR29uZyB3cm90ZToKPiBJRUVF
IFN0ZCA4MDIuMTFheOKEoi0yMDIxIGFkZGVkIHJlZ3VsYXRvcnkgaW5mbyBzdWJmaWVsZCBpbiBI
RSBvcGVyYXRpb24KPiBlbGVtZW50LCB0aGlzIHBhdGNoIGlzIHRvIGFkZCBpdCBpbiBtYWM4MDIx
MSBkZWZpbml0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlbiBHb25nIDx3Z29uZ0Bjb2RlYXVy
b3JhLm9yZz4KPiAtLS0KPiDCoGluY2x1ZGUvbGludXgvaWVlZTgwMjExLmggfCA0ICsrKysKPiDC
oDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCk5vdCByZWFsbHkgbWFjODAyMTEgKHN1
YmplY3QpLCBidXQgSSdsbCBmaXguCgpqb2hhbm5lcwoKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0
CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
