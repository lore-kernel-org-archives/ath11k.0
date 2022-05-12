Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242F3C433FE
	for <ath11k@archiver.kernel.org>; Thu, 12 May 2022 18:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V5qejSuLTBX6j0MseSbDwnA+zw96Z4F3j18aVtgMFD0=; b=GxR8+E1lL17PCX
	CvFcZks1q6lA+WZjgfZIxkTeuJjyu+nbHViRBG2AjhHY0bhmMvzwtOjfPDJXUTqhbVzzPYPQfioG4
	jcq/QlaMXtJqt198pJhZcjzCvXn+4nMVY3JyQV4gyCFnv4+XJa05IXbIu3RsZGhvKmOzvvV+dI320
	x7QyZyt5yMXvL6Jxa8eqjzIKAeV+4qHb8il2Wi+1vC6Up8WT6OsZg19SszxnQfwfMF3bLrgx0wKFR
	iA59sqsGKVwRBg1IGvBQ4AUbSnyF12In/5GdKJfq/HmkJ52JAuINpXmWtu26irQX3JThaoriO/1QZ
	keV3tDWs9A83v+81z1Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npDTp-00D5Xs-TV; Thu, 12 May 2022 18:24:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npDTm-00D5Wq-Qo
 for ath11k@lists.infradead.org; Thu, 12 May 2022 18:24:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 74028B80AEA;
 Thu, 12 May 2022 18:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A112CC34100;
 Thu, 12 May 2022 18:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652379839;
 bh=s8HoR9bAro6r0TzslCOHEuM3gaJqVnDqWZhoi3LMcEs=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=MQGUled/0p+pO1g+oMIpQhVZ0xvraNxX6wWtNIWyQT0ZhRqEgvDgD1crPNcmcuCrw
 csOri/aH2xHckFdaqsi55ldD2NCRdFy+MTvsnYGOilwc6q/Bt/fGQC4JYHv6aOOVPg
 azTImFw18I+bSW5XfaqxpEeo/gaIKaqLb+vcy4lJGP9SOfW/RnsijGtFcZXIyyFSpF
 aK9+EUPh+NcK/1cQcV0MrehIcnCJgAndNoEzErXNcDL9zitjCDnx6MJN5ONjV66LVP
 HPrT6galLAsmymGhx/41x6CbePTDEZf9qih9qJdAQm/cbAdPrMIQsI9XGBKq7hOwh5
 Du1B+O5Sbsg8A==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: WCN6855 issues with latest linux-firmware
References: <a1657ff0-198c-14f9-3b2b-d7ab06cfc8e6@linaro.org>
Date: Thu, 12 May 2022 21:23:52 +0300
In-Reply-To: <a1657ff0-198c-14f9-3b2b-d7ab06cfc8e6@linaro.org> (Dmitry
 Baryshkov's message of "Thu, 12 May 2022 17:31:50 +0300")
Message-ID: <87v8ua624n.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_112403_206603_0B9FAE62 
X-CRM114-Status: GOOD (  14.34  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> The wcn6855 WiFi chip stopped working for me after an update to the
> latest linux-firmware (Linux 5.18-rc2). I can reproduce it with both
> hw2.0 and hw2.1 chips.
>
> Here is the set of kernel messages I'm getting from ath11k_pci driver:
>
> [    4.422391] ath11k_pci 0000:01:00.0: Adding to iommu group 3
> [    4.429571] ath11k_pci 0000:01:00.0: BAR 0: assigned [mem
> 0x60400000-0x605fffff 64bit]
> [    4.437857] ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
> [    4.445323] ath11k_pci 0000:01:00.0: MSI vectors: 1
> [    4.450375] ath11k_pci 0000:01:00.0: wcn6855 hw2.0
> [    5.378488] ath11k_pci 0000:01:00.0: chip_id 0x2 chip_family 0xb
> board_id 0x8c soc_id 0x400c0200
> [    5.392898] ath11k_pci 0000:01:00.0: fw_version 0x110f0c35
> fw_build_timestamp 2022-03-30 09:05 fw_build_id
> QC_IMAGE_VERSION_STRING=WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.7
> [    5.420648] ath11k_pci 0000:01:00.0: failed to fetch board data for
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=140
> from ath11k/WCN6855/hw2.0/board-2.bin
> [   15.686398] ath11k_pci 0000:01:00.0: failed to wait board file
> download request: -110
> [   15.694530] ath11k_pci 0000:01:00.0: qmi failed to load bdf file
> [   15.700784] ath11k_pci 0000:01:00.0: failed to load board data file: -110

What WCN6855 hardware are you exactly using? (make, model etc) And what
board file are you using? md5sums of all firmware files is the best.

> With the earlier firmware from [1] I'm getting the following trace
> (and WiFi device probes). Interestingly enough the chip_id differs
> between these firmware versions.
>
> [    4.352661] ath11k_pci 0000:01:00.0: Adding to iommu group 3
> [    4.359192] ath11k_pci 0000:01:00.0: BAR 0: assigned [mem
> 0x60400000-0x605fffff 64bit]
> [    4.367466] ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
> [    4.374916] ath11k_pci 0000:01:00.0: MSI vectors: 1
> [    4.379963] ath11k_pci 0000:01:00.0: wcn6855 hw2.0
> [    5.273930] ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb
> board_id 0x8c soc_id 0x400c0200
> [    5.286020] ath11k_pci 0000:01:00.0: fw_version 0x110406b8
> fw_build_timestamp 2021-01-08 06:14 fw_build_id
> QC_IMAGE_VERSION_STRING=WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> [    5.312464] ath11k_pci 0000:01:00.0: failed to fetch board data for
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=0,qmi-board-id=140
> from ath11k/WCN6855/hw2.0/board-2.bin
> [    5.384315] ath11k_pci 0000:01:00.0: leaving PCI ASPM disabled to
> avoid MHI M2 problems
>
>
>
> [1]
> https://chromium.googlesource.com/chromiumos/third_party/linux-firmware/+/d233ddd89abe06448070471963a58c0a7da81d79/ath11k/WCN6855/hw2.0

That looks like an unsupported firmware version. I recommend using
_both_ firmwares and board files only from ath11k-firmware.git[1] or
upstream linux-firmware[2].

[1] https://github.com/kvalo/ath11k-firmware

[2] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
