Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA66AC6FA8B
	for <ath11k@archiver.kernel.org>; Thu, 22 Sep 2022 08:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kl65uDklFA/acHMeZmwotDtb6XCtfLDm/MNBkhDrcgg=; b=MDPSMUdlr1QPJ0
	CaaBcnl61V+zdK9aNIhA+QPBeTJFR2oOfMGew50nVOhzYm8ndHehR/dngzeahdvcqPtTHROkA1RA6
	sCu7Smi8Tr5xKtDUTaaaozSorIQSNDWeeb/RL/TwU1OasgxcOis/C+vzrSJbhA5WG6CEPuNfRvCJw
	hVNYNvxuR4ME12Vpgp716tLVivxl+fuXHNazEIeCgkW+hifBt8wJTYDAfg0A7G7AGagpyYHvccgeD
	RC0eecvbz5G2mgo1HioMZivKiGvsiZZdc9uPIxZhlQ93C0j6jyn/+hGhs3QYRp7Jmi0TprcJtl7jZ
	ofgAVcW64fjNfaP7FnKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obHg8-00EBkk-3s; Thu, 22 Sep 2022 08:35:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obHg4-00EBiX-3V
	for ath11k@lists.infradead.org; Thu, 22 Sep 2022 08:35:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3F66860A67;
	Thu, 22 Sep 2022 08:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A18C433D7;
	Thu, 22 Sep 2022 08:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663835722;
	bh=LzYixJB53o4lrYmnQpu6l9b3KeR5dskhXKC15wJwOW8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Myb5Zos/+R8NGrvzoedBHSVKxD+/DYQikKtB9TnWTKCPS61BNW7zSR0Y8kyJWSvkB
	 vVZ7JZqwgwbAywZ7xgMQulnZK6Yd6xjC7DoZ4Dvel4bLoXES8K6d0HACdumBn4gKye
	 dbVbQ6uWwwLVrqiNTvFdX5/D2JEMfoSD4mUpckVXD/5hCFiIB9anVgYfMAk3Kp+uyd
	 ZxRStr6X0N8VBu1FJCGVgh0wHa5W+x/K7cz+zRpUbVXMcsumtZLCbIMmX7dHd9Bm5E
	 oQ1sDPeujft/clAmVYPIttfrOS5Af5B3l1YcLdlxOazU958puRgSY4UrVNP9UpGXj2
	 XMMTxNP+op/rA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix number of VHT beamformee spatial streams
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220616173947.21901-1-jesus.manzano@galgus.net>
References: <20220616173947.21901-1-jesus.manzano@galgus.net>
To: Jesus Fernandez Manzano <jesus.manzano@galgus.net>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 jesus.manzano@galgus.net
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166383571956.27663.10307320275505026019.kvalo@kernel.org>
Date: Thu, 22 Sep 2022 08:35:21 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_013524_277763_0C52B31F 
X-CRM114-Status: GOOD (  12.52  )
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

Jesus Fernandez Manzano <jesus.manzano@galgus.net> wrote:

> The number of spatial streams used when acting as a beamformee in VHT
> mode are reported by the firmware as 7 (8 sts - 1) both in IPQ6018 and
> IPQ8074 which respectively have 2 and 4 sts each. So the firmware should
> report 1 (2 - 1) and 3 (4 - 1).
> 
> Fix this by checking that the number of VHT beamformee sts reported by
> the firmware is not greater than the number of receiving antennas - 1.
> The fix is based on the same approach used in this same function for
> sanitizing the number of sounding dimensions reported by the firmware.
> 
> Without this change, acting as a beamformee in VHT mode is not working
> properly.
> 
> Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Jesus Fernandez Manzano <jesus.manzano@galgus.net>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

55b5ee3357d7 wifi: ath11k: fix number of VHT beamformee spatial streams

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220616173947.21901-1-jesus.manzano@galgus.net/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
