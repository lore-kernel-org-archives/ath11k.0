Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1D4C433FE
	for <ath11k@archiver.kernel.org>; Wed, 27 Apr 2022 05:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MK1xzmIxvdpBDRichGbO3tBL2ga/wP7CGxYtxE+/tQE=; b=XK4ycarxDqv/+d
	AiG8wQi/OKRd4fdbphfOCnIVnWFUHUSm5Kzp74muZyHEjNymaB3F9KMuF5ZwQgu9rwEL9RJQFqURy
	nm7ur1OdKStHmUuSCsPnodk+i7K0xjdJurcLW+QY9eOx1GGCH7SouJXnns9SANsdZPYrCxR5U4QE3
	VL2rtUdKlg0WtK+cwG4sxonCO+Z3+dKr2wY3wzQGXN2G0r4P1qfgiR0o3hbCcmxbw+Z0OeH/DHW5g
	PXe/7sEt1MU4Nipd2P7sgxYE5qKuZJNXzxkEvEH6AOTx7XAQ8e7eA7dgrtznjv02pJ4f8dnOZOtid
	Ng2Vk874Tz306zXZHwkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njaXr-00HVn1-IA; Wed, 27 Apr 2022 05:48:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njaXp-00HVmM-11
 for ath11k@lists.infradead.org; Wed, 27 Apr 2022 05:48:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4B94FB823F4;
 Wed, 27 Apr 2022 05:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2F3C385A7;
 Wed, 27 Apr 2022 05:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651038534;
 bh=YJikARyQpyzsiI/zGqFigsGB6nxfUX79srTEf7Pf2dw=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=WM+i3ZIfB79+TxqsRBjfVDlwsn9rKHjGGwFnRWuGqAwLjO9hiRrmyZGm2/N8MaO5b
 Ve3R4ZlgvJ6QAsL3P9pGN1Yvuy9JIcix4tlYXpaq8HsXIlqriGpNHQC/EiDnm239WQ
 QB6x2bkT2MGJzh7jjKIas0XRz+e9sX3UEyhbHl7Yte14C82mufA4mnPgRtaaUcqd9T
 gu0nbN/466m2DaBEPbTsnxQGOQ7m/QMSyb/wjzwGekXkCTwI6/eOf2Sj6cUcRP/QxF
 HmjLbe/bMt8C5k5d25Z1yLeojGhx1MI2sto14mZ/UisUzZsJ+kmod9EPLJ3JeG6zFV
 yj0sZI7tOWw9A==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH v2 12/19] ath11k: Datapath changes to support WCN6750
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-13-git-send-email-quic_mpubbise@quicinc.com>
 <87ilqvgkgo.fsf@kernel.org>
 <bd125d43-2f0c-f791-7bbe-f4333896722b@quicinc.com>
Date: Wed, 27 Apr 2022 08:48:48 +0300
In-Reply-To: <bd125d43-2f0c-f791-7bbe-f4333896722b@quicinc.com> (Manikanta
 Pubbisetty's message of "Wed, 27 Apr 2022 11:07:17 +0530")
Message-ID: <878rrrgjpb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_224857_259341_B65FBFF7 
X-CRM114-Status: GOOD (  14.59  )
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

> On 4/27/2022 11:02 AM, Kalle Valo wrote:
>> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
>>
>>> HAL RX descriptor for WCN6750 is same as QCN9074, so use
>>> the DP APIs of QCN9074 for WCN6750. There is one change
>>> wrt to REO configuration though, REO configuration for
>>> WCN6750 is same as WCN6855; Therefore, use reo_setup()
>>> of WCN6855 for WCN6750.
>>>
>>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>>> ---
>>>   drivers/net/wireless/ath/ath11k/core.c |  1 +
>>>   drivers/net/wireless/ath/ath11k/hw.c   | 31 +++++++++++++++++++++++++++++++
>>>   2 files changed, 32 insertions(+)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
>>> index 347131a..f65347c 100644
>>> --- a/drivers/net/wireless/ath/ath11k/core.c
>>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>>> @@ -458,6 +458,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>>>   		.num_vdevs = 16 + 1,
>>>   		.num_peers = 512,
>>>   		.supports_suspend = false,
>>> +		.hal_desc_sz = sizeof(struct hal_rx_desc_qcn9074),
>>
>> You mention nothing about this change in the commit log, I'll add that.
>>
>
> I did mention that "HAL RX descriptor for WCN6750 is same as QCN9074",
> you were looking at something specific?

If I'm understanding correctly, by accident hal_desc_sz was not
initialised for qcn9074. If that's the case, it would be good to mention
that in the commit log.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
