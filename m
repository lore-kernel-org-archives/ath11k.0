Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF3AC433F5
	for <ath11k@archiver.kernel.org>; Mon, 21 Feb 2022 10:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UiI7jqizOIU+VdVRrtruPzMxhCDD31BnzIBAUtGJy3M=; b=yhVWOLlYD32sNU
	OPebryZbXeFeKREjRzMGMMZiDVmQ0Msg+RcxUeZH1Ac/ymq+fG9j3s8mvvgpKylLukFPTgNn9SsLf
	pZfHlGUdcjb0hI3xYOE4YT5QSpao8HmRGZd4gJHTkSsYCfmSufuIHiE4VPxUg8oaqfsercjON3ld0
	aF3Pw1QDwTmeWYqZtIHQFsQ0SHCqkiDXZ2tb/gzhBlDBR9gWCWfIt3WXYoQ2/Fn+ukAo5NVEyk3mH
	XnL9mTxpHrMzt2KI1L3lQ0jW511c3dVDkAkB7EzStJUzcmPrCfbHv+uRvGqlrdU7mHu6hUzU2aNtv
	i2NUExf/M4CjzTu0MApg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM5m8-004qbi-Ft; Mon, 21 Feb 2022 10:18:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM4p0-004YVp-Bn
 for ath11k@lists.infradead.org; Mon, 21 Feb 2022 09:17:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BFCFF60E95;
 Mon, 21 Feb 2022 09:17:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C9BBC340EB;
 Mon, 21 Feb 2022 09:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645435048;
 bh=iJfhffaxaqucqlfWHbQPFYGDjZ9N6RtcLoLdRTMnIyY=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=W5U/jExpVNMAES/DEUdOWgigHuCG/oVtAsjj8JoBZTk2KEHetUKwb/cFaweqMcNAZ
 Z6kpwWnalZu3uEYgA/hKbYwgNWdczdkAG5opvih6GdxATlVYnbb1hZ94JVrmrJzLCt
 Fij2h2sF3q0hcphj5MGm8M/rEKwxj/Cxcg/O1rq5Vh4894Nx3wCdolR3ZX9srwsl+b
 pazkXtAD5wAfujHr0UukkEKa61if2dhZzzdey4hZ8PjrwItoCeeue6BkvHDyxASYfn
 JkAX8Rh0kpzfmFf/a/tQv96UClGLX1hT+mrObJ1QIOty5JcVw3BAIO6DrLVS6cMwej
 abJ2tgBzjtTQg==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH v2 05/19] ath11k: Remove core PCI references from PCI
 common code
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-6-git-send-email-quic_mpubbise@quicinc.com>
 <87a6fggo0h.fsf@kernel.org>
 <df81787b-3ad4-62b7-7a39-fdca6775bae1@quicinc.com>
Date: Mon, 21 Feb 2022 11:17:25 +0200
In-Reply-To: <df81787b-3ad4-62b7-7a39-fdca6775bae1@quicinc.com> (Manikanta
 Pubbisetty's message of "Mon, 21 Feb 2022 12:25:45 +0530")
Message-ID: <875yp8zihm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_011730_585031_1A1F1ED6 
X-CRM114-Status: GOOD (  13.74  )
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

> On 1/28/2022 3:50 PM, Kalle Valo wrote:
>> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
>>
>>> Remove core PCI and ath11k PCI references(struct ath11k_pci)
>>> from PCI common code. Since, PCI common code will be used
>>> by hybrid bus devices, this code should be independent
>>> from ATH11K PCI references and Linux core PCI references
>>> like struct pci_dev.
>>>
>>> Since this change introduces function callbacks for bus wakeup
>>> and bus release operations, wakeup_mhi HW param is no longer
>>> needed and hence it is removed completely. Alternatively, bus
>>> wakeup/release ops for QCA9074 are initialized to NULL as
>>> QCA9704 does not need bus wakeup/release for register accesses.
>>>
>>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
>>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>>>
>>> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
>>
>> [...]
>>
>>> @@ -651,6 +653,13 @@ struct ath11k_bus_params {
>>>   	bool fixed_bdf_addr;
>>>   	bool fixed_mem_region;
>>>   	bool static_window_map;
>>> +	struct {
>>> +		void (*wakeup)(struct ath11k_base *ab);
>>> +		void (*release)(struct ath11k_base *ab);
>>> +		int (*get_msi_irq)(struct ath11k_base *ab, unsigned int vector);
>>> +		void (*window_write32)(struct ath11k_base *ab, u32 offset, u32 value);
>>> +		u32 (*window_read32)(struct ath11k_base *ab, u32 offset);
>>> +	} ops;
>>>   };
>>
>> Please don't use bus_params for this, I'm starting to suspect that we
>> actually need to remove struct ath11k_bus_params altogether. It would be
>> cleaner to have separate 'struct ath11k_pci_ops' or something like that.
>>
>
> Sure, something like 'struct ath11k_bus_ops' in ath11k_base struct
> would be appropriate.

But we have 'struct ath11k_hif_ops' already, and that's basically
ath11k_bus_ops with a confusing name :) (IIRC HIF means Host InterFace,
or something like that.) So having both ath11k_bus_ops and
ath11k_hif_ops would become even more confusing.

You are basically abstracting out PCI functionality, that's why I
suggested ath11k_pci_ops. But yeah, naming is hard :)

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
