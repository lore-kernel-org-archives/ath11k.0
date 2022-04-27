Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A69C433EF
	for <ath11k@archiver.kernel.org>; Wed, 27 Apr 2022 05:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMLG+AZXHuKfTa/EUWSFJTZSWKq6hZid8kqR5pVcUXk=; b=Z/BbpB5l6g/G0D
	vVdrmsAfsHrQrGq5mpNzuQtMR31CB3VroeWK1/zp1DUdXNaO+6NUr+E95LzYgXFfJqDGqkykkmvmJ
	AIsuuMvabpLFmaQLdeZoEbqQ5qFhy5oPKPp+4fWH66BcjEAk8i/w8IhVi3I/bxjyjUGqVNV+71zEF
	tCNukMjA5v9EmQ91/NnQGpfQfyZitABuqNrtvRFy1kwRT8xGuQEexW9Rzp8Xz0oHlRhbOB2NTev7r
	qFkm6kdxwrZPpOUtDJ0c7jZTWcD5cFKl95kOjxGYbX/GpqnmArQDghrUq1z0958Ps/QWPIXDe8kRY
	D3gpo/IbuPWcJ2g8crpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njacD-00HW78-86; Wed, 27 Apr 2022 05:53:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njacA-00HW6c-CI
 for ath11k@lists.infradead.org; Wed, 27 Apr 2022 05:53:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B889461757;
 Wed, 27 Apr 2022 05:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5D0C385A9;
 Wed, 27 Apr 2022 05:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651038805;
 bh=hz7bi9Pgapr+ftLdyJ4V0ycR2cjB1IZVr7lyVIPCgBo=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=C68fxvNBssgLv+xl/iQyiIVOG//jPoitzEF1kq4IixGsBDe5e2sDSkV0kVZm2J3K/
 m5mcqmbgYkdzabzxFzEg9bJcMNIbbmwizUkpQ+k2R1SV9XmO+6sxmJQUEQ87ympN2o
 EjWu1dSR8zoXH+eyujUri97YOwpGQcQm2GM1bfG243K0A/GiFUJbmiCmAwfv+Ya0dn
 CdlSY3qYJUORGel6IP9FEj8rBc0ToGZG08Wxm2BP9YinDTEpU1Ae97884+6TKNmFoY
 Gcd7DM9C8bFqrwdcO3ZDbEa3LfXDJ3+QmSL330vOtLEFUWoHewfc85RFO/xlpUqcXa
 nQwQ4zFJV4bnA==
From: Kalle Valo <kvalo@kernel.org>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <mka@chromium.org>
Subject: Re: [PATCH v4 00/12] add support for WCN6750
References: <20220406094107.17878-1-quic_mpubbise@quicinc.com>
Date: Wed, 27 Apr 2022 08:53:17 +0300
In-Reply-To: <20220406094107.17878-1-quic_mpubbise@quicinc.com> (Manikanta
 Pubbisetty's message of "Wed, 6 Apr 2022 15:10:54 +0530")
Message-ID: <874k2fgjhu.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_225326_530800_11BEEAEF 
X-CRM114-Status: GOOD (  22.65  )
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
> An important point to note is that though WCN6750 is a PCIe device,
> it cannot be attached to any other platform except on Qualcomm
> Snapdragon SoCs due to the aforementioned reasons.
>
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
>
> Manikanta Pubbisetty (12):
>   dt: bindings: net: add bindings of WCN6750 for ath11k
>   ath11k: Add HW params for WCN6750
>   ath11k: Add bus params for WCN6750
>   ath11k: Add register access logic for WCN6750
>   ath11k: Fetch device information via QMI for WCN6750
>   ath11k: Add QMI changes for WCN6750
>   ath11k: HAL changes to support WCN6750
>   ath11k: Datapath changes to support WCN6750
>   ath11k: Do not put HW in DBS mode for WCN6750
>   ath11k: WMI changes to support WCN6750
>   ath11k: Update WBM idle ring HP after FW mode on
>   ath11k: Add support for WCN6750 device

Due to the bus_params problem I had to drop most of the patches, but I
did keep few of them in the pending branch to reduce the patchset size:

495a15b1969a ath11k: Update WBM idle ring HP after FW mode on
8d121dacbe35 ath11k: WMI changes to support WCN6750
e31091e06011 ath11k: Do not put HW in DBS mode for WCN6750

Please submit v6 only after I have applied these, I'm waiting for some
build testing first.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
