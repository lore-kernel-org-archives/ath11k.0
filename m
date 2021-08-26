Return-Path: <SRS0=rto1=NR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3C1C432BE
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 08:26:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07A4B60EBA
	for <ath11k@archiver.kernel.org>; Thu, 26 Aug 2021 08:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07A4B60EBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sVgO4sQlqlHpUvMyldp2rB9Ci+HshRXVm2U5WVTVzaI=; b=1LybG14eh0VbuD
	9MtNN0Fig41eWzXhAhC1i8eA7BM/d6GYE1bOXriFTFbIw8iU3jGCHSwQ0/k95NSc+88pZWtLklPVS
	QUbruhbps8No1GGNGMyX5hjaHSpP80QBC+xAGyIdSCPehPjs1cZj/42TkNGP6z5revGaeZ+IMKVfl
	OCp8GDWHc0f3H7lU3SsMlYPr7CzXPaBeAhB21J+RBCxYEvJPGUOqn84j+u1LwePrXCAT4yQ970de9
	9jBsxLV8Auu+8jRhbIIHkL0lIJh3EVckuQ54vp45W4AzawOZi8zm5oFaehGIn9xn22MVipzguCW43
	ZhEhsrbNPZEhqc0sMf0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJAi0-009Y2q-Kj; Thu, 26 Aug 2021 08:26:00 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJAhv-009Y26-P2
 for ath11k@lists.infradead.org; Thu, 26 Aug 2021 08:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=yRAb8wzgZPM9JDBdvrupwwZip5xyRlAmMzl5arzWrro=; 
 t=1629966355; x=1631175955; b=HldwxcmGM89wAhmnQjidJ5RjEX+zRX8iKVceKd6h0NcnbBZ
 uHLoSiFqyDzav7ICRwnt6J4Nia6OCRIJc+zN0oFGS0D7a1NJL4lmmjLPHRveGadyH5gATUTWKLkl5
 peDb2P1Y2PFmswFUxC/seQxBvIqKbGCGJnnXnxydee24nb5ACswJ29prjqGNxJxT6HitUOTugIqaJ
 FRfuqJC5v46tjWn/otSkuX3czUTUNjO1wwrnG7B7o/k8u0j2SQS9mogyiP0Ovmu8iNE737LO3kV16
 ULHPrIIY4/aEOVAKla3jVGdcCupVjkFx5rwPgUyJDxYfAS/L2btzBXTisIeIfwZw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <johannes@sipsolutions.net>)
 id 1mJAhu-00G4n4-3k; Thu, 26 Aug 2021 10:25:54 +0200
Message-ID: <101b523a6fe06fea3e1c9642a1bf5e85a9d0e680.camel@sipsolutions.net>
Subject: Re: [PATCH v2 5/8] cfg80211: save power spectral density(psd) of
 regulatory rule
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Date: Thu, 26 Aug 2021 10:25:52 +0200
In-Reply-To: <20210820122041.12157-6-wgong@codeaurora.org>
References: <20210820122041.12157-1-wgong@codeaurora.org>
 <20210820122041.12157-6-wgong@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_012555_865319_35119348 
X-CRM114-Status: UNSURE (   5.72  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

I was going to apply this and patch 4 squashed, saying:


    cfg80211: regulatory: handle 6 GHz power spectral density (PSD)
    
    6 GHz regulatory domains introduce power spectral density (PSD).
    Allow wiphy-specific regulatory rules to specify these values.

but ...
> 
> +		if (chan->flags & IEEE80211_CHAN_PSD)
> +			chan->psd = min_t(s8, rrule1->psd, rrule1->psd);
> +

This is obviously wrong?

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
