Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A2AC433EF
	for <ath11k@archiver.kernel.org>; Fri,  6 May 2022 06:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=86KLkIJXaPADyZcpS5DkZlIw0rLoHNipE9wYYin+AfY=; b=jdAQPxJfvG+SPX
	9jJ3FUk4NKpwvFSNfemxwhIWtHQ76O1FuH5uKAbs6DaW2g2OsVv6dwQH7vDWIEXqE4gn4RyYgBC6B
	LQlpeYx9lySzSrSMs7avWd5ZwzAOGxQz05FR2R7d/bEDceH65BeJq7oLEpATxgW7mBaLneO4zZMWg
	fH3875omTGlZSiWEMw3ZKLf/CuF6QxkmPHxHaHANnPUiH16LfHDkhui3e/S2gT+EJUBQRM8XosJpU
	vaCA5G8JjzRVqQIt7NkUpk04T0eU784vT+0KsJfYFhIdkL1H9CO0y981NHuepTGHnG/ynGV+tVBc9
	IxPMmPaHVsJIma7LXq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmrc0-001eKi-8X; Fri, 06 May 2022 06:38:48 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmrbw-001eCc-1d
 for ath11k@lists.infradead.org; Fri, 06 May 2022 06:38:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EB03FB833B5;
 Fri,  6 May 2022 06:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2405BC385AA;
 Fri,  6 May 2022 06:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651819118;
 bh=x4uCI5AGloXuZ5WEfeg+M51+iY7AfE6W/0NGsM3IUrQ=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=NslOF7TNcxc+gKS2MCHyiu+ab7NXKHWJcbJ4g9DeFU1/xUJJs8KmocNvVeuqhL/6x
 usXRZRMS8p7JYmIFte1C6JbyZyHg8f/MN1an/1pfUBDNJbwRTNjBBmOKXzX486R2t0
 Vtfuz2j6vVtW8F/KS1PEoBNFj3lBVJbWn+FJqTfq/WDSkQcNq8Z5VEoGw3UVzyC/Wz
 SaERIEaaUxKQy82uqJKsi1/MR3YvYEerHxD/z0anb9FWkUk6rb4r4oXFXqBdO3yYv+
 E0kKTPhKwgaNxo4QLXU4jWMJWBu8ZqHip4YyATDQJct+i4E5o4UMK5FFCCutn4V0Si
 HNGihxruan01g==
From: Kalle Valo <kvalo@kernel.org>
To: Wim Van Boven <wimvanboven@gmail.com>
Cc: ath11k <ath11k@lists.infradead.org>
Subject: Re: support for WCN6855 liteon subsystem device 11ad:a82d
References: <6VYEBR.N4O0Q6H2MTME3@gmail.com>
Date: Fri, 06 May 2022 09:38:35 +0300
In-Reply-To: <6VYEBR.N4O0Q6H2MTME3@gmail.com> (Wim Van Boven's message of
 "Thu, 05 May 2022 16:28:18 +0200")
Message-ID: <87bkwb9ndg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_233844_307029_C53271E6 
X-CRM114-Status: GOOD (  13.76  )
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

Wim Van Boven <wimvanboven@gmail.com> writes:

> the firmware doesn't have the board information for this
> subsystem-device:
>
> 02:00.0 Network controller [0280]: Qualcomm Atheros QCNFA765
> [17cb:1103] (rev 01)
> Subsystem: Lite-On Communications Inc Device [11ad:a82d]
>
> however, it seems to work fine with this one:
> bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=9409,qmi-chip-id=18,qmi-board-id=255m
>
> i hexedited the board-2.bin and swapped out the vendor and device
> identifiers to match the LiteOn ones, which seems to work properly,
> but is likely not the proper way to do this.

BTW we have a tool for creating board-2.bin so that you don't need to
use hexedit:

https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath11k/ath11k-bdencoder

Unfortunately no documentation but hopefully --help provides some guidance.

> what would be the proper way to get support for this device and how
> can i help?

Can you report this to bugzilla.kernel.org:

https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport

That way it's easier to track. I'll try to find a board file for this
device.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
