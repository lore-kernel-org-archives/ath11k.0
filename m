Return-Path: <SRS0=85K5=O7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB71C433EF
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 04:06:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30CAF60E90
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 04:06:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30CAF60E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpC6oSJ3N1FZaUJMtoEmuRkaQyR9Oy3YKPnOOapddAk=; b=bg9SKxSjEtduQgaPpay4OkkeEw
	u/xzbIjs02IySlW9Yv1/0Ddx5A5xS/r2Nn2/CK5LUFdNbqQN4nFt+6LTVL8g5ZB9yR8/p+MuoZjhB
	Mh0E5+juK9C4pHwy2U6yMb8JiLH7hMuXKa+XRg4NUDHIGAaLQlVTUB3li39TL43f6vnSFgr36Vo/9
	pqxK+9qWBx9urpn/DYCXG1j7sl+WqxKqm4jsZcFBNxaC8YgY+8VfUtq9FiNXltwtgbYDeMos2b3W2
	vDckr+gD538YqHbIxjnXEgWofSp0rl8QFJJXbZA8tHBamBfTsAsa4gTSel2R8VMFiSyRd/fK88qb2
	0/zx2Anw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZmZw-007eeX-7L; Mon, 11 Oct 2021 04:06:20 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZmZt-007ee9-JK
 for ath11k@lists.infradead.org; Mon, 11 Oct 2021 04:06:19 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633925177; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+56MsHvQUgwvmdOWMayKmrkXDzcge09CMTNZDQdtpZ0=;
 b=cAqnG+m1lwMxLkNBhqOi6ncmqntGxXn8a1dGXNfhxP4rtGTo7CaDlE9KCev/g1edFtQylYhG
 EMy5TeU0R+v+cPOOmd6N5aaGMo1D7E2pKQ8gIhEKpZmkYT1u79m3ZjtKHJNXNcL/HqFIN4nj
 iSmdD7dOUI+oWsHQnuApIq16ETg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6163b83422fe3a98e5aac11f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 04:06:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 31D96C4360C; Mon, 11 Oct 2021 04:06:12 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AEAD4C4338F;
 Mon, 11 Oct 2021 04:06:10 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 11 Oct 2021 12:06:10 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 wgong=codeaurora.org@codeaurora.org
Subject: Re: [PATCH v5] cfg80211: save power spectral density(psd) of
 regulatory rule
In-Reply-To: <1222384c2bc7d80bf572b65ab17660477bb27300.camel@sipsolutions.net>
References: <20210928085211.26186-1-wgong@codeaurora.org>
 <bd649a3d2cf2ea9064d427d633055891@codeaurora.org>
 <cb20427eae96c4551084e4c899618b94@codeaurora.org>
 <2afb1bf6f06cb53f43fe0d354afa4e7c@codeaurora.org>
 <2ed76cff292dcca18326de0407a93821@codeaurora.org>
 <1222384c2bc7d80bf572b65ab17660477bb27300.camel@sipsolutions.net>
Message-ID: <562080d7fc3b7568811c47a8e8e79156@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_210617_745191_53085BC2 
X-CRM114-Status: GOOD (  32.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2021-09-30 20:50, Johannes Berg wrote:
> On Thu, 2021-09-30 at 10:53 +0800, Wen Gong wrote:
>> > >
>> > > 		chan->max_reg_power =
>> > > 			min_t(int, MBM_TO_DBM(power_rule1->max_eirp),
>> > > 			      MBM_TO_DBM(power_rule2->max_eirp));
>> > >
>> > > For AP + STA concurrency, it should to maintain 2 group of reg rules,
>> > > one is for AP, another is for STA.
>> >
>> > Can we maintain two power rules in the same channel one for AP and one
>> > for STA. In this way, we can update the power rules in the same
>> > channel for both AP and STA from the reg rules.
>> >
>> > Otherwise, we need to maintain multiple channel lists in sband for all
>> > supported power mode combinations to apply the respective power rules
>> > and build channel flags from the multiple reg rules.
>> > right?
>> 
>> If AP+STA is up in the same wiphy/ieee80211_hw, and AP's reg rules is
>> different
>> with STA, then it should maintain muti channel list for each band of 
>> the
>> wiphy/ieee80211_hw by my understand.
> 
> I don't think that's how it works. You can today have AP/STA 
> concurrency
> on a single wiphy with different netdevs, even with mesh or whatever.
> 
>> Currently there is only one "struct ieee80211_supported_band
>> *bands[NUM_NL80211_BANDS]"
>> in "struct wiphy".
>> 
>> I advise to discuss the AP + STA concurrency in another mail thread
>> since it is not relative with this patch.
> 
> I actually explicitly pointed to this thread, but I'm not sure it's so
> clear cut?
> 
> If we have completely separate rules here for AP and STA, we probably
> should have different "max_reg_power" values for AP and STA? Maybe mesh
> is treated like AP, maybe not?
> 
> But I don't know - does PSD really differ between AP and STA?
> 
> Maybe this discussion belongs rather to the power type patch? But that
> didn't add any state!
> 
> 
> So - does this PSD depend on mode? It kind of seems like it shouldn't
> and then this *isn't* the right place to be discussing this, but if PSD
> does in fact depend on the mode then we should be discussing it here?
> 
> Venkatesh seemed to be worried more about LPI/client power etc. as in
> commit 405fca8a9461 ("ieee80211: add power type definition for 6 GHz"),
> but that doesn't add state?
> 
> So what gives? From a regulatory POV it seems PSD should be 
> independent,
> but some other things might be dependent on mode?
> 

As I know, below values maybe all different for the AP and
STATION in the same wiphy/ieee80211_hw, not only PSD.

struct ieee80211_reg_rule {
	struct ieee80211_freq_range freq_range;
	struct ieee80211_power_rule power_rule;
	struct ieee80211_wmm_rule wmm_rule;
	u32 flags;
	u32 dfs_cac_ms;
	bool has_wmm;
	s8 psd;
};

@Venkateswara, please feel free to give more info to Johannes:)

> johannes

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
