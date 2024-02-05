Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4AFC4828D
	for <ath11k@archiver.kernel.org>; Mon,  5 Feb 2024 17:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yV/xuoHz04olhNvPa/dkX4WddgBDdDJ9gT2SiUlM7/g=; b=PijYHn9UVovU3cIIdlqEkLvv0V
	dwDkQ8ZfOoy83+cGqOXUCKJZLFke8fqJaCPrYzSnXKcSfH3Gig6vCbk7XNyC4R746dWz034WBt4D1
	mkzlgZ2FFTFuIvhH2asmsdvFI2uaGTPxk1LB6OiitB/vpPEoIjw5imq3RXsoMf7lpOh2BO8bfhua4
	6vCxDuWwdmgEHIblNajplILEhoN3oJ/F4X+rAZmr4xxNfRcO2SAa5DMiq68ynGDM1BHipcc7vFo4I
	Pl7Ja8L37bGjcNtxhcippPdp+hNJBfAElTY49kknhGsO7d+wo7ZDFLxrRn6H5b13BIhoBOMwMwD/2
	zyI62/cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2LF-000000043zh-2khw;
	Mon, 05 Feb 2024 17:01:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2L7-000000043y1-2hr8
	for ath11k@lists.infradead.org;
	Mon, 05 Feb 2024 17:01:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 09F46CE09E9;
	Mon,  5 Feb 2024 17:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C174C433F1;
	Mon,  5 Feb 2024 17:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707152459;
	bh=ZrSDvmtwP1vUXi1nbdBJZyeQyjUOwBdLUaOYkUs5j0k=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=u1FkzKYiHwLYISmv984jE0qkxNgKLJWgFDoUEY9K7+WnbNaQxTj/J56f3i6HFsK7w
	 rfOIUBIfFkBRHsKHL6IbhSX+63JNSmWiXzhUEZ0Yl5EkP3+7f3PucYtAYfY9cNR+x2
	 QmCuGkZPBP1GIgqvBmR3Vp7WbMDedJ+9jYNkwBdmrS/UhmLTAuHh4hCRnFR+GIg0UG
	 j62KPnb0AgBwX5PyUVXt8EktY0U0tZL5HVZG6/kjmknHsx3CHjVC6kPWu5uOr1q8r/
	 5Kj4jlnCkdYfJDuh5XXXRdQ1W+3uPvlwQvIWxxMiZwxToieswDqYwMpau/4oiiM3BF
	 CDiWT8C3L14JA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: initialize eirp_power before use
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240202024011.11341-1-quic_bqiang@quicinc.com>
References: <20240202024011.11341-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170715245648.1233901.14417827801031466925.kvalo@kernel.org>
Date: Mon,  5 Feb 2024 17:00:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_090106_908435_0646C346 
X-CRM114-Status: UNSURE (   9.05  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> Currently, at the end of ath11k_mac_fill_reg_tpc_info(), the
> reg_tpc_info struct is populated, including the following:
>         reg_tpc_info->is_psd_power = is_psd_power;
>         reg_tpc_info->eirp_power = eirp_power;
> 
> Kernel test robot complains on uninitialized symbol:
> drivers/net/wireless/ath/ath11k/mac.c:7949
> ath11k_mac_fill_reg_tpc_info() error: uninitialized symbol 'eirp_power'.
> 
> This is because there are some code paths that never set eirp_power, so
> the assignment of reg_tpc_info->eirp_power can come from an
> uninitialized variable. Functionally this is OK since the eirp_power
> only has meaning when is_psd_power is true, and all code paths which set
> is_psd_power to true also set eirp_power. However, to keep the robot
> happy, always initialize eirp_power before use.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Fixes: 92425f788fee ("wifi: ath11k: fill parameters for vdev set tpc power WMI command")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202401311243.NyXwWZxP-lkp@intel.com/
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

b82fb7ef690b wifi: ath11k: initialize eirp_power before use

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240202024011.11341-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


