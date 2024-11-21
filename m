Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B83D6ED02
	for <ath11k@archiver.kernel.org>; Thu, 21 Nov 2024 11:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBBlfv+S3yWtewY6awKnjeUpW6jVDu/hz0Z2fnAyke4=; b=UHWNQ6nlk13rF5SClWnSEAyDMb
	mesWm1Fepo07242sxzTQYXJmsbOftZCDO2CIbieL677baAiQq5AKujOvcnHR6gQtAnvj1wFk6GN5y
	Ptk3349X+EQJf3tIWo48ZGjLGc48QSaex2y/f5IchSe5ntBWM7vYuTe1vzAT1ayVEOetA2zG2lSFx
	nt/xQQ3IxBe9NhZUJ8EinLNEkjreHRnrwq3C5OdCOwoc8Z+WE/ZT/9F/ik6tip7MTLBLRWMWS2fs8
	WUwwrMfzs1SX5+P7SR7r/wIIxU254LIE8XJ7OMhd8SFqtOkfBF1xCTEwpURmkdtLAl2UkyAne5/Hd
	zSflwG6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4us-0000000HPm6-3Miv;
	Thu, 21 Nov 2024 11:00:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4ur-0000000HPla-09bp
	for ath11k@lists.infradead.org;
	Thu, 21 Nov 2024 11:00:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EE919A402F3;
	Thu, 21 Nov 2024 10:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E161C4CECC;
	Thu, 21 Nov 2024 11:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732186804;
	bh=f/43QzehujPcbsQhIGSMhRy+9gJFgqsbw5YlCcBeeZQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pzxKa/PeUVNJRXke5bX1N35Tc7GXlJdj+1k3xidUNpFiSYK6ZOC/F78ktAZ+gNgSJ
	 fOlFAbuuGeyu9kyModEsYIQ6RfOr8Ww5QHKseKnozr6r9InYcX0mn32JcHEhqJqtYG
	 VsoE14XXYmG+csGyVAJd7MTLeOV+sGhVUwvRXzJfLHTxaikBhQSvQEC37F0yagjaGT
	 E4APCuSc7CF5SkHDnYidwOdVKAlYbgbQGtM0Nvj1pjFOP+uKyo3QDaKf+STTfLjBNR
	 fICZNZByq+eN21DNHQ/D7l/RNP2mMU7WqDMWaqwFFwWWBBorr1jG9U39JzIZljPj8o
	 irZmaMw4+3I6g==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jeff Johnson <jjohnson@kernel.org>,  ath11k@lists.infradead.org,
  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 3/4] wifi: ath11k: cleanup struct ath11k_mon_data
References: <20241111070152.85140-1-dmantipov@yandex.ru>
	<20241111070152.85140-3-dmantipov@yandex.ru>
Date: Thu, 21 Nov 2024 13:00:01 +0200
In-Reply-To: <20241111070152.85140-3-dmantipov@yandex.ru> (Dmitry Antipov's
	message of "Mon, 11 Nov 2024 10:01:51 +0300")
Message-ID: <87frnkyhqm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_030005_142298_3443BE5C 
X-CRM114-Status: UNSURE (   6.84  )
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

Dmitry Antipov <dmantipov@yandex.ru> writes:

> Remove initialized but otherwise unused 'rx_status_q' member of
> 'struct ath11k_mon_data' and adjust 'ath11k_dp_rx_pdev_mon_status_attach'
> accordingly. Compile tested only.
>
> Fixes: 67a9d399fcb0 ("ath11k: enable RX PPDU stats in monitor co-exist mode")
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

