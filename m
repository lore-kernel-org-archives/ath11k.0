Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026B1EE49A3
	for <ath11k@archiver.kernel.org>; Tue, 22 Aug 2023 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QBo95ZeCZJPAf+EoCUONgzTyrPYvQVW/2b8OLdlyPwY=; b=yPiiTTB6U/T0i0
	vKkF4YCyQxcXkuSAYLdjfNfqw6x0tLIGlhi6YmcnNbF0OWWMYLVaYWcJVJ9aEEiI53YproRtN3nzm
	tSkmKk8IUWh7Bx2w4QriHZ8z4/Rnw8sBWr2ffcwIcA75VhnAUHD0gVilNyVNCOBzxo1Mu01azuAV3
	b7JMj4GDmPiD5q+vcJV/X8AjlOVFbpov4OKThlw0L8KVTuSR+p3ruSGd2utgUSu1JnaLrN9lOoNjy
	/IQyBsKhXqQiGqHdZUW4JjaJWjqWZe96RtX6f5+G/M0dMQI/pPXwvz/fqzWilNeU4BBYXxCK3ZGAx
	Jvk6iFlRUL8Y9/5zHLFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYTq5-00GQlp-0o;
	Tue, 22 Aug 2023 16:02:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYTq2-00GQlV-1A
	for ath11k@lists.infradead.org;
	Tue, 22 Aug 2023 16:02:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8329162CDD;
	Tue, 22 Aug 2023 16:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5A5C433C8;
	Tue, 22 Aug 2023 16:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692720156;
	bh=B4dVX7JomV77pBcVqtD0PNTGXOQTdjWiq/Ji2vFROpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kmxPkkTwYCQZnR4ofNmuKm7gv2uiQDKusaOVm4+AvZ6IaaGd8xX75E8iqHzAfVUw5
	 WllJU/8IG1KKWLe9HO7xE4RyAubCZPuh2861jQMReIEjT/jwsULtwHAzWnK2sflFHx
	 BWGx+sXx0R63DjB2YbS4DY4RkP7rvaI6Ct0+T+AmYQXo//IzyuvK3erHkxLrST2aBp
	 6wDaYVitItaDSb6yLzD86wcSYz89JYn/a96LwoLfqyzx8jGTsOeTKen2XN+Bavk8iy
	 f64BmIsFGJ3zcYPeD/A4gfz345Nz8ho1wOhRIte5vdAcWyH2GI188wKcS34cx44Rmu
	 O37NQ2ZTMJ/0w==
Received: from johan by theta with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qYTpw-00015s-0B;
	Tue, 22 Aug 2023 18:02:32 +0200
Date: Tue, 22 Aug 2023 18:02:32 +0200
From: Johan Hovold <johan@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Kalle Valo <quic_kvalo@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
	quic_jjohnson@quicinc.com, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.4 03/10] Revert "wifi: ath11k: Enable threaded
 NAPI"
Message-ID: <ZOTcGEfqsBkWugAa@hovoldconsulting.com>
References: <20230822113101.3549915-1-sashal@kernel.org>
 <20230822113101.3549915-3-sashal@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230822113101.3549915-3-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_090238_443980_F4992301 
X-CRM114-Status: UNSURE (   9.48  )
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

On Tue, Aug 22, 2023 at 07:30:53AM -0400, Sasha Levin wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> [ Upstream commit d265ebe41c911314bd273c218a37088835959fa1 ]
> 
> This reverts commit 13aa2fb692d3717767303817f35b3e650109add3.
> 
> This commit broke QCN9074 initialisation:
> 
> [  358.960477] ath11k_pci 0000:04:00.0: ce desc not available for wmi command 36866
> [  358.960481] ath11k_pci 0000:04:00.0: failed to send WMI_STA_POWERSAVE_PARAM_CMDID
> [  358.960484] ath11k_pci 0000:04:00.0: could not set uapsd params -105
> 
> As there's no fix available let's just revert it to get QCN9074 working again.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217536
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@kernel.org>
> Link: https://lore.kernel.org/r/20230720151444.2016637-1-kvalo@kernel.org
> Signed-off-by: Sasha Levin <sashal@kernel.org>

This commit break machines like the Lenovo ThinkPad X13s so please do
not backport until this has been resolved:

	https://lore.kernel.org/lkml/20230809073432.4193-1-johan+linaro@kernel.org

Johan

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
