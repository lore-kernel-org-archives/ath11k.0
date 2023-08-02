Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B122C04E69
	for <ath11k@archiver.kernel.org>; Wed,  2 Aug 2023 16:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcS7uEJVavthBWgvFA3W13tLBJorqdxU8c+3pRFftzw=; b=jUZoIuokEUtDMc
	+8eTGyUGIr7gwBIaMtCK2Dmet06dgdsV1oQUJ15dfdEfLI5uTiIHGG0nAYGTCnoYSs6vAwI/WH3ig
	mGJ5mkO26XgnA92Uzkcok0GKoQM3v4cyeWqS6+ReXcqS7ANYXhIP81rXw7UqDLNxY/Occr7kY+ABP
	sXmo3J7Kcnp3q9bbVb/4COetFDheVUh52hBThRNZh4NZK2nJ2DztNS+r8gmx6kIUNe8kSSzFTGKDb
	3EYUtxtVshRiMo3ljfLkDzEyeNzTgRpm2lxQ7mXWVHl85EB+438rY6YV/xE6wW88FixS1pK4HzCrK
	uxtBMcpyxBZNPd4aPaGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF37-005Ovs-1n;
	Wed, 02 Aug 2023 16:50:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRF33-005OuL-38
	for ath11k@lists.infradead.org;
	Wed, 02 Aug 2023 16:50:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8119C615C2;
	Wed,  2 Aug 2023 16:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93B7C433C8;
	Wed,  2 Aug 2023 16:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690995008;
	bh=GP/jX1Sc2orjtaHf4DKQ/zYrR37BmaILJD+asVNRSZg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=DLJx4or7kB3H3YokiF8M4w01H51xQW096s4egFvcfnAUehYGWZxUgslORjx5OedwO
	 FoUuAjZDXCm3n5jUsaNPbKztxY2j5qICLK1xYWsaJUgTZf9dUyriuudrhLFBTQNzQv
	 53+Z5YwjC+mEEbamFWaHOFOgBGPAsZPuZeqy/synm03OR22+veECXeeX/rBlApaHHL
	 /ghQsInHSViYJT8co0mfp43zok1g+Tg9UFM+yB1x8110+DfPx6WYVh56xJn0mkTeQl
	 iLRdQIaas7x8+CD1mHpUKmKW5fiMs61q81jtvKD1yxSu/0O04bMEOUxhIoqDxwcEdE
	 u4T14VCXWdF4g==
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] wifi: ath11k: Split coldboot calibration hw_param
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230726141032.3061-2-quic_rajkbhag@quicinc.com>
References: <20230726141032.3061-2-quic_rajkbhag@quicinc.com>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Seevalamuthu Mariappan <quic_seevalam@quicinc.com>,
 Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169099500560.463701.10291421829844281060.kvalo@kernel.org>
Date: Wed,  2 Aug 2023 16:50:07 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_095010_060042_B5D60AEC 
X-CRM114-Status: UNSURE (   5.95  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> wrote:

> QCN9074 enables coldboot calibration only in Factory Test Mode (FTM).
> Hence, split cold_boot_calib to two hw_params for mission and FTM
> mode.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

011e5a3052a2 wifi: ath11k: Split coldboot calibration hw_param
bdfc967bf5fc wifi: ath11k: Add coldboot calibration support for QCN9074
13329d0cb721 wifi: ath11k: Remove cal_done check during probe

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230726141032.3061-2-quic_rajkbhag@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
