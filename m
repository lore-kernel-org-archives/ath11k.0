Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D34C433F5
	for <ath11k@archiver.kernel.org>; Tue, 11 Jan 2022 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=axpA0Ojq8zLtyVvQSyK2gK78jruGoLeAWWmpk8fo7hc=; b=Djqi80phd4Scyn
	X0cFZ38dtRnL0O89vC9/NkzqNlTtiUPw5RjWOEvk3RX7rJabEIBhoHvVIikL6XXvI0qoi8AnKxkw+
	kkPu7c1oaFWk+DRATJk9o7p6OmSfTtCMZofJ1g/esci42s+CuSQg0tGLd92tYxVO4TjaB7opAxMZg
	1MNR3U1u/NmXmm/RfUKbBszgeRJAIDr87RSR7OUCA5UJhYui2ZJttVf4NU8cxsNlnuV6ZJ5GSIpwN
	7y4fa1HHYom/t+kZ63OBIywz2qecrUja87Xf/SKcUohpncYJx3M0ffxQetKlkB8t+n7wYQhYqMQGE
	+v/tG1MT2ZzoNVd8EA6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7IJ5-00Ga3B-Ti; Tue, 11 Jan 2022 14:39:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7IJ2-00Ga2T-Kh
 for ath11k@lists.infradead.org; Tue, 11 Jan 2022 14:39:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2CB316167E;
 Tue, 11 Jan 2022 14:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3619C36AEB;
 Tue, 11 Jan 2022 14:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641911963;
 bh=2qpHvcXdKCF1BOvShza4EwfmUXGsmF2U/fuYdTalL8k=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=J/EiCWdC2Ni8Z0IeWzKYechwE1bS2sdSFI38Lu1/oE0c7tcRatE0nMGJr0DrEkMMm
 o5E/5YxNWGLtw9L8PO7H8k7IpT7Ji0ihXJqk1l/vn0nxGgqGfjZaXJ+aZrEkJ6yNfC
 r9R4DcIo4Uj4bMvQwOcMVDJK+y7EZWRfvMEE8vyN4ZorViNZcky3dqdb/gIQ45cmUm
 OTBMXp14jrsi79fbLSbS+55ZTXQr6Cxv1X4XhLmNnz+Zlq+E5q5yQsOkHh5y11hDdl
 ZPNB/qSONdpqTxpyE74lk5Y7bAFKfI9g9YH3u4FKFc/uU/uW1SN40cr4wIu4iyaQpv
 /UdyGcDCWaIAA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Refactor the fallback routine when peer create
 fails
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1640244819-21183-1-git-send-email-quic_periyasa@quicinc.com>
References: <1640244819-21183-1-git-send-email-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy <periyasa@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164191196101.24158.7054789674667193662.kvalo@kernel.org>
Date: Tue, 11 Jan 2022 14:39:22 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_063924_763229_68B42D47 
X-CRM114-Status: UNSURE (   9.38  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:

> When there is an error in peer create process from
> ath11k_peer_find(), the code attempts to handle a fallback
> for peer create. When this fallback fails, the driver returns
> the fallback return code rather than actual error code
> (-ENOENT). So refactor the fallback routine to return
> the actual error code.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01067-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <periyasa@codeaurora.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

fbed57d897f6 ath11k: Refactor the fallback routine when peer create fails

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1640244819-21183-1-git-send-email-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
