Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10DF1C433F5
	for <ath11k@archiver.kernel.org>; Fri, 28 Jan 2022 12:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+KaNogfLMYVTAcmSospvCPIN2BaRkiX+nhuZI+TpRqM=; b=zByhKj9KoiZSj4
	ddlBfGoSl+t6zYLV+GAFe3UAuJXutlqmcY0EkzZDFPRWzyeEkzB0voHXyqmIShBxc7Zy8rahF1gwp
	wmjrdOe+8R5nmX0I/apzb0Z5gVMwa5Q4SFFj1SVONZrobLwketxwSM/OEZ82ojFJcsRgsnoexYXcx
	OnmhaLDclIhVUJOwmKeuUyMS/NZO/wGSX2SnEhOYxTqVjBf+MXHoDbzBcplA3Q1ZTxfvS+Xo3RhBk
	IzmBCdBFpYl4xjYYqTMa3SwPhzMgkmEBrvc9+1Nkspcx96fwlffJ0t8lhngBqNEWEXUfpuktV/Ba2
	qJD+Cy7JqtgMX0pU64aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDQ8j-001rcT-62; Fri, 28 Jan 2022 12:14:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDQ8g-001rbH-Ft
 for ath11k@lists.infradead.org; Fri, 28 Jan 2022 12:14:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0509E618C7;
 Fri, 28 Jan 2022 12:14:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B94C340E6;
 Fri, 28 Jan 2022 12:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643372041;
 bh=Gl0idB2Sk6mpsfiD/yCwRa26c7O/F/PjGnyjeYSw0QY=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=k1tDv3aQd6V7ZaOzFVGTMG6poo5NV4P38Pe4gM67NZsrgBTY6umJx87MdVxTJZJ+m
 UK1Nfb8nBBpNkb2w1ku9n+hNjOngR1doVyedmxQmrkv2c4mg+mVg0rd0/JRPUSuiO4
 ICaf0bm6alsaJIcMVoyhljDn+iCFHcZcQxnKQXNnQb4OW9Kzbs5lgWiX7LKR3+YmdQ
 j1nNYlXE8nKHAswzLcGIeKfkLJ57qN3yez5zjGjpqnDVLx+fGkxQLFycemeIykyCZi
 e+sMnlQ4ajYif0BjUQJR+XJKDS9FmVa5K6xX+bGm+RNgyJQFW5FOw2lPqw4qhAd3aJ
 HBUoFo3ugWAhQ==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH v2 02/19] ath11k: Refactor PCI code to support hybrid bus
 devices
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-3-git-send-email-quic_mpubbise@quicinc.com>
Date: Fri, 28 Jan 2022 14:13:55 +0200
In-Reply-To: <1642337235-8618-3-git-send-email-quic_mpubbise@quicinc.com>
 (Manikanta Pubbisetty's message of "Sun, 16 Jan 2022 18:16:58 +0530")
Message-ID: <87h79of470.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_041402_591616_D708CA00 
X-CRM114-Status: GOOD (  17.84  )
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

> Unlike other ATH11K PCIe devices which are enumerated by APSS
> processor (Application Processor SubSystem), WCN6750 gets
> enumerated by the WPSS Q6 processor (Wireless Processor SubSystem);
> In simple terms, though WCN6750 is PCIe device, it is not attached
> to the APSS processor, APSS will not know of such a device being
> present in the system and therefore WCN6750 will be registered as
> a platform device to the kernel core like other supported AHB
> devices.
>
> WCN6750 uses both AHB and PCI APIs for it's operation, it uses
> AHB APIs for device probe/boot and PCI APIs for device setup
> and register accesses; Because of this nature, it is referred
> as a hybrid bus device.
>
> Refactor PCI code to support hybrid bus devices like WCN6750.
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

[...]

> --- /dev/null
> +++ b/drivers/net/wireless/ath/ath11k/pci_cmn.c

[...]

> +static inline void ath11k_pci_select_window(struct ath11k_pci *ab_pci, u32 offset)
> +{
> +	struct ath11k_base *ab = ab_pci->ab;
> +
> +	u32 window = FIELD_GET(ATH11K_PCI_WINDOW_VALUE_MASK, offset);
> +
> +	lockdep_assert_held(&ab_pci->window_lock);
> +
> +	if (window != ab_pci->register_window) {
> +		iowrite32(ATH11K_PCI_WINDOW_ENABLE_BIT | window,
> +			  ab->mem + ATH11K_PCI_WINDOW_REG_ADDRESS);
> +		ioread32(ab->mem + ATH11K_PCI_WINDOW_REG_ADDRESS);
> +		ab_pci->register_window = window;
> +	}
> +}

So the style used in ath11k is ath11k_<filename>_foo, so that a function
ath11k_pci_foo() should be in pci.c. This patch is now breaking that
style. Maybe pci_cmn.c should renamed to cpci.c, pcic.c or something
like that? Then the function prefix could be ath11k_cpci_, ath11k_pcic_
or similar.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
