Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAF8C433F5
	for <ath11k@archiver.kernel.org>; Tue,  7 Dec 2021 15:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnXAhhxPTJ7NuUVx8Wz9VLwJ2hbgmrNEkySlds5/bZU=; b=k8S5TA2SzkwtXE
	rQdzxzuQxaTYWzyWKKDgvdTFwKzI4Mu0yOWI7kgCy9Gp1ki3KvEuHk+nv2Y7r51b5FpbY8xxBhzF5
	XxHxBVc+0VtNyUZ+0tEMG23D+2Q0sqmBnLE85GTgXxQPo3Pb3jpHx5O1m7CyInjeRhckT2Nfnzg20
	dWEVlwZt8/KgjLkj2+2G5PH/oC0iU2nWljeSTbBKz7gqjvFfjidCluNz3Y0kKSfJoT1jcDCVIULbw
	evwj9dkxjH+oZCo6bzuSDtjRj+l34mWVcWvHhEr/Wi28xUeBq4VEaTQoBhGclcxA2h1nnUOSlXV4D
	3k2NNfyqqr2eQrm57Wkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mucOx-009Dlp-0M; Tue, 07 Dec 2021 15:29:07 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mucEN-0099yC-7o
 for ath11k@lists.infradead.org; Tue, 07 Dec 2021 15:18:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 855BECE1B62;
 Tue,  7 Dec 2021 15:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB1CBC341C1;
 Tue,  7 Dec 2021 15:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638890287;
 bh=h0Ql3E0ICU7/XRtzNOTsUF2pda4AqGfhADdvOMsJBOE=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=OVrAbnre31eIC9fIyHDTKAq5GSc8RD5dQTFKEXFc2LwXVonSqG1ES4JZA+RCDg0gO
 T7pN+cAd2cOaXAvCXnEXJPup17TS56VI92pSdWzLRPSfjKL298T0zRGVW8uYal4Cm1
 klpvzv2RRm+3OXXa7xD4LedFFcv6gq6piA2H8DdIG37xpZaY8q5G6+7nvDRztpcfvY
 TWsvKxr3dqQwgwdo+l4mrjbAugQXZUoeYrFS0RnayytGselBR+yP3xwXBAf5Sgb6jr
 eSpQPBOAKtDvthF+VxuuuxNShGTlsfEXHlp9rtuZSeFlmYkxT1ch2jhLClYJZEVvD6
 Hm8b9jUQyEzZw==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix QMI file type enum value
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1638182754-18408-1-git-send-email-quic_seevalam@quicinc.com>
References: <1638182754-18408-1-git-send-email-quic_seevalam@quicinc.com>
To: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163889028518.23771.5686155539421838446.kvalo@kernel.org>
Date: Tue,  7 Dec 2021 15:18:06 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_071811_508319_EC44736C 
X-CRM114-Status: UNSURE (   7.17  )
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

Seevalamuthu Mariappan <quic_seevalam@quicinc.com> wrote:

> bdf_type for caldata in QMI_WLANFW_BDF_DOWNLOAD_REQ_V01 is wrongly
> sent as 1. But, expected bdf_type value for caldata and EEPROM is 2 and 3
> respectively. It leads to firmware crash. Fix ath11k_qmi_file_type enum
> values.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-00192-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 336e7b53c82f ("ath11k: clean up BDF download functions")
> Signed-off-by: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

18ae1ab04525 ath11k: Fix QMI file type enum value

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1638182754-18408-1-git-send-email-quic_seevalam@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
