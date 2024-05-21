Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D235C25B78
	for <ath11k@archiver.kernel.org>; Tue, 21 May 2024 08:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQiIRWaD4a3bLz8L/B8fJT6SWM8pEditaIB8bWBvn5Q=; b=DyS05vW5FpIutkd8OWH400kQSU
	LA4K/Mi1N5afE4kw1OTLV90QXeikvdpJDCoyUbMGtIg4QUjAJgLhRc9F621e0CG0QQHe3e+Fjw8df
	6VU7c1mtWATPR6lzDK5KJwB6j8lxPO0stPTcroPNGmDAmGQQnNxsDqXMXGvVhHoAhJk6/nmpzee/B
	I5nsufAtWJ5I0lyoGvCCMrk5BvcEFCog7vPOlauyDubtVxjzrCZp1SZecMN0shauUe6iW2gf4WKoz
	vqwmyqfjOFzvMinEh0D3DYgA0H3BlXUNxTPVcwHdMxEf88hsLrr5W52HfbM5U0zxJFaKVnTO0Fi0I
	ERUuI1HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9KUL-0000000GiHp-2qru;
	Tue, 21 May 2024 08:04:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9KUJ-0000000GiGE-0FxA
	for ath11k@lists.infradead.org;
	Tue, 21 May 2024 08:04:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C6A462063;
	Tue, 21 May 2024 08:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC3EBC4AF07;
	Tue, 21 May 2024 08:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716278686;
	bh=NcSOlTnJ5jJM2S0GNJGH62zu9GD9MTBkYBrkBqGgDEg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ZBzxfYVfMM5kjS3o7b9dJPKhCOWKG0l8tzSOGNJkshTr224PlDU6Ezz+S7gVstZ0x
	 35KoKFWoAJeguv1hUk6jY3FISE+AMFSa6YLGIhKn3+AcUgO5JqNLaja30ZmBadXs0W
	 OqHqetta8olXlD9PkmKz7JEXq3tcvLXjWSKy58yItN8eNAat9weTfN000ZYXCKkcJS
	 O49s7ujfLJqz1/sCjfYfk98yAF8NS3MzPXjk5ynVrJmwt9n9NFb5sTq4P3TY/UjAj/
	 ctkLFM44r1FecPR2DOjleP8zvxwRRw1xlFp/sz5nIjmxJwsVKQYOo0ZGdIGjjmFVcF
	 Fo4ZGuXN7eljQ==
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
 <quic_cjhuang@quicinc.com>, Luca Weiss <luca.weiss@fairphone.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171627868306.3970531.273322605619339350.kvalo@kernel.org>
Date: Tue, 21 May 2024 08:04:44 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_010447_234346_202D7BFA 
X-CRM114-Status: UNSURE (   8.56  )
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
> is 17. This is caused by commit f019f4dff2e4("wifi: ath11k: support
> 2 station interfaces") which assigns ab->hw_params.num_vdevs directly
> to config->num_vdevs in ath11k_init_wmi_config_qca6390(), therefore
> WCN6750 firmware crashes as it can't support such a big num_vdevs.
> 
> Fix it by assign 3 to num_vdevs in hw_params for WCN6750 as 3 is
> sufficient too.
> 
> Fixes: f019f4dff2e4 ("wifi: ath11k: support 2 station interfaces")
> Reported-by: Luca Weiss <luca.weiss@fairphone.com>
> Closes: https://lore.kernel.org/r/D15TIIDIIESY.D1EKKJLZINMA@fairphone.com/
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-01371-QCAMSLSWPLZ-1
> 
> Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

This patch should go to v5.10 but I'll wait for Luca to test this first. No
rush with testing, this is just a status update.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240520030757.2209395-1-quic_cjhuang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


