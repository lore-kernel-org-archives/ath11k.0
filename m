Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F0AC433F5
	for <ath11k@archiver.kernel.org>; Thu,  3 Mar 2022 02:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgqRdxUVTE93jPVzuv3jXM7P8W6jmDFzSWWE94RmpdM=; b=yepTUrHuBBaqVxlR/0ScCIig4S
	H3rkH+/hX9NhFpU9elHHEVkS0XVqq7qfbV5XNYqXaq0n22KG0Ku6iLiapCHlqk342DU9y2decagx/
	TrRPCYlJBHMEpHN4oEGEyHevpAosGEnPgHNyLYXtsvt5tVjERIcToDUUkUeLqiNrLyi9YpI5AqSrH
	E8C3IdsHJNPMDmlqCu/bDyyicp9ZTG8MNuXu0K3lwbokzqJrMRqbQY+YwTVWFsDKk8kJiN40IFPsA
	sN7LV7ah+rhEw55rV0XZyfbjofvBnPLHIatl1olwWSGe69dN+l+PTskW0q/4flQvTugEB2PumTjjB
	4UyBxWkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPayF-004zAg-KD; Thu, 03 Mar 2022 02:13:35 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPay3-004z8Q-TI
 for ath11k@lists.infradead.org; Thu, 03 Mar 2022 02:13:25 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1646273602; h=Message-ID: References: In-Reply-To: Subject:
 Subject: Cc: To: To: From: From: Date: Content-Transfer-Encoding:
 Content-Type: MIME-Version: Sender: Sender;
 bh=d0CRU1DHzcvr19xaz+D8Zc0p7ulYliZaXMQKJIq75Ts=;
 b=xKIotFB9HMXcoJ6cMcDShKNEItLGe71N0hKiM1P2Qj3aAtL3SMUtPNLEpDMF5QB7fnBiU/iD
 ZGe3yJE7jRUPVPnvxlZwrc5WvB796VZQvmVnL3AHNhLWhFkNqO7IT77/AzvN+ptHa8vzac8z
 VYbC+Ih1CLHOK+IDOHsuLkiPujQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 62202441e1c212bb9c220932 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Mar 2022 02:13:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EBE50C4361A; Thu,  3 Mar 2022 02:13:20 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: wgong)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B9085C4338F;
 Thu,  3 Mar 2022 02:13:19 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 03 Mar 2022 10:13:19 +0800
From: Wen Gong <wgong@codeaurora.org>
To: Johannes Berg <johannes@sipsolutions.net>, johannes.berg@intel.com
Cc: Venkateswara Naralasetty <vnaralas@qti.qualcomm.com>, Venkateswara
 Naralasetty <vnaralas@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, wgong=codeaurora.org@codeaurora.org,
 quic_adisi@quicinc.com, quic_vnaralas@quicinc.com
Subject: Re: [PATCH v5] cfg80211: save power spectral density(psd) of
 regulatory rule
In-Reply-To: <68b700b371399db0ed4174d20ddd0b8b@codeaurora.org>
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
 <6053b0963612057267f00b89e14b9e15@codeaurora.org>
 <68b700b371399db0ed4174d20ddd0b8b@codeaurora.org>
Message-ID: <7761dc6f736b04cce1137b68a7132ac7@codeaurora.org>
X-Sender: wgong@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_181324_078426_885145BE 
X-CRM114-Status: GOOD (  17.57  )
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

Do you have comments for this patch?

Currently these patches of mac80211/cfg80211/ieee80211 for LPI/SP/VLP is
the base patches, to enable the feature of LPI/SP/VLP, it still need 
other
patches of lower drivers such as ath11k to enable it. It will not have
LPI/SP/VLP without patches of ath11k, it means all these patches of
mac80211/cfg80211 will not take effect.

When lower driver such as ath11k set max_interfaces of 
ieee80211_iface_combination
to 1, then it can not start more than 1 interface on the same 
ieee80211_hw/wiphy.
When STATION interface is up, then AP interface can not start up. AP 
interface
can start up after STATION interface down. Also when AP interface is up,
STATION interface can not start up. STATION interface can start up after
AP interface down.

I have sent out my ath11k v2 
patches(https://patchwork.kernel.org/project/linux-wireless/list/?series=601212),
it will allow only one interface
up simultaneously for the chip which enable LPI/SP/VLP feature in this
patch: "ath11k: allow only one interface up simultaneously for WCN6855"
https://patchwork.kernel.org/project/linux-wireless/patch/20211224085236.9064-5-quic_wgong@quicinc.com/
It means it will not have both AP/STA together and these patches of 
mac80211/
cfg80211/ieee80211 not need changes and it will not have bugs.

If there are some chip want to both enable LPI/SP/VLP feature and
enable AP/STA simultaneously in same ieee80211_hw/wiphy in future,
then he/she need to refine reg rules and channels of mac80211/cfg80211/
ieee80211, but at that moment, this patch "cfg80211: save power
spectral density(psd) of regulatory rule" still not need change.
Because this patch is change in each reg rule/each channel in a
low layer, the refine reg rules and channels is a high layer, they
have no intersection.

On 2021-12-06 16:48, Wen Gong wrote:
> Hi Johannes,
> 
> Are you waiting for the AP/STA concurrency patches, then apply this 
> patch?
> 
> On 2021-11-09 17:57, Wen Gong wrote:
>> Hi Johannes,
>> 
>> do you have comments about my description for PSD?
>> 
>> On 2021-10-26 19:26, Wen Gong wrote:
>>> On 2021-10-26 04:09, Johannes Berg wrote:
>>>> On Mon, 2021-10-11 at 15:48 +0800, Wen Gong wrote:
>>>>> 
>>>>> > IMO, Only power rules and PSD info might vary for AP and STATION. Rest
>>>>> > of the rules will remains same right?
>>>>> >
>>>>> The freq_range may also be different for AP and STATION.
>>>>> and reg_rules number also may also be different for AP and STATION.
>>>>> 
>>>>> for example:
>>>>> SUBORDINATE CLIENT of STANDARD POWER reg rules number 2
>>>>> reg rule 1: (5945 - 6425 @ 160) (0, 30) (FLAGS 0) (psd flag 1 EIRP 
>>>>> 17
>>>>> dB/MHz)
>>>>> reg rule 2: (6525 - 6885 @ 160) (0, 30) (FLAGS 0) (psd flag 1 EIRP 
>>>>> 17
>>>>> dB/MHz)
>>>>> 
>>>>> INDOOR AP reg rules number 1
>>>>> reg rule 1: (5945 - 7125 @ 160) (0, 24) (FLAGS 0) (psd flag 0 EIRP 
>>>>> 0
>>>>> dB/MHz)
>>>> 
>>>> That seems right, but isn't that an orthogonal question?
>>>> 
>>>> Here, on this patch, we're discussing what data we should have in 
>>>> the
>>>> channel information, and it would seem that if it's different for
>>>> AP/client, then we do need both information stored, so that we can 
>>>> cope
>>>> with concurrency between AP and client?
>>>> 
>>>> If we additionally need to have different data for the regulatory 
>>>> rules
>>>> for AP and client, that might mean we need to go back and actually
>>>> change the code there *as well*, and then fill in the right fields 
>>>> in
>>>> this patch?
>>>> 
>>>> Unless somehow we're convinced that for this feature we don't need 
>>>> to
>>>> worry about concurrently using AP and client modes?
>>>> 
>>>> johannes
>>> 
>>> Currently these patches of mac80211/cfg80211/ieee80211 for LPI/SP/VLP 
>>> is
>>> the base patches, to enable the feature of LPI/SP/VLP, it still need 
>>> other
>>> patches of lower drivers such as ath11k to enable it. It will not 
>>> have
>>> LPI/SP/VLP without patches of ath11k, it means all these patches will
>>> not take effect.
>>> 
>>> When lower driver such as ath11k set max_interfaces of
>>> ieee80211_iface_combination
>>> to 1, then it can not start more than 1 interface on the same
>>> ieee80211_hw/wiphy.
>>> When STATION interface is up, then AP interface can not start up. AP 
>>> interface
>>> can start up after STATION interfacedown. Also when AP interface is 
>>> up,
>>> STATION interface can not start up. STATION interface can start up 
>>> after
>>> AP interface down.
>>> 
>>> I have sent out my ath11k
>>> patches(https://lore.kernel.org/linux-wireless/20211026111913.7346-1-quic_wgong@quicinc.com/),
>>> it will allow only one interface
>>> up simultaneously for the chip which enable LPI/SP/VLP feature in 
>>> this
>>> patch: "ath11k: allow only one interface up simultaneously for 
>>> WCN6855"
>>> https://lore.kernel.org/linux-wireless/20211026111913.7346-5-quic_wgong@quicinc.com/
>>> It means it will not have both AP/STA together and these patches of 
>>> mac80211/
>>> cfg80211/ieee80211 not need changes and it will not have bugs.
>>> 
>>> If there are some chip want to both enable LPI/SP/VLP feature and
>>> enable AP/STA simultaneously in same ieee80211_hw/wiphy in future,
>>> then he/she need to refine reg rules and channels of 
>>> mac80211/cfg80211/
>>> ieee80211, but at that moment, this patch "cfg80211: save power
>>> spectral density(psd) of regulatory rule" still not need change.
>>> Because this patch is change in each reg rule/each channel in a
>>> low layer, the refine reg rules and channels is a high layer, they
>>> have no intersection.

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
