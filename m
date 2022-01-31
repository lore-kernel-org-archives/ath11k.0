Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04803C433EF
	for <ath11k@archiver.kernel.org>; Mon, 31 Jan 2022 14:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzIixiwG7ohZMfyFyzzSMMeXBWkE5kN7lKbimhytLQM=; b=OqyIwytLG58zYI
	ZgXqu3cjx5bkaV67PsGMgiIC0SDD2ikByRz3fP/lVZlbEHqQ0bVu6CPXodDdfFUIf3lFTc2caEC3L
	xp6JCK0Any8unWSwiBmVK/mjQQ016vUiqoOE4EBZDPCb8lgnavG45jdkf4Bm94CHhOK3NzOu57gGX
	hh8Adxifx2EYj6JwSiPCot0irmC93ZvAQh58BCXWv4gZ1NMfpB4h6Z2Xcee+TpSCIMCidlae89mx7
	BS2/h84eUN6jSckBi/jzt9AU6QoMb29XD9VNk5lJ309PjmRFqzq4vg9BYs61rdaVRXeLc5efzYpxD
	qY7cpIX7kffA1v/Qw7wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEXE6-009Yxn-Vi; Mon, 31 Jan 2022 14:00:14 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEXE3-009YxU-Rd
 for ath11k@lists.infradead.org; Mon, 31 Jan 2022 14:00:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7E142B82ADB;
 Mon, 31 Jan 2022 14:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41BE3C340E8;
 Mon, 31 Jan 2022 14:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643637609;
 bh=e4EkiSX3SihHp5U31Zs8drqYOnv+WBmpGbtaxqsvHB4=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=bfjuMmtMCuziQYpcvtm/+6lCWRZ/xfFRdAShk7SzbnhY6nUaHZ5E+WDvp9KnNCfwC
 8Ykkwqe451pC5uGhmjNbAsvkG8/rvG/qS1e734S5ZI5n07ez5/W5b2l/EXgJfu3FdK
 4AmER0YTYSrafQDk5tWB6AL4S0n1Q/P/XEwd3sKhD7T++5aH0ioCK5ZJTpGg1LUsYN
 P0CwGjFkN1A9OcQBJtg2jH3kjqHGkxXhUTfbTSYqufbSOSq+Dfw1fn8AWpll1HRo0i
 xVJaa5yBUM6M/BgLlWAaQrtNXOj5DQ8AzGaHOysR1QEdvtqGYCvm0N/z9ERKYie9iW
 CbYwKajyWAQBQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix uninitialized symbol 'rx_buf_sz'
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1642605793-13518-1-git-send-email-quic_akolli@quicinc.com>
References: <1642605793-13518-1-git-send-email-quic_akolli@quicinc.com>
To: Anilkumar Kolli <quic_akolli@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Anilkumar Kolli <quic_akolli@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164363760657.22527.17165496476093064241.kvalo@kernel.org>
Date: Mon, 31 Jan 2022 14:00:08 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_060012_060715_32189A0F 
X-CRM114-Status: UNSURE (   6.43  )
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

Anilkumar Kolli <quic_akolli@quicinc.com> wrote:

> Add missing else statement in ath11k_dp_rx_process_mon_status()
> to fix below smatch warnings,
>     drivers/net/wireless/ath/ath11k/dp_rx.c:3105
>     ath11k_dp_rx_process_mon_status()
>     error: uninitialized symbol 'rx_buf_sz'.
> 
> Fixes: ab18e3bc1c13 ("ath11k: Fix pktlog lite rx events")
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Anilkumar Kolli <quic_akolli@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

dca857f07dc1 ath11k: Fix uninitialized symbol 'rx_buf_sz'

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1642605793-13518-1-git-send-email-quic_akolli@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
