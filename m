Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFDBFC433EF
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 13:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RkoYOHrBvG/uy3VBAayG8isvEUtWxfAuMaAOGLOdCOc=; b=qyYovstjiCoSup
	Vpz3j4BLDZeefRb7aoDZYQvby6mEkAT3evKSOBIRqn8RUH58EpujEqFvSDi9Ig8wQNGBN57zP3aph
	r/qze+4XZ3KHKIq6w+mDweKn7Pr+7nLuDH63ti9HqGBZGSSpazXKuFeRB75+W3MbRtwnv3cDyBBqa
	Ip/Wr0AGyx6s3Y9kqsYrEDfEcyXip5elTDU9sPXMyvjdd5EpiXQKWnO2KrFFZvIhPUVQwseLXc9I2
	nQT0QBGhLhmW/jYRwOxskQvcl/2d6KxLmOYFzu0oIZQSqQccv6nKNkwdbee9EY6FBHRh+U0px6l9u
	2nOqCmeMhO15rzRIwNDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naHAt-005lqK-Nw; Fri, 01 Apr 2022 13:18:47 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naHAq-005lpH-Bs
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 13:18:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5D293CE2557;
 Fri,  1 Apr 2022 13:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8A6C340EC;
 Fri,  1 Apr 2022 13:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648819120;
 bh=wrMgiEFWz5tExTwNpneICoem7zquqiVIvT/B0wAxmg8=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=HwAsSPcYP/q5Ra/mRjWUSbapEZDx1Gcgw83Bappx4TSRaRgjrq4cqle8+AHn/vDq7
 BUwVq+s+oEpKA6np3T7xAPdBzykdGwHn2ebDZZORT8TrbjvVsRoxwfwivrxTGcyktr
 exnZKxi/BmCEIdpupsHOni2KUzURrldArP8M4ysJ08gXVesGH23gKFfzN2DgIiLxTG
 /Y7nr8uTeEnNnVpbSOtWK2k9IdjgUxV/jJKqb8u9XOMniWTcjIYtyDxWj8enIqrTHR
 YhWKUKdyp2iNjeBYAfsNxuBai2VqBXHrhgez8O81HgmFoMOZh/nuBeNsCt2a94YNgw
 NLfJUvL6WpzGw==
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/2] ath11k: Add support for SAR
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220401120948.1312956-3-quic_bqiang@quicinc.com>
References: <20220401120948.1312956-3-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164881911553.13354.3859976459020276949.kvalo@kernel.org>
Date: Fri,  1 Apr 2022 13:18:39 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_061844_624884_520A68BA 
X-CRM114-Status: UNSURE (   8.94  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> ath11k assigns ath11k_mac_op_set_bios_sar_specs to ath11k_ops,
> and this function is called when user space application
> calls NL80211_CMD_SET_SAR_SPECS. ath11k also registers SAR
> type and frequency ranges to wiphy so user space can query
> SAR capabilities.
> 
> This feature is currently enabled for WCN6855.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-02431-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

This introduced new warnings:

drivers/net/wireless/ath/ath11k/mac.c:8326: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath11k/wmi.c:8913: No space is necessary after a cast
drivers/net/wireless/ath/ath11k/wmi.c:8920: No space is necessary after a cast
drivers/net/wireless/ath/ath11k/wmi.c:8950: No space is necessary after a cast

Fixed in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220401120948.1312956-3-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
