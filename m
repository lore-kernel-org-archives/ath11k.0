Return-Path: <SRS0=q65b=NO=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32EFFC4338F
	for <ath11k@archiver.kernel.org>; Mon, 23 Aug 2021 12:53:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E09E561368
	for <ath11k@archiver.kernel.org>; Mon, 23 Aug 2021 12:53:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E09E561368
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=je+6njucOepa85t9n3EWzBlQTMCACqT6qZpWr17QlVU=; b=oxDJSetJE6QL9u
	Mw0FqUzo1CTOVlqrQ2NU3u4ckvl9y1qCA3qduXDyD/2ltkgqtZwvFeIUQRug38KWVyoaEbuPYTJWm
	8Qsigbl19no7QmEJGZuxjVpxMjxrnIwYHcQ6XnOs3waAT32lkXNOrEenzFkpQmRKKQHS9H2ABjzCN
	As1Q1SyaKk4O7YriSNqLjo4ALnCz01dygDJBaFi/Rp/k8GsPE7B8CZkOH5Y/FXw5vs4La+facvdWJ
	ndjlNTIiOwRUuRnyEG25JTs8sc05CSFKJmecLsdj8JVZ8wUwqmB51iYG8T5e8bqxvn/7t1p7rgOEb
	1nbKzxRSBc8mV1RiLH6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI9ST-00Gqv1-6B; Mon, 23 Aug 2021 12:53:45 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI9SL-00GqtR-2G
 for ath11k@lists.infradead.org; Mon, 23 Aug 2021 12:53:43 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629723219; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=JcfDWR4cffqT+kvemo31Qw9aFals0hPQCxPipl6EkWA=;
 b=UGto2SmrsOkDbkyPy9yZb/BQQNKwM0xcN8dGnObErLGffwvN2KSXaEno3dHCLwAFSi787/P4
 BJ0FMPS7jIUT1GizlBoSEsi3QBQADnCaagVa/G9QK5W0qJ2VZSNSmM8gyU6R68R06kcl09kD
 rLmZl5o4THt6SPH9CeE0TxOJZx0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61239a42a2d1fbf62bd7631b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Aug 2021 12:53:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C9AF1C43460; Mon, 23 Aug 2021 12:53:21 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F0DDC4338F;
 Mon, 23 Aug 2021 12:53:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7F0DDC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Wren Turkal <wt@penguintechs.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 regressions@lists.linux.dev,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Hemant Kumar <hemantk@codeaurora.org>, Loic Poulain <loic.poulain@linaro.org>
Subject: Re: 5.14 rc6 broken for QCA6390 on Dell XPS 13 9310
References: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org>
Date: Mon, 23 Aug 2021 15:53:14 +0300
In-Reply-To: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org> (Wren
 Turkal's message of "Sun, 22 Aug 2021 14:08:11 -0700")
Message-ID: <87y28sqq4l.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_055339_736938_18E86FDA 
X-CRM114-Status: UNSURE (   8.86  )
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

KGFkZGluZyBsaW51eC13aXJlbGVzcywgcmVncmVzc2lvbnMgYW5kIHNvbWUgbWhpIGZvbGtzKQoK
V3JlbiBUdXJrYWwgPHd0QHBlbmd1aW50ZWNocy5vcmc+IHdyaXRlczoKCj4gSSBoYXZlIG5vIGRl
dmljZSBmb3IgdGhlIHdpZmkgb24gbXkgY29tcHV0ZXIuIDUuMTMgd29ya2VkIHByZXR0eSB3ZWxs
Lgo+IEkgYWxzbyBmb3VuZCBvdGhlcnMgcmVwb3J0aW5nIHNpbWlsYXIgaXNzdWVzOgo+IGh0dHBz
Oi8vZm9ydW0ubWFuamFyby5vcmcvdC9rZXJuZWw1LTE0LXJjNi1hdGgxMWstb24tcWNhNjM5MC1y
ZWdyZXNzaW9uLW1oaS1wcm9iZS1mYWlsdXJlLzc5MzYyCj4KPiBIZXJlJ3MgaW5mbyBhYm91dCB0
aGUgaGFyZHdhcmUgb24gbXkgbGFwdG9wOgo+IOKenCAgfiBzdWRvIGRtaWRlY29kZSAtcyBzeXN0
ZW0tcHJvZHVjdC1uYW1lCj4gWFBTIDEzIDkzMTAKPgo+IOKenCAgfiBzdWRvIGRtaWRlY29kZSAt
cyBiaW9zLXZlcnNpb24KPiAzLjAuNAoKRG8geW91IGdldCB0aGUgc2FtZSBtaGkgZXJyb3IgYXMg
aW4gdGhlIGZvcnVtIHBvc3Q/CgpxY29tX21oaV9xcnRyOiBwcm9iZSBvZiBtaGkwX0lQQ1IgZmFp
bGVkIHdpdGggZXJyb3IgLTIyCgpNSEkgZm9sa3MsIGFueSBpZGVhcz8gSSBoYXZlIFhQUyAxMyA5
MzEwIG15c2VsZiBidXQgSSdtIG5vdCBhYmxlIHRvIHRlc3QKdjUuMTQtcmM2IGtlcm5lbCByaWdo
dCBub3cuCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdp
cmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9yZy9lbi9kZXZlbG9w
ZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCi0tIAphdGgxMWsgbWFpbGluZyBs
aXN0CmF0aDExa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vYXRoMTFrCg==
