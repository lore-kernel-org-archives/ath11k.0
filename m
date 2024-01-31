Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043CEC47DB3
	for <ath11k@archiver.kernel.org>; Wed, 31 Jan 2024 12:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfntSIEpHU5+3jEauVMQpmuBBjXxwaqStvy3lkC7Q84=; b=awuGjwfNy1X+C19wxK+/qZWxVu
	GC2cEybSJxRTXiOXbaZYEmJzy8JrpNFl7jDYizNOZIjQQjaUT0xYHNnQLyo1IvmZB/CdW4RQBdIaA
	DwZmnEAxe7cHPCcc8JWclhQIKvdN6L17G/UkK50aPeh9OzK3uRRHTAJQPa/bZkV0kdflB7w5MUu1r
	HR/XU71yiu3tglr1ncU2DyNtSja+bVuayuZLMuX14OTe2Q8F4cCCdFyXhq/7cMLr0uwQZRw9k0MCr
	mq2kekJA6IxditGcn4Z+SHBW9XWKp8Q0R9uUw92+DVHJ6JNVKyLuHF2SJlwbmXl0yjM4krHm9lXKt
	TU4jDzww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV9ot-00000003N13-2svd;
	Wed, 31 Jan 2024 12:35:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV9oq-00000003MzO-29T7;
	Wed, 31 Jan 2024 12:35:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1748161694;
	Wed, 31 Jan 2024 12:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687C7C433C7;
	Wed, 31 Jan 2024 12:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706704554;
	bh=xytjf0LR9arNjEEtHDXL4gqkOjsL5qAoCsPZDkHX/0g=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fMVf+7zVGsr/DBv1OboE6VWvpdMnoe8oYdU80Etv6O9zjNPISOJh/p5PCEXl5vfx9
	 YiiBkxkTtQVw9Pkp41gx1X9ZErP3iXPtz+lgErReeIs2430Ef/rWkx+34O3kpwRyiw
	 sqOV2oSHRR4CE2uE68H3R9czPzYgr0j+8lCnSMxq5Ex4NZrR/P/qezWyvTEBEeeXf5
	 qAF520d3orCndMW9ZaEbg5kwrpjewlCYOk+kLZJSUvAkNtAg3JZkehJRJOvv35dnPz
	 t3qh657wpC1e4Hg5SbFSME5sjIjmER1KoZufTzZyHLQ4APprotTNJUTjE1dSeE0gL+
	 SgFih8YzJTN8A==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Wen Gong <quic_wgong@quicinc.com>,  oe-kbuild-all@lists.linux.dev,
  ath10k@lists.infradead.org,  kernel test robot <lkp@intel.com>,
    ath11k@lists.infradead.org
Subject: Re: [kvalo-ath:pending 47/100]
 drivers/net/wireless/ath/ath11k/mac.c:7949 ath11k_mac_fill_reg_tpc_info()
 error: uninitialized symbol 'eirp_power'.
References: <202401311243.NyXwWZxP-lkp@intel.com>
Date: Wed, 31 Jan 2024 14:35:51 +0200
In-Reply-To: <202401311243.NyXwWZxP-lkp@intel.com> (kernel test robot's
	message of "Wed, 31 Jan 2024 13:01:18 +0800")
Message-ID: <87ttmtvfx4.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_043556_611020_A426EA86 
X-CRM114-Status: UNSURE (   8.63  )
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

+ ath11k list

kernel test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
> head:   2c471f31297856be56f60ef29f2565dea1470800
> commit: 92425f788feede9bf152ecf3fb7a264942ee7719 [47/100] wifi:
> ath11k: fill parameters for vdev set tpc power WMI command
> config: i386-randconfig-141-20240129
> (https://download.01.org/0day-ci/archive/20240131/202401311243.NyXwWZxP-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202401311243.NyXwWZxP-lkp@intel.com/
>
> New smatch warnings:
> drivers/net/wireless/ath/ath11k/mac.c:7949
> ath11k_mac_fill_reg_tpc_info() error: uninitialized symbol
> 'eirp_power'.

Baochen, could you take a look at this new warning and if it's valid
send a fix for it, please?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

