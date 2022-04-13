Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067F3C433EF
	for <ath11k@archiver.kernel.org>; Wed, 13 Apr 2022 08:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHL15AG6DQPgNB1aiqXfbshFvwKaVp0c+CZ84gwp+co=; b=fy6RwqPP/DFGO3
	ervev/7PqDduQJbDw4rhqrkV4U7ffhV8dzHNtKpzN7woAOxAm330iBCitMiptmILJltNKPbGxdo5T
	rtOz4FWztJQrmc4YTiS+bHQLfbuGQi4OxBK377xqgqlS+efRM3aAyTpW3M1ib1yunOu+CRBPXLtXI
	FdusSSlLG1fnJ3LAtffjXRgwsSIIyOAFs5AENLDCxIGs6Y4YopkArv/S4+7fH62NKZVn6Q5nw/NuB
	kjaPvyHVQ1retsUofcPjoUJ6Scy8V7k83N39fyOIOHKM8w/bLW8hLrLFwocUGRrvcZQtfxnWY8utI
	gENU6MdxrUiyKn7HFmyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neYN2-0003rk-Fw; Wed, 13 Apr 2022 08:29:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neYMr-0003mO-PM
 for ath11k@lists.infradead.org; Wed, 13 Apr 2022 08:28:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 208D4B820FD;
 Wed, 13 Apr 2022 08:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C362FC385A3;
 Wed, 13 Apr 2022 08:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649838526;
 bh=y0bLgtdqrc4kC/bUaLQ8sB2CnYcK5VjYVok5sq719a0=;
 h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
 b=a3aUmlPtjj4+tULYr12Ypjw7JlPUSawZDDj6SDNalXhJj2AKSXEC+qu0pPiR12IMQ
 YT9aOSyaKdWIv8AObQ8DSgSxI/5Wb46zH1X1fPOkBzwgsj7FWgEeDOvqFYD7RZrwPk
 ZXNAG2UdJvPRAgnjuB+iCdXQHIqnA23X33cyBTiBUJSTuIjGPwX78PUF0YxYg54qE+
 xT08Q8NWGLaffPyvyerfV1YgRsmcOBYPt9OriUdcXX/zTM7iTywTgJF00HkndNxt9S
 eRPFgyH5NGhev5cl+Zb4qqsqbuwtXN+PQuQzzaSXC3Dq/iIQVM5twrstxMijsxr5pI
 UcQVuCneuVo1A==
From: Kalle Valo <kvalo@kernel.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: "linux-firmware\@kernel.org" <linux-firmware@kernel.org>,
 ath11k@lists.infradead.org,
 "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PULL] ath11k firmware 20211223
References: <BYAPR02MB4567669033A210A78AC397E9927E9@BYAPR02MB4567.namprd02.prod.outlook.com>
 <4785910.v3KmxWAaZY@ripper>
Date: Wed, 13 Apr 2022 11:28:43 +0300
In-Reply-To: <4785910.v3KmxWAaZY@ripper> (Sven Eckelmann's message of "Fri, 18
 Feb 2022 16:00:47 +0100")
Message-ID: <87czhlmlok.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_012850_002866_98E8CC1A 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

Sven Eckelmann <sven@narfation.org> writes:

> On Thursday, 23 December 2021 15:03:04 CET Kalle Valo wrote:
>>  ath11k/QCN9074/hw1.0/Notice.txt  |  802 ++++++++++++++++++++
>>  ath11k/QCN9074/hw1.0/amss.bin    |  Bin 0 -> 11897676 bytes
>>  ath11k/QCN9074/hw1.0/m3.bin      |  Bin 0 -> 340108 bytes
>
> This pull adds the firmware for QCN9074 but not the board-2.bin. As result, 
> the initialization of the ath11k PHY will fail.

Good point, I missed that. My plan is to include both QCN9074 firmware
and board-2.bin in my next pull request.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
