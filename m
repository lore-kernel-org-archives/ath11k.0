Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7CBC433EF
	for <ath11k@archiver.kernel.org>; Wed,  1 Jun 2022 12:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vvOUsKQoPY06XjnfwXg3vBu8MEowtCENluB4ySqepp8=; b=Lh7hOQ/vyIl9lWx4YFGjAc33r6
	vW5HB4ltDmH5ubCwzGl7NhNRRgKqt6otf//DEnXWlgnvObQaSAPSiolmnRo+XaPF3ydxwXkyCFOzx
	HqvW4pO7Drluv7LIQIQwCutFpumbOU8y+9q6jt2VzToXQN/cDFH10TX15Vm/qBySTzFu/Y9jDQTCq
	Wk66FjpLJF/iGpcdpfGuDKVmMoC6hHJ0WirfX+rmccxqaEQCkSq9gJj3TrC7NrJfmV7S4l3FUKcqk
	Hu+fnyNpYdMOPEPedlPmx0dTxTVo3SI+0crTdfCX7Bb9jyabfMqlWMK4aYGh5BkZ3mAagUeekvSj1
	nK/DSuiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwNeZ-00G4qJ-Tf; Wed, 01 Jun 2022 12:40:47 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwNeX-00G4ot-1b
	for ath11k@lists.infradead.org; Wed, 01 Jun 2022 12:40:46 +0000
Received: by mail-qk1-x72b.google.com with SMTP id r84so1154920qke.10
        for <ath11k@lists.infradead.org>; Wed, 01 Jun 2022 05:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=fajdYMxjwcm0rT1PEco8CbYRRh0B3PRDnXZBk4rLBYc=;
        b=SJIw3mJPGLLufA+TNOuaKtnqAlGJMRDvY5ALQRYL7ec/HM41v38uEgDdVpDsph6zcH
         f5iBdv8EkRNHsm7LZ3WSTz4txNYZLUVjElOY/0VwH0nQenydCjQw5RyeN43HIetbrUxx
         48pkPSEYKl3uyeHyH7EWyhqaGzQNSKFywVH7yFex5V2ek8C4MRo1XcgKbvYlCdVOHVeX
         ucRsXW2CqxrVmcn4EbfPXRwfBWKvvplNHl9YuIspXZnM4JnIEdNzBVqd/9h2l4j8sa3W
         FQ/aumNz1D7wBO9QnPWNrkgRK2rPl6fkLVG2vG/MgYZmfIXa7CaylyFsQAQNJnhy/5zM
         RMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=fajdYMxjwcm0rT1PEco8CbYRRh0B3PRDnXZBk4rLBYc=;
        b=Ek6YPDISxTB+o6YTw5Mv9P56Qa0wtpA2BfalaptnG8v1DFS1WFmaNW566k1cNqa9ZP
         tAiER1FWNbUZmareWkjHo7zNY58wHjMoxyOsK8aGevzaC8kBnZyL6zJR1Afqb7uv/UnX
         IvwodqK8YFVI2eOODpQOrWVidSYfBGmD6M+yvGRZxpKTCpWB58gIHZuzKHCdRTO3IB7P
         tWLea5JU5Yytco8JYv3BbRZi+5q5D3LHGN4WjZXEJKw/FDN79MoXMXrST0b3KsdgKmJ3
         RRC8iGzFVpdA4gFHx3o7hzAMnU9vUekk4e4JNABhKA5P2/qjcQBDhex0s2riaqRI6kWu
         FV/w==
X-Gm-Message-State: AOAM533cuSuGL9zvoV3QA+0mDV/8dLRYjpSRG2XOSxix4PMNfPtqeQ6p
	6aoPffyUh2Ce4KE1VggGCPaPewzh8tNnb3dFquWBl9L3chXFmw==
X-Google-Smtp-Source: ABdhPJzmPJ8kYQp1d9GdEpk1MvUAvoKMDX8W978iFxgUXds/EP0dG9FpQlXJPtDqXKQ2ueJAnz3v4TBrFRVghRIOQm8=
X-Received: by 2002:a37:6883:0:b0:6a3:42ae:e17b with SMTP id
 d125-20020a376883000000b006a342aee17bmr42357350qkc.59.1654087242272; Wed, 01
 Jun 2022 05:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <a1657ff0-198c-14f9-3b2b-d7ab06cfc8e6@linaro.org>
In-Reply-To: <a1657ff0-198c-14f9-3b2b-d7ab06cfc8e6@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 1 Jun 2022 15:40:31 +0300
Message-ID: <CAA8EJpoHKUSx3Aq+fB-4s0ZpZXfvp8p-==hO12hxsrxE46YfCw@mail.gmail.com>
Subject: Re: WCN6855 issues with latest linux-firmware
To: "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_054045_126681_ED5E407D 
X-CRM114-Status: GOOD (  13.63  )
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

Hi,

On Thu, 12 May 2022 at 17:31, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hi,
>
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
>
>
> With the earlier firmware from [1] I'm getting the following trace (and
> WiFi device probes). Interestingly enough the chip_id differs between
> these firmware versions.
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
>
>
> --
> With best wishes
> Dmitry

I have tested the latest firmware from linux-firmware and it still
fails to send the bdf file request:

[    3.740702] ath11k_pci 0000:01:00.0: chip_id 0x2 chip_family 0xb
board_id 0xa7 soc_id 0x400c0210
[    3.752952] ath11k_pci 0000:01:00.0: fw_version 0x11090c35
fw_build_timestamp 2022-04-18 20:23 fw_build_id
QC_IMAGE_VERSION_STRING=WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
[    3.760674] ath11k_pci 0000:01:00.0: failed to fetch board data for
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=167
from ath11k/WCN6855/hw2.1/board-2.bin
[....]
[   13.843957] ath11k_pci 0000:01:00.0: failed to wait board file
download request: -110

^^^^^^^^^^^^^^^^^^^^^^

[   13.852094] ath11k_pci 0000:01:00.0: qmi failed to load bdf file
[   13.858322] ath11k_pci 0000:01:00.0: failed to load board data file: -110

-- 
With best wishes
Dmitry

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
