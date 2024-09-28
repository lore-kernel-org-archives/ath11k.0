Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121DECF6495
	for <ath11k@archiver.kernel.org>; Sat, 28 Sep 2024 09:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEliKup3qwGXHuDEQNI7For6xLoTCKZGveiSgoIBOhU=; b=dxNkOa7lTvfhTO3eFSoTaE1D+v
	tpMvvwmrU8FIywfpP4C6g8ewkprzkskTOW6TETJ/d5UyuX90jI/s5wrnajiwWqQc1ycBq70YYQmBf
	gVeqhWZ6fuKQlzqVvO+k7Gqr73Jt/ETpNYh61e0NZRpokUwN8tkZLyYm3QWAlKgLdhibynYHGojRA
	eCYF1wnY33uE1VYE51p5h0Ja6llZ5V6iLFZo4H6osy0/Allpj4PeC8cRk/bB7v92i13mBqC9eITH5
	MVf9Sm8x6entv3V0SbFITVflJQNWCw9u02GLGIYIdz65hANk4dQ+iP5BOqoWFoj2vpdq1I8+R6HL8
	2uKFRv8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suTZC-0000000Cs4W-2dbD;
	Sat, 28 Sep 2024 09:16:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suTZA-0000000Cs4E-0ReC
	for ath11k@lists.infradead.org;
	Sat, 28 Sep 2024 09:16:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1CD20A4018C;
	Sat, 28 Sep 2024 09:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8F8BC4CEC3;
	Sat, 28 Sep 2024 09:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727514999;
	bh=LOBf+j+tR+3OBDo0e9/2ULDyl7cpXfdowranANYZDg8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=cY8cWr6F+7+z/2dWiQWuMop9VkNdNfqEW5gzdJ1r0R+00lu5lHodYH+T9O9Bj9tRt
	 rXxIQp5DJqeJBHf/TxuMHHmqbF1F/I8qPJgoqjV/PNRkUyvecsMFFCLgHUbfEkAwUA
	 BgoTaSi2QIkiPVFtYWSnI4HCzZ17daMrHenGxEH6ZTftAlBaKa8GsWFpXEmOaah3X6
	 hEo/HfT1YtmS5iUnMguJ3bbyeXPLkhfMJWopbm9aOJPpQdfIr7so5vS4vk0XzAvGxh
	 MjVAzdrKTESpeHvlvO4qqejZz6wqoPIPPddx3D9IqWIORLy9yU/br1NpwIpuzHu+dZ
	 o8Yx5FJ1wDafA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] wifi: ath11k: fix the stack frame size warning in
 ath11k_vif_wow_set_wakeups
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240829075253.657667-1-quic_miaoqing@quicinc.com>
References: <20240829075253.657667-1-quic_miaoqing@quicinc.com>
To: Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, Miaoqing Pan <quic_miaoqing@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172751499620.2249584.15547291626292372736.kvalo@kernel.org>
Date: Sat, 28 Sep 2024 09:16:37 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_021640_230579_BE5C924C 
X-CRM114-Status: UNSURE (   5.29  )
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

Miaoqing Pan <quic_miaoqing@quicinc.com> wrote:

> Fix the following W=1 kernel build warning:
> 
> drivers/net/wireless/ath/ath11k/wow.c: In function ‘ath11k_vif_wow_set_wakeups’:
> drivers/net/wireless/ath/ath11k/wow.c:461:1: warning: the frame size of 1352 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> 
> Remove the nonessential variable 'struct cfg80211_pkt_pattern
> old_pattern' by relocating bitmask to bytemask conversion into
> ath11k_wow_convert_8023_to_80211().
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-04358-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

6f15937833d8 wifi: ath11k: fix the stack frame size warning in ath11k_vif_wow_set_wakeups

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240829075253.657667-1-quic_miaoqing@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


