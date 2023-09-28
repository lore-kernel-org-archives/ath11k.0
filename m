Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB40E732E8
	for <ath11k@archiver.kernel.org>; Thu, 28 Sep 2023 15:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xuaqdak/be5CxoHlK9oE4lg1OplPl5qCEja19uurIB8=; b=1Cz/xdy9lPCWSk
	GaCSikGdWwhW5zQLO8vJykkeQLkKJRIo9/KUZ+4rEBCYpI9mkCWLVuqKFfY2fisY+p9evh6FzFMG/
	mS1CsMPhBLCO0ctrmv2AHLgofnFj9k4xUD6BHq8Sk+qnpWxAtJcHL/HD2zy3ZiO7pD4AjiY5QAzzN
	bS7OI58aWOsiFFKly4fITHTRqRW6vIXRw1gwgJyofRrpTSlJLsu8Ad9EQ/GdKtIc0VBaYAgiFDqo7
	w33thC2QZgSM3TCUDT1br17X79tsYwggnvQpVr6xTwOP6ClnM6DOPVVyJqt2V+RV4bw7PXZyPWTQb
	58ja95z1e/GrvWUPMHkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qltCn-005bdf-0l;
	Thu, 28 Sep 2023 15:45:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qltCi-005bYT-33
	for ath11k@lists.infradead.org;
	Thu, 28 Sep 2023 15:45:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3E0E0B81D2F;
	Thu, 28 Sep 2023 15:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F521C433C8;
	Thu, 28 Sep 2023 15:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695915926;
	bh=yHNkxiAAIzBp3oCMDHb2rEM1ouYfuQia29ntrGpeQR4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=pv9J2YimpM88uArDa0c5hTj8y7ulzFzNDozF6uz4DcPIrHHMYVV3TJ2CdEH0N35AE
	 SILaijUyJzDyOzDWOKwLietyGAvvM+eDDeG2hNcPXT6LozTVwO9rCSVOsp4kNGzYTk
	 liPq1EY0LvAfgqqU6cWeWTIv8iQ/yvGclpgkAQWNdugVEPDY7Z1GShlvyTGItx8IHx
	 6llurfEIJvl0Z1FDJa1cL1jYQhnsqm2IZu3qRV7BEAwHEFsCew8I7LdrDdXl1KhkN0
	 KE0tsy5PqMi6EHti3fOmGNYs73Ot00DJPtgCMIJbw6h4ONSKsuq8qugsqZHCC5emax
	 pqjM8CZb0lznw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: consistently use kstrtoul_from_user()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230920115447.38355-1-dmantipov@yandex.ru>
References: <20230920115447.38355-1-dmantipov@yandex.ru>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Dmitry Antipov <dmantipov@yandex.ru>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169591592363.3096214.434817849719589486.kvalo@kernel.org>
Date: Thu, 28 Sep 2023 15:45:25 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_084529_156075_9A0D0764 
X-CRM114-Status: UNSURE (   6.40  )
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

Dmitry Antipov <dmantipov@yandex.ru> wrote:

> Use 'kstrtoul_from_user()' in 'ath11k_write_file_spectral_count()'
> and 'ath11k_write_file_spectral_bins()' and so simplify both ones.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Do not submit duplicate patches without marking them as v2 and including
a list of changes. Otherwise it's difficult for me to track what you have submitted.

This should have been marked as v2 but I already applied v1:

https://patchwork.kernel.org/project/linux-wireless/patch/20230824075121.121144-4-dmantipov@yandex.ru/

Patch set to Superseded.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230920115447.38355-1-dmantipov@yandex.ru/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
