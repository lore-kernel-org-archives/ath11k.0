Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B083C433EF
	for <ath11k@archiver.kernel.org>; Wed, 24 Nov 2021 07:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYAxsZ+7kuJPluUQeWXDJMSvlCioDWRlsDSe9bKtqBY=; b=Y6oXjfYz15iMB3
	feTMftupDM3DA4YSLazrKxFxdX0upqbg0v1vtyi9IWm9wbv9+JW3r1NBtNejZM9aeJ9KeqIch3HVa
	c5T9BjEVz9je1c1VgwRZz6TkO7ARzCMCjxuc/sjCIM6QZvYlME4QU00J+/2mWoDq04hQ7YrxNnm8c
	u8RZ0HWk54ibwEcEIwUXPANZaE2n8BFrAtABHihK72rYOLctnPtQFecYc7M4faIk7nqePq+KiXNwB
	/rCRbTb+nrrHeYHywwkjxmavWDBlFYK22UpsCS3dAPgherjrh/49Hr6E5nzyVdpP43tQ/MjZ8nQnb
	IeSFKR0fhYWYueUEkrIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpn0o-004AXQ-L4; Wed, 24 Nov 2021 07:48:14 +0000
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpn0m-004AW7-9o
 for ath11k@lists.infradead.org; Wed, 24 Nov 2021 07:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1637740092; x=1669276092;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sf/A5/EKWlm3h8AkjLrcNw6H2o9Qz4tmsjQ0iHqtdbI=;
 b=ZMXPBAYFbBLebkpIlPdAwLATJM4RdWjx53LRaUdSg4s5s3C/uBZ8ZmPk
 jgXiijj1gF6dND/cW4vusmFMs6VAThKXHr3cKpMiN2D12EW6ri9WJZ28Q
 6uNHSgY8BxbW33Nqkfo6iJ7ZLGKWOfNOIdbTvYxl3ppH7NAVNXupgv6X0 g=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 23 Nov 2021 23:48:08 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2021 23:48:08 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Tue, 23 Nov 2021 23:48:08 -0800
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Tue, 23 Nov
 2021 23:48:06 -0800
Message-ID: <5929130a-7824-acd1-0182-da8fa304c576@quicinc.com>
Date: Wed, 24 Nov 2021 15:48:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 2/3] ath11k: Refactor update channel list function
Content-Language: en-US
To: Kalle Valo <kvalo@codeaurora.org>
CC: P Praneesh <ppranees@codeaurora.org>, <ath11k@lists.infradead.org>,
 <johannes@sipsolutions.net>, <linux-wireless@vger.kernel.org>, "Karthikeyan
 Periyasamy" <periyasa@codeaurora.org>
References: <1634906227-22028-1-git-send-email-ppranees@codeaurora.org>
 <1634906227-22028-3-git-send-email-ppranees@codeaurora.org>
 <0fb4fec3-4fd0-6e92-b1d9-5bffc0958e97@quicinc.com>
 <87pmqq6lyx.fsf@codeaurora.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <87pmqq6lyx.fsf@codeaurora.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_234812_406269_B1CB73E1 
X-CRM114-Status: UNSURE (   7.36  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 11/24/2021 3:39 PM, Kalle Valo wrote:
> Wen Gong <quic_wgong@quicinc.com> writes:
>
>> On 10/22/2021 8:37 PM, P Praneesh wrote:
>>
>> ...
>>
>>> ---
>>> ...
>>> -			ch->maxpower = channel->max_power * 2;
>>> -			ch->maxregpower = channel->max_reg_power * 2;
>>> -			ch->antennamax = channel->max_antenna_gain * 2;
>>> ...
>>>    +int ath11k_wmi_update_scan_chan_list(struct ath11k *ar,
>>> +				     struct scan_req_params *arg)
>>> ...
>>> +			ch->maxpower = channel->max_power;
>>> +			ch->maxregpower = channel->max_reg_power;
>>> +			ch->antennamax = channel->max_antenna_gain;
>>> +
>>> ...
>> I see it also have another patch to remove the "*2" for power.
>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=9212c1b9e80a869e732769a4fe7f82d392b219be
>>
>> ath11k: send proper txpower and maxregpower values to firmware.
>>
>> so are you the same reason to remove "*2" ?
> I'm not quite getting what you are saying, can you elaborate more? Did
> this patch break something?

Oh. Not see break anything.

I just want to know why remove the "*2". Did you see any issue if NOT 
remove "*2"?

>

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
