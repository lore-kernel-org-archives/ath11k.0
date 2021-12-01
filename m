Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60535C433F5
	for <ath11k@archiver.kernel.org>; Wed,  1 Dec 2021 14:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlh0PbjqjnEr6DlDFXJzIR61Nifetv3ZuUds7dMYZeQ=; b=a0x4r4SKjAwJeS
	mmubrEUNVPbYwMdOnegeF253HbexECDvQu+/CiUQUPcPO/frDHAzpQ2vDiH3JGt4DzDk/MCZQXAfW
	ug6jlyrt+JrE14Dj2JB9Eq7wBVsFMrbziBhXPARHxRBN7NphnU4vL+gjNKzJ7LoW6Md+qfsYQwOX7
	suTFuH2qt/EPvk3x45VjsJS68n/p88QslprZnbxcAgGueEwXQd8hsDUonPZaM4GYhvc/M+mMzyGeV
	UD/ebRmsJ7Zeq0R3I7RUuv3CPvpkkidJAxvk9V3csUacrU05HsAUlnWABa8/7vA3QxKKhPExV0dOz
	fIedwT+2XWaQCPK92RqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msQBI-008xzk-M1; Wed, 01 Dec 2021 14:01:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msQBF-008xz7-Cm
 for ath11k@lists.infradead.org; Wed, 01 Dec 2021 14:01:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7A109B81EC7;
 Wed,  1 Dec 2021 14:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 422F7C53FAD;
 Wed,  1 Dec 2021 14:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638367310;
 bh=Z7+dThLw1oAvd2/DKOJd85iSbnTwCVErnI+SDITsQq0=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=oC9a7T4B7yjcp3DyAW0eAGZR8SwTFBEIPuHoay6D83A0jYS2NeZs5UFL5ugckMtul
 AwW1c9sFadqarKUGp1+4gEVIJjGivDUObRAqxxHZzCWKByx0VjSDxC/ijVhtqjTqt/
 nw81EPNDDKsgXwd2H3KHUD3eYIz86Kogx5s69V4+EXCgAg/0eKt8BLguKPEX+oaEG6
 813PEAZQ2wQPZEIbwFnmO0dqnD5Iwx8BROch2wYiBlAK51kqdIQFoHsAM0fVSYzciH
 CkUNyM5hCSKo9Gs6PcaIpni1G4f9UIS4Zy1f2X9rQHkqJMKN9ca2QUBEjTxVI3ADsp
 Y6ukaQWipXnEQ==
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath11k: add wait operation for tx management packets
 for flush from mac80211
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211126064934.26490-1-quic_wgong@quicinc.com>
References: <20211126064934.26490-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163836730490.316.5064011158500804861.kvalo@kernel.org>
Date: Wed,  1 Dec 2021 14:01:49 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_060153_768124_5E6E235F 
X-CRM114-Status: GOOD (  11.69  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> In ath11k, tx of management packet is doing in a work queue. Sometimes
> the workqueue does not finish tx immediately, then it lead after the next
> step of vdev delete finished, it start to send the management packet to
> firmware and lead firmware crash.
> 
> ieee80211_set_disassoc() have logic of ieee80211_flush_queues() after
> it send_deauth_disassoc() to ath11k, its purpose is make sure the
> deauth was actually sent, so it need to change ath11k to match the
> purpose of mac80211.
> 
> To address these issue wait for tx mgmt as well as tx data packets.
> 
> dmesg log of connect/disconnect to AP:
> [  307.522226] wls1: authenticate with 62:66:e4:e9:6a:a9
> [  307.586565] wls1: send auth to 62:66:e4:e9:6a:a9 (try 1/3)
> [  307.586581] ath11k_pci 0000:05:00.0: mac tx mgmt frame, buf id 0
> [  307.586922] ath11k_pci 0000:05:00.0: mac tx mgmt frame, vdev_id 0
> [  307.590179] ath11k_pci 0000:05:00.0: wmi mgmt tx comp pending 0 desc id 0
> [  307.590181] ath11k_pci 0000:05:00.0: mgmt tx compl ev pdev_id 2, desc_id 0, status 0
> [  307.598699] wls1: authenticated
> [  307.599483] wls1: associate with 62:66:e4:e9:6a:a9 (try 1/3)
> [  307.599506] ath11k_pci 0000:05:00.0: mac tx mgmt frame, buf id 0
> [  307.599519] ath11k_pci 0000:05:00.0: mac tx mgmt frame, vdev_id 0
> [  307.603059] ath11k_pci 0000:05:00.0: wmi mgmt tx comp pending 0 desc id 0
> [  307.603063] ath11k_pci 0000:05:00.0: mgmt tx compl ev pdev_id 2, desc_id 0, status 0
> [  307.637105] wls1: associated
> [  317.365239] wls1: deauthenticating from 62:66:e4:e9:6a:a9 by local choice (Reason: 3=DEAUTH_LEAVING)
> [  317.368104] ath11k_pci 0000:05:00.0: mac tx mgmt frame, buf id 0
> [  317.372622] ath11k_pci 0000:05:00.0: mac tx mgmt frame, vdev_id 0
> [  317.378320] ath11k_pci 0000:05:00.0: wmi mgmt tx comp pending 0 desc id 0
> [  317.378330] ath11k_pci 0000:05:00.0: mgmt tx compl ev pdev_id 2, desc_id 0, status 0
> [  317.378359] ath11k_pci 0000:05:00.0: mac mgmt tx flush mgmt pending 0
> [  317.421066] ath11k_pci 0000:05:00.0: mac mgmt tx flush mgmt pending 0
> [  317.421427] ath11k_pci 0000:05:00.0: mac remove interface (vdev 0)
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01230-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

Fails to apply:

error: patch failed: drivers/net/wireless/ath/ath11k/mac.c:5224
error: drivers/net/wireless/ath/ath11k/mac.c: patch does not apply
stg import: Diff does not apply cleanly

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211126064934.26490-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
