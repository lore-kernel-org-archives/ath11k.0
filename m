Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0EDC4332F
	for <ath11k@archiver.kernel.org>; Tue, 12 Dec 2023 17:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VyNVfsZs6BUgqYYbWSXjvuozmrTOlEroFlx9p/gGTjQ=; b=icfk1eRnEpgyVEKGS1RQX63Hrh
	ny/6pWM37xsS0yzk7Hq/20sbAwC3undr1oYiBJKFgqM4dQRjfhom3MGh8FUdz4p5uT+zt9gxyJJRi
	S6K+Iot4nmQpYgxNHElWjo3MJYB45S6M6uYK2se0D9UX6HsRu2Dypeyho09eqpWCCanVzHzRMGfF7
	h0x2aFqeZStiAk0cI7o1FaN0ig/lMI8NzrezkkiymZFTHNvUm3QQqXDlVZuqP2abWT38m+M8ePLLY
	qZ17E4yOfm/4H11HGESGa04Pc3JGmtLaxYDOWeedM9zY/E/tSYCqFRCguDnU/upVr8XPh11qL0FYd
	LqMSOyfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD6JN-00CLHr-29;
	Tue, 12 Dec 2023 17:12:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD6JK-00CLHD-2B
	for ath11k@lists.infradead.org;
	Tue, 12 Dec 2023 17:12:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4B72FCE1B0F;
	Tue, 12 Dec 2023 17:12:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF99DC433C7;
	Tue, 12 Dec 2023 17:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702401163;
	bh=11KCF6eSfX3xll38pRiWQMZTkETjMhw6UMQe+oezm78=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=JUaoRgfnbG3rvgefKvEPEIVdTLPOtFJN5zQ42Fh1q7LwJIk11bBtG/fSym3OaFS4X
	 8qyGvBj+NLb+mcwzSbuOghxn6a9l/E5Hjv4Mi0G/p4rhyO6uD/9tkPVNH+d3dmsr0k
	 PTbIPFnx9NrjdRdWQdSQARv5GU1EGVDRIYd3Cj80kKij6aOSPrV8btNNt1aD/Lnodx
	 crc1c/nXU+NB4z8CNtz4cw5j0dDOXZDbnj3z1DAZjjidn5czF/Quhz6VtG2ZGtzGyo
	 NxBn+VjFRyk7xqKDamf6cq0qZDZhVUVbCawrLU39Qba21U14d+rpiEjYwuYV+Pd1AJ
	 oQz4W6NGLcBmQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath11k: Fix ath11k_htc_record flexible record
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231205-flexarray-htc_record-v2-1-fbb56d436951@quicinc.com>
References: <20231205-flexarray-htc_record-v2-1-fbb56d436951@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook
	<keescook@chromium.org>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170240115970.422537.17165398794556525510.kvalo@kernel.org>
Date: Tue, 12 Dec 2023 17:12:41 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_091246_884566_5FF83C8E 
X-CRM114-Status: UNSURE (   5.03  )
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

> Transform the zero-length ath11k_htc_record::credit_report array into
> a proper flexible array. Since this is the only array in
> ath11k_htc_record, remove the unnecessary union.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

add731385eed wifi: ath11k: Fix ath11k_htc_record flexible record

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231205-flexarray-htc_record-v2-1-fbb56d436951@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


