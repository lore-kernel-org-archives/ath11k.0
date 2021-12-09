Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5A4C433EF
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qBrZt0CLGGBCfXUaHX1mWhG22SAWjuq48L/GtqWH/no=; b=z8vVi1yTf988Mt
	ajyWrFLpVorEuiiiSr3cCxOVpqf1eHOMCy7U2bMa8WMODTffG3pgQbjUHF1rrzO9L2Kg+0Xr7fJdN
	ZWCSwfC74gusvd2gOwZmgDY/uspfM89yccd6bempppYBzJ/XPk8GijZQ04sJz15WN6kfjNiAN856/
	2U1yU6K2wbUEFP3PQ8Q45Y5E6w0iq1N67K2qQ9Ze6d+Ng3IVHOf1jQ9WfrY3c4urEmqd7O0vlRJoX
	LoK0PGHmrKBY3r0yUOqG+m2VE0paykXJUi3nnZOHzA3EYBlUh0pbdiiEDBVIkeU8E3D3bWUDQzq0L
	VbQQwemB2vcpAWpmw1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvEW1-00FDSa-5k; Thu, 09 Dec 2021 08:10:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvEVy-00FDRt-BX
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 08:10:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8DD00CE24F4;
 Thu,  9 Dec 2021 08:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D00B4C004DD;
 Thu,  9 Dec 2021 08:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639037450;
 bh=Kx5MBSbwU5jq+zQ3PRJJLr4QP7RIu2pMRaeW29p0Z88=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=V53leU9dNHJCIf4/fImOCt4lWjv7CHFlUWwTDOXCmvizfviS//CFlEDAbBToJBeme
 haGqWJk4fexYhOkM3QRQT10DJWXYlJpiJ5ztTANKOXVagggJCi2QktdMQpnOo3OMGQ
 8DijnEw3hJj8nqkZqJvLyfe0QblYaODxGuPin/VoURORDHncfEsxv2fhHxHCK7KijN
 ABNxG4o2rF1Vdn9IXwqdTYv9xrqJlHGXRMhwCvYWDLIj5lE2f0bdoeB1SUz71agDl7
 AMNTzwujgd1kkLZtleCjFVpYxxL+PJFHdkg/If1xdPFPf4Tpku9HG/hxKAF4TNpM0e
 7uj1EQSsaYCqA==
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/3] ath11k: Add htt cmd to enable full monitor mode
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1638881695-22155-2-git-send-email-akolli@codeaurora.org>
References: <1638881695-22155-2-git-send-email-akolli@codeaurora.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163903744561.4504.3172414546384512849.kvalo@kernel.org>
Date: Thu,  9 Dec 2021 08:10:49 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_001054_599208_3BF50CC3 
X-CRM114-Status: UNSURE (   7.26  )
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

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> A new hw_param full_monitor_mode is added to enable full
> monitor support for QCN9074.
> HTT_H2T_MSG_TYPE_RX_FULL_MONITOR_MODE cmd is sent to FW
> to enable the full monitor mode.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.4.0.1-01734-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

5c1f74d24d92 ath11k: Add htt cmd to enable full monitor mode
88ee00d130f7 ath11k: add software monitor ring descriptor for full monitor
7e2ea2e94704 ath11k: Process full monitor mode rx support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1638881695-22155-2-git-send-email-akolli@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
