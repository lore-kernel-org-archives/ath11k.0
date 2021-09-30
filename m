Return-Path: <SRS0=03FT=OU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2189AC433F5
	for <ath11k@archiver.kernel.org>; Thu, 30 Sep 2021 12:51:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDF42617E5
	for <ath11k@archiver.kernel.org>; Thu, 30 Sep 2021 12:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDF42617E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FvLISo5Ft/FxiN1fA6T2eDsq9h1jN0aVz43G+ekJg4o=; b=4AKg+Z2LQpc48H
	g/52uRhWaocp+L3YkPRdkPKJZW44yfxiOiHFv/OcVqzBgR4JYxFjbIta7XnXrOGiifPAr3FxE2cd2
	xtVq4y5G0BtnF7SymcRwWWW7sf/eHomT7yigNkalibC513VQF21el59zr53lyz7Cro0IOU4U0/PPb
	BBbPrplqYrQk7v7j8/OJCd5xvjNM6piPlZsvbTNEfafKp7rgGWORxnLEQueD7t/xV9l4wxznnNyJl
	iciFYiCrwjDwAbDBEhraA28j6bjSdP7QYbyKWt0PukQNzqGvS/1AgIAinCZ+Z6awj0h49nyCsi7HG
	4kUl4kBTsE3iTxCjT1nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVvWe-00EHKu-Pm; Thu, 30 Sep 2021 12:51:00 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVvWb-00EHE8-Ux
 for ath11k@lists.infradead.org; Thu, 30 Sep 2021 12:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=4TlleyCiMGp2HgcNJjQRpYOtvGgDuirMN1avNFQtPaw=; 
 t=1633006250; x=1634215850; b=Dzj+A7D5Udd2Xf47l5dHt3XE0lpWvhj8wftjdRkd+5LQn0N
 fPUJSX7UOeTVrmL6jqWKhxnsBwfmflM1e8krbHvk8xMNw/YrOq6LHWKWb5HwuvsUWG9axgUJ0UJV9
 TEDwJFA7HHqkNFh4LaAJhvyVFGQHyU5P+JBV40yNApRpGKoQua79FFHItlzpn0nwQOmKknuHujsIw
 Cp0kaDHGMiaXHOF5H+qvcWDx98jrym5mWQHS6GJHDx/+10C+9NNGsFenbjfkWb0uUDJZ/4Kgl2sb+
 EHEMfu4XjY2RVmUhKFSNmuBTXWttvs7qoI5afud1MKfaYqgxqJ1/Mubck9fSo8Yg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95-RC2) (envelope-from <johannes@sipsolutions.net>)
 id 1mVvWR-00DnvS-Ej; Thu, 30 Sep 2021 14:50:47 +0200
Message-ID: <1222384c2bc7d80bf572b65ab17660477bb27300.camel@sipsolutions.net>
Subject: Re: [PATCH v5] cfg80211: save power spectral density(psd) of
 regulatory rule
From: Johannes Berg <johannes@sipsolutions.net>
To: Wen Gong <wgong@codeaurora.org>, Venkateswara Naralasetty
 <vnaralas@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 wgong=codeaurora.org@codeaurora.org
Date: Thu, 30 Sep 2021 14:50:46 +0200
In-Reply-To: <2ed76cff292dcca18326de0407a93821@codeaurora.org>
References: <20210928085211.26186-1-wgong@codeaurora.org>
 <bd649a3d2cf2ea9064d427d633055891@codeaurora.org>
 <cb20427eae96c4551084e4c899618b94@codeaurora.org>
 <2afb1bf6f06cb53f43fe0d354afa4e7c@codeaurora.org>
 <2ed76cff292dcca18326de0407a93821@codeaurora.org>
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_055058_062332_06CD9700 
X-CRM114-Status: GOOD (  22.70  )
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

On Thu, 2021-09-30 at 10:53 +0800, Wen Gong wrote:
> > > 
> > > 		chan->max_reg_power =
> > > 			min_t(int, MBM_TO_DBM(power_rule1->max_eirp),
> > > 			      MBM_TO_DBM(power_rule2->max_eirp));
> > > 
> > > For AP + STA concurrency, it should to maintain 2 group of reg rules,
> > > one is for AP, another is for STA.
> > 
> > Can we maintain two power rules in the same channel one for AP and one
> > for STA. In this way, we can update the power rules in the same
> > channel for both AP and STA from the reg rules.
> > 
> > Otherwise, we need to maintain multiple channel lists in sband for all
> > supported power mode combinations to apply the respective power rules
> > and build channel flags from the multiple reg rules.
> > right?
> 
> If AP+STA is up in the same wiphy/ieee80211_hw, and AP's reg rules is 
> different
> with STA, then it should maintain muti channel list for each band of the 
> wiphy/ieee80211_hw by my understand.

I don't think that's how it works. You can today have AP/STA concurrency
on a single wiphy with different netdevs, even with mesh or whatever.

> Currently there is only one "struct ieee80211_supported_band 
> *bands[NUM_NL80211_BANDS]"
> in "struct wiphy".
> 
> I advise to discuss the AP + STA concurrency in another mail thread 
> since it is not relative with this patch.

I actually explicitly pointed to this thread, but I'm not sure it's so
clear cut?

If we have completely separate rules here for AP and STA, we probably
should have different "max_reg_power" values for AP and STA? Maybe mesh
is treated like AP, maybe not?

But I don't know - does PSD really differ between AP and STA?

Maybe this discussion belongs rather to the power type patch? But that
didn't add any state!


So - does this PSD depend on mode? It kind of seems like it shouldn't
and then this *isn't* the right place to be discussing this, but if PSD
does in fact depend on the mode then we should be discussing it here?

Venkatesh seemed to be worried more about LPI/client power etc. as in
commit 405fca8a9461 ("ieee80211: add power type definition for 6 GHz"),
but that doesn't add state?

So what gives? From a regulatory POV it seems PSD should be independent,
but some other things might be dependent on mode?

johannes


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
