Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD98C433EF
	for <ath11k@archiver.kernel.org>; Wed, 27 Apr 2022 07:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OIwcujkP5/qUf0mLB7UMJtdfYNM5jiZPO8oU8128HS4=; b=g1wQEwcXqaUBm1
	A245BlMsTZ1SKwZSpxuGBGB+DxiUExEPlpwSnLjl+A5KAtl5pLnJpOWWrjzIk6p3wv0R8gc6wNXad
	3WiIHqtpGXW0XoMAcCKNJ5YW+WGZK8H1noPDbAIh2MEaHnv/Emeklm5qp7qvlDe5bi1+urOX/rFip
	C3ExVNbwEriXzG2gYdvB0xbjy0l+P2++mQajLRVZXmDOSZvm+hpNY3bKMf5csrcjfWsP5QqEETvwt
	KMxXuQPr/f9c0UwjI8uoegaRqjYaPDNsjL4UjzSycvmlY1Ubt8SoIClIU6G7UWxlxpPCnKe1auDIV
	+ve6zns/yV6/pV7sgRVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njc41-000FnG-Pd; Wed, 27 Apr 2022 07:26:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njc3z-000Fmc-AY
 for ath11k@lists.infradead.org; Wed, 27 Apr 2022 07:26:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 87A4E61AC0;
 Wed, 27 Apr 2022 07:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10FEC385AF;
 Wed, 27 Apr 2022 07:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651044374;
 bh=F6qI68i8z8l7t3NoHSf81x8+WLlXe4rKy/juqO44zaA=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=qymtwT65aE4xSJbJTku1nlJrWbZnmwD/IveqmK7Qfhv4V7ZPCLkC6N5LEZjS8TavI
 dpv8ihHFl48Aq6br4n3N43bW2MIuQ18eiKmZx3kSx4ZWFmJQl1XVFOl6YsVbskB4TS
 vneEn2fKUP+9cZpgtuzbMxrH8f8sacGi9hb2WZgbdPlmrKKUC1KPwLtN3r4EQlbHB9
 FDkdUlcmyImUY2fKoCOYqkkGB2Yak8N0fYxxVLD2q3SZQk891UxhBIMzE+RrePzw6p
 X8C1ydmAcfgdWuPhbgUXQASlFMXPIGSMG997L6LcI0Olo55m+D50VngemF06QnT+MH
 AxGY9Phzl8ALQ==
MIME-Version: 1.0
Subject: Re: [PATCH v4 09/12] ath11k: Do not put HW in DBS mode for WCN6750
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220406094107.17878-10-quic_mpubbise@quicinc.com>
References: <20220406094107.17878-10-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <robh@kernel.org>, <mka@chromium.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165104436845.23965.9240232763822798831.kvalo@kernel.org>
Date: Wed, 27 Apr 2022 07:26:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_002615_462577_7FE37878 
X-CRM114-Status: UNSURE (   6.91  )
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

> Though WCN6750 is a single PDEV device, it is not a
> DBS solution. So, do not put HW in DBS mode for WCN6750.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00573-QCAMSLSWPLZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

b6f6301041a3 ath11k: Do not put HW in DBS mode for WCN6750
95959d702ede ath11k: WMI changes to support WCN6750
33b67a4b4e64 ath11k: Update WBM idle ring HP after FW mode on

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220406094107.17878-10-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
