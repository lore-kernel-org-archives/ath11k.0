Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25B7C46CD3
	for <ath11k@archiver.kernel.org>; Tue, 26 Dec 2023 19:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lc0ZZS9raYFTuzTAjY2HbHAifM/5aEZ7LhNbefE+rA0=; b=CaGNjjQeJP4LHKw7Pyq2uEbZQT
	UavvXHDPYxrawzLm2voHNXcMgdQAnYZcRjlhMzDRoGFIf0tf8Zd1y0Z09zFHqFC2/kKwGVS1ugDy5
	aNqQU01WGgYsoj4rL7aZ/JINAkIN6QvY3xHQ0Y0BDItv7v4pAqlIwKK/Vd/wv8cTSjv31sA1cQXzT
	25BOmvlOw74zWt9LU4lKlBhDVFo/6z5v3gtWFv5PEJUFWUj5moR0F59OkFYCFcTmcVlHaLc7osMeF
	TBf7UMx9pdimPvO7siNfjWRWGjEi21DXuoZxJyQgfKwUmiuCq3EMhYxTLKoVR8BUmZkjBBAdyuRdw
	kbjVCVIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIDJe-00DSO9-2A;
	Tue, 26 Dec 2023 19:42:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIDJb-00DSNF-0d;
	Tue, 26 Dec 2023 19:42:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DBE64B80945;
	Tue, 26 Dec 2023 19:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC57C433C8;
	Tue, 26 Dec 2023 19:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703619729;
	bh=yGkxVhUKDayFNUEMyL0TaOj2LLfx+FpjFxb7WILnJbY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=iwfI6OsJ0OSxBbcvHbcN4T0NHFQfRqMgnKIX0Ccsw8L4R+erCnvUyZoRYgRJcZIvs
	 1COiuDN02x1HsjoHI/JFPmnmVj1XVgHvQYbCSQMg5ZfWkQxhB+CJg/B23hlVHwx1ki
	 Rz2DFM2DqfyYJJjrnahFvePUdSAv57S7olZwQpfIQxSAM7JYVbAhsOTj8pyTfRXDdh
	 5NqRTgaVdSdYanhwgF0JhDlQ9tloZXWIUeaJt7KAWCdt6p7IOmJq0i+4jIr2LzTKCc
	 CiTjs+Kit+VvOSyeu5aLMqI+WEk/akp9+3gNa8pk1FiK0xieCctuBNr/hI3nMgTfyk
	 dmjOqFxm+aDDQ==
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dbdbe917d39so3622028276.2;
        Tue, 26 Dec 2023 11:42:09 -0800 (PST)
X-Gm-Message-State: AOJu0YwxT7WDz/J1tdzKsMIM9Oa/2cs1iv05AiLO7JIEz130w8/krU07
	Jc6PihgMEmG8ZWvu0K4U1lEr3TpvNCyeScv+4tE=
X-Google-Smtp-Source: AGHT+IFo/cnUZqxRCUv6aDluCoe4zPRLbzZCTXYsyfOwSZNJkt8jQ+OdNEVJMSTHLE0aGXkcw+bftFtMW163Y8A/HDM=
X-Received: by 2002:a25:8583:0:b0:d9a:cd62:410c with SMTP id
 x3-20020a258583000000b00d9acd62410cmr2895754ybk.4.1703619728414; Tue, 26 Dec
 2023 11:42:08 -0800 (PST)
MIME-Version: 1.0
References: <878r5nprch.fsf@kernel.org>
In-Reply-To: <878r5nprch.fsf@kernel.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 26 Dec 2023 14:41:57 -0500
X-Gmail-Original-Message-ID: <CA+5PVA5CAbLESXMZY-b7j2A4P2fjeH6upxQkStw_VTDyok-V2g@mail.gmail.com>
Message-ID: <CA+5PVA5CAbLESXMZY-b7j2A4P2fjeH6upxQkStw_VTDyok-V2g@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware 2023-12-21
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231226_114211_509378_88E4DD92 
X-CRM114-Status: GOOD (  18.15  )
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

On Thu, Dec 21, 2023 at 9:23=E2=80=AFAM Kalle Valo <kvalo@kernel.org> wrote=
:
>
> Hi,
>
> Here's a new pull request for ath10k, ath11k and ath12k. We have a new
> driver ath12k and the first firmware for WCN7850. And as usual firmware
> and board files to other hardware.
>
> Please let me know if there are any problems.
>
> Kalle
>
> The following changes since commit c156e6be6d4a0a2290e7059bc74fb0612aa196=
93:
>
>   Merge branch 'robot/pr-0-1702625169' into 'main' (2023-12-15 12:16:57 +=
0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git =
ath10k-20231221

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/103

josh

>
> for you to fetch changes up to 17509e53b97baaefeb287b98d3358da8a6e1c199:
>
>   ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SI=
LICONZ_LITE-3.6510.36 (2023-12-21 16:13:58 +0200)
>
> ----------------------------------------------------------------
> Kalle Valo (9):
>       ath12k: add new driver and firmware for WCN7850
>       ath10k: QCA6174 hw3.0: update firmware-6.bin to WLAN.RM.4.4.1-00309=
-
>       ath10k: QCA4019 hw1.0: update board-2.bin
>       ath10k: QCA9888 hw2.0: update board-2.bin
>       ath10k: WCN3990 hw1.0: update board-2.bin
>       ath11k: IPQ8074 hw2.0: update board-2.bin
>       ath11k: WCN6750 hw1.0: update board-2.bin
>       ath11k: WCN6855 hw2.0: update board-2.bin
>       ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V=
2_SILICONZ_LITE-3.6510.36
>
>  WHENCE                              |   16 +-
>  ath10k/QCA4019/hw1.0/board-2.bin    |  Bin 1798148 -> 1822336 bytes
>  ath10k/QCA6174/hw3.0/firmware-6.bin |  Bin 706004 -> 706360 bytes
>  ath10k/QCA9888/hw2.0/board-2.bin    |  Bin 206444 -> 218596 bytes
>  ath10k/WCN3990/hw1.0/board-2.bin    |  Bin 513892 -> 670116 bytes
>  ath11k/IPQ8074/hw2.0/board-2.bin    |  Bin 1311380 -> 1442536 bytes
>  ath11k/WCN6750/hw1.0/board-2.bin    |  Bin 843548 -> 843548 bytes
>  ath11k/WCN6855/hw2.0/amss.bin       |  Bin 4980736 -> 4988928 bytes
>  ath11k/WCN6855/hw2.0/board-2.bin    |  Bin 6278772 -> 6308684 bytes
>  ath12k/WCN7850/hw2.0/Notice.txt     | 3386 +++++++++++++++++++++++++++++=
++++++
>  ath12k/WCN7850/hw2.0/amss.bin       |  Bin 0 -> 6000704 bytes
>  ath12k/WCN7850/hw2.0/board-2.bin    |  Bin 0 -> 382856 bytes
>  ath12k/WCN7850/hw2.0/m3.bin         |  Bin 0 -> 299660 bytes
>  13 files changed, 3400 insertions(+), 2 deletions(-)
>  create mode 100644 ath12k/WCN7850/hw2.0/Notice.txt
>  create mode 100644 ath12k/WCN7850/hw2.0/amss.bin
>  create mode 100644 ath12k/WCN7850/hw2.0/board-2.bin
>  create mode 100644 ath12k/WCN7850/hw2.0/m3.bin

