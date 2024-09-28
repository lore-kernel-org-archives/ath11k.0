Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4534CF6493
	for <ath11k@archiver.kernel.org>; Sat, 28 Sep 2024 09:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYhmmACLT3gysI2JXjOAohL9tutjqjKwIVgONRCejQM=; b=Ot1imVby9tnIg11ulHxPnt78P4
	k52XF46qZ9tlahICBbfxDRGwS1OqhAk9DkeAxm54PF+nCxt9d+4LzFslj4dj/YZazLt8/6j2TOtnJ
	FOla1NdqMdcVQmnSqu3n77eGDsZOLPT2JNZgRvAU43iSkysz0QSYWXh2w8XrMM5BdoYbsZZPzE81+
	B1RpUhzoDysB7P2LxQFpl08QNBRJaz+rs91YNiBLdU5oZ48X3kJjq1HQs1mP1ncZJkV/6xDkAy2pf
	13MlICpYhqH/aczlJflPdM3MowuZJ8o3tqk/yZswxvLGBnXlQwRCUIOjfr0Na2/PaZbknYeYmg6DA
	kLW2h85A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suTYj-0000000Cs1N-1wsC;
	Sat, 28 Sep 2024 09:16:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suTYh-0000000Cs0u-1EHa
	for ath11k@lists.infradead.org;
	Sat, 28 Sep 2024 09:16:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1CDF5A4018C;
	Sat, 28 Sep 2024 09:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4281C4CEC3;
	Sat, 28 Sep 2024 09:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727514969;
	bh=nSS8/Mp4RwqYI3+lY1xNHCPSdP62FLumSgms12QSo3g=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=vG7FpMYcfh44DGZMLQuobAViD7RYHLjUf4X+h/1E4yG5GNROTbdJwfOlZPc+BSJml
	 hRMRT8fiTMwoe+K8m4fG5GlJVtLh3/r/r6iChOMkL4HVEbSwtFp52jKicctVeTP075
	 k9G3hqhxpSYARdzKEWQiB148cRzmJ1P9DgCIMu0Lmj7+/NgVJ6l2/Cg37eE3T9xXpA
	 4wPJ1oVmhZoXFKwkZsTolPBTLYEPmBKyXBAqNZk0pXlCOxtUVw51QkrfI5iTBYTQkB
	 sK6nAYXyeEjTCJYxgJHWD7Ne6ujNwHSy8wmoRK2zG7TAHbidEXH/dyBXHgEanJr7VX
	 EzbUgp5Om5+DA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: enable fw_wmi_diag_event hw param for
 WCN6750
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240828103043.2413-1-quic_bpothuno@quicinc.com>
References: <20240828103043.2413-1-quic_bpothuno@quicinc.com>
To: Balaji Pothunoori <quic_bpothuno@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Balaji Pothunoori
	<quic_bpothuno@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172751496718.2249584.7164352924972001237.kvalo@kernel.org>
Date: Sat, 28 Sep 2024 09:16:08 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_021611_450991_07ED4A52 
X-CRM114-Status: UNSURE (   7.28  )
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

Balaji Pothunoori <quic_bpothuno@quicinc.com> wrote:

> WCN6750 firmware sends the log messages via WMI_DIAG_EVENTID only
> when the host driver enables the same via QMI_WLANFW_WLAN_INI_REQ_V01
> QMI message. This is further controlled via fw_wmi_diag_event.
> Hence set this flag to true for the firmware to send the logs.
> These logs are further collected in the user space through
> the trace infrastructure.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00233-QCAMSLSWPLZ-1
> 
> Signed-off-by: Balaji Pothunoori <quic_bpothuno@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

c9c6a4f1be1f wifi: ath11k: enable fw_wmi_diag_event hw param for WCN6750

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240828103043.2413-1-quic_bpothuno@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html


