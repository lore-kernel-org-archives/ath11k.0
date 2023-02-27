Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7DCC7EE23
	for <ath11k@archiver.kernel.org>; Mon, 27 Feb 2023 13:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4csPUvNNcbGKr6yEXa3eCqWw/s+cvwSVc3LL4XBk36A=; b=Lca2RjLp0JKaTN
	8eyJ2sFqpcjiSa33HicxXicYT1GBPCihS4rRB/fBQ/Wbt7/HKP/DLGLQ3GtN1+xrppvUInaPNqUdW
	3KTYftfrwKYh/8f4god5fKm3g3nixjLgdl3VeFEB2YgLIz2C16BZk16PPq+Vov/XSHYziWphC4hVb
	mm/nRhHgPnUQYU47Kfpus4DPXpJbRotHb9VMBdPeT4Szsvglu8k3FpblnL2UHaFMKZXLpnk4zuJD/
	Q6Y8ViFp2jnC/S1osBzGAcTcTpyasZZX03+yDGyFnTdsbZFrRNFM41Wk14vZUBiFnSAMYm4dd5dBM
	Rkg/BfntrHAW0q51gcxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdAL-009fiP-26; Mon, 27 Feb 2023 13:03:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdAF-009fgf-GK
	for ath11k@lists.infradead.org; Mon, 27 Feb 2023 13:03:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C6C5A60DF8;
	Mon, 27 Feb 2023 13:03:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7975C4339B;
	Mon, 27 Feb 2023 13:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677503014;
	bh=RYkNAgZgiYeaaXL9Pl+5+zD1OJ5nLgaPwvvpaJezxjU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=QRzgGMkPB96l+sx9SJpOakHuUyn1iNX8ZNFhNtlfcQQhiPrpZKB56cgxjhqEWD+08
	 woL9tv3eU3uCqL9+G9vK6bRFn4U4Oi1mIFNURv7VgZd+vvgaAlzVpG2K8QPifkb9eT
	 3Dmk7HGqiORTUtta+DnNKE6SF/nrNj1lWZk8ElFEdS4pYdzoLk0210b1yycRsToe3q
	 IxrNozltw8JteCkahr99xGATVJT5Gxey9SPsJzkeVZijr7rUThzBJfupLst7pUL8zW
	 Gebc9qQtmNLe74oEQRhpm3n51LNT6JzxDGOodHQRUegC6loCeXQtYCc1VtKwaL4mSN
	 shWKkJsr3pYyA==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] wifi: ath11k: factory test mode support
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230213130854.2473-2-quic_rajkbhag@quicinc.com>
References: <20230213130854.2473-2-quic_rajkbhag@quicinc.com>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Govindaraj Saminathan <quic_gsaminat@quicinc.com>,
 Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
 Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167750301098.30655.1426219945777543435.kvalo@kernel.org>
Date: Mon, 27 Feb 2023 13:03:32 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_050335_612038_C439CF0C 
X-CRM114-Status: GOOD (  16.27  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> wrote:

> Add support to process factory test mode commands(FTM) for calibration.
> By default firmware start with NORMAL mode and to process the FTM commands
> firmware needs to be restarted in FTM mode using module parameter ftm_mode.
> The pre-request is all the radios should be down before starting the test.
> 
> When start command ATH11K_TM_CMD_TESTMODE_START is received, ar state
> is set to Test Mode. If the FTM command or event length is greater
> than 256 bytes, it will be broken down into multiple segments and
> encoded with TLV header if it is segmented commands, else it is sent
> to firmware as it is.
> 
> On receiving UTF event from firmware, if it is segmented event, the driver
> will wait until it receives all the segments and notify the complete
> data to user application. In case the segmented sequence are missed or
> lost from the firmware, driver will skip the already received partial data.
> 
> In case of unsegmented UTF event from firmware, driver notifies the
> data to the user application as it comes. Applications handles
> the data further.
> 
> Command to boot in ftm mode
> insmod ath11k ftm_mode=1
> 
> Tested-on : IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
> Co-developed-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

This had new warnings:

drivers/net/wireless/ath/ath11k/testmode.c:27:16: error: no previous prototype for 'ath11k_tm_get_ar' [-Werror=missing-prototypes]
drivers/net/wireless/ath/ath11k/testmode.h:26: void function return statements are not generally useful
drivers/net/wireless/ath/ath11k/core.c:1839: Blank lines aren't necessary before a close brace '}'

I fixed them in the pending branch, but please always use ath11k-check before submitting patches.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230213130854.2473-2-quic_rajkbhag@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
