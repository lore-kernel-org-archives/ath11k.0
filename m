Return-Path: <SRS0=ve4P=P4=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5907C433F5
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 09:59:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FED1610A3
	for <ath11k@archiver.kernel.org>; Tue,  9 Nov 2021 09:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FED1610A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JE2HeLmf9WOAAkBzIGrJgYm0wc26tBaewDNPeQP5ULs=; b=pOVVhS7bdtVOjMSvv6HZUBvEpH
	ZkgbTSZyyveKXBrXASNUC3Pqctrzm3paeNxAnz4tL5XCB1IGOn3q6AsSUezANWrKJsJIffBK/j/sR
	dz+9uPo4GVUWwZPijnk/rJ+FnEtrOQpMgaa9YOHaa1tymA+9fvTWDsk1KKRk05XsqKNDmT8MwSKHE
	NzmLCH9KNqvp7Hel2rjNM+sx6VH2jUvINHq/Y6XYEzLTy44n43uRvdMCkMSHJHk+SB80maFMYv0bq
	d/6l4b3oWhjVhX8K1nbcEl+X1LfCoUb3txAqmtn2SGtiB7huD9I0NCBncTlLM1nb4PEpjhYbzoqvp
	jHC72EVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNuv-001NhU-Ie; Tue, 09 Nov 2021 09:59:49 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNsT-001Mo3-4Z
 for ath11k@lists.infradead.org; Tue, 09 Nov 2021 09:57:20 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636451839; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JqO118YMY9m3B/RF52ZBcw2MCflSgzOhZYVVhgi3NZQ=;
 b=Mjs5KUUp00GOqpvDDH7fmxWkqVQ1wnBXwi4kV6rfnX2ZUx3g4OxXFLgrWnyzbAHXiNn1dSFw
 J9VTRAV6kvsF1rXTKzYwdZyTCfRR4NwJGvv1YVvmFlVA53rqkQwgFWGZ+OkvZL3iqGEADErJ
 Ij6rKkm0OVs8tjK9VsxOJoH6pcw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 618a45f80f34c3436a9ca275 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Nov 2021 09:57:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B9913C43619; Tue,  9 Nov 2021 09:57:11 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 09C81C4338F;
 Tue,  9 Nov 2021 09:57:10 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 09 Nov 2021 17:57:10 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Venkateswara Naralasetty <vnaralas@qti.qualcomm.com>, Venkateswara
 Naralasetty <vnaralas@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, wgong=codeaurora.org@codeaurora.org
Subject: Re: [PATCH v5] cfg80211: save power spectral density(psd) of
 regulatory rule
In-Reply-To: <67936afa5545b9a5d6eb5ad6931026d7@codeaurora.org>
References: <20210928085211.26186-1-wgong@codeaurora.org>
 <bd649a3d2cf2ea9064d427d633055891@codeaurora.org>
 <cb20427eae96c4551084e4c899618b94@codeaurora.org>
 <2afb1bf6f06cb53f43fe0d354afa4e7c@codeaurora.org>
 <2ed76cff292dcca18326de0407a93821@codeaurora.org>
 <1222384c2bc7d80bf572b65ab17660477bb27300.camel@sipsolutions.net>
 <562080d7fc3b7568811c47a8e8e79156@codeaurora.org>
 <DM8PR02MB8154258563A4F7C805C84B4BE6B59@DM8PR02MB8154.namprd02.prod.outlook.com>
 <0b05f6e555bcb89c49f56279c077ce63@codeaurora.org>
 <18363bc18538ea9b7e8fe28f4c5595c54f3b93d3.camel@sipsolutions.net>
 <67936afa5545b9a5d6eb5ad6931026d7@codeaurora.org>
Message-ID: <6053b0963612057267f00b89e14b9e15@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_015719_208967_CA8C7D11 
X-CRM114-Status: GOOD (  27.60  )
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

do you have comments about my description for PSD?

On 2021-10-26 19:26, Wen Gong wrote:
> On 2021-10-26 04:09, Johannes Berg wrote:
>> On Mon, 2021-10-11 at 15:48 +0800, Wen Gong wrote:
>>> 
>>> > IMO, Only power rules and PSD info might vary for AP and STATION. Rest
>>> > of the rules will remains same right?
>>> >
>>> The freq_range may also be different for AP and STATION.
>>> and reg_rules number also may also be different for AP and STATION.
>>> 
>>> for example:
>>> SUBORDINATE CLIENT of STANDARD POWER reg rules number 2
>>> reg rule 1: (5945 - 6425 @ 160) (0, 30) (FLAGS 0) (psd flag 1 EIRP 17
>>> dB/MHz)
>>> reg rule 2: (6525 - 6885 @ 160) (0, 30) (FLAGS 0) (psd flag 1 EIRP 17
>>> dB/MHz)
>>> 
>>> INDOOR AP reg rules number 1
>>> reg rule 1: (5945 - 7125 @ 160) (0, 24) (FLAGS 0) (psd flag 0 EIRP 0
>>> dB/MHz)
>> 
>> That seems right, but isn't that an orthogonal question?
>> 
>> Here, on this patch, we're discussing what data we should have in the
>> channel information, and it would seem that if it's different for
>> AP/client, then we do need both information stored, so that we can 
>> cope
>> with concurrency between AP and client?
>> 
>> If we additionally need to have different data for the regulatory 
>> rules
>> for AP and client, that might mean we need to go back and actually
>> change the code there *as well*, and then fill in the right fields in
>> this patch?
>> 
>> Unless somehow we're convinced that for this feature we don't need to
>> worry about concurrently using AP and client modes?
>> 
>> johannes
> 
> Currently these patches of mac80211/cfg80211/ieee80211 for LPI/SP/VLP 
> is
> the base patches, to enable the feature of LPI/SP/VLP, it still need 
> other
> patches of lower drivers such as ath11k to enable it. It will not have
> LPI/SP/VLP without patches of ath11k, it means all these patches will
> not take effect.
> 
> When lower driver such as ath11k set max_interfaces of
> ieee80211_iface_combination
> to 1, then it can not start more than 1 interface on the same
> ieee80211_hw/wiphy.
> When STATION interface is up, then AP interface can not start up. AP 
> interface
> can start up after STATION interfacedown. Also when AP interface is up,
> STATION interface can not start up. STATION interface can start up 
> after
> AP interface down.
> 
> I have sent out my ath11k
> patches(https://lore.kernel.org/linux-wireless/20211026111913.7346-1-quic_wgong@quicinc.com/),
> it will allow only one interface
> up simultaneously for the chip which enable LPI/SP/VLP feature in this
> patch: "ath11k: allow only one interface up simultaneously for WCN6855"
> https://lore.kernel.org/linux-wireless/20211026111913.7346-5-quic_wgong@quicinc.com/
> It means it will not have both AP/STA together and these patches of 
> mac80211/
> cfg80211/ieee80211 not need changes and it will not have bugs.
> 
> If there are some chip want to both enable LPI/SP/VLP feature and
> enable AP/STA simultaneously in same ieee80211_hw/wiphy in future,
> then he/she need to refine reg rules and channels of mac80211/cfg80211/
> ieee80211, but at that moment, this patch "cfg80211: save power
> spectral density(psd) of regulatory rule" still not need change.
> Because this patch is change in each reg rule/each channel in a
> low layer, the refine reg rules and channels is a high layer, they
> have no intersection.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
