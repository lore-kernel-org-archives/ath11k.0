Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C7CC433F5
	for <ath11k@archiver.kernel.org>; Fri, 29 Apr 2022 08:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZFSPan3aSkVlg1hQNZ2UkiCUyinkcuqoKxXwQ76kWI=; b=vd/S00Z/l+FDD5
	XwLcRenV/TNlGQRMqTk/oBjlwziZyQg/foKEL0Xjt24EYMEYbk9cVtbmxfqxIHdN27jZWJjPhGcHG
	EJZoWy8I/DLcll0hC+S7NGY911ix5CeSq+3KRteVruIbziqpT6VDBTJEm+d79S3TM761A3CEqqIKt
	DLv7yKCp4BT6QGgoUnLkJX6Lz9/nkOHRzeZveto2h8Fhu9FHq/2Qe2uoO0IMIhKFAGhr0vkjWmxyt
	Q75vRETaFqdZ2r5uDESG1D7F4SUvxPksrIaFlsm0Ql5uTghWGEF600UTSUL3puN8YgmPYlQciuPkh
	+byQx85BzL0Mg1zErQVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkMQx-00AJC6-3c; Fri, 29 Apr 2022 08:57:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkMQt-00AJBS-GX
 for ath11k@lists.infradead.org; Fri, 29 Apr 2022 08:57:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1FF61B8333A;
 Fri, 29 Apr 2022 08:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911CDC385A4;
 Fri, 29 Apr 2022 08:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651222616;
 bh=6d6nB68RER/KEqDI3K1SemCxTzjGArif2Q6UeQcHHIQ=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=QXxGlSu9zcBdhwptMLcVEmvmko0yj9jWMTqH4cxu9kIsYbRKFrqqbgC4WKDkVtK/S
 XGh1PFtogCFkALjsvOg2VfCcTfet+yV4L0eXc4aG1inaBot4ICnO5PJBUNy+DMZ483
 Xl00aHPtw1ylT45R0isLsJ1a9PbVRetf8GSnObAYHjYORdwg2CwHuGJ+vySU26n418
 8/+vRuzH7AAEu6kkU02AZb+qeZ36zuFIXmlHOhuaVZmCNkgWkJbmMuQPGfeAcO9ejI
 wQubVj1jzU2r0bF6Ey0sVN8f30udBXu+3Sjp0x7FWQdnWRC/v7dl3sTBhj7uR9RP/i
 h6fWTxWqWvMxw==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH v2 12/19] ath11k: Datapath changes to support WCN6750
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-13-git-send-email-quic_mpubbise@quicinc.com>
 <87ilqvgkgo.fsf@kernel.org>
 <bd125d43-2f0c-f791-7bbe-f4333896722b@quicinc.com>
 <878rrrgjpb.fsf@kernel.org>
 <d377a595-c816-30f6-0386-442e10a81b9e@quicinc.com>
Date: Fri, 29 Apr 2022 11:56:51 +0300
In-Reply-To: <d377a595-c816-30f6-0386-442e10a81b9e@quicinc.com> (Manikanta
 Pubbisetty's message of "Wed, 27 Apr 2022 11:26:41 +0530")
Message-ID: <87pml0e08c.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_015659_886989_BC807045 
X-CRM114-Status: GOOD (  18.39  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:

> On 4/27/2022 11:18 AM, Kalle Valo wrote:
>> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
>>
>>> On 4/27/2022 11:02 AM, Kalle Valo wrote:
>>>> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
>>>>
>>>>> HAL RX descriptor for WCN6750 is same as QCN9074, so use
>>>>> the DP APIs of QCN9074 for WCN6750. There is one change
>>>>> wrt to REO configuration though, REO configuration for
>>>>> WCN6750 is same as WCN6855; Therefore, use reo_setup()
>>>>> of WCN6855 for WCN6750.
>>>>>
>>>>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
>>>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>>>>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>>>>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>>>>>
>>>>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>>>>> ---
>>>>>    drivers/net/wireless/ath/ath11k/core.c |  1 +
>>>>>    drivers/net/wireless/ath/ath11k/hw.c   | 31 +++++++++++++++++++++++++++++++
>>>>>    2 files changed, 32 insertions(+)
>>>>>
>>>>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
>>>>> index 347131a..f65347c 100644
>>>>> --- a/drivers/net/wireless/ath/ath11k/core.c
>>>>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>>>>> @@ -458,6 +458,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>>>>>    		.num_vdevs = 16 + 1,
>>>>>    		.num_peers = 512,
>>>>>    		.supports_suspend = false,
>>>>> +		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),
>>>>
>>>> You mention nothing about this change in the commit log, I'll add that.
>>>>
>>>
>>> I did mention that "HAL RX descriptor for WCN6750 is same as QCN9074",
>>> you were looking at something specific?
>>
>> If I'm understanding correctly, by accident hal_desc_sz was not
>> initialised for qcn9074. If that's the case, it would be good to mention
>> that in the commit log.
>>
>
> If I understand your comment correctly, since HAL RX descriptor is
> related to data path, I thought of adding it as part of the data path
> patch.

Ah, now I understand better. I thought you were setting hal_desc_sz for
qcn9074, but now I checked it and you were actually setting it for
wcn6750. It would be better to set hal_desc_sz in patch "ath11k: Add HW
params for WCN6750".

Actually I would prefer that _all_ existing hw_params fields for wcn6750
would be initialised in patch "ath11k: Add HW params for WCN6750", even
if just set to null or invalid values. That way it's easier to track
that we are not missing any fields and makes it easier to review other
patches. But this is getting more to nitpicking so definitely not a hard
requirement.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
