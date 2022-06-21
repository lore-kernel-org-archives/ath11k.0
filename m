Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC29C433EF
	for <ath11k@archiver.kernel.org>; Tue, 21 Jun 2022 11:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=n8N17Mchtcf9ihc+xOjJA9HxIOvxYzxHSIrJVDc7PGY=; b=m/U
	vqUG/OoCVpF8XbqT+duPBLxBZT+J2mMLn4sGgFz7JkiPMLafClPdDTcrTLKatI4OOj7GuyE0D6f0s
	1JuaFSWaGHnoJ2lDgToZd736aicYXVDqZgWm8pap188L/NwxhS2//76m69MoYjwahMo4Lgx1d4phq
	Jzskzx0FpyWhrl8BKZvgsDo7IFhG5gFD3+hcvVG0umO7fpigevTcIRgOa6Mf8L5tLoUllKXeZ/je0
	ouLcQ/49kXRcxhyyMsCO8jTfDQaoLXBpnSBHUkE/rV+C3aCAw1Kt2C8PbfAP1bC80S24/42qrGk2O
	QcnZn+dDwiNBrUYDBRNacddDa4x3KEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3c5g-00549o-Ne; Tue, 21 Jun 2022 11:30:40 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3c5e-00548t-A9
	for ath11k@lists.infradead.org; Tue, 21 Jun 2022 11:30:39 +0000
Received: by mail-pf1-x434.google.com with SMTP id 128so5828649pfv.12
        for <ath11k@lists.infradead.org>; Tue, 21 Jun 2022 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=YcNTudnfNe9PYVct1AIMH9xXhCMbjJZi0rP9pN00vKA=;
        b=daRgyrFKhUphRzta0SW1R5MON0Quwq6zduCgzp/SYZ3Gawq7z+nVQnre8rJNOjG5HP
         /fjq6mPUiF15dE4cI034zWZB4ZhFPvj4EBG5eCMGnS2mzKsUQUmAu4CNFsYY0w3TYLie
         ggQbFx40Hqr+s+H28tVrYDsjnQErVNcYGLg/1laE9htLOjjjvY1Y703EM4NrOc11WUEP
         qH1So2cy+UJgP4NMun1M4Kc8xmXqaPeIeqpke75ijnUkf3bhVmGt0NmVple2iIVU6XVK
         RDuI4gamXDOTGb0BgXBvHInqTvqV9Qme/6I0iEUICZ5xLjJDIDJuxBxkeoBvpC6Pr5RO
         Y4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=YcNTudnfNe9PYVct1AIMH9xXhCMbjJZi0rP9pN00vKA=;
        b=A4QZfF7dijUWMcjDioiDAbL7LXEKhQZmRkqZ9FHd6sk4kIKN1yoA6FjQPKXePmCfYl
         BNx+2t/fnXG/4yTwNHahCe4RwRNMuRysSRbRj5Ouk/+y8hduCaRCz9314f5MmqKGfTJ+
         F4wEqu9hbigFBk/3TgNBv880TKn7g+3ZCeblrqsAEmgzKFgHnUBgNVJqcs6qxGkUcUGK
         uWHS3MZ+6l3eJkASQf7S6jHMGxXCV64CehFF9mXhXdhfbeuy0GmojEHjCaZcbceu1oRz
         9n2lAd8mluiSUjzIAWx3xe4rPfJpaXMvaBW+SkEuowWtzGFrA/EMf9OsZt3geCyrMTW4
         xn9Q==
X-Gm-Message-State: AJIora8zEBe+HEqwphztgqTYuXh6NYSo/GSzrbC2s2g46lXkaaylcRq0
	V0YtgyVR81Jf+q9fK6iIumMsrALdYUth5AhTv4eW+9oerIcnJg==
X-Google-Smtp-Source: AGRyM1ugLFXJAalQvGBQaDEfNFWZk9AIi7Q4Ar/3qC7nzHzs36GMjMQp5vNdMcQxbqc1jGDgkPMfe5xaoeaoMzrNL/M=
X-Received: by 2002:a05:6a00:140f:b0:4e0:6995:9c48 with SMTP id
 l15-20020a056a00140f00b004e069959c48mr29490487pfu.59.1655811033821; Tue, 21
 Jun 2022 04:30:33 -0700 (PDT)
MIME-Version: 1.0
From: Kristian Evensen <kristian.evensen@gmail.com>
Date: Tue, 21 Jun 2022 13:30:22 +0200
Message-ID: <CAKfDRXi373X-4jSpKtfeJHRqrVXgMKZyQ3gDcDE5c41pYp0neA@mail.gmail.com>
Subject: WCN6855 service timeout issues
To: ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_043038_410570_C97B2AE7 
X-CRM114-Status: GOOD (  15.37  )
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

Hello,

I am trying to make a WCN6855-based card work with on an x86-device
running kernel 5.15. My base system is OpenWRT (compiled from master
today) + backports-5.15-33. As WCN6855 is not support by kernel 5.15,
I have backported all ath11k commits up to 3926e0c122 ("ath11k: Fix
warnings reported by checkpatch"), and brought mhi in sync with
mhi-next (13b9b814da) and qrtr in sync with net-next (f4b41f062c).

When I boot my device, the card is detect and board file found, but
communication times out almost immediately. In my kernel log, I see
the following:

[   11.336010] ath11k_pci 0000:06:00.0: BAR 0: assigned [mem
0x91000000-0x911fffff 64bit]
[   11.344336] ath11k_pci 0000:06:00.0: MSI vectors: 1
[   11.350532] ath11k_pci 0000:06:00.0: wcn6855 hw2.1
[   11.513448] mhi mhi0: Requested to power ON
[   11.517895] mhi mhi0: Power on setup success
[   11.904189] mhi mhi0: Wait for device to enter SBL or Mission mode
[   12.551007] ath11k_pci 0000:06:00.0: chip_id 0x12 chip_family 0xb
board_id 0xff soc_id 0x400c1211
[   12.560045] ath11k_pci 0000:06:00.0: fw_version 0x11090c35
fw_build_timestamp 2022-04-18 20:23 fw_build_id
WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
[   12.768324] ath11k_pci 0000:06:00.0: leaving PCI ASPM disabled to
avoid MHI M2 problems
[   13.814188] ath11k_pci 0000:06:00.0: failed to receive control
response completion, polling..
[   14.844167] ath11k_pci 0000:06:00.0: Service connect timeout
[   14.849919] ath11k_pci 0000:06:00.0: failed to connect to HTT: -110
[   14.858741] ath11k_pci 0000:06:00.0: failed to start core: -110
[   15.074355] ath11k_pci 0000:06:00.0: ignore reset dev flags 0x4000
[   25.332283] ath11k_pci 0000:06:00.0: failed to wait wlan mode
request (mode 4): -110
[   25.340294] ath11k_pci 0000:06:00.0: qmi failed to send wlan mode off: -110

The device and PCI-slot should be good. I inserted another wifi-card
that uses the ath10k-driver and it works fine (and without the " ..
polling.." message). Also, the WCN6855-card works well when I install
Ubuntu on the same device + kernel 5.17 + board file. The board file
is supplied by the vendor, but as it works fine with ath11k from the
5.17 kernel I guess it is ok.

In order to try to make progress, I searched for the different error
messages and got quite a lot of ath10k-related hits on the first ones
(".. polling .." and "Service connect timeout"). However, for example
disabling MSI or enabling PCI quirks had no effect on my device.

Does anyone know what could be wrong or have an idea of where I should look?

Thanks in advance for any help,
Kristian

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
