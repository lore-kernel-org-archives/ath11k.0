Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3275C10F1B
	for <ath11k@archiver.kernel.org>; Wed, 21 Dec 2022 12:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aSEXWY5IqvtY/U3aW1Rsnlu8EcTlyPLudbaYFPd6QFU=; b=Uv8+PxQ2kqBzfz
	qgumhQ3tG+uFUIB08Al+iDCQCAM5kg6Uyyxly78AHNDNjE5HEWZtXiFcDLSAOhQ5BIMqg4NydvOlK
	A3/caj933GaZwZZhx11h5jZwFBX8XDzcuMff66l3Z310PvUXLLjfWyRtmX9SmUKZJRU7IA9PHBAJC
	566l/86IzOCXFoKm0ZOEdOabkdqhdquCqLGT2p+uw0uy0X+w8g9BXytYMe1PRLojIEwt90W5ZxlUM
	P38whNpPYv8f3lVsAOa97lN8sEciNfgfUBk/DnmKE+Pje5MAf9YYygWl2nySgVmhH+dcaiVEogDSL
	7vgwD9V7APM2GxnhYJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7yeA-00ErB9-5I; Wed, 21 Dec 2022 12:56:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7yaq-00Epfw-GP
	for ath11k@lists.infradead.org; Wed, 21 Dec 2022 12:53:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DC7766179C;
	Wed, 21 Dec 2022 12:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62AA7C433D2;
	Wed, 21 Dec 2022 12:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671627187;
	bh=DLAQ9QL+nNCF/Z8bHJa4ZoD6buy9oY888cXR+gjhCJs=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=qhPOTxpxJMSNmb16xZPAS65bsoywT5etzEM6EhDcqz4rEAr7GruxD6CL/hbr+wffZ
	 3kc+iimhQUA70H/JtIwlYsKGJDBDbQEMGBjgg0ZQnCM6bckw3VDKfz4yk0Skg54T3/
	 +CaVRQe3pi9DmtzwGRiGEZUkY7OO4MLxuFMdAyPv8/QjugYUDygbLV98uHyE+iMlo/
	 TsrnnyBDO/gn0MO10PnafLNn7zp2g7Qs/oi+rhEXMQM4tYPyjOe8DnNp65kbD2X58d
	 tDbtoYA3p32xf0yj2pz8G6Z9h1+AddqK5EsgaRvzEdOGWfmPwWvI8lOKxHwfTcwPka
	 GasYjwOnbhG+w==
MIME-Version: 1.0
Subject: Re: [PATCH v2 3/3] wifi: ath11k: add debug prints in regulatory WMI
 event
 processing
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221214164639.31542-4-quic_adisi@quicinc.com>
References: <20221214164639.31542-4-quic_adisi@quicinc.com>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aditya Kumar Singh <quic_adisi@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167162718423.23347.17706545802283934057.kvalo@kernel.org>
Date: Wed, 21 Dec 2022 12:53:06 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_045308_686099_71820C81 
X-CRM114-Status: UNSURE (   6.83  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:

> Add some more debug prints in processing regulatory WMI event in order to
> increase more debuggability.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

I see new warnings also here:

drivers/net/wireless/ath/ath11k/wmi.c:5494: line length of 111 exceeds 90 columns
drivers/net/wireless/ath/ath11k/wmi.c:5495: line length of 110 exceeds 90 columns
drivers/net/wireless/ath/ath11k/wmi.c:5496: line length of 112 exceeds 90 columns

Please run ath11k-check.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221214164639.31542-4-quic_adisi@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
