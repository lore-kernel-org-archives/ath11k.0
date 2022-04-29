Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597FAC433EF
	for <ath11k@archiver.kernel.org>; Fri, 29 Apr 2022 08:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vdS7cjYIoiqpKZSVOQTYGxW6+Vx/bIM4a43J8F1RjYA=; b=M3lz4e7uipqA4J
	SosLHCeU4X0UVhPTD6OU1ZY/O5q2U71IoAgwOSOer+4RSk6LzOVg/u5uqMLyd8Z1zWpGiB27GHi5+
	MPk+KPAe/xc7j4DmiX5v4i852NEsGJ8xVcLKKjmsEVzlWtPm9dnuXqeQSpZ25t+3mQTMAlLfZmjtt
	KxX26wcKPO8r9kPYwOpkKL7wUBS8AcVuiMVkpNDsnXhpAbIQ75xmPFOGVTW0wtWON/EJhjuVVZ4Cw
	kOJhuDzAd2ERztLITYoHC7itWirQHRdqAPjuPNWWxULnagqTzm9RqPjJfm/ed3huvDckA3hjWeu8m
	SQH5Jhv+7XxDXUumPnxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkMRa-00AJJz-PO; Fri, 29 Apr 2022 08:57:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkMRX-00AJIp-C9
 for ath11k@lists.infradead.org; Fri, 29 Apr 2022 08:57:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A9844CE3009;
 Fri, 29 Apr 2022 08:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910DAC385A4;
 Fri, 29 Apr 2022 08:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651222656;
 bh=G+F4MHPC3gx10dTFgiEJr2YE94YbxB3UX1Lblg+1WzM=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=hDXcu90eqSpCmOFcOynumu4/Wht0U5igvFoEz74Ca1xLPNFRge+ZuuYY12essSgfP
 /P8YWT/wShcPCFHU0TDhFFkIdZteZXUZG5ZZaelM3e4GfT7Y3BrrBIXbg2qJTMPWr/
 tHoax26SmAUW/xTC/YMuoFh4mNfsJqxUqgsMhGVk6qCQxLBBb9bW8ziYnSpNaAuYUu
 Sag7EQYypipun+xKyTnhYPi9V+cPWpIXX5kEYSuXbLCgSFF4TzQvO4E+YQM0Q4T5AC
 Bh54l0/1PPMu6XnS0qcOasmuwSX63YY+ayJEKWNNRrNm12DNrXFIbm1tltq3wsVZzE
 1n2oPVZxzquig==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <mka@chromium.org>
Subject: Re: [PATCH v4 04/12] ath11k: Add register access logic for WCN6750
References: <20220406094107.17878-1-quic_mpubbise@quicinc.com>
 <20220406094107.17878-5-quic_mpubbise@quicinc.com>
 <87czh3gjuq.fsf@kernel.org>
 <2a18a4d3-254b-727e-e96d-90deec61571c@quicinc.com>
Date: Fri, 29 Apr 2022 11:57:32 +0300
In-Reply-To: <2a18a4d3-254b-727e-e96d-90deec61571c@quicinc.com> (Manikanta
 Pubbisetty's message of "Wed, 27 Apr 2022 11:23:52 +0530")
Message-ID: <87levoe077.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_015739_627919_F05854CD 
X-CRM114-Status: GOOD (  13.37  )
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

> On 4/27/2022 11:15 AM, Kalle Valo wrote:
>> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
>>
>>> WCN6750 uses static window mapping to access the HW registers.
>>> Unlike QCN9074 which uses 2nd window for CE and 3rd window
>>> for UMAC register accesses, WCN6750 uses 1st window for UMAC
>>> and 2nd window for CE registers.
>>>
>>> Code is refactored so that WCN6750 can use the existing
>>> ath11k_pci_read/write() APIs for accessing the registers.
>>>
>>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>>> ---
>>>   drivers/net/wireless/ath/ath11k/ahb.c  |  3 ++
>>>   drivers/net/wireless/ath/ath11k/core.h |  2 +
>>>   drivers/net/wireless/ath/ath11k/pci.c  |  4 ++
>>>   drivers/net/wireless/ath/ath11k/pcic.c | 53 +++++++++-----------------
>>>   4 files changed, 28 insertions(+), 34 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
>>> index d73643e3e8dd..d27fc7276977 100644
>>> --- a/drivers/net/wireless/ath/ath11k/ahb.c
>>> +++ b/drivers/net/wireless/ath/ath11k/ahb.c
>>> @@ -42,6 +42,9 @@ const struct ath11k_bus_params ath11k_ahb_hybrid_bus_params = {
>>>   	.fixed_bdf_addr = false,
>>>   	.fixed_mem_region = false,
>>>   	.hybrid_bus_type = true,
>>> +	.static_window_map = true,
>>> +	.dp_window_idx = 1,
>>> +	.ce_window_idx = 2,
>>>   };
>>
>> Even if the values are zero, please initialise the new fields in every
>> bus_params structure:
>>
>> ahb.c:31:static const struct ath11k_bus_params ath11k_ahb_bus_params = {
>> pci.c:118:static const struct ath11k_bus_params ath11k_pci_bus_params = {
>>
>
> Makes sense, should I send another series addressing these?

Please fix that already in this patchset.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
