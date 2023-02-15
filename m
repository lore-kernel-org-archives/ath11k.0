Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD115C636CC
	for <ath11k@archiver.kernel.org>; Wed, 15 Feb 2023 19:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oUc8eH7/I9gHg1iu1EnLEnWaP+J2dTxOrn3MIINGZp8=; b=P5hmf8GlY35WdS
	iR/VLtzYKl7itKUhME4xyhzplAf9Axs/10nQfzo93BRulWVsJoNedY2ej7Pdj3iXk/o7iqdEcijIM
	FX2yrAg0t4JfiYDbGs8WABjnv7Z6XUOBCimDQCb0rHcatZSMDvqBib4X3gRSXOkVD4f730N9wWZPu
	pYOLp3O+Xo0r5bF/gn10uNQq8HPO7lBH6PFmqokoVzQOfBhQc4wAgwJiEjN2K3dMO5ex37ncBX9ke
	O+U/4lcn1mCUzx2JfQgqbfoo7jcheR1ywEPnY9XMA0W0H/fANBMtpKFiJpCNk6aHBh7yexIQ2o9f8
	t0qoJhDEIVhH8jH+sKAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSNRj-006y0d-R5; Wed, 15 Feb 2023 19:28:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSNRf-006xz0-MC; Wed, 15 Feb 2023 19:28:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5528261BD5;
	Wed, 15 Feb 2023 19:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BC1C433EF;
	Wed, 15 Feb 2023 19:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676489276;
	bh=77deFbh1kwzI95YfY2HOEGkz4OJJgjpZQiM18t9j1YI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=JSB57JY5SU4XD8WCG/8IqtCLsJ7HbfO/vun00tY9rynBj3oPJ6WYArYWkCbtgl2nr
	 0AAeormczFQnH6FJPmtK+g8/VcbHGc+isuOvEmxG9QdbUmPNbEhKVJ5Y+2b+LH5gwG
	 VH/OwttOxK/59+4DGpnsOhQwLIPy2p7bZLpGt+udNODZx2H0GFaDxq3hZLzsLhBH88
	 PVU6yGeaczNPsPWQGSODSJv7qOo3YP8FEimhEnnFNymrBBBCZZRiassuxni17U+KTb
	 t57ZmVlyvPZj9uyb5QidTBmmK7GvzD2jPix/TWNwLW8sgbjHQGhc/mZZ29wLrVahbX
	 pNh7VYNUZqdqg==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-530b9a0a789so69410807b3.13;
        Wed, 15 Feb 2023 11:27:56 -0800 (PST)
X-Gm-Message-State: AO0yUKXavQpt0ubcotnxb+nnD1Ev7V7KGUPlcxtuRutf/HfsIqbEeW69
	IuuoTuLKrBhCtcLV2RTQKnse6cdfstmr80y6YvE=
X-Google-Smtp-Source: AK7set8YE4F0WC5yQ6uu/RsU32AgWOEa1eUtcJ9r+GVQcQ8y0YXMwNvjSc6L7U5wNA9mrQitnIu3TbnJLfgP1XpXIK4=
X-Received: by 2002:a25:ab30:0:b0:8d7:814e:4e53 with SMTP id
 u45-20020a25ab30000000b008d7814e4e53mr303226ybi.564.1676489275682; Wed, 15
 Feb 2023 11:27:55 -0800 (PST)
MIME-Version: 1.0
References: <878rgzuw37.fsf@kernel.org>
In-Reply-To: <878rgzuw37.fsf@kernel.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Wed, 15 Feb 2023 14:27:44 -0500
X-Gmail-Original-Message-ID: <CA+5PVA40QB4_5eEiQ_s0M4OSD+-Abbzr8z+YasUGasMZBxboYw@mail.gmail.com>
Message-ID: <CA+5PVA40QB4_5eEiQ_s0M4OSD+-Abbzr8z+YasUGasMZBxboYw@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k & ath11k firmware 20230215
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, ath11k@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_112759_848604_13EC5233 
X-CRM114-Status: GOOD (  20.83  )
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

On Wed, Feb 15, 2023 at 4:17 AM Kalle Valo <kvalo@kernel.org> wrote:
>
> Hi,
>
> Here's a new pull request for ath10k and ath11k. We have new hardware
> IPQ5018 and various updates for existing hardware. Especially many have
> requested the firmware update for WCN6855 which seems to fix an
> important suspend problem.
>
> Please let me know if there are any problems.
>
> Kalle
>
> The following changes since commit a253a3723f8a0ee5bc5d4f551981a651ba660186:
>
>   cnm: update chips&media wave521c firmware. (2023-02-14 12:58:03 -0500)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20230215

Pulled and pushed out.  Thanks.

josh

>
> for you to fetch changes up to c7a57ef688f7d99d8338a5d8edddc8836ff0e6de:
>
>   ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23 (2023-02-15 11:09:53 +0200)
>
> ----------------------------------------------------------------
> Kalle Valo (7):
>       ath10k: WCN3990 hw1.0: update board-2.bin
>       ath10k: QCA6174 hw3.0: update firmware-sdio-6.bin to version WLAN.RMH.4.4.1-00174
>       ath11k: IPQ5018 hw1.0: add board-2.bin
>       ath11k: IPQ5018 hw1.0: add to WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1
>       ath11k: WCN6750 hw1.0: update board-2.bin
>       ath11k: WCN6855 hw2.0: update board-2.bin
>       ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
>
>  WHENCE                                   |   27 +-
>  ath10k/QCA6174/hw3.0/firmware-sdio-6.bin |  Bin 604416 -> 607252 bytes
>  ath10k/WCN3990/hw1.0/board-2.bin         |  Bin 461060 -> 513892 bytes
>  ath11k/IPQ5018/hw1.0/Notice.txt          | 4094 ++++++++++++++++++++++++++++++
>  ath11k/IPQ5018/hw1.0/board-2.bin         |  Bin 0 -> 524564 bytes
>  ath11k/IPQ5018/hw1.0/m3_fw.b00           |  Bin 0 -> 148 bytes
>  ath11k/IPQ5018/hw1.0/m3_fw.b01           |  Bin 0 -> 136 bytes
>  ath11k/IPQ5018/hw1.0/m3_fw.b02           |  Bin 0 -> 262144 bytes
>  ath11k/IPQ5018/hw1.0/m3_fw.flist         |    3 +
>  ath11k/IPQ5018/hw1.0/m3_fw.mdt           |  Bin 0 -> 284 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b00           |  Bin 0 -> 532 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b01           |  Bin 0 -> 520 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b02           |  Bin 0 -> 7552 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b03           |  Bin 0 -> 545008 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b04           |  Bin 0 -> 86788 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b05           |  Bin 0 -> 17776 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b07           |  Bin 0 -> 1488 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b08           |  Bin 0 -> 4096 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b09           |  Bin 0 -> 2330624 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b10           |  Bin 0 -> 269028 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b11           |  Bin 0 -> 99436 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b13           |  Bin 0 -> 7024 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b14           |  Bin 0 -> 1668 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.flist         |   13 +
>  ath11k/IPQ5018/hw1.0/q6_fw.mdt           |  Bin 0 -> 1052 bytes
>  ath11k/WCN6750/hw1.0/board-2.bin         |  Bin 843548 -> 843548 bytes
>  ath11k/WCN6855/hw2.0/amss.bin            |  Bin 4972544 -> 4980736 bytes
>  ath11k/WCN6855/hw2.0/board-2.bin         |  Bin 1322820 -> 6158196 bytes
>  28 files changed, 4135 insertions(+), 2 deletions(-)
>  create mode 100644 ath11k/IPQ5018/hw1.0/Notice.txt
>  create mode 100644 ath11k/IPQ5018/hw1.0/board-2.bin
>  create mode 100644 ath11k/IPQ5018/hw1.0/m3_fw.b00
>  create mode 100644 ath11k/IPQ5018/hw1.0/m3_fw.b01
>  create mode 100644 ath11k/IPQ5018/hw1.0/m3_fw.b02
>  create mode 100644 ath11k/IPQ5018/hw1.0/m3_fw.flist
>  create mode 100644 ath11k/IPQ5018/hw1.0/m3_fw.mdt
>  create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b00
>  create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b01
>  create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b02
>  create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b03
>  create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b04
>  create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b05
>  create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b07
>  create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b08
>  create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b09
>  create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b10
>  create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b11
>  create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b13
>  create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.b14
>  create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.flist
>  create mode 100644 ath11k/IPQ5018/hw1.0/q6_fw.mdt

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
