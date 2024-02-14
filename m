Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29831C48BEB
	for <ath11k@archiver.kernel.org>; Wed, 14 Feb 2024 08:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dE+FoD/DpULRJbQ66+ibJ5p8wSSDaHa8OQCd6oggK5E=; b=zGs/VdLxvJx0PtyUMdleQpSUuD
	lJvF72NgBxkdLnwsLbSb+uAlaf98ScGQmlxeNkAMJZforRU/p9fcrtzVV+04/qqKzuthyvs4nuyAI
	zSZw+ZNir29fBTXAMRqB3rVRpN88EeqD97besS6+IeZ22TgyB2WBF2+ijgvSllddhpn208mCJEFsb
	paUWHPLFcB23x94mieDgEBj6/nt2IKoOKsfYs6n+HrPcaOq9Txb7E4eo9BF4AhRTjmYiZvM+qslTg
	i5wtKOjEuOWvUxlPSt//+u5srxT/HgX1T4zOS5HdIW4buF5PKWrPczo6c0D3OrglLvMnvg34XMUNj
	TA7jxmMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raAQx-0000000C7qD-46Wq;
	Wed, 14 Feb 2024 08:15:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raAQu-0000000C7ov-2GAC
	for ath11k@lists.infradead.org;
	Wed, 14 Feb 2024 08:15:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0057C6151C;
	Wed, 14 Feb 2024 08:15:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E30C433C7;
	Wed, 14 Feb 2024 08:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707898555;
	bh=qOkqjcmIQarjisBZIh76v+uAW3kG2nLiaTnmAU/OxKE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ATUooogL91zyqTu4hUp+29S6PPukUun34xRjWuGPqQXULkgg9YxXLDwaCWN4oThBP
	 dO34VIlgfE3ATsV+//lDip4CmQ+zqKanyFKcH8WQ9d1ymLZxZmQQ8rM5KRtWbTEQa4
	 xMo0D1skN5l+jSVOcoCZSQbslJErtZ+jq+PoH250QCPsDutJAn5jeK9bARM/ZBJZHq
	 e7pR5fYOkkMZf4x9roPWKH4awBXX203wrnQ/MvfaZWanEqLymCOKXrloH3S62mfB/P
	 jdSe0+RQBnC613toTxXnxNQhl0aZcjE/dDn84dp9uC5mDe3OlDIfgjeUWUmycoK8Hx
	 R/1pPmNWNbSfQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/2] wifi: ath11k: Do not directly use scan_flags in
 struct
 scan_req_params
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240209113536.266822-2-nico.escande@gmail.com>
References: <20240209113536.266822-2-nico.escande@gmail.com>
To: Nicolas Escande <nico.escande@gmail.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170789855274.3088943.4437243850124616394.kvalo@kernel.org>
Date: Wed, 14 Feb 2024 08:15:54 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_001556_677528_D21A37F9 
X-CRM114-Status: UNSURE (   6.53  )
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

Nicolas Escande <nico.escande@gmail.com> wrote:

> As discussed in [1] lets not use WMI_SCAN_XXX defines in combination with
> scan_flags directly when setting scan params in struct scan_req_params but use
> the underlying bitfield. This bitfield is then converted to WMI_SCAN_XXX when
> filling the WMI command to send to the firmware.
> 
> [1] https://lore.kernel.org/all/871qae51wx.fsf@kernel.org/
> 
> Tested-on: QCN9074 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

64493a7ff74b wifi: ath11k: Do not directly use scan_flags in struct scan_req_params
79ad70c6df0a wifi: ath11k: Remove scan_flags union from struct scan_req_params

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240209113536.266822-2-nico.escande@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


