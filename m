Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48834C433EF
	for <ath11k@archiver.kernel.org>; Wed, 24 Nov 2021 07:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXNTVqo8MpQF1+QRZwCOAS9BTZr7AkCTXWZ/B5H1mrI=; b=D5rlsBzxEv88vo
	ZeojmVpGjdlmuT53Z2V/VhD1NeQ/RDesOEhau1bF1q3Q9qNq+9ov0MXtKmOTojeY88kkUVNasvU0K
	V4elQZ5zAIH4XbDzlti937PpDhsDDP4DRV6HL0qDTL6ieLGXYCJU3s/zqM6zpDrtU8gfIMVDCwNyn
	hyAqfpaVqD+Xtq4FbkdJAT5CwS1MmChhRSrgKHnC38MvNkcdNofW1s1ufku3I7lxZ7+QdVEvmdNkn
	ekho1iBvtoQTsUX16RBJhNbhXwKtG1EU9mhzYrIvci7yIZJH14KAK/6+Qq6JdyZFhfL2uCuTXLfZw
	gpIcrBP4sGbZGqRyfKoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpn8e-004BoF-Dh; Wed, 24 Nov 2021 07:56:20 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpn8c-004Bnc-7T
 for ath11k@lists.infradead.org; Wed, 24 Nov 2021 07:56:19 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637740578; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=5t9tIvY11Eq0fURiPaPrJCYPJKTVN17WJRu+6+PU/Aw=;
 b=QLECEq66zgkcqnV/NlJFO8t+3IIPyZ5Ayf31IZlEQhp3wlNeurJvGU6UhfEZO+UyC9TUz5vM
 NJRMjq1tA7ixvhAGBzbbNybGEOmQiu23J4Zh15A3V/O4b3Y2rVd1jpIP+FpAPaFpCS1LfG3g
 s+ot6j+69WdQFSEywV2VTZbb6n0=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 619df02186d0e4d888642692 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Nov 2021 07:56:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9BA95C4360C; Wed, 24 Nov 2021 07:56:16 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 56540C4338F;
 Wed, 24 Nov 2021 07:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 56540C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: P Praneesh <ppranees@codeaurora.org>, <ath11k@lists.infradead.org>,
 <johannes@sipsolutions.net>, <linux-wireless@vger.kernel.org>,
 "Karthikeyan Periyasamy" <periyasa@codeaurora.org>
Subject: Re: [PATCH v3 2/3] ath11k: Refactor update channel list function
References: <1634906227-22028-1-git-send-email-ppranees@codeaurora.org>
 <1634906227-22028-3-git-send-email-ppranees@codeaurora.org>
 <0fb4fec3-4fd0-6e92-b1d9-5bffc0958e97@quicinc.com>
 <87pmqq6lyx.fsf@codeaurora.org>
 <5929130a-7824-acd1-0182-da8fa304c576@quicinc.com>
Date: Wed, 24 Nov 2021 09:56:08 +0200
In-Reply-To: <5929130a-7824-acd1-0182-da8fa304c576@quicinc.com> (Wen Gong's
 message of "Wed, 24 Nov 2021 15:48:03 +0800")
Message-ID: <87ee766l7r.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_235618_344711_253C4A17 
X-CRM114-Status: GOOD (  12.67  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> On 11/24/2021 3:39 PM, Kalle Valo wrote:
>> Wen Gong <quic_wgong@quicinc.com> writes:
>>
>>> On 10/22/2021 8:37 PM, P Praneesh wrote:
>>>
>>> ...
>>>
>>>> ---
>>>> ...
>>>> -			ch->maxpower = channel->max_power * 2;
>>>> -			ch->maxregpower = channel->max_reg_power * 2;
>>>> -			ch->antennamax = channel->max_antenna_gain * 2;
>>>> ...
>>>>    +int ath11k_wmi_update_scan_chan_list(struct ath11k *ar,
>>>> +				     struct scan_req_params *arg)
>>>> ...
>>>> +			ch->maxpower = channel->max_power;
>>>> +			ch->maxregpower = channel->max_reg_power;
>>>> +			ch->antennamax = channel->max_antenna_gain;
>>>> +
>>>> ...
>>> I see it also have another patch to remove the "*2" for power.
>>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=9212c1b9e80a869e732769a4fe7f82d392b219be
>>>
>>> ath11k: send proper txpower and maxregpower values to firmware.
>>>
>>> so are you the same reason to remove "*2" ?
>> I'm not quite getting what you are saying, can you elaborate more? Did
>> this patch break something?
>
> Oh. Not see break anything.
>
> I just want to know why remove the "*2". Did you see any issue if NOT
> remove "*2"?

All I know is that commit 9212c1b9e80a ("ath11k: send proper txpower and
maxregpower values to firmware") mentions about cca getting stuck:

ath11k: send proper txpower and maxregpower values to firmware

Set proper values for max_regpower, max_power, max_antenna_gain as it
is because firmware will convert power values to 0.5dbm steps by
multiplying it with 2.

If txpower is not set, it will lead to cca stuck resulting in latency
issues for QCN9074.

Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01386-QCAHKSWPL_SILICONZ-1

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
