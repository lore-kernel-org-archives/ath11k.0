Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6662EC47DD9
	for <ath11k@archiver.kernel.org>; Wed, 28 Feb 2024 14:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsO64tZ1tTqGOsDzUr5euxHGaBQ/0Z+aIVYiQvDntas=; b=ulaXrK/giFz0gUuAeiLewBLOV3
	hoZhkxqa24/nEpdsoQD/iawaSiQIB32FR7qv4UgMSDqkNuNamRKHiU8k1uZoqzFxyNhlX+MfqjJQ/
	UmBDgsN095cR3QUePEdxUOkrWaAEt0yNEkvRHsqYdHKABxkJFaXxJRSzcu6Uh5HkvT+/Yvy5z3RP6
	5NfOWhrr7s8Gn5HQlPz+SYIzvU60KWUMCuPyuADPdFiOq2lH4+5Pb+by6yDCgw6TfYNfY1vvasBPe
	jE7affsc+9xr4YYGF4pLmCY/Z4AhTfn6xZKBTc+L9cs62TL9jzsdwuXhxiauY60RHXu42aSy//wag
	KzfUtSeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfKcX-00000009des-0HOR;
	Wed, 28 Feb 2024 14:09:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfKcT-00000009de7-3Kw9
	for ath11k@lists.infradead.org;
	Wed, 28 Feb 2024 14:09:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4E2196186E;
	Wed, 28 Feb 2024 14:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2055C433F1;
	Wed, 28 Feb 2024 14:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709129353;
	bh=jrePBEDD+LSREfFk9ElVQL3Of9a8rn4iwpCCpmX7pck=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=hJ/Ny0dxrz2/5IefuLTfuUeZugiQypMoiJ6O5MnV1I+sMQoK3VUo+RUNC6fI2G+lP
	 IHK+1nfLAl6NsCM0ScOpc+Z8+tx7Ar/VNmRv+HVJJLU7Nv2ndtDAUFZTO/HddWozbL
	 jxKtVjAu4XQxyGj+9i7fh40xpH/yfJAknblkvVwAbX2CAt+75B2X2sWBv21qaLqitY
	 gJOXEkLpq40/PdjBYYpfk7y8gByglk5tekJzzjc+lxYCXEtXBSQo7ItFzPFRPq7CRs
	 ne2X/EhqHPB2HymsNxpNnvPCPlCseasxoxwPg9mRpy8k89Ocs42qyyjK7hYeUurg6b
	 K7WL4zy8R/VtA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: constify MHI channel and controller configs
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240223-mhi-const-wifi-ath11k-v1-1-51b9d42d2639@quicinc.com>
References: <20240223-mhi-const-wifi-ath11k-v1-1-51b9d42d2639@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170912934984.3989537.1475358075618175010.kvalo@kernel.org>
Date: Wed, 28 Feb 2024 14:09:11 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_060913_933087_AF0DE2D3 
X-CRM114-Status: UNSURE (   5.28  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Unlike the event configuration which can be modified by MHI, the
> channel and controller configurations are expected to be const. And
> since they are not modified locally, constify them to prevent runtime
> modification.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

766cf07c4023 wifi: ath11k: constify MHI channel and controller configs

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240223-mhi-const-wifi-ath11k-v1-1-51b9d42d2639@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


