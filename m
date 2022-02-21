Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52941C433F5
	for <ath11k@archiver.kernel.org>; Mon, 21 Feb 2022 10:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GlFAjjq0SItg7ftMqFI1E5Ll+2prG5Gn2zUWLnH4gfg=; b=T4cwETa98DxPnA
	KK+8Hd/Fd17KjOwpERb2c6JaKFvIxhk5umzAMiLcedG0Ibz4ubbzkovk5103HOb/Tg4sLnwB5BBiX
	XeL+L5XIdAmfXgzW03QwaYkdPlVTdOOXE5qVo8tIGabhR82+QS27aNZKy4QzQA6sGxWHlsbW3zfCI
	OREEqG39x3AnoTaKFxtzaZ615jL6GGi842iJY/tP6DB8vEZwIRwq3nMMaVcuemrABfh/OOZcJVMJk
	kfcr5o2aJsDK8jEpwO7e8nv0HMA2VeDNyCyCODZ01bdxyOKSEbToo0OA0yGoFjBrM7vmXsDBlW7sT
	CVI60sIU5exfuN4uvWNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM5mt-004r38-5h; Mon, 21 Feb 2022 10:19:23 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM4sa-004ZQC-1s
 for ath11k@lists.infradead.org; Mon, 21 Feb 2022 09:21:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3F724CE0E80;
 Mon, 21 Feb 2022 09:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD11C340EB;
 Mon, 21 Feb 2022 09:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645435268;
 bh=G9qsOIaU98YL4dvaSW0KBRUIIJZ5fR+aEheIpSP0fSU=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=YopDpMVtruprOaV/SZ/FMFShUXL8Hjwbo0vMR12S3RDVmQTEfu+fKqiHzmU3/zkYz
 UGxCl8MwUZIKXLUBGsYaWUiQab+v3I5Sz4dStrOAg7B/V+Sl/Gts/wW428RZ3htYES
 v8nYZdwN61GyoUVwnnR0G6LPdiKX4QP7MaaBz4F3FWDd2sQTJSigCZFHqdMTuNuIFB
 EGqG4xh7qdHn9fICcVWCtFeIuxlNELucANaysdqKUIzHqDrqoSGokhIHloWOL7cLwm
 YOi/FD20HkWz/sUshQmkQU6Q7oYk1fipT710V3gArlPuzU5FFBnguKeZEI9moMs94U
 3PWzatYZl25/w==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH v2 05/19] ath11k: Remove core PCI references from PCI
 common code
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-6-git-send-email-quic_mpubbise@quicinc.com>
 <87a6fggo0h.fsf@kernel.org> <871r0sgn7n.fsf@kernel.org>
 <3b8b03ba-c6a1-d794-79e5-f244bc1dffae@quicinc.com>
Date: Mon, 21 Feb 2022 11:21:04 +0200
In-Reply-To: <3b8b03ba-c6a1-d794-79e5-f244bc1dffae@quicinc.com> (Manikanta
 Pubbisetty's message of "Mon, 21 Feb 2022 12:37:41 +0530")
Message-ID: <87wnhoy3r3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_012112_503577_DB6D7718 
X-CRM114-Status: GOOD (  21.05  )
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

> On 1/28/2022 4:07 PM, Kalle Valo wrote:
>> Kalle Valo <kvalo@kernel.org> writes:
>>
>>> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
>>>
>>>> Remove core PCI and ath11k PCI references(struct ath11k_pci)
>>>> from PCI common code. Since, PCI common code will be used
>>>> by hybrid bus devices, this code should be independent
>>>> from ATH11K PCI references and Linux core PCI references
>>>> like struct pci_dev.
>>>>
>>>> Since this change introduces function callbacks for bus wakeup
>>>> and bus release operations, wakeup_mhi HW param is no longer
>>>> needed and hence it is removed completely. Alternatively, bus
>>>> wakeup/release ops for QCA9074 are initialized to NULL as
>>>> QCA9704 does not need bus wakeup/release for register accesses.
>>>>
>>>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
>>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>>>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>>>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>>>>
>>>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>>>
>>> [...]
>>>
>>>> @@ -651,6 +653,13 @@ struct ath11k_bus_params {
>>>>   	bool fixed_bdf_addr;
>>>>   	bool fixed_mem_region;
>>>>   	bool static_window_map;
>>>> +	struct {
>>>> +		void (*wakeup)(struct ath11k_base *ab);
>>>> +		void (*release)(struct ath11k_base *ab);
>>>> +		int (*get_msi_irq)(struct ath11k_base *ab, unsigned int vector);
>>>> +		void (*window_write32)(struct ath11k_base *ab, u32 offset, u32 value);
>>>> +		u32 (*window_read32)(struct ath11k_base *ab, u32 offset);
>>>> +	} ops;
>>>>   };
>>>
>>> Please don't use bus_params for this, I'm starting to suspect that we
>>> actually need to remove struct ath11k_bus_params altogether. It would be
>>> cleaner to have separate 'struct ath11k_pci_ops' or something like that.
>>
>> And after looking at this more it seems .get_msi_irq is the only
>> function which actually has two different implementations. The other
>> four are either run or not run, there's no difference in the
>> implementation. So would it be cleaner to have a some sort check within
>> the function for these other four, instead using function pointers?
>>
>
> WCN6750 has it's own wakeup() and release(), I'll send that patch
> separately. QCN9074 doesn't need wakeup() and release() functions.
>
> The intention of the patch was to remove all Linux and ATH11K PCI
> reference like struct pci_dev and ath11k_pci in the common code.
> TBH, WCN6750 doesn't need these references since it is a AHB device
> in ATH11K. If we have these references in common code, first thing is
> the code will look kind of messed up and another aspect is we need to
> enable CONFIG_PCI unnecessarily. This was the reason behind defining
> other two callbacks window_write32() and read32().

Ah, makes sense.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
