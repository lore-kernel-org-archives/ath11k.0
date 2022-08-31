Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BB6C0502A
	for <ath11k@archiver.kernel.org>; Wed, 31 Aug 2022 05:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s4YQOToKkW7gHRaN032Y3cibuKfVEQhpPzZxtmVLD7s=; b=Xv+zlh/fVefBmN
	KQbMropoXRSwG08wOpcv82SCXNPNLVrL09xVammM+xFypmf+IpXIwOEGUI/1q3yd2IZhR+LhW97E8
	9ztBIo/hGc/tBN+KHmygGIjjm9GiQLBNqG9IJtCZh28wN1AMfnY7nw5Qy+ARC5yNc2YkMAYfskwWQ
	3X0VvSuDKMpb5+bg5QPHVnOKezZsqGbWndl/DvW6WT7TYuWqR+tiTwZ/OVtDdbb94679W9Gkfskye
	FqRAUxcIpiMp/tw50nPeTE6E+r7YgwZTxAxG38sIMon9KbajLoLy0JJvD0lOKN1YoDb9Dph845gTq
	XxoKHEQti1FA9kgBcl+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTGkp-0048sH-2p; Wed, 31 Aug 2022 05:59:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTGkn-0048r4-5k
	for ath11k@lists.infradead.org; Wed, 31 Aug 2022 05:59:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 97FCEB81EB8;
	Wed, 31 Aug 2022 05:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631BCC433D7;
	Wed, 31 Aug 2022 05:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661925546;
	bh=HPwYuqsQzg9kc/XS6VUuHVSn/Oej/5p/qbDHnbjBZ78=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=qn7cppFohyqOriqjSH78ZnV0CyVihFmA6hV5jmu8Lf/NYFtvwDAUyOQRYYJWISU1P
	 NSbpweaUhy4Ru3pEZzy2TOdTY22oVz0M9WJc41HUk0wSaqLjCa3S78Blb4taZK+QoE
	 KxtMzipyVKdhVTwfiNallCARoLsb4mdCNG8ptwIjbzjcYJ63mlZYw72FoU1G/aoTJQ
	 fTT67ZKUbaReHtN1KBbBrY5zCtx3KRi8u4H2RPcHuVN4rVM+IOnv1Z32739UJjq87l
	 iV1HpJ20qNTSYYbV6KjU8mSzdaCyUonXx3Uspro9qfQ3kKTTt7z5f23PL4hEog2MH2
	 K5y+gqD9e/hLw==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Add support to connect to non-transmit MBSSID
 profiles
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220720134622.15293-1-quic_mpubbise@quicinc.com>
References: <20220720134622.15293-1-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166192554340.26203.2447393721716803657.kvalo@kernel.org>
Date: Wed, 31 Aug 2022 05:59:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_225909_386183_011D6D93 
X-CRM114-Status: UNSURE (   9.76  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:

> Add support to connect to a non-transmit MBSSID AP profile.
> 
> Non-transmit MBSSID profile parameters are passed to the firmware
> via WMI VDEV UP command and this helps firmware to track MBSSID
> profile within the multi-BSS beacon and report beacon loss if
> any.
> 
> WCN6750, QCA6390 & WCN6855 firmwares have the support and hence
> enable the support on these hardwares.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

Failed to apply. Again please use --base.

error: patch failed: drivers/net/wireless/ath/ath11k/core.c:111
error: drivers/net/wireless/ath/ath11k/core.c: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath11k/hw.h:205
error: drivers/net/wireless/ath/ath11k/hw.h: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220720134622.15293-1-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
