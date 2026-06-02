Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414EECD6E4A
	for <ath11k@archiver.kernel.org>; Tue,  2 Jun 2026 08:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YcHbUW0/z6MxMlX2QsScaV0gwWaW5ODpoWMz4NoUgZw=; b=jH9csYr0uZcJQITh1CznPdM6rg
	Yq/e+mh/rYjB/cVsvKYdQP5JT4QiFtdI/BE9OKxCQK47Ui00bRcC7ZMp5KueX6UmnU43DPJ//549n
	8TSR6h7nyoPssLXJt1HvTtjzbtmvrj+PvmzVAWE8EPJcswClktwCFqiTYOdxxWO4NU6P5MGLgvzO5
	s+aSwmT9ulq3Vnmpi6GsJiWRqiQnfgp2NRi/r9vLxriENzTzZzj+AICnowjDBaDTfWTP5irmQ4/tx
	LwRby+If62Glf6XP6hO2jR8mLSp3SvPjxRJoTjL+b1Ontsgq2/hUFwZhYo4O3zZtOENnr4X9hkFac
	eVKlZBRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUK2v-0000000CWZb-2wHx;
	Tue, 02 Jun 2026 08:00:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUK2t-0000000CWZD-2cnm
	for ath11k@lists.infradead.org;
	Tue, 02 Jun 2026 08:00:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 02D0F445B0
	for <ath11k@lists.infradead.org>; Tue,  2 Jun 2026 08:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2DCF1F00A03
	for <ath11k@lists.infradead.org>; Tue,  2 Jun 2026 08:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780387218;
	bh=YcHbUW0/z6MxMlX2QsScaV0gwWaW5ODpoWMz4NoUgZw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=KzNDbDXUP0/GMeHK0OA58vp1P+iuRNQD3rXvWS3Jv2YLR3nFB6b/Fsx3qmeJ9uDtY
	 ST49GW2bUSnc6WwFndPZPApLCXbsnR06mrP4zB8k9T249WuHHDIXZRQiHvHqBOkV2c
	 5jaQVnUAyYkqjMmE2dY9YINfcGHjlYu8PtkJHoYBAaSvW+1FTUn0ScSt2Ato0gHTc6
	 rm7b5UIX8yQAUqd24jQ8X7TVgQKKjYa1zo+yjfKih3vuOduO5hmqKKLibfOyOFsTX2
	 hQOWS5oS67SUnmx0GLc6u8uoqOBQ4p2/bY9LxIpEsAvtSXRpyUcjmKkNX1FGrOd1CQ
	 qceuqgMB41GDA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3966c0d5ac9so27889171fa.2
        for <ath11k@lists.infradead.org>; Tue, 02 Jun 2026 01:00:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+j2lU531OzQ81BTwKK+ZOmb2rJKgI3vRaUMcTeJWqN999vrYHLyC2B5DdqU3pEjWae9/UEgEo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzoLBVwBdY+YUxaUpg9mq1Vok242aUTQ+80a9ogkO1S9H4s7rlN
	dCe5JODzYm9zwUBUXsj4dLgk303AvZExsu4VX9YspFCEvzHoMZEsx2U6rzyowfYpmSUndxKdSYk
	kVHsoYHJBN+Qp1s4enILMvgkW+55K2SLfXuuSchW6Dg==
X-Received: by 2002:a2e:8614:0:b0:396:9630:5ed with SMTP id
 38308e7fff4ca-3969a81a943mr7988131fa.15.1780387217586; Tue, 02 Jun 2026
 01:00:17 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 03:00:15 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 2 Jun 2026 03:00:15 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260601-sm8350-wifi-v1-7-242917d88031@oss.qualcomm.com>
MIME-Version: 1.0
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com> <20260601-sm8350-wifi-v1-7-242917d88031@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 03:00:15 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfmosOiaYONd1Cs_G8M4bgL6k844gmANUD-tg_H+VcEqA@mail.gmail.com>
X-Gm-Features: AVHnY4LpWcxff9jncmRnjmUuLE6aaoj7VaQIrr97syxQJ21dl10x_BOM0i6sA48
Message-ID: <CAMRc=MfmosOiaYONd1Cs_G8M4bgL6k844gmANUD-tg_H+VcEqA@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8350-hdk: describe WiFi/BT chip
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, devicetree@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>, 
	Jeff Johnson <jjohnson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_010019_765006_D0A9BA2B 
X-CRM114-Status: GOOD (  11.63  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On Mon, 1 Jun 2026 11:46:55 +0200, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> said:
> The SM8350 HDK has onboard WiFi/BT chip, WCN6851. It is an earlier
> version of well-known WCN6855 WiFI/BT SoC. Describe the PMU, BT and WiFI
> parts of the device.
>
> The firmware isn't (yet) available as a part of linux-firmware, so it
> was verified with the firmware files from the vendor-supplied package
> (wcn prefix was applied to Bluetooth firmware files to make them follow
> upstream driver changes, vendor provided hpbtfw10.tlv and hpnv10.b06).
>
> Bluetooth: hci0: QCA Product ID   :0x00000013
> Bluetooth: hci0: QCA SOC Version  :0x400c0110
> Bluetooth: hci0: QCA ROM Version  :0x00000100
> Bluetooth: hci0: QCA Patch Version:0x00001017
> Bluetooth: hci0: QCA controller version 0x01100100
> Bluetooth: hci0: QCA Downloading qca/wcnhpbtfw10.tlv
> Bluetooth: hci0: QCA Downloading qca/wcnhpnv10.b06
> Bluetooth: hci0: QCA setup on UART is completed
> Bluetooth: hci0: HFP non-HCI data transport is supported
>
> ath11k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x605fffff 64bit]: assigned
> ath11k_pci 0000:01:00.0: MSI vectors: 32
> ath11k_pci 0000:01:00.0: wcn6855 hw1.1
> mhi mhi0: Requested to power ON
> mhi mhi0: Power on setup success
> mhi mhi0: Wait for device to enter SBL or Mission mode
> ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0x6 soc_id 0x400c0110
> ath11k_pci 0000:01:00.0: fw_version 0x110c80c8 fw_build_timestamp 2021-05-25 21:43 fw_build_id WLAN.HSP.1.1.c3-00200-QCAHSPSWPL_V1_V2_SILICONZ-1
> ath11k_pci 0000:01:00.0 wlp1s0: renamed from wlan0
>
> For the reference, the driver looks for the board data for
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=0,qmi-board-id=6,variant=QC_8350_HDK
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

