Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3AEDC25B79
	for <ath11k@archiver.kernel.org>; Thu, 23 May 2024 12:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbKPHFjZt0eC/YVxjeD2oFY60TYL1dwUBVa97u2rNpE=; b=aTY7dv42tcti2wwwiBeHiwHuT/
	+Qbo/3iWWYShdxKNFneFSFNc43IOVxoUxKNhVjS2EiJ2snJ2aHmy+k4MJzPcIKdxv0TfQd4EVOqWo
	8AOAtjxs4G6DSZ403qeiDlrYWYz0NI+QIaVCW4Cct1fnCBQyaHNdtAaID5QHitDa8WfHbnaNa1jne
	w4zPWt2JXc0VkGlZfElQGyTddpjVDEwYKnpJxbkHkaQa4rP6/aCAWf38003O4W9nrak5pxRTM5Puj
	rZUjPP6fb1bBOnxbAoaZNIRSr1ecVQ/xGfKpkTED5eq1AShTetOTfC1SbyKJhKlTNxANLCJAxyFyb
	3JL3ByXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7nv-00000006E0d-0nEU;
	Thu, 23 May 2024 12:44:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7nr-00000006E0A-49vN
	for ath11k@lists.infradead.org;
	Thu, 23 May 2024 12:44:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD16762DE4;
	Thu, 23 May 2024 12:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EF78C32782;
	Thu, 23 May 2024 12:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716468254;
	bh=l7mLZ2DFf3Oq9wE+1CtIHhvmDx4/5DoMK0izVbWUcxs=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=E8hb/JJqBYJS++YPBpvlmDLeWlW9ZLnjikwGYAqScSV55J5PDnn/BveBugL48T56o
	 1efXh2COxS9hY5Us4d+n2SlxuNOY+yMiujMCfh/fT+KtAWZ6+iW5vu+G2l0rTQybbA
	 DGRxobcXrx6+pY0KiJyHp/WJpbAwIY/4eA7lqr3P9Q2Nsnsnn3bU4cZ+GM5nNQrhal
	 meOCpaMoDDJ4Fijvj14XcOafKvM24gmT9IxEeY/6IOgwquo4gKEA6nREQrkze2GGIw
	 Tepl2nH4Nu/WEzOdj8/NIbHfzfX0UfmF3l69N/GrsZUG6zuEwyv/uwDoKoh1OW5Hrh
	 5Qb/yH1oCoqBA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: fix WCN6750 firmware crash caused by 17
 num_vdevs
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240520030757.2209395-1-quic_cjhuang@quicinc.com>
References: <20240520030757.2209395-1-quic_cjhuang@quicinc.com>
To: Carl Huang <quic_cjhuang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_cjhuang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171646825167.213015.5353620054103285361.kvalo@kernel.org>
Date: Thu, 23 May 2024 12:44:13 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_054416_109699_DBEF3AE3 
X-CRM114-Status: UNSURE (   7.18  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Carl Huang <quic_cjhuang@quicinc.com> wrote:

> WCN6750 firmware crashes because of num_vdevs changed from 4 to 17
> in ath11k_init_wmi_config_qca6390() as the ab->hw_params.num_vdevs
> is 17. This is caused by commit f019f4dff2e4 ("wifi: ath11k: support
> 2 station interfaces") which assigns ab->hw_params.num_vdevs directly
> to config->num_vdevs in ath11k_init_wmi_config_qca6390(), therefore
> WCN6750 firmware crashes as it can't support such a big num_vdevs.
> 
> Fix it by assign 3 to num_vdevs in hw_params for WCN6750 as 3 is
> sufficient too.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-01371-QCAMSLSWPLZ-1
> 
> Fixes: f019f4dff2e4 ("wifi: ath11k: support 2 station interfaces")
> Reported-by: Luca Weiss <luca.weiss@fairphone.com>
> Tested-by: Luca Weiss <luca.weiss@fairphone.com>
> Closes: https://lore.kernel.org/r/D15TIIDIIESY.D1EKKJLZINMA@fairphone.com/
> Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-current branch of ath.git, thanks.

ed281c6ab6eb wifi: ath11k: fix WCN6750 firmware crash caused by 17 num_vdevs

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240520030757.2209395-1-quic_cjhuang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


