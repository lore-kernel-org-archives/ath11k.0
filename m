Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99493C4345F
	for <ath11k@archiver.kernel.org>; Tue, 16 Apr 2024 15:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBZxWjBkHSS2q1EUDy5i0Ui386IEoz7+xKnj7yslKHo=; b=do/cjG8IkTQklYSaHzmxbKjTBn
	Li9sWnmHc2T749mawGChadCch1SaN3kiDR8xGQVENhCGz9jV9L6BT6O+ONoSpRUo4taeTO3rLTz1R
	wKxXkeLJUWT8cWHtZfaaCD3KUazXxDDAITqksKMWKH1fiHeYRlnF12L8PjxTIqjYSg1OMB3bnpXGU
	jUGMP4KF6vARDV9jZc0g8xv57f4489ozRd6b0KBeN0434lShVgfpsen3z7XVJJj6iUVc3F5nLqtiM
	SNrxSChM01uUk+xP+MoBXrqx+RMxninhNUNr48rVJEwfBOyQKTW6msu8TosqfWopANdNHayQfBktv
	3XlYE/Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkgk-0000000CkvQ-0yom;
	Tue, 16 Apr 2024 15:25:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwkgh-0000000Ckub-2OnF
	for ath11k@lists.infradead.org;
	Tue, 16 Apr 2024 15:25:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E3D876121D
	for <ath11k@lists.infradead.org>; Tue, 16 Apr 2024 15:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AAEC113CE;
	Tue, 16 Apr 2024 15:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713281134;
	bh=K/MSx+kBrzVHwkn5x+iwOZu5fOasPv/F/bgNFCFPMFc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=cLbRiTBm6XzsFNgW7z9JMXlns1VpD+qOu2wXeAvaV7900t62bBlGDMzVIcghQLmDF
	 3i3wKYxh9r5YYp5TJC/24hYTAPLly7jHigz+CXglb9fOzdw1lSi1TIq4oul/sVMbKx
	 aCsI/R3Iyi1rcnrDMDNve7Z8+1iDVUxDRaH17ZcXeukoAJaBGiMxWe8eWWSYiu1zOn
	 NsmnBIT1/m1hOVmKIv3YhXTP4zhpudCdLREWvU237RcKJY8b1YuzehuzvWn5TjLltr
	 49BguSTzIVZTKF3wpKz/jH3lI9mJoOSAgx6cadUK+p2jTG6twIvG1TOBvdP+46dbqM
	 H3zQbKwi1RWpw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] wifi: ath11k: use RCU when accessing struct
 inet6_dev::ac_list
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240411165516.4070649-2-kvalo@kernel.org>
References: <20240411165516.4070649-2-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171328113106.329964.14896487316067436390.kvalo@kernel.org>
Date: Tue, 16 Apr 2024 15:25:32 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_082535_745082_5D1B77F9 
X-CRM114-Status: UNSURE (   6.97  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Kalle Valo <kvalo@kernel.org> wrote:

> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> Commit c3718936ec47 ("ipv6: anycast: complete RCU handling of struct
> ifacaddr6") converted struct inet6_dev::ac_list to use RCU but missed that
> ath11k also accesses this list. Now sparse warns:
> 
> drivers/net/wireless/ath/ath11k/mac.c:9145:21: warning: incorrect type in assignment (different address spaces)
> drivers/net/wireless/ath/ath11k/mac.c:9145:21:    expected struct ifacaddr6 *ifaca6
> drivers/net/wireless/ath/ath11k/mac.c:9145:21:    got struct ifacaddr6 [noderef] __rcu *ac_list
> drivers/net/wireless/ath/ath11k/mac.c:9145:53: warning: incorrect type in assignment (different address spaces)
> drivers/net/wireless/ath/ath11k/mac.c:9145:53:    expected struct ifacaddr6 *ifaca6
> drivers/net/wireless/ath/ath11k/mac.c:9145:53:    got struct ifacaddr6 [noderef] __rcu *aca_next
> 
> Fix it by using rtnl_dereference(). Also add a note that read_lock_bh() calls
> rcu_read_lock() which I was not aware of.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> 
> Fixes: c3718936ec47 ("ipv6: anycast: complete RCU handling of struct ifacaddr6")
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Patch applied to wireless.git, thanks.

feafe59c8975 wifi: ath11k: use RCU when accessing struct inet6_dev::ac_list

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240411165516.4070649-2-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


