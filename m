Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCF5C433F5
	for <ath11k@archiver.kernel.org>; Fri, 28 Jan 2022 10:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MCnDxEOaGlEb9sV42y/5y4oO+yy6zAipVP7nnnLbzmo=; b=1T4XoE4IELPCdg
	sw9pXrTUfAloFg2ufd83MKoOz+PiCqMGjl/LhvCtWjjowJFl8zaU6b/dIOj5pdbOF8b8tEv8ck7e5
	a+tjtIOmga7PjG10NtQFQeoh1DRU26Sk7/VSzWeomu0BiHxk8qdhY8NUn9rsuYH9Y6dE+bqNaLn8b
	UfWNBuqsP7ia8IElWWTLMfVRoQtr5igJ0jpSHgpjAvROyELHC6ZWYbY5/f8G2JoGniFhSaeXA/IeD
	pgt96N9GPfBy6DixqB6n/Y4x/LL3aumFn/2t5QIjHjx+5H5d2LkcfGmXTRTP2FazUS4ffOsjt5D0g
	vIzaKqz2XXXBEUKFybSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDOBo-001OCD-L6; Fri, 28 Jan 2022 10:09:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDOAC-001Nl6-SX
 for ath11k@lists.infradead.org; Fri, 28 Jan 2022 10:07:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7710EB818E0;
 Fri, 28 Jan 2022 10:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4B13C340E6;
 Fri, 28 Jan 2022 10:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643364446;
 bh=f6PBkZrbiXplSyJ9SctAtOlwopu9lunMvBAUlYg6D7g=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=BxXiOoMbcRuJmnVWD08edF4mMqvedPC7E0EuIxK0D5sTwf2JXOMtHgd8BG9wGFdGX
 0pEZrtdYyrsnhw69G9Bv5jw+A1mv1Z5QnN3ysjbfrJQquqqrYN4pQ0a8aAtI8i6On3
 RSRwZRpIxWJ+XQWL3qY8gJvHY4snzRfEY0kFos898pBXR9oVz/4/BD2E7NyFU06aZs
 /Tgg/hxG0666i3CY53idv7Sosaz5nxO6SiCGeJDdy6nq7z6mxPfUvd7pnjo7VhH0cO
 hMHrW4Op5D+xXfdqlBiSmMYMO3GUjF6PLP2tPmzWzCZGgFIm7lxIOwQMkiTZSG2pWO
 vJksRwr+x3f/w==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH v2 00/19] add support for WCN6750
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
Date: Fri, 28 Jan 2022 12:07:22 +0200
In-Reply-To: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 (Manikanta Pubbisetty's message of "Sun, 16 Jan 2022 18:16:56 +0530")
Message-ID: <87ilu4gomd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_020729_242296_899C0B8D 
X-CRM114-Status: GOOD (  26.05  )
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

> WCN6750 is non-DBS 2x2 11AX chipset. Unlike QCA6390/WCN6855 which
> are DBS (dual band simultaneous) solutions (2 LMACs), WCN6750 has a
> single LMAC supporting 2G, 5G and 6G bands. It can be operated only
> on one band at any given point.
>
> WCN6750 is a PCIe device. Unlike other supported ATH11K PCIe devices
> which are directly attached to APSS (Application Processor SubSystem),
> WCN6750 is not attached to APSS, it is attached to the WPSS
> (Wireless Processor SubSystem) Q6 processor, the FW which runs on the
> Q6 processor will enumerate the PCIe device. Since APSS is unaware of
> such a device, it has to be registered as a platform device(AHB) to the
> kernel for device probing. Like other AHB devices, remoteproc APIs are
> used to boot up or shutdown of WCN6750.
>
> WCN6750 uses both AHB and PCIe ATH11K APIs for it's operation.
> It uses AHB APIs for device probe and booting of the remote processor.
> Once device is booted up, it uses ATH11K PCIe APIs for initialization
> and register access. Hence, it is referred as hybrid bus device in
> the rest of this series.
>
> Since the chip is enumerated by WPSS Q6, device information like
> BAR and BAR size is not known to the APSS processor. A new QMI message
> called device info QMI request will be sent to the target for fetching
> these details.
>
> STA and AP modes are supported; Basic connectivity and ping are
> verified in both the modes.
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>
> Note:
> *	Remoteproc driver changes for WCN6750 which takes care of
> 	downloading the FW and booting of Q6 processor are under
> 	upstream review.
> 	Link: https://patchwork.kernel.org/project/linux-remoteproc/list/?series=582475

This is a very good overview, thanks for that. But I think something
which is not clearly mentioned here is that this only works on Qualcomm
Snapdragon SoC, right? So even though WCN6750 is a PCI device, it cannot
be attached to any platform. It would be good to emphasise that.

> Manikanta Pubbisetty (19):
>   ath11k: PCI changes to support WCN6750
>   ath11k: Refactor PCI code to support hybrid bus devices
>   ath11k: Choose MSI config based on HW revision
>   ath11k: Refactor MSI logic
>   ath11k: Remove core PCI references from PCI common code
>   ath11k: Add HW params for WCN6750
>   ath11k: Add bus params for WCN6750
>   ath11k: Add register access logic for WCN6750
>   ath11k: Fetch device information via QMI for WCN6750
>   ath11k: Add QMI changes for WCN6750
>   ath11k: HAL changes to support WCN6750
>   ath11k: Datapath changes to support WCN6750
>   ath11k: Fix RX de-fragmentation issue on WCN6750
>   ath11k: Do not put HW in DBS mode for WCN6750
>   ath11k: WMI changes to support WCN6750
>   ath11k: Update WBM idle ring HP after FW mode on
>   ath11k: Add support for WCN6750 device
>   ath11k: Add support for targets without trustzone
>   dt: bindings: net: add bindings of WCN6750 for ath11k

19 patches is a lot to chew on in one go, my recommendation is to have
max 10-12 patches per set.

In this case having three patchsets would make it a lot easier for
reviewers, but not sure how to split them. Maybe you could submit these
patches separate for preparing WCN6750 support, after a quick look they
seem pretty independent:

  ath11k: Fetch device information via QMI for WCN6750
  ath11k: HAL changes to support WCN6750
  ath11k: Fix RX de-fragmentation issue on WCN6750
  ath11k: Do not put HW in DBS mode for WCN6750
  ath11k: WMI changes to support WCN6750

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
