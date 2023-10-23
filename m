Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58003C001E0
	for <ath11k@archiver.kernel.org>; Mon, 23 Oct 2023 14:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Hw6hWtZp4zF0nYmNbQJdXngGnkLIn3Bcfw1QZQcCe8=; b=LQMbtP1zfvGfly
	2hB/TFhaPWCXsT/Y7hs/yjTBn6XjkUTTOID8NzJ9FGtMCWYt1yT1vmCAOp+KAgqTkp8DZpvy4+qJI
	zgeifL2xV7pqyOfI7e7bGFc4pCbrbcfD+vL5Uh5/C4RBuWgWbzlVPg9VNTsSBGI4DkRg3GOvdtTNG
	mB1ykMBRqJa3q2+nyIhW8FcOflgDaa8BxPvEsD6h62UpAx8tC3L4OpO+9SbgbVQt4QHs2aR+44ttP
	P7p5IvM1zDOHxhRwJHBEOjs5IjHwC5g6bE/P+8V5nsgv4vFdRNmOYA7yxf8QCSRp6bqDtx/6k/5EP
	uJum9q14Ciz26FOA7rbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quw1C-007Ymh-07;
	Mon, 23 Oct 2023 14:34:58 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quw17-007Yly-2V
	for ath11k@lists.infradead.org;
	Mon, 23 Oct 2023 14:34:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 74894B80AD5;
	Mon, 23 Oct 2023 14:34:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA62C433C8;
	Mon, 23 Oct 2023 14:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698071691;
	bh=JYDlcXXlP+MSCd42LrNkKzSs3Am/gU/ZQMAJKqivErA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pBg3HUbz5e21X45ZF5mjxFvmw6h2zCf5aBsrAKLEws4W8h+AvuuQqG/sJInaroo2E
	 hlDnOeC08T71LZd9sTnRzigQ98M9g04024+odI/E6T9PYR7mJ92FO8T1M8D4H0M1vi
	 7r8W3wVw4yXFsuGb2isHcDtbe4au85x4fhnyN2bOe5Pjf6OWH/t5XSZ+unfybBf9Bl
	 gT8xaPNwsNEJ7JruFjiInyFXJk8Vyem54Q2k8ewCQTZRPnd3h1jWUduNRwP/9go/gl
	 /+EoqFM+WQDAw1EAZubKPB70XcLQuzII+eb6sDHKVcHp2tj5IqUPz+9Vq65lCpMDHl
	 fKWKoFLSznqSA==
From: Kalle Valo <kvalo@kernel.org>
To: ath11k@lists.infradead.org
Cc: Aloka Dixit <quic_alokad@quicinc.com>
Subject: Re: ath11k: QCA6390 hw2.0: firmware crashing on ath.git master branch
References: <87edhu3550.fsf@kernel.org>
Date: Mon, 23 Oct 2023 17:34:49 +0300
In-Reply-To: <87edhu3550.fsf@kernel.org> (Kalle Valo's message of "Mon, 16 Oct
	2023 19:26:35 +0300")
Message-ID: <87o7gpz9ti.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_073453_943025_19C08DFE 
X-CRM114-Status: GOOD (  14.44  )
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

+ aloka

Kalle Valo <kvalo@kernel.org> writes:

> Last week I updated ath.git master branch to v6.6-rc4 (from v6.5). My
> regression tests were passing without issues. But once I updated my
> daily driver laptop Dell XPS 13 9310 to ath.git master branch (tag
> ath-202310100725) the firmware started crashing daily:
>
> [71990.787525] ath11k_pci 0000:72:00.0: firmware crashed: MHI_CB_EE_RDDM
>
> This happens during resume and ath11k won't work after the crash, not
> even reload ath11k kernel modules won't help and I need to reboot the
> whole laptop.
>
> The strange part is that I haven't yet seen these crashes on Linus'
> official release (tag v6.6-rc4). I don't know if this is just a
> coincidence or the bug causing is just in ath.git master branch. I'll
> continue testing tag v6.6-rc4 to see if I see the firmware crash also
> with that.
>
> The problem here is of course that I see the crash only in average once
> per day so a git bisect is difficult. Has anyone else seen anything
> similar?

I found a reliable way to reproduce the firmware crash. I connect to my
home network, then do 'sudo service connman stop' and boom, the firmware
has crashed. I suspect it has nothing to do with connman, most likely a
simple disconnect will suffice but I didn't bother to test that.

I did a git bisect and it points to Aloka's recent commit. Luckily the
commit is only in ath-next so far and not in any release. My plan is to
submit a revert by tomorrow so that we get this fixed before pulling
ath-next into wireless-next.

e149353e6562f3e3246f75dfc4cca6a0cc5b4efc
commit e149353e6562f3e3246f75dfc4cca6a0cc5b4efc
Author:     Aloka Dixit <quic_alokad@quicinc.com>
AuthorDate: Mon Oct 9 10:13:54 2023 +0300
Commit:     Kalle Valo <quic_kvalo@quicinc.com>
CommitDate: Tue Oct 10 10:23:02 2023 +0300

    wifi: ath11k: call ath11k_mac_fils_discovery() without condition

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
