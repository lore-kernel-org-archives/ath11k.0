Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7B3C433FE
	for <ath11k@archiver.kernel.org>; Wed, 12 Oct 2022 06:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AlP9FDbFHN67y4Id9FO4WQuRUsZpUF5hNcQRbX5LHSc=; b=CaRR4qYOPKFyDc
	WcvYEaCIpPyq+Z037BjQu4Tta5uNdkJ4mxg4gb+lYa3x1kaNy2CkQriOWTniPyqkKotFdnQlgEItI
	befXTNdFFAJO9oSNplyiBy2QFSkVAEsGi2PDCu8MFt9oEqRg8AK2DNpDRTcKEeOgLJeRvDoLPcCU/
	bNoejmhV0Y7LoeZ0+yd76eyJeu2KpeIcn0ffuRbdLnjWPuOG5/sDqvo+ISnDO6xkVIZSqRpO0sQ+f
	gzkbGLdXMSEfHCwV9F/a9A4HdY9Quqm4n+xJqSkC4D4s8HdfI3/yBaaMeWSj0FuV2cj+fQqLBGBAn
	dC/NPECjzfaJWTG24AfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiVS8-0075Qd-JR; Wed, 12 Oct 2022 06:42:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiVS6-0075Pk-6e
	for ath11k@lists.infradead.org; Wed, 12 Oct 2022 06:42:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF8896144C;
	Wed, 12 Oct 2022 06:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D360FC433B5;
	Wed, 12 Oct 2022 06:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665556969;
	bh=eWRIqZc5754gF/uR/0jNt0HIDDxHoz4adOEk71CFKH0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ndvFxoVbREvi5E2yHRNN6UNCnphgieSRUK3c+dG4jLbDstD/JK35otcN4nQF8ZGMo
	 rSk61++nP0YfLXdiAkchZA4mau61NNyTKwoINkdmij8JKjw8yKl0RoMXqTgvk/9OoZ
	 gRz5QcT6t725aaKbJ540Y/B7FALC1pUYt18eFfAzZYk65YCQaTi/RpMfZa2Ac+/unA
	 6dD/NwRShEIWQlEM1sgo5+oqDm43dHVKal5nELtkjfs7fPuijdo7fz1Y1SgU+KJ6k3
	 Q2cH/mBkvGkeGLCV2Cld9Q/KE4ypTlxeT8tC+er7zQygpd2F/ZjMZGRNe0jb/9yvbN
	 v5Mu/V7LFni7w==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Send PME message during wakeup from D3cold
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221010033237.415478-1-quic_bqiang@quicinc.com>
References: <20221010033237.415478-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166555696700.24262.12095664854132294209.kvalo@kernel.org>
Date: Wed, 12 Oct 2022 06:42:48 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_234250_312926_F576B333 
X-CRM114-Status: UNSURE (   7.15  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> We are seeing system stuck on some specific platforms due to
> WLAN chip fails to wakeup from D3cold state.
> 
> With this flag, firmware will send PME message during wakeup
> and this issue is gone.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3f9b09ccf7d5 wifi: ath11k: Send PME message during wakeup from D3cold

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221010033237.415478-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
