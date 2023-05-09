Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70359C7EE24
	for <ath11k@archiver.kernel.org>; Tue,  9 May 2023 16:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B6Q0wVzYsRyA5mdi5j+NRAa22PCH38uEedaPI/VMGOk=; b=PP+m6S8qQXTLFw
	t0g75oFet72K4BQtpog7+3UrXjmTqOFLOzXYfoLY9M3e7d4K3wnXWd3GZUi1nlkGI95OgWou5Za0U
	zuG6lgDMWUnn9VsHowDenhGvCvFf+i+nfCVq3TRabEpN6pweTuhw0BDXvZsr9YuoQlAV00c0CDI1D
	gMF0xzbFLkcONJZnGaR+SCJ9pqrIVOiRnD2Q5kdVoApLKBd9mLcdZvOjXkjbFmsyJquXvsPz3fSVZ
	NtU44jvb6TEgzV/7C+PN6IV4OASz5oNkO8raYylwjphXdeHMJkKaBBSdk2cRDB/QMyYtVYpkf6XSR
	jS3t6C7xiFR3aTnL7ULg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwQgQ-003rMU-27;
	Tue, 09 May 2023 16:59:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwQgO-003rLi-1B
	for ath11k@lists.infradead.org;
	Tue, 09 May 2023 16:59:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D9E9D6476D;
	Tue,  9 May 2023 16:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7769DC433EF;
	Tue,  9 May 2023 16:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683651563;
	bh=nJ7qm7dCXPLZjsUv2Zv2I3JSUpvWHMqX5gDg8LKZjmc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=MID/fIbNlOxp3BXiZ39BIObWwCumMLRBa0r0jPe+3lNBBRbZtNLf+owPIbOZAjYrx
	 pZvJ8n0bN7W2AdjxZxwlCmPX5qFtcu1Sc3CMrbSZcCDdmBYdtRli4YzVJDokpoFEU1
	 lCg1WGEKBeTbSnwlZ3o1qWf4bX6oB0rB+pxHg9Hu9Ap3pj9/9EX0CYNKN0CCAnu9QB
	 4wXsK6jpuMcUdf/hVliUT9gqcBhW/a9veqsWHDT1eezMJvbbpwuD7nQIOS5e3qmoG2
	 XGHmjIrayhjD4q2fvhQzQIewZnUU8X8Kf7rW0MvSjWQLbkoQPA9CK9xFAy4BB3v/Lm
	 TXsu+GTwoqfzA==
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/7] wifi: ath11k: driver settings for MBSSID and EMA
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230405221648.17950-2-quic_alokad@quicinc.com>
References: <20230405221648.17950-2-quic_alokad@quicinc.com>
To: Aloka Dixit <quic_alokad@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168365155854.21274.2582854709073882511.kvalo@kernel.org>
Date: Tue,  9 May 2023 16:59:22 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_095924_441662_812BCF3D 
X-CRM114-Status: GOOD (  11.43  )
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

Aloka Dixit <quic_alokad@quicinc.com> wrote:

> Advertise the driver support for multiple BSSID (MBSSID) and
> enhanced multi-BSSID advertisements (EMA) by setting extended
> capabilities.
> 
> Configure mbssid_max_interfaces and ema_max_profile_periodicity
> fields in structure wiphy which are used to advertise maximum number
> of interfaces and profile periodicity supported by the driver.
> 
> Add new WMI fields to configure maximum vdev count supported for
> MBSSID and profile periodicity in case of EMA.
> Setting WMI_RSRC_CFG_FLAG2_CALC_NEXT_DTIM_COUNT_SET flag
> indicates that the firmware should track and update the DTIM counts
> for each non-transmitted profile.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
> Co-developed-by: John Crispin <john@phrozen.org>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

7 patches applied to ath-next branch of ath.git, thanks.

a08dbb04d736 wifi: ath11k: driver settings for MBSSID and EMA
5a81610acf66 wifi: ath11k: MBSSID configuration during vdev create/start
cf604e72bc6e wifi: ath11k: rename MBSSID fields in wmi_vdev_up_cmd
c82dc33f252f wifi: ath11k: MBSSID parameter configuration in AP mode
cb9bea773c85 wifi: ath11k: refactor vif parameter configurations
335a92765d30 wifi: ath11k: MBSSID beacon support
87bd40113816 wifi: ath11k: EMA beacon support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230405221648.17950-2-quic_alokad@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
