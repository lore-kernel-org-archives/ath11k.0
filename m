Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A1AC433F5
	for <ath11k@archiver.kernel.org>; Wed,  9 Mar 2022 12:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=STkkeKllCz9er5vcydhPU8VFfHNkbV+O0E2/kz/Lu3w=; b=0mIEHMwHn41zY7
	pEibqsaD3YZWDVOt1wE420D8jTOy3diZon6j9oDMvB+dLlS5CUd4tcqa6zHH9R5jPMqPl7dD7EEnr
	egGy6P3VSoKthqpG1MwFVfuQUjZ6bV+MaQ//l3SihSTjt9Jot6vrlxvFsYaeVltLJIM9iADTH0p8y
	hVpGISeG2IgtBb9NLA1WenrsJ9Z+NErNWZL3q8M9j6CQKJAfGbIA4BYGw5LD1KqVccSrt7JDEoVIb
	8OPRrmTVQ66SKSGePMeLk/kSI5ao3ojCuUCd5KAS2TG1NpSLBvHFVV4b4wTbqZFmiOXkL+WYglU/m
	jLp82n/2gouMk90jJhuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRvQr-008a1O-Re; Wed, 09 Mar 2022 12:28:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRvQm-008a08-N9; Wed, 09 Mar 2022 12:28:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 74E69B82039;
 Wed,  9 Mar 2022 12:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9FFC340EE;
 Wed,  9 Mar 2022 12:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646828917;
 bh=LHAIB28Kz3tNaYpxdWarxfSrRGCmeqElibWd2WIzOys=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=TzMcVxnl+zskvXgWuPvR+EXDnMqL5n8MWfXRrr83lsZuw4+jzSfhlV+k2qvcSa+Ik
 9yYZXNA51C0Jy5rC4UJ53Z6nP9FnUUDnJ3iEEcvMGDrUjliWRpK2Brxsqqs+Px461J
 A6Vbwz6t4O7dykF44NTrw9OC7FZAjaqsroSfudFNqNmzFXKksf1DSRpTTv3hsClx5G
 k20J6mCTeRe1nFAKEwVV7Q5cKjj/Mfv7zjc1wXCNHmhmJxYTIN7NAGGuaj3QHKe+dN
 +oELvlqPJ2skW/+nyFS89vFrgHEM72rOhhE4rPCHX7uTT7NJmdo3lK9Lb4ZQ78s6Vw
 5fFDRFJ/5WL0w==
Received: by mail-il1-f174.google.com with SMTP id j29so1342485ila.4;
 Wed, 09 Mar 2022 04:28:37 -0800 (PST)
X-Gm-Message-State: AOAM530mjotr4LwigWKRRyv5Fo8AnXGV4oTY44MLvZxwLcsaf9tta/KL
 zL+r64K3s05TxdHl/+5b4osFYY2nI1m43ucS0TM=
X-Google-Smtp-Source: ABdhPJzG2p3OSIkkJVGwKtr2MBYB5qyILPfU4tzVnDLbVWmtOONDKP0tu+TM623kHFkvrhjx7973lHhN2S7cgqAQ1Zc=
X-Received: by 2002:a05:6e02:1688:b0:2c6:4a85:a1bf with SMTP id
 f8-20020a056e02168800b002c64a85a1bfmr10991305ila.243.1646828916333; Wed, 09
 Mar 2022 04:28:36 -0800 (PST)
MIME-Version: 1.0
References: <BYAPR02MB4567574A7FBBA13037C4283692089@BYAPR02MB4567.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB4567574A7FBBA13037C4283692089@BYAPR02MB4567.namprd02.prod.outlook.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 9 Mar 2022 07:28:25 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7UGLCSvTuDdxKUU65sV8GG1JjoMSAeLuJGo6Afq9xE6w@mail.gmail.com>
Message-ID: <CA+5PVA7UGLCSvTuDdxKUU65sV8GG1JjoMSAeLuJGo6Afq9xE6w@mail.gmail.com>
Subject: Re: [PULL] ath10k & ath11k firmware 20220307
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
 "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, 
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_042841_092169_F7EA7F27 
X-CRM114-Status: GOOD (  19.80  )
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

On Mon, Mar 7, 2022 at 12:37 PM Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>
> Hi,
>
> Here is a small pull request to use "File:" on all ath10k and ath11k notice.txt files and add support for
> WCN6855 hw2.0 and hw2.1 hardware families. Please let me know if there are any problems.
>
> Kalle
>
> The following changes since commit f011ccb490f952ea35e9ce4d73ca9b7d0d2453c3:
>
>   linux-firmware: add firmware for MT7986 (2022-03-04 08:43:26 -0500)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20220307
>
> for you to fetch changes up to e8bc0db413b4ab7f8e540ffa17991ff61252de9c:
>
>   ath11k: add links for WCN6855 hw2.1 (2022-03-07 19:18:22 +0200)
>
> ----------------------------------------------------------------
> Kalle Valo (4):
>       ath10k/ath11k: mark notice.txt as "File:"
>       ath11k: WCN6855 hw2.0: add board-2.bin and regdb.bin
>       ath11k: WCN6855 hw2.0: add WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>       ath11k: add links for WCN6855 hw2.1

Pulled and pushed out.  Thank you for working with me on this.

josh

>
>  WHENCE                           |   46 +-
>  ath11k/WCN6855/hw2.0/Notice.txt  | 3658 ++++++++++++++++++++++++++++++++++++++
>  ath11k/WCN6855/hw2.0/amss.bin    |  Bin 0 -> 4972544 bytes
>  ath11k/WCN6855/hw2.0/board-2.bin |  Bin 0 -> 1322820 bytes
>  ath11k/WCN6855/hw2.0/m3.bin      |  Bin 0 -> 266684 bytes
>  ath11k/WCN6855/hw2.0/regdb.bin   |  Bin 0 -> 24310 bytes
>  6 files changed, 3686 insertions(+), 18 deletions(-)
>  create mode 100644 ath11k/WCN6855/hw2.0/Notice.txt
>  create mode 100644 ath11k/WCN6855/hw2.0/amss.bin
>  create mode 100644 ath11k/WCN6855/hw2.0/board-2.bin
>  create mode 100644 ath11k/WCN6855/hw2.0/m3.bin
>  create mode 100644 ath11k/WCN6855/hw2.0/regdb.bin

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
