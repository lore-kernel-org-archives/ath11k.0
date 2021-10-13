Return-Path: <SRS0=CdPh=PB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BFCC433F5
	for <ath11k@archiver.kernel.org>; Wed, 13 Oct 2021 03:33:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 495A060E0C
	for <ath11k@archiver.kernel.org>; Wed, 13 Oct 2021 03:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 495A060E0C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kt11Z+1q0adEypQV94B5xzcHsqI3+tFTO1bEU/X07kI=; b=tGTkMNsA3/AyynRiUzCcH/kuq4
	T30pcOeofd3+trZ1vM7BWDbBpcCIhl3K8Ax8olJNfm/XNxdZngZUWyx95DrLjp2zCsFQ+CJkWzre+
	HNWgL3kBMCIE3i0phpp3wDN2C9lEp9iy8A3BatqDhoGR9+ytbqYIvjt0Skuvl5bMuPqwrfa+kCVHX
	kqHitih6ZKCK5/BUvkYGGMOQMf5wgvnbYiaBdLb7etnJ/mgnFWQl01Xd9figPsaOXijGAXmoLYTRP
	vKec9sgXXVWwhJsXS7zNV0y72Pyw74FnquAT1D0OR2/toaoEbMfnOLUrkhV2y7KFLAO96MUq65vMv
	W8bSzfkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maV1V-00Ekj2-HM; Wed, 13 Oct 2021 03:33:45 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maV1S-00Eki1-Sy
 for ath11k@lists.infradead.org; Wed, 13 Oct 2021 03:33:44 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634096022; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=YTOgE+A2iwb9MRu5N3jfU+h+8uS7y5/VrTNsVY+kN4U=;
 b=LxeEQDTNPIXIpDX9wThCwTSnvr/Nkw52PmVMNIu/XeodNViY2t725CBsCkK4DCC42/Zg+B07
 frpFpRl/X1ScFoiRGmaLCj5fPeAN11G4DWqBcGY+S0SR3oC1iG2MYvuDnR6TpBgtwW8qwNRm
 fKmZgUuL2398WMRZNuIxKXc8WDw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 61665395446c6db0cb566879 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Oct 2021 03:33:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7A335C4360D; Wed, 13 Oct 2021 03:33:40 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A1A62C4338F;
 Wed, 13 Oct 2021 03:33:38 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 13 Oct 2021 11:33:38 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Venkateswara Naralasetty <vnaralas@qti.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Venkateswara Naralasetty
 <vnaralas@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, wgong=codeaurora.org@codeaurora.org
Subject: Re: [PATCH v5] cfg80211: save power spectral density(psd) of
 regulatory rule
In-Reply-To: <0b05f6e555bcb89c49f56279c077ce63@codeaurora.org>
References: <20210928085211.26186-1-wgong@codeaurora.org>
 <bd649a3d2cf2ea9064d427d633055891@codeaurora.org>
 <cb20427eae96c4551084e4c899618b94@codeaurora.org>
 <2afb1bf6f06cb53f43fe0d354afa4e7c@codeaurora.org>
 <2ed76cff292dcca18326de0407a93821@codeaurora.org>
 <1222384c2bc7d80bf572b65ab17660477bb27300.camel@sipsolutions.net>
 <562080d7fc3b7568811c47a8e8e79156@codeaurora.org>
 <DM8PR02MB8154258563A4F7C805C84B4BE6B59@DM8PR02MB8154.namprd02.prod.outlook.com>
 <0b05f6e555bcb89c49f56279c077ce63@codeaurora.org>
Message-ID: <9bd081863cb53380de8741ec1ab316dd@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_203343_070395_8BC06D39 
X-CRM114-Status: GOOD (  33.89  )
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

Hi Johannes,

Do you think what change is needed for this patch?

It should need another patchset to handle AP+STA... in
same wiphy/ieee80211_hw feature by my understand.

On 2021-10-11 15:48, Wen Gong wrote:
> On 2021-10-11 14:43, Venkateswara Naralasetty wrote:
>>> -----Original Message-----
>>> From: ath11k <ath11k-bounces@lists.infradead.org> On Behalf Of Wen 
>>> Gong
>>> Sent: Monday, October 11, 2021 9:36 AM
>>> To: Johannes Berg <johannes@sipsolutions.net>
>>> Cc: Venkateswara Naralasetty <vnaralas@codeaurora.org>;
>>> ath11k@lists.infradead.org; linux-wireless@vger.kernel.org;
>>> wgong=codeaurora.org@codeaurora.org
>>> Subject: Re: [PATCH v5] cfg80211: save power spectral density(psd) of
>>> regulatory rule
>>> 
>>> WARNING: This email originated from outside of Qualcomm. Please be 
>>> wary
>>> of any links or attachments, and do not enable macros.
>>> 
>>> On 2021-09-30 20:50, Johannes Berg wrote:
>>> > On Thu, 2021-09-30 at 10:53 +0800, Wen Gong wrote:
>>> >> > >
>>> >> > >          chan->max_reg_power =
>>> >> > >                  min_t(int, MBM_TO_DBM(power_rule1->max_eirp),
>>> >> > >                        MBM_TO_DBM(power_rule2->max_eirp));
>>> >> > >
>>> >> > > For AP + STA concurrency, it should to maintain 2 group of reg
>>> >> > > rules, one is for AP, another is for STA.
>>> >> >
>>> >> > Can we maintain two power rules in the same channel one for AP and
>>> >> > one for STA. In this way, we can update the power rules in the same
>>> >> > channel for both AP and STA from the reg rules.
>>> >> >
>>> >> > Otherwise, we need to maintain multiple channel lists in sband for
>>> >> > all supported power mode combinations to apply the respective power
>>> >> > rules and build channel flags from the multiple reg rules.
>>> >> > right?
>>> >>
>>> >> If AP+STA is up in the same wiphy/ieee80211_hw, and AP's reg rules is
>>> >> different with STA, then it should maintain muti channel list for
>>> >> each band of the wiphy/ieee80211_hw by my understand.
>>> >
>>> > I don't think that's how it works. You can today have AP/STA
>>> > concurrency on a single wiphy with different netdevs, even with mesh
>>> > or whatever.
>>> >
>>> >> Currently there is only one "struct ieee80211_supported_band
>>> >> *bands[NUM_NL80211_BANDS]"
>>> >> in "struct wiphy".
>>> >>
>>> >> I advise to discuss the AP + STA concurrency in another mail thread
>>> >> since it is not relative with this patch.
>>> >
>>> > I actually explicitly pointed to this thread, but I'm not sure it's so
>>> > clear cut?
>>> >
>>> > If we have completely separate rules here for AP and STA, we probably
>>> > should have different "max_reg_power" values for AP and STA? Maybe
>>> > mesh is treated like AP, maybe not?
>>> >
>>> > But I don't know - does PSD really differ between AP and STA?
>>> >
>>> > Maybe this discussion belongs rather to the power type patch? But that
>>> > didn't add any state!
>>> >
>>> >
>>> > So - does this PSD depend on mode? It kind of seems like it shouldn't
>>> > and then this *isn't* the right place to be discussing this, but if
>>> > PSD does in fact depend on the mode then we should be discussing it
>>> here?
>>> >
>>> > Venkatesh seemed to be worried more about LPI/client power etc. as in
>>> > commit 405fca8a9461 ("ieee80211: add power type definition for 6
>>> > GHz"), but that doesn't add state?
>>> >
>>> > So what gives? From a regulatory POV it seems PSD should be
>>> > independent, but some other things might be dependent on mode?
>>> >
>>> 
>>> As I know, below values maybe all different for the AP and
>>> STATION in the same wiphy/ieee80211_hw, not only PSD.
>>> 
>>> struct ieee80211_reg_rule {
>>>         struct ieee80211_freq_range freq_range;
>>>         struct ieee80211_power_rule power_rule;
>>>         struct ieee80211_wmm_rule wmm_rule;
>>>         u32 flags;
>>>         u32 dfs_cac_ms;
>>>         bool has_wmm;
>>>         s8 psd;
>>> };
>> IMO, Only power rules and PSD info might vary for AP and STATION. Rest
>> of the rules will remains same right?
>> 
> The freq_range may also be different for AP and STATION.
> and reg_rules number also may also be different for AP and STATION.
> 
> for example:
> SUBORDINATE CLIENT of STANDARD POWER reg rules number 2
> reg rule 1: (5945 - 6425 @ 160) (0, 30) (FLAGS 0) (psd flag 1 EIRP 17 
> dB/MHz)
> reg rule 2: (6525 - 6885 @ 160) (0, 30) (FLAGS 0) (psd flag 1 EIRP 17 
> dB/MHz)
> 
> INDOOR AP reg rules number 1
> reg rule 1: (5945 - 7125 @ 160) (0, 24) (FLAGS 0) (psd flag 0 EIRP 0 
> dB/MHz)
> 
>>> 
>>> @Venkateswara, please feel free to give more info to Johannes:)
>>> 
>>> > johannes
>>> 
>>> --
>>> ath11k mailing list
>>> ath11k@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/ath11k

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
