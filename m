Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C150C433EF
	for <ath11k@archiver.kernel.org>; Wed, 22 Dec 2021 17:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h5X7cClmcmkJFkDIuqFFXzrmD05ijgOJgtrZNjW5rmg=; b=bDMb2HSK2I25eZ
	1FLgvJabfocVELX2ihwrnP5RoGiajCp1I+pDmZsTHlzEhIcBWF9eCMsAM0Rs9PXSvBJUSAXjSVmP4
	xFKSZ3/O2vpIOL5aXF59fYT1RC71kJBrr1JPUxvxHhWhOG833DFbhHLLN/Q+6yx2F5WFK71Zjf/Pl
	FNu2W/90hmsEqQt3zLqBOi2vsubjMSuIIHWIStaud2gpNwo0om3wRCRzNRYt8ELjSCcjsTL6zuCaj
	GQw1tQjm+xIv4M8pPOZClRqSko7e46AmcUBdzK1EDCvD17H0gCF5NCdMaLbC7WpTlTizuqJnQe2bq
	sAK5xRISEL9M2w6sxdsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n05aL-00B02h-V3; Wed, 22 Dec 2021 17:39:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n05aI-00B01y-Cl
 for ath11k@lists.infradead.org; Wed, 22 Dec 2021 17:39:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 451F561B91;
 Wed, 22 Dec 2021 17:39:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB1CC36AE8;
 Wed, 22 Dec 2021 17:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640194764;
 bh=WKr+MZnRoi4x2/+qLX13uG3/111TAK8lneB6RcSwLls=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=Tx+oMY3/5yxQ/zNApnQ5C46Wfnc5tCKZL8jNiwXmpzmWKtrpPIfyJSpxbSLbNh1du
 4+WNCGwVjRpH6F8be3je56orLbnRN8mAd5NANEiQB7T43FLHIXi5wh1lNqJunhkUyr
 pgHsHcrlfv7BtRnwNcUenTOCAMs2rWG62ADcy78JiOwVi4yjzqXm6smKxpTeSjeP6/
 CCpixSm1IkorBlAqZacG6fYpqyPxHlgjmNL7BbkqJuNgyHCRVfYXdDCrKl/RdF4Nvk
 PlDLUjcOGumt5nwqfT6mNjPbJo8f6bL/cafiJbkLVW2recPqnHC4oN2zDOYpEJrHqc
 eiwoIr0VGOtSQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix unexpected return buffer manager error for
 QCA6390
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20211222013536.582527-1-quic_bqiang@quicinc.com>
References: <20211222013536.582527-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164019475894.13998.9287903984814236611.kvalo@kernel.org>
Date: Wed, 22 Dec 2021 17:39:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_093926_524486_272D579C 
X-CRM114-Status: GOOD (  11.49  )
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

> We are seeing below error on QCA6390:
> ...
> [70211.671189] ath11k_pci 0000:72:00.0: failed to parse rx error in wbm_rel ring desc -22
> [70212.696154] ath11k_pci 0000:72:00.0: failed to parse rx error in wbm_rel ring desc -22
> [70213.092941] ath11k_pci 0000:72:00.0: failed to parse rx error in wbm_rel ring desc -22
> ...
> 
> The reason is that, with commit 734223d78428 ("ath11k: change return
> buffer manager for QCA6390"), ath11k expects the return buffer manager
> (RBM) field of descriptor configured as HAL_RX_BUF_RBM_SW1_BM when
> parsing error frames from WBM2SW3_RELEASE ring. This is a wrong change
> cause the RBM field is set as HAL_RX_BUF_RBM_SW3_BM.
> 
> The same issue also applies to REO2TCL ring though we have not got any
> error reported.
> 
> Fix it by changing RBM from HAL_RX_BUF_RBM_SW1_BM to HAL_RX_BUF_RBM_SW3_BM
> for these two rings.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Fixes: 734223d78428 ("ath11k: change return buffer manager for QCA6390")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

71c748b5e01e ath11k: Fix unexpected return buffer manager error for QCA6390

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211222013536.582527-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
