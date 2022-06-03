Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8268C433EF
	for <ath11k@archiver.kernel.org>; Fri,  3 Jun 2022 08:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ot7jFsKA12antyb5ow7l6Ssn0x6ZfrcJ8rD/b2NmWHw=; b=QtSoo/DMsQp3Li
	+0Bt1h6/9v5eC2ceqpqoULAoFslWOamY3dV8/t0VA7PWXNi0To1F67hdikNQX+2Z0oku18RjwJGZt
	8CUWYwDLQ10u3mR89j8kwkviOLzcaXQf76CYm/AeIjlGy0FfWxZB2RDJMB8SMdS5uWEUzjtjKqqHD
	K+BVI7FvOm02Hg3zXUACikWst4t67JHgHZ9TSZ5Dylafw7r9kn/TJLhXl+g6lTJPiyHzAlf2EZPZQ
	kN0EJYt1WJKqn8cBEO16RxfD7kxivJDvcr+ETUhq3bk/7U38p28t7Nn+Pj6jSf/Ggsb2SrXBoPQTD
	T/fZCatkz1ltKERbD3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2n4-006gFI-E3; Fri, 03 Jun 2022 08:36:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx2n1-006gET-7s
	for ath11k@lists.infradead.org; Fri, 03 Jun 2022 08:36:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C8CD861949;
	Fri,  3 Jun 2022 08:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7D0C385A9;
	Fri,  3 Jun 2022 08:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654245374;
	bh=ZJmVz9kkx4apLqs6k7nA/DEKO3XbqbAbdgWAiAfN4v4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ScmyZ4Y/DXP7Az1HR5CwOjsuLBLIvNmyZX4A2WsAMVU8zq35jB2aRf+/FClm6oby0
	 mLjXqlQDzLXr8fzjBwzaOtghonv2LfTI4Po1bxERODtPetC+95F7hH3/VS0KAXEkGi
	 v1F+guDbCYLp9pCBQ+61A+c4NizslyMRzbN61AUjZP5th3X8Wqd6xbeOWWR8XMd9Mm
	 0FGe8ck/W+LwxWAyGdtJldGL1Muxj+bZwAXLy5CwrM879bIu2Vh9POCV4RAFgt85TY
	 LJ/geNju1znYZNvCxmOai1WIA9EkDj9ZoalCB20gR3TFw5NZXjm8VC4D5Wd5MnpzZ0
	 mhwiNbT0onwmQ==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: "ath11k\@lists.infradead.org" <ath11k@lists.infradead.org>
Subject: Re: WCN6855 issues with latest linux-firmware
References: <a1657ff0-198c-14f9-3b2b-d7ab06cfc8e6@linaro.org>
	<CAA8EJpoHKUSx3Aq+fB-4s0ZpZXfvp8p-==hO12hxsrxE46YfCw@mail.gmail.com>
Date: Fri, 03 Jun 2022 11:36:11 +0300
In-Reply-To: <CAA8EJpoHKUSx3Aq+fB-4s0ZpZXfvp8p-==hO12hxsrxE46YfCw@mail.gmail.com>
	(Dmitry Baryshkov's message of "Wed, 1 Jun 2022 15:40:31 +0300")
Message-ID: <87zgium9dw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_013615_339869_C3CB47D6 
X-CRM114-Status: GOOD (  11.49  )
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

> I have tested the latest firmware from linux-firmware and it still
> fails to send the bdf file request:
>
> [    3.740702] ath11k_pci 0000:01:00.0: chip_id 0x2 chip_family 0xb
> board_id 0xa7 soc_id 0x400c0210
> [    3.752952] ath11k_pci 0000:01:00.0: fw_version 0x11090c35
> fw_build_timestamp 2022-04-18 20:23 fw_build_id
> QC_IMAGE_VERSION_STRING=WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.9
> [    3.760674] ath11k_pci 0000:01:00.0: failed to fetch board data for
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2,qmi-board-id=167
> from ath11k/WCN6855/hw2.1/board-2.bin
> [....]
> [   13.843957] ath11k_pci 0000:01:00.0: failed to wait board file
> download request: -110

Yeah, I have a bunch of missing board files but I haven't been able to
start searching for them yet. This will take time, sorry.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
