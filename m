Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282A5C77B76
	for <ath11k@archiver.kernel.org>; Tue, 18 Apr 2023 10:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L06QiQnz051P2uzSRh/Z1noOWlwbMJATL8Ylbv/C39k=; b=X9P1Mu8vqjFjGp
	9Yqsok7g/Vl+dimNcMqxFtqhS/OhZwMj3EIoMkPdqgNKCM5qBEN4lTVar+n+oI5eSc5siCh/iK0Wm
	bk8AYvgoZA6B58RI8mDaQ6GXyCC2NRzpf2AJTiBGbVMsFMVGGmpMhfzdMjlKJ5pMddNc+adv5mdpy
	axtB1FBMJcZfyLwXka94qlw8yRx1daHBC65thuQtftE8YSjRWkXgmXi/R725bYUZZVZ+MXSKaZCi4
	bt+uKFlIAyoLNqaud/fEEmgEVdc1A/IUa/CQnPaK9CDdZicD1UVT1PQgTyb66OBQBHDqIhIpin8zv
	LTh8DQYrUBARbeVUaCtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poiQT-001cMS-04;
	Tue, 18 Apr 2023 10:19:05 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poiQQ-001cLG-0m
	for ath11k@lists.infradead.org;
	Tue, 18 Apr 2023 10:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=F5GtC/Ug8FVHmzGkdMDsWJgCnt1hLX/XyGMcykgns/M=;
	t=1681813141; x=1683022741; b=gxYmmUfRqUQXIHRQ/ShK1V18Ju4+O2hYTsnkegXZqo4v9p+
	Td/hvlOfzV9UQt6dl77NRepN09Bwi1mBY6+BNae1CVCauyybcJvVYmIWtQDbjQYTVixIktAf9qOgF
	f3Lh4T5N90a/IT14VJK5yyWFl60J18EsOfJ1LiQuUN/WFaZU7y5oikYYzzODopy8/X5XzlP1ov2OL
	Szub5pWqmkh3j405GNmgfdOMKykKw7MbzVQDhuUrbOpwrtZyNmnet1Nk3zqrdrTvkONeIMbsR2Lty
	di/a1Rb+HOS5vcfrC4FfcIlYDcB9mKt6TDzJTx2rkxWkCr+rjXcTxWEI1h5VQiCg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <johannes@sipsolutions.net>)
	id 1poiQK-001aBp-0x;
	Tue, 18 Apr 2023 12:18:56 +0200
Message-ID: <949040e5e573acef1a56269983a0e930951986ca.camel@sipsolutions.net>
Subject: Re: [PATCH 10/27] wifi: mac80211: isolate driver from inactive links
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <quic_wgong@quicinc.com>, linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org
Date: Tue, 18 Apr 2023 12:18:55 +0200
In-Reply-To: <a371eb4f-7d79-eeb4-5208-f9a342798021@quicinc.com>
References: <20220902141259.377789-1-johannes@sipsolutions.net>
	 <c7fd18fa-531f-a90d-a8fb-442a5aa66d7d@quicinc.com>
	 <d1fda46a-2481-8e05-e0a5-9f2bd3850ff4@quicinc.com>
	 <868131d13ed7c4c8b5d4938adcd71cf1ff8e9677.camel@sipsolutions.net>
	 <5765e3c5-46d4-e92b-a93b-4a2649acff2a@quicinc.com>
	 <37958ca93039114b98909d730ff57dd1d10bb68d.camel@sipsolutions.net>
	 <b9c6d022-12c3-a696-c4b9-cb14a6d30a45@quicinc.com>
	 <91577d586475d290e08dee9e535cb6b4896e06d4.camel@sipsolutions.net>
	 <edfc26b5-f6d1-2ab7-f3cc-60a74c8c334d@quicinc.com>
	 <61268d31f8a6dd4eea10fcb6048d39244bc584e2.camel@sipsolutions.net>
	 <870ce439-85b1-f02c-70e5-2d424fd73372@quicinc.com>
	 <34ed0938b69ead648da1aa250a2e081054fb49d4.camel@sipsolutions.net>
	 <34212873-0b71-7f39-b064-6b50d8e514b4@quicinc.com>
	 <09b156b1ef05377ca7fa0db35e8e13beb5c60e2c.camel@sipsolutions.net>
	 <13980456-11a6-384c-7be2-63c005410267@quicinc.com>
	 <ab8f9ed0f04873cafb81cc1c9f5d5c804b146aa9.camel@sipsolutions.net>
	 <a371eb4f-7d79-eeb4-5208-f9a342798021@quicinc.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_031902_279893_9F0CD1EA 
X-CRM114-Status: GOOD (  19.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Tue, 2023-04-18 at 17:44 +0800, Wen Gong wrote:
> On 4/18/2023 5:38 PM, Johannes Berg wrote:
> > On Tue, 2023-04-18 at 17:37 +0800, Wen Gong wrote:
> > 
> > 
> > > > > the sdata->u.mgd.assoc_data is NOT empty,
> > > > > 
> > > > > and the sdata->u.mgd.assoc_data->link[link_id].addr is valid,
> > > > > 
> > > > > it is addr by eth_random_addr(assoc_data->link[i].addr) in
> > > > > ieee80211_mgd_assoc().
> > > > > 
> > > > Exactly, so we've already decided on the address long before we actually
> > > > add the link data structure, so your callback would be much too late.
> > > > We'd need to have it called from ieee80211_mgd_assoc() already?
> > > For the 2nd link, is it OK for me to use the random addr which is set in
> > > ieee80211_mgd_assoc().
> > > 
> > > I only need to set the 1st assoc link in low driver.
> > > 
> > Ah. But does it make sense to restrict the API for that? I mean, if you
> > just change the prototype a little bit and call it without the link
> > conf, you can easily solve this problem too, no?
> Sorry, I am not sure how to solve this problem by remove the link conf 
> in prototype.

Why, then you can have an output parameter for the address, and call it
in mac80211 wherever it calls eth_random_addr() today, no?

johannes
> 

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
