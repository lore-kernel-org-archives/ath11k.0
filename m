Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F7BCF6493
	for <ath11k@archiver.kernel.org>; Sat, 28 Sep 2024 09:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+P/yTykli3QtddrzgwiVCuifCCI8U1c4spmf0htzy8c=; b=bs7HcEjmB+X1jxl2nAsJrHTkvB
	F8XhpRqJoS5HG8DIP2MUqaEqwHn8jeJEonaJ8zwB5pYrtoVZL+DtQcVVduXdMEumOEbQpRSdgkzYH
	Mp3JUwJdA/enXcEWq5ADLgWlcBRN+ZiJDMKlarzSIFq+PHdesN+7gkDR3KsoBvSITAG7OxVFIaN/G
	rhvyHBjn8aGGK3ongDW5Q4So4Hc1aN74KVYFbtljxokPn29pl1qOBiln4owLl+gZREMieNrxcLIuQ
	y+hAEqxwBauAtv4g14yF4BvZv5ErE+LSBXr5gEUjT+8OQ3RZqZRaE2cIWxVi0tBZOMr1gyNkXtKXE
	t6uxdn0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suTZm-0000000Cs70-3S0p;
	Sat, 28 Sep 2024 09:17:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suTZk-0000000Cs6Z-0N7i
	for ath11k@lists.infradead.org;
	Sat, 28 Sep 2024 09:17:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 260CEA401B9;
	Sat, 28 Sep 2024 09:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD229C4CEC3;
	Sat, 28 Sep 2024 09:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727515035;
	bh=zlFE7sjU8cNkipIRBOILe/Ow1jb6tDtCKLZpkN0gd+k=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=f7PqAes02e7bGpkU2wkqWqjYg+1Xd2gKrgWRVMMEi75Th5oYb17vRfay9vDx1X08V
	 54M0K1mJsbbX4dv9ArsoAsxHCYczv+c1O4doeb2UtQ39tw2o/yLGq9tlsh1duabXmH
	 g4ZavTCCcIPFI5NZjjFk99LTeg2SrwLGoLw9XscnvFn1b67ijcUU+jClFMVDhk2oiy
	 eurNZ9xg0vWb8Ej0XgPwSa/DTLSUtdpXExx/f9vobzg2U/BUEU3b/my5fMjKc0gjzY
	 fqTBGdNmeu7KRR/BlttyKtglohpyTaBOfrBjAy0t8moxiq+q7znaHkIMLoXmdr/ZbE
	 iQrPGDyE4/3dw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] ath11k: allow missing memory-regions
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240904095815.1572186-2-caleb.connolly@linaro.org>
References: <20240904095815.1572186-2-caleb.connolly@linaro.org>
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, linux-arm-msm@vger.kernel.org,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172751503199.2249584.16916308008976490497.kvalo@kernel.org>
Date: Sat, 28 Sep 2024 09:17:13 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_021716_226963_244D9952 
X-CRM114-Status: UNSURE (   9.19  )
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

Caleb Connolly <caleb.connolly@linaro.org> wrote:

> On SC7280 platforms which are running with TrustZone, it is not
> necessary to manually map the memory regions used by the wifi hardware.
> However, ath11k will currently fail to load unless both memory regions
> are specified.
> 
> This breaks wifi on the rb3gen2 which only specifies the firmware memory
> region and does not use the CE region.
> 
> Adjust the order of operations in ath11k_ahb_fw_resources_init() to
> check for the wifi-firmware subnode before attempting to parse the
> memory regions.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Reviewed-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

095cb947490c wifi: ath11k: allow missing memory-regions

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240904095815.1572186-2-caleb.connolly@linaro.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


