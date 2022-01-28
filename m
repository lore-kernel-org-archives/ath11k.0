Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6E4C433FE
	for <ath11k@archiver.kernel.org>; Fri, 28 Jan 2022 10:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lY8d+xbGjWdeksy90h4gPVtCmQHDe50HwvApf82RgMI=; b=xdO8RRO19p/T+U
	6crdFIBZF+7kPUTTg9AgfWTCjnurU86ivBrRhAHt7Ty9F++Udpk55skdABrg+9e0CIDIYURHoM2O4
	OpBecpcPyNDYiPWQiIurR8tlXtgqnhwsVsrKHEhvLwyxHmyYexQT1nNfmZW26Elq8l7gg90VR/1su
	0+c5kLODm6EDrNbLJ092HX96gxPDpKFt8GHbe1uJlBIaAGDkgcRaY7fjPFC0zGYUuV0qtN+NZ7eo+
	v9tFEwHgtHtjINnj5VeeXMzT275UWEhnHFjYSbmNHdhPhm0xcj2Z5y7b2CLrnPumAHabqPxx/kc7a
	yyl+5eZ6o7Zzx1s7LmpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDOKN-001Qb5-0e; Fri, 28 Jan 2022 10:17:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDOIk-001Q0v-Ek
 for ath11k@lists.infradead.org; Fri, 28 Jan 2022 10:16:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA24361E48;
 Fri, 28 Jan 2022 10:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E016C340E0;
 Fri, 28 Jan 2022 10:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643364977;
 bh=wBS1aRv8RBZk+XEloyXKx+zfsuc5T0JiJLuJbWY0NBI=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=VKPa2eGqVcj0n4uwza6XCCOBMGt5Q1W8el5/LCN9rQtlYFZUyH6LXG+xHpTXDYFtK
 ldt3UO2F9cYCA4jscnRad9etBQbOO7kvTQdgUdhjPmqmeHMar2KgpJalgBVEjfW7Q/
 FD9tNfWjOCVWaLzaujLCMuC2sx4DG0ZpU4SnGhfhzw6EKJBKrXuX4IfikAHewPWirL
 wroPufVF4rrQSVXBTXdxlsVenfPF2CbUPOgdvL/ONQSv9M6vW4v5wUeTRxgD87B4DH
 jgjhE5Aki/4ZmE1iZ3qu2FzCEGVj1miJQMwwBSczJZRhwnDCH9GjHRwBIn7gFv+rhR
 GcneXS/1fPn7w==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>
Subject: Re: [PATCH v2 02/19] ath11k: Refactor PCI code to support hybrid bus
 devices
References: <1642337235-8618-1-git-send-email-quic_mpubbise@quicinc.com>
 <1642337235-8618-3-git-send-email-quic_mpubbise@quicinc.com>
Date: Fri, 28 Jan 2022 12:16:14 +0200
In-Reply-To: <1642337235-8618-3-git-send-email-quic_mpubbise@quicinc.com>
 (Manikanta Pubbisetty's message of "Sun, 16 Jan 2022 18:16:58 +0530")
Message-ID: <87ee4sgo7l.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_021618_617628_6FEAF4CE 
X-CRM114-Status: GOOD (  17.29  )
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

> --- a/drivers/net/wireless/ath/ath11k/Makefile
> +++ b/drivers/net/wireless/ath/ath11k/Makefile
> @@ -29,7 +29,7 @@ obj-$(CONFIG_ATH11K_AHB) += ath11k_ahb.o
>  ath11k_ahb-y += ahb.o
>  
>  obj-$(CONFIG_ATH11K_PCI) += ath11k_pci.o
> -ath11k_pci-y += mhi.o pci.o
> +ath11k_pci-y += mhi.o pci.o pci_cmn.o

So the end result looks like this:

obj-$(CONFIG_ATH11K_AHB) += ath11k_ahb.o
ath11k_ahb-y += ahb.o pci_cmn.o

obj-$(CONFIG_ATH11K_PCI) += ath11k_pci.o
ath11k_pci-y += mhi.o pci.o pci_cmn.o

Linking pci_cmn.o to both ath11k_pci.ko and ath11k_ahb.ko looks wrong.
Does that even compile if ath11k is linked to the kernel, eg. with
allyesconfig?

One way to solve is to link pci_cmn.o to ath11k.ko. But for another
approach, for a long time I have been thinking about what's the point to
have separate ath11k_pci.ko and ath11k_ahb.ko modules?,They are very
small anyway compared to ath11k.ko. So my ideais that should we have
just one ath11k.ko module, it contains all AHB and PCI code as well, and
ath11k_pci.ko and ath11k_ahb.ko would not be created anymore. It would
simplify things a bit, especially here.

Thoughts?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
