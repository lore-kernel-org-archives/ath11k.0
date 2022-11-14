Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0E2C43219
	for <ath11k@archiver.kernel.org>; Mon, 14 Nov 2022 12:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+KW5uBMIzuhBvqE8Q+ehnc4LEcGM57RF+723viKbyLE=; b=JqIIuzJGOdZ8b+
	FVc2Y19Qcn4G9TP4lcVsPgLZcp/NHKjTXjZ3WyQTUVEkTQang5LIyFRN9l8BIIqxa+8VLcdh7MjMU
	OenmXmKm21A5m1yAs/bMU86IYRw+s74KBOh6u9iCOVMC2jEYgXnh43Lmgaoc2KdzA+KoAL8tSDb4E
	Cr11ooIfEnpXyQqlS3Zggeziu9ul8ryo1oN65/FbbM7dFaxkg3l3T317cRSDaKHv5kAHpxEo4cBwx
	GQOZWlYvbqWh1YmtshBMtBWuQtMg0aiImmO4z+Xg7MxDTS9Am+IymwUwRZa/kx50oVAOKfDrPcF87
	2lMBmo9d3r7xFJm4ZF5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouZ3t-0010GF-Qo; Mon, 14 Nov 2022 12:59:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouZ3r-0010FW-1D
	for ath11k@lists.infradead.org; Mon, 14 Nov 2022 12:59:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0BCCC61175;
	Mon, 14 Nov 2022 12:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3BDEC433D7;
	Mon, 14 Nov 2022 12:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668430777;
	bh=Bqo8VHEKOh4b2/t4IKtYamnmb4QITdYQ/EJfORddcJk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ciRd/Wku/AsQYh4opphPAa7JXWu1GgVorWniVQ5/xseSsNCWOywBbKqe6RMF+ZPFt
	 G4XLEvA51Th350+mE1g8JFpdBaJXwUGEt01zv2OcHVQQgsMNeyw8bIyyEyxHE9MgK8
	 x7mNGyK+z7+4rb+YiMtLx8krXVUDApP2wfoflnXYB/htCwTaNkLzxeBd7g4PtJcgMH
	 Ojkt0QuIKGoatmlSquzA742Q6lIzXRaB2+gj18z+4/LAOdUm10WWBHSXboOWk2arW0
	 Bvn6RNUvNce4bquYp1QfM/8t7WzgBzoLL3FElrcoqN6pGlw5u7joVgbfghgHP0jszW
	 6SoZY3rPqi1Ig==
From: Kalle Valo <kvalo@kernel.org>
To: Youghandhar Chintala <quic_youghand@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  <linux-kernel@vger.kernel.org>,  <quic_mpubbise@quicinc.com>,  <linux-arm-msm@vger.kernel.org>,  kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3] wifi: ath10k: Add WLAN firmware image version info into smem
References: <20221111114235.10287-1-quic_youghand@quicinc.com>
Date: Mon, 14 Nov 2022 14:59:31 +0200
In-Reply-To: <20221111114235.10287-1-quic_youghand@quicinc.com> (Youghandhar
	Chintala's message of "Fri, 11 Nov 2022 17:12:35 +0530")
Message-ID: <87edu5bsjw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_045939_211778_D74D5035 
X-CRM114-Status: GOOD (  21.52  )
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

Youghandhar Chintala <quic_youghand@quicinc.com> writes:

> In a SoC based solution, it would be useful to know the versions of the
> various binary firmware blobs the system is running on. On a QCOM based
> SoC, this info can be obtained from socinfo debugfs infrastructure. For
> this to work, respective subsystem drivers have to export the firmware
> version information to an SMEM based version information table.
>
> Having firmware version information at one place will help quickly
> figure out the firmware versions of various subsystems on the device
> instead of going through builds/logs in an event of a system crash.
>
> Fill WLAN firmware version information in SMEM version table to be
> printed as part of socinfo debugfs infrastructure on a Qualcomm based
> SoC.
>
> This change is applicable only for WCN399X targets.
>
> Example:
> cat /sys/kernel/debug/qcom_socinfo/cnss/name
> QC_IMAGE_VERSION_STRING=WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
>
> Reported-by: kernel test robot <lkp@intel.com>
>
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
>
> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
> ---
> Changes from v2:
>  - Removed blank line between trailers
>  - Changed memcpy to strscpy
>  - Removed version_string_size
>  - Added new condition fw_build_id against max length
>  - Added depends on QCOM_SMEM for ath10k_snoc
> ---
>  drivers/net/wireless/ath/ath10k/Kconfig |  1 +
>  drivers/net/wireless/ath/ath10k/qmi.c   | 34 +++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/Kconfig b/drivers/net/wireless/ath/ath10k/Kconfig
> index ca007b800f75..e6ea884cafc1 100644
> --- a/drivers/net/wireless/ath/ath10k/Kconfig
> +++ b/drivers/net/wireless/ath/ath10k/Kconfig
> @@ -44,6 +44,7 @@ config ATH10K_SNOC
>  	tristate "Qualcomm ath10k SNOC support"
>  	depends on ATH10K
>  	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on QCOM_SMEM
>  	select QCOM_SCM
>  	select QCOM_QMI_HELPERS

Is there a reason why you used "depends on"? Other QCOM dependencies
used "select", so I'm wondering if QCOM_SMEM should also use select?

Please also use ath10k list for ath10k patches, not ath11k.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
