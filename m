Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A717ECAAD8
	for <ath11k@archiver.kernel.org>; Thu,  1 Sep 2022 16:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+UdxvdVzUXTLuCoKlLs6ecK1DD7PffKvqaUBmz9HBM=; b=0cOPWACfhvh/Hv
	hIgr72gB18crRssXGaNlMUCG/esmH1MB7lw1xwY/KfnVV7ncbhECS8hN3dUSbGz0mRn1cvKjZ6ez6
	A0oexYGCc8oxoxkxrD6KRLja/sBnaVd/mPVyO9bYADt0D1TVcbDqlBXxbx9qJBwQ0RHEJxAEBJgnG
	QKEQwuw8GIy9Cu3xEb/6q5fdO+hxi3j9/xgxjMRfZmo607qXS/HxmtPMQ72qlV/15jens2GQNZaY6
	Fva2eOeW9wQCYhmjL2T/BwFIbI1UY/U3gPNmbQcGYBWybjQM0Mi9hnp3vXtaRJbdVENcY91ur+Adn
	mq3HUFGJSTnA0aSunL0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTmpo-00DCyT-FY; Thu, 01 Sep 2022 16:14:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTmpl-00DCtW-75
	for ath11k@lists.infradead.org; Thu, 01 Sep 2022 16:14:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4B740B82830;
	Thu,  1 Sep 2022 16:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 262E3C433D6;
	Thu,  1 Sep 2022 16:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662048861;
	bh=pbRiEW810/z4dMLbhfR754FG3Xc43pwbUMTg9W2eMeI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=KTH0ucWUHEiRmOowLLad/Rg8IYx+vSsFPJOxRUz0QZBFv9AAPKTeStcNa9jSiER9w
	 EYNoT4/83cyiWWX361FLCOcJjQhYvAgBd+mHig5GCMiQQzudNY3M4efPHkUH8+IjUh
	 eP6PBABji2QuChpoTvaq6qMwcHZFZrjykxt4VBFTCT7a4yUsPOEsv9A5isS2NfO6l/
	 YOFzucf8LGQpxtBgHDpyn29xoBX1YfzhmDDJRTY43mmR46/wVdlHGVphLAIDHonFPJ
	 iqAdEhWqcyUBMP50biH/eWOcxZFuNSDLPjoEYeAsYelKuLA00sxhnQlIanYLDtbhJR
	 0w7ixY9jhEciQ==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: Fix incorrect QMI message ID mappings
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220720134909.15626-2-quic_mpubbise@quicinc.com>
References: <20220720134909.15626-2-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166204885791.15293.566980702953762498.kvalo@kernel.org>
Date: Thu,  1 Sep 2022 16:14:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_091425_428642_9D3DD9F3 
X-CRM114-Status: UNSURE (   9.81  )
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

> QMI message IDs for some of the QMI messages were incorrectly
> defined in the original implementation. These have to be corrected
> to enable cold boot support on WCN6750. These corrections are
> applicable for all chipsets and will not impact them. Refactor the
> code accordingly.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

b3ca32308e46 wifi: ath11k: Fix incorrect QMI message ID mappings
6fe62a8cec51 wifi: ath11k: Add cold boot calibration support on WCN6750

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220720134909.15626-2-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
