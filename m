Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAB5C433EF
	for <ath11k@archiver.kernel.org>; Mon,  2 May 2022 12:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3zmBtU/TUjLH/njQX+AInEKTYMsiEgVvhMobsFC19OE=; b=gwjMFWTyIUzgSO
	iXDNmM6pOckRO3htgf0U4tA6PUz8EHntFwM5/mkpmP7+Tj0uTHvMIteUhHUqGpYgmHepC2Xtw5Iqm
	BIx9SUiIh6mvfQ7y4OPd6CqAByP1qTpzi6Dg41zHquWPdCTfJspFpcW4rWbFmIf16M2rQEmuAL48v
	d2aP2lcXFd5kxm0OxjW6sW7RGBqdd2SiDWmvjyVhFx7l5izuPDMXwPGX572slDuG6wc+fC3R4440c
	CR077BGRlUkbKvJYUuLPQillhJYRCVomWXptrC7l4vCRoDKtGXb6crGpPQiwmmZI8R6ZDr7cxhtQM
	Egsm7kiSiLu3UxV5a/4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlVDy-0018KF-D8; Mon, 02 May 2022 12:32:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlVDu-0018JF-7f; Mon, 02 May 2022 12:32:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B038F61306;
 Mon,  2 May 2022 12:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DFCC385AE;
 Mon,  2 May 2022 12:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651494737;
 bh=X9If51qcWdiMTVlgA2TPtHyf0UjlycqYJE3P4DiffrY=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=cQZsHWQEuO73IacvTwJmmKk0Y/TVHyI9XVbRfQc3151eEwn5DUX/fyFfqCdfqx71b
 6+27oHEankMaor7RDVc8eNj2dIlkpFjwx1i6dVTXHWTGPciY60CikQRYV/IHvRr/mu
 TxI1NXtK3q/tbKTYjnaPJPIXkgNIhjXH+8gZvYFgTkWh8XtYk8RukAvHBwheNR3OAs
 pdsc5vSto8vL9y8iupd8H0A3/a0S0tR9nel7kRnzSZpwUZA1enKqB2xeCcx+F2mAAL
 Jp3VTDDje657VNzMb+/VHXdUGo8a/7Cp4gCkIszJu5+msGctITGWEy9z2iitrCmrTe
 wBYnFBGfKNKKQ==
Received: by mail-io1-f50.google.com with SMTP id r27so10909455iot.1;
 Mon, 02 May 2022 05:32:17 -0700 (PDT)
X-Gm-Message-State: AOAM532QNnBXd8ZPtgXv1emJ7tHk2m4Bah+qZ/uXEdHwaXTv7UCRoDb7
 1Vr3904q88G+Y3Fl5jBSr1ybr6VpDI0EWfkfhFs=
X-Google-Smtp-Source: ABdhPJy8beIkgtq3LLJuhh6P9mLA6lAyScLigyutOfUQ4AodxjHjl7fq7DTiNdra5+tY4bJZ3u+wR+6Y+ekXgFq475g=
X-Received: by 2002:a6b:fa13:0:b0:64f:d480:30d3 with SMTP id
 p19-20020a6bfa13000000b0064fd48030d3mr4243504ioh.179.1651494736240; Mon, 02
 May 2022 05:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <BYAPR02MB4567E377F14F272DFF48907A92FA9@BYAPR02MB4567.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB4567E377F14F272DFF48907A92FA9@BYAPR02MB4567.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 2 May 2022 08:32:05 -0400
X-Gmail-Original-Message-ID: <CA+5PVA76L84n-EiL+DTkVKiw6ney3r9e+=U=xEfO-tCX2H05=A@mail.gmail.com>
Message-ID: <CA+5PVA76L84n-EiL+DTkVKiw6ney3r9e+=U=xEfO-tCX2H05=A@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20220423
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
 "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, 
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_053218_402286_A70D4686 
X-CRM114-Status: GOOD (  19.43  )
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

On Wed, Apr 27, 2022 at 4:32 AM Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
> Add support for QCN9074 and WCN6750 ath11k hardware families. Also
> there are several updates to existing firmwares and board files for both ath10k
> and ath11k.
>
> Please let me know if there are any problems.
>
> Kalle
>
> The following changes since commit e6553076626e932983b1947e1cc593421cb83aa8:
>
>   Mellanox: Add new mlxsw_spectrum firmware xx.2010.1502 (2022-04-21 06:46:21 -0400)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20220423

Pulled and pushed out.  Thank you.

josh

>
> for you to fetch changes up to 4a0e59f95830817b1601631281191a5c3327d138:
>
>   ath11k: QCA6390 hw2.0: update to WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1 (2022-04-27 11:23:17 +0300)
>
> ----------------------------------------------------------------
> Kalle Valo (19):
>       ath11k: IPQ6018 hw1.0: update board-2.bin
>       ath11k: IPQ6018 hw1.0: update to WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
>       ath11k: IPQ8074 hw2.0: update board-2.bin
>       ath11k: IPQ8074 hw2.0: update to WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
>       ath11k: QCA6390 hw2.0: update board-2.bin
>       ath11k: QCN9074 hw1.0: add board-2.bin
>       ath11k: QCN9074 hw1.0: add to WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
>       ath11k: WCN6750 hw1.0: add board-2.bin
>       ath11k: WCN6750 hw1.0: add to WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
>       ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.7
>       ath10k: QCA99X0 hw2.0: add board-2.bin
>       ath10k: QCA4019 hw1.0: update board-2.bin
>       ath10k: QCA6174 hw3.0: update firmware-6.bin to WLAN.RM.4.4.1-00288-QCARMSWPZ-1
>       ath10k: QCA6174 hw3.0: update board-2.bin
>       ath10k: QCA9888 hw2.0: update firmware-5.bin to 10.4-3.9.0.2-00156
>       ath10k: QCA9888 hw2.0: update board-2.bin
>       ath10k: QCA9984 hw1.0: update firmware-5.bin to 10.4-3.9.0.2-00156
>       ath10k: QCA9984 hw1.0: update board-2.bin
>       ath11k: QCA6390 hw2.0: update to WLAN.HST.1.0.1-05266-QCAHSTSWPLZ_V2_TO_X86-1
>
>  WHENCE                              |   34 +-
>  ath10k/QCA4019/hw1.0/board-2.bin    |  Bin 607304 -> 1129788 bytes
>  ath10k/QCA6174/hw3.0/board-2.bin    |  Bin 715444 -> 731852 bytes
>  ath10k/QCA6174/hw3.0/firmware-6.bin |  Bin 702844 -> 706004 bytes
>  ath10k/QCA9888/hw2.0/board-2.bin    |  Bin 84928 -> 133540 bytes
>  ath10k/QCA9888/hw2.0/firmware-5.bin |  Bin 691292 -> 693604 bytes
>  ath10k/QCA9984/hw1.0/board-2.bin    |  Bin 171916 -> 220528 bytes
>  ath10k/QCA9984/hw1.0/firmware-5.bin |  Bin 679288 -> 681568 bytes
>  ath10k/QCA99X0/hw2.0/board-2.bin    |  Bin 0 -> 157680 bytes
>  ath10k/QCA99X0/hw2.0/board.bin      |  Bin 12064 -> 0 bytes
>  ath11k/IPQ6018/hw1.0/Notice.txt     | 3916 +++++++++++++++++--
>  ath11k/IPQ6018/hw1.0/board-2.bin    |  Bin 787208 -> 787208 bytes
>  ath11k/IPQ6018/hw1.0/m3_fw.b01      |  Bin 6712 -> 6712 bytes
>  ath11k/IPQ6018/hw1.0/m3_fw.b02      |  Bin 294912 -> 294912 bytes
>  ath11k/IPQ6018/hw1.0/m3_fw.mdt      |  Bin 6860 -> 6860 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b00      |  Bin 340 -> 340 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b01      |  Bin 7000 -> 7000 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b02      |  Bin 4696 -> 4696 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b03      |  Bin 2357712 -> 2557136 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b04      |  Bin 370560 -> 412064 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b05      |  Bin 175588 -> 198052 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b07      |  Bin 8936 -> 9416 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b08      |  Bin 409914 -> 453364 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.mdt      |  Bin 7340 -> 7340 bytes
>  ath11k/IPQ8074/hw2.0/Notice.txt     | 3916 +++++++++++++++++--
>  ath11k/IPQ8074/hw2.0/board-2.bin    |  Bin 1311380 -> 1311380 bytes
>  ath11k/IPQ8074/hw2.0/m3_fw.b01      |  Bin 136 -> 136 bytes
>  ath11k/IPQ8074/hw2.0/m3_fw.b02      |  Bin 327680 -> 327680 bytes
>  ath11k/IPQ8074/hw2.0/m3_fw.mdt      |  Bin 284 -> 284 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b00      |  Bin 340 -> 340 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b01      |  Bin 328 -> 328 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b02      |  Bin 4696 -> 4696 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b03      |  Bin 2589264 -> 2934864 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b04      |  Bin 985504 -> 1009888 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b05      |  Bin 387076 -> 243652 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b07      |  Bin 7048 -> 9816 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b08      |  Bin 424524 -> 486546 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.mdt      |  Bin 668 -> 668 bytes
>  ath11k/QCA6390/hw2.0/Notice.txt     | 4839 ++++++++++++++++-------
>  ath11k/QCA6390/hw2.0/amss.bin       |  Bin 3609456 -> 3628672 bytes
>  ath11k/QCA6390/hw2.0/board-2.bin    |  Bin 58016 -> 115984 bytes
>  ath11k/QCA6390/hw2.0/m3.bin         |  Bin 266684 -> 266684 bytes
>  ath11k/QCN9074/hw1.0/Notice.txt     | 4094 +++++++++++++++++++
>  ath11k/QCN9074/hw1.0/amss.bin       |  Bin 0 -> 11905872 bytes
>  ath11k/QCN9074/hw1.0/board-2.bin    |  Bin 0 -> 786836 bytes
>  ath11k/QCN9074/hw1.0/m3.bin         |  Bin 0 -> 340108 bytes
>  ath11k/WCN6750/hw1.0/Notice.txt     | 7380 +++++++++++++++++++++++++++++++++++
>  ath11k/WCN6750/hw1.0/board-2.bin    |  Bin 0 -> 843548 bytes
>  ath11k/WCN6750/hw1.0/wpss.b00       |  Bin 0 -> 340 bytes
>  ath11k/WCN6750/hw1.0/wpss.b01       |  Bin 0 -> 6848 bytes
>  ath11k/WCN6750/hw1.0/wpss.b02       |  Bin 0 -> 10300 bytes
>  ath11k/WCN6750/hw1.0/wpss.b03       |  Bin 0 -> 4096 bytes
>  ath11k/WCN6750/hw1.0/wpss.b04       |  Bin 0 -> 5783231 bytes
>  ath11k/WCN6750/hw1.0/wpss.b05       |  Bin 0 -> 175236 bytes
>  ath11k/WCN6750/hw1.0/wpss.b06       |  Bin 0 -> 266684 bytes
>  ath11k/WCN6750/hw1.0/wpss.b07       |  Bin 0 -> 1176368 bytes
>  ath11k/WCN6750/hw1.0/wpss.b08       |    0
>  ath11k/WCN6750/hw1.0/wpss.mdt       |  Bin 0 -> 7188 bytes
>  ath11k/WCN6855/hw2.0/amss.bin       |  Bin 4972544 -> 4972544 bytes
>  59 files changed, 22238 insertions(+), 1941 deletions(-)
>  create mode 100644 ath10k/QCA99X0/hw2.0/board-2.bin
>  delete mode 100644 ath10k/QCA99X0/hw2.0/board.bin
>  create mode 100644 ath11k/QCN9074/hw1.0/Notice.txt
>  create mode 100644 ath11k/QCN9074/hw1.0/amss.bin
>  create mode 100644 ath11k/QCN9074/hw1.0/board-2.bin
>  create mode 100644 ath11k/QCN9074/hw1.0/m3.bin
>  create mode 100644 ath11k/WCN6750/hw1.0/Notice.txt
>  create mode 100644 ath11k/WCN6750/hw1.0/board-2.bin
>  create mode 100644 ath11k/WCN6750/hw1.0/wpss.b00
>  create mode 100644 ath11k/WCN6750/hw1.0/wpss.b01
>  create mode 100644 ath11k/WCN6750/hw1.0/wpss.b02
>  create mode 100644 ath11k/WCN6750/hw1.0/wpss.b03
>  create mode 100644 ath11k/WCN6750/hw1.0/wpss.b04
>  create mode 100644 ath11k/WCN6750/hw1.0/wpss.b05
>  create mode 100644 ath11k/WCN6750/hw1.0/wpss.b06
>  create mode 100644 ath11k/WCN6750/hw1.0/wpss.b07
>  create mode 100644 ath11k/WCN6750/hw1.0/wpss.b08
>  create mode 100644 ath11k/WCN6750/hw1.0/wpss.mdt

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
