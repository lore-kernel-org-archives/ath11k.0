Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87CEC47077
	for <ath11k@archiver.kernel.org>; Sun, 14 Jan 2024 14:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koprWsqMccu51Qs17y+k1e1rBuJH0fl3cociG57fldc=; b=4m1Z7xTlj3qQq9vFv/m6WV1iZ4
	DNGrIIgyCRQvLNVhwQYmRiB5r/qk26IY5lwLdreWrCREYkN8s9YKWlLroW7ofvZMpIQSokKRFCfGo
	7pUUyvHRCc4ZkaL10EUKd8+p6Uqv0bFHtWgI2iPW45MkLwFu5/59TMfsrh2oRWr9sfML3bjFx/7Zk
	r97RX//JfLDbQyaaNYyZx4r7tNQUnbOC9szcaBrBuNJprKMPVU7wCR+52fwCgdDLbjEeDLk4DTghv
	HnteI837TIIo/qx1lRnF9wXDRb6hNZZzQyAp6ZSfwe20AFv4oxKCJCXcqddZmhYaKCPc2+S4oWlgV
	LQUNc2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rP1xo-006rTe-2c;
	Sun, 14 Jan 2024 14:59:52 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rP1xl-006rTF-2e
	for ath11k@lists.infradead.org;
	Sun, 14 Jan 2024 14:59:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 643D6B80A76;
	Sun, 14 Jan 2024 14:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7AAC433F1;
	Sun, 14 Jan 2024 14:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705244385;
	bh=Dy5kPxsHjGqVTGPSsW4+1cdug+F9HxfM/LEsiCVjKcc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=p23S/zSFZdCksXJB7VsnADBcYzejKET70aVO9whCGItmzqxPTtUwg58ksMIaRPKQO
	 nxJDqB3dzH1+R2U/CquVTGSaSEH43OonOPl7Msos+bFmWn9E7z4iAs7VKtxiILTu91
	 R87SnOd4KhArQ2hG6KxOf3adfWfQ2YlPHDYCYRZBaFQ4hBFn3aXsmG+bdDUx/cdJw4
	 KoAVGVoCZ6+HNWk7OomD6m1dl9JhD1TUX2SqOuj72+120LQwCIeRv8W8riSnMD5sxb
	 6Y8w9fcnksCJ+zuJRn/VZEp0vpguR1YXuNTL6IKcmSj/I9b9RwVQahuzeVmzDZpAAU
	 iCEepUnOYJAmQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v10 01/12] wifi: ath11k: add support to select 6 GHz
 regulatory type
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231218085844.2658-2-quic_bqiang@quicinc.com>
References: <20231218085844.2658-2-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170524438206.1421352.5740886782222495154.kvalo@kernel.org>
Date: Sun, 14 Jan 2024 14:59:44 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240114_065950_027167_7B5F4E3A 
X-CRM114-Status: UNSURE (   4.92  )
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

> There are 3 types of regulatory rules for AP mode and 6 type for
> station mode. Add wmi_vdev_type and ieee80211_ap_reg_power to
> select the exact reg rules.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

12 patches applied to ath-next branch of ath.git, thanks.

e3d373ec4f02 wifi: ath11k: add support to select 6 GHz regulatory type
7004bdceef60 wifi: ath11k: store cur_regulatory_info for each radio
cf2df0080bd5 wifi: ath11k: fix a possible dead lock caused by ab->base_lock
17144d32e907 wifi: ath11k: update regulatory rules when interface added
1329beb56297 wifi: ath11k: update regulatory rules when connect to AP on 6 GHz band for station
28f64d368b21 wifi: ath11k: save power spectral density(PSD) of regulatory rule
6f4e235be655 wifi: ath11k: add parse of transmit power envelope element
46f20de2c4f8 wifi: ath11k: save max transmit power in vdev start response event from firmware
92425f788fee wifi: ath11k: fill parameters for vdev set tpc power WMI command
f8a573bd5f3b wifi: ath11k: add WMI_TLV_SERVICE_EXT_TPC_REG_SUPPORT service bit
ed0a61dcb2d3 wifi: ath11k: add handler for WMI_VDEV_SET_TPC_POWER_CMDID
74ef2d05ede6 wifi: ath11k: use WMI_VDEV_SET_TPC_POWER_CMDID when EXT_TPC_REG_SUPPORT for 6 GHz

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231218085844.2658-2-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


