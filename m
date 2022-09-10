Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB68ECAAD5
	for <ath11k@archiver.kernel.org>; Sat, 10 Sep 2022 06:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4iYWSrNZ/3xjMj3pN/6G0mfWEmjKj4GMV8+AnFAI50=; b=xF6jKqj4y1La7h
	X5ptQvjvsi+U8cHZPjsXvE3QI47tl97quSFd2tzpcMkh3oIaWrTed2kj/zOLJQhZ9vvF+k6yo2F8r
	z6ODQGHkP6NYvEkYANhRL3GDqf/zrk5VbBtn06/hUn+JpmEbb49CzZxwRCr2MGrknJuvNLJI1iYiW
	95iE4PZgseyI5AfGzcovfXtZT00gmMZELWiaRwkGGBHLtOmTzAnPGh7LuJYvk3QWuCPIjEEEaAvA4
	JPCtqGGm6oE+alNd3OVo2+r+JVYf6h9eeWWNaCPWZ+FDgwwIlmdpIx51Ht+WiMkf7KzIE3w1arJIS
	E/hpkDI1PYrVN6fuN15w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWtxg-006jEx-2i; Sat, 10 Sep 2022 06:27:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWtxd-006jDY-7m
	for ath11k@lists.infradead.org; Sat, 10 Sep 2022 06:27:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 31814B8074E;
	Sat, 10 Sep 2022 06:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730C7C433D7;
	Sat, 10 Sep 2022 06:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662791241;
	bh=GXAqaX6S5isTiZevwTGC5NS6o9x12/MY1+Xsels5fyY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=lLL3kBYo9Krm21ps6ucufzFryCtpdVR/tx8NS2P5vV+nm3W5ZYrTFqAb1n5ZayT/N
	 2jm1lz6nimtPoVCz7/IzDLBNU+3KmbRwJLnGBipLCcg/wY6qBIH2/qjrt6GSZafnel
	 uFgOtR7c5oDco1ht0lLVaZMh6eLkK1d/p1oDhiKG+ttsr8rq4yn27n1uaS5x+Dxmq0
	 M5/LvQlzGOBSVzTr3WPBCeVBQfWmdOCNxkTJVlO32Sculj3kwoqFde+j6U9aj2NHxd
	 e2QQ3yR31iMJ9xgv6acI3S8H3zeABvEDwW0WK4XgmuhwtiUHkRLmhMoojZ7UygSofl
	 jR/WZa+xhla9w==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: mhi: fix potential memory leak in
 ath11k_mhi_register()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220907073704.58806-1-niejianglei2021@163.com>
References: <20220907073704.58806-1-niejianglei2021@163.com>
To: Jianglei Nie <niejianglei2021@163.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jianglei Nie <niejianglei2021@163.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166279123716.2050.14052144817465731004.kvalo@kernel.org>
Date: Sat, 10 Sep 2022 06:27:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_232725_455058_9FFA6407 
X-CRM114-Status: UNSURE (   9.60  )
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

Jianglei Nie <niejianglei2021@163.com> wrote:

> mhi_alloc_controller() allocates a memory space for mhi_ctrl. When gets
> some error, mhi_ctrl should be freed with mhi_free_controller(). But
> when ath11k_mhi_read_addr_from_dt() fails, the function returns without
> calling mhi_free_controller(), which will lead to a memory leak.
> 
> We can fix it by calling mhi_free_controller() when
> ath11k_mhi_read_addr_from_dt() fails.
> 
> Signed-off-by: Jianglei Nie <niejianglei2021@163.com>
> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

43e7c3505ec7 wifi: ath11k: mhi: fix potential memory leak in ath11k_mhi_register()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220907073704.58806-1-niejianglei2021@163.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
