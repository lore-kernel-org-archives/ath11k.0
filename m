Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF23BC4828D
	for <ath11k@archiver.kernel.org>; Mon,  5 Feb 2024 17:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WNclPoNmmsZenLjJoexiqAgLR6qO95nzE/cAG0QJ10=; b=q/I9Y9UGNzhuB/khyPHhpaOWHk
	JXeFTqNs75mskpWBHMt9EKu87kpWiuTuFhvdgh3X7rXQ/bwD8CgG16FFfmLDQiqbXiXiTHjuh+XOb
	O6pc0m53d1sCIhLoxxW06sYEW0/dbjjW+rjwFsZntncN/SZ0irXtiXhnfpGA/nHnmALt4dd1Wm7tO
	l7fgIpEv2prcztwCc5NGvQReRctTgjC4stvFI62PGXzZ7QmM9J6jnmdAO4VHOYIuSGWotEpDjrC/6
	bHCW+Qyd98CK5xX98Nv0bhS0oL+jbGmdNMU/fYg34rjTJkxPXdBeKYx3fzJno3GCRe56/CDMBL8tb
	YFHaQI4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2Kd-000000043rX-2SJh;
	Mon, 05 Feb 2024 17:00:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2Kb-000000043r6-0oFb
	for ath11k@lists.infradead.org;
	Mon, 05 Feb 2024 17:00:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 995CBCE0FC9;
	Mon,  5 Feb 2024 17:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCC2C433C7;
	Mon,  5 Feb 2024 17:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707152426;
	bh=bxL+BxvlQHAe89NWKzDQGbw1Dc3qITGhBAJv+A1KpVQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=DynhfXa3itEgXiADpdPXsXsUDAc/xgcQIoLO7tcfu7hIrYlWWiLsN8drA9qvEDdqW
	 9QriOuTuL7XSYytb1Hzinx6MRR/u7S9DeXE+EJsTa9/u1gtj0Kf+hy2cprQVdU8eKK
	 Fm/1bdUp4+bNWCLRTPLJ931CqWVkzr4z1EyQfjHtFtH7CfoUOKlMxhMfIbX37sGJuc
	 rWqJfBnqptbCxkZxWUTK2XkQwesE3UAildRPudh6YOmj4UIIoHDM0RE77y5jP/CThg
	 8gzR2Yahyb8gMrCUeV6rmy0/MxM6hC8Yd0VAwSC1319BB/MkZmPA8Zcfy4tCMSWPU8
	 jtZpmRHS7a1yg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: initialize rx_mcs_80 and rx_mcs_160 before
 use
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240202023547.11141-1-quic_bqiang@quicinc.com>
References: <20240202023547.11141-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170715242424.1233901.13688011305726669667.kvalo@kernel.org>
Date: Mon,  5 Feb 2024 17:00:25 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_090029_437681_6FD814C5 
X-CRM114-Status: UNSURE (   9.94  )
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

> Currently in ath11k_peer_assoc_h_he() rx_mcs_80 and rx_mcs_160
> are used to calculate max_nss, see
>         if (support_160)
>                 max_nss = min(rx_mcs_80, rx_mcs_160);
>         else
>                 max_nss = rx_mcs_80;
> 
> Kernel test robot complains on uninitialized symbols:
> drivers/net/wireless/ath/ath11k/mac.c:2321 ath11k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.
> drivers/net/wireless/ath/ath11k/mac.c:2321 ath11k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_160'.
> drivers/net/wireless/ath/ath11k/mac.c:2323 ath11k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.
> 
> This is because there are some code paths that never set them, so
> the assignment of max_nss can come from uninitialized variables.
> This could result in some unknown issues since a wrong peer_nss
> might be passed to firmware.
> 
> Change to initialize them to an invalid value at the beginning. This
> makes sense because even max_nss gets an invalid value, due to either
> or both of them being invalid, we can get an valid peer_nss with
> following guard:
>         arg->peer_nss = min(sta->deflink.rx_nss, max_nss)
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Fixes: 3db26ecf7114 ("ath11k: calculate the correct NSS of peer for HE capabilities")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202401311243.NyXwWZxP-lkp@intel.com/
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

b802e7b7e771 wifi: ath11k: initialize rx_mcs_80 and rx_mcs_160 before use

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240202023547.11141-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


