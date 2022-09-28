Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA72C6FA8E
	for <ath11k@archiver.kernel.org>; Wed, 28 Sep 2022 15:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bWOfTe7xjbBW/FVHWu8MpbVwRuByr0JH65061axbutc=; b=dMNT++LamZhQ03
	s8MbEXitV8DOz9wXRskFwCgcjvmuh/e6VbvdrLf7eWeZTLPBGb6UaSqLti/P/SrvxFHe78tJevQHT
	bhlxE2f9rwXnXHs2IRGbjdTZDu4MN9kh6F5gKkmsr2LsQC/B1jvptksO98nEVjh9vzs2lxIptA7mD
	fiJAqGbjjS2OR9lE/sBgRLwEVamI+EqRZYHiNSoMBw6ls6mZHWCPBiNOGgoIMolLm0fjOTq4OlMLE
	1SyFNPwc4+rkzOoWgGSTXwvLQNKAqatMrKe+VJ1M+RVfrenUDmyAlLiUqx1zgcZJisERXHPlUKa8o
	D8hMR9h2XWLR4gW1qUnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odYzj-00Gu6Z-G3; Wed, 28 Sep 2022 15:29:07 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odYzg-00Gu4d-Qu
	for ath11k@lists.infradead.org; Wed, 28 Sep 2022 15:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=37EOxp/iCVHSBCtfr+3t/FcQTpssKgQl/uIYUuUiCAA=;
	t=1664378940; x=1665588540; b=CGzVYoRYw8ToHwwzVKK+Cavt4kOWGHWhTjTh/kJBx+VESZI
	InriTApVhuoHGdzlFdhK1mJ00U3Sa5LfI8w/eKCWzP9fVO24vSjKidSx79idDh9ExynFsPg28LulM
	B7/AAKwnNrMpz5mfyFaTJuPnKN6ORMB2GfPZoDdy3R9ZsI3lhtB7VJZ1SU2d8EcJFf5LIsaV8mB03
	t/ZKBEhfFVaSjOi27ThRB4+G73iZH2DsyIRC3lRvi82L5B6mUifet72OL7k7SflTIMz9nvh3Bn11r
	PZpdd7Qpxk/5/cUFISYJf+fE+iBhRlHbvAWkasSGuyud8DL4gDyMWKCDFKwY6okw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1odYzV-00ARg9-2U;
	Wed, 28 Sep 2022 17:28:53 +0200
Message-ID: <868131d13ed7c4c8b5d4938adcd71cf1ff8e9677.camel@sipsolutions.net>
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Date: Wed, 28 Sep 2022 17:28:52 +0200
In-Reply-To: <d1fda46a-2481-8e05-e0a5-9f2bd3850ff4@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
	 <20220902161143.5ce3dad3be7c.I92e9f7a6c120cd4a3631baf486ad8b6aafcd796f@changeid>
	 <5d82e564-86bf-c26b-077a-d0bc14e2d3c3@quicinc.com>
	 <74f3eb848326607b15336c31a02bdd861ccafb47.camel@sipsolutions.net>
	 <2de44394-cb93-7be4-481f-2d92788b8d28@quicinc.com>
	 <351f74e0e1cd6e9724f97dbd042bdc5e04c44842.camel@sipsolutions.net>
	 <c05780bc-864c-9323-499d-a8b1ba1c2ef2@quicinc.com>
	 <545227cf18baac94ea8aa24dc08b250c47949541.camel@sipsolutions.net>
	 <c7fd18fa-531f-a90d-a8fb-442a5aa66d7d@quicinc.com>
	 <d1fda46a-2481-8e05-e0a5-9f2bd3850ff4@quicinc.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_082904_891534_3DCF4533 
X-CRM114-Status: UNSURE (   5.66  )
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

SGksCgpTb3JyeSAtIHN0aWxsIGNhdGNoaW5nIHVwIGZyb20gUEYgcmVsYXRlZCBtYXR0ZXJzIC4u
LgoKPiBNYXkgSSBrbm93IHNvbWUgbW9yZSBpbmZvL3N0YXR1cyBhYm91dCB0aGUgImluY29taW5n
wqAgbmV3IG1ldGhvZCB0byBsZXQgCj4gZHJpdmVycyBzZXQgdGhlIGxpbmsgYWRkcmVzcyI/Cj4g
CgpJIHdhc24ndCBhY3R1YWxseSBwbGFubmluZyB0byB3b3JrIG9uIHRoYXQgbXlzZWxmLCBGV0lX
LgoKam9oYW5uZXMKCi0tIAphdGgxMWsgbWFpbGluZyBsaXN0CmF0aDExa0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTFr
Cg==
