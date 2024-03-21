Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D0EC54E58
	for <ath11k@archiver.kernel.org>; Thu, 21 Mar 2024 11:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbbyCSTuQeE8/emTu4JhVLYIjyoX3KJqiTEOITPTII4=; b=KCe6pUN63gmIYAgOeeAZTlKTxO
	LnfdvmcjvIGVnyx5iJFqYOp20MoqPe9khC77N1IQL14TIDW/SM46x2B1HGRupD/CKKVq97GS2xEbs
	QXIdH0uWIG4tn60coSIJwaAFP6k2NaEK8F0ntiWWc4mMBKKd0Asd0QWtui7NDTzoz/MMjECnYI41J
	0MDORJLMumFUpivqJCrantYBF2NTDVqksX52axvaWFnAtEy5+PdBRJAVbEZ3h93ZfoGQuEnNtuKUK
	O8AMcEi3czn6BaukqDIHJVQMqtEf7IO2ygyrralXV6gVA1ekUNmUZ6qvfryfIFSrJclBRugBV0m8j
	Cvo5hcEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnGmc-00000002qcp-3smW;
	Thu, 21 Mar 2024 11:40:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnGma-00000002qcJ-2EhX
	for ath11k@lists.infradead.org;
	Thu, 21 Mar 2024 11:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D79B16116D;
	Thu, 21 Mar 2024 11:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98ED2C433C7;
	Thu, 21 Mar 2024 11:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711021227;
	bh=BDrs6bk24h92KdGirrXYHOyB22BWqkXqdzBUtsoeK70=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=C3v9iapxnEr8TgEo3fE91CLPlfvPhg/d6Hten8qu64UMm4cQVhqyQ/TXiuIcTG69Q
	 gw8GXO+i+P7ufJB1xphF1xJUtjhxUcKdoPa7i1JbRpJPdODB9+4qhJhC3IaTHMUZ6b
	 t5HHRFBuEf8mExhogi3IjvUaQIxLyVx0MOkji/P8pQXpIyugJqL+FB44LLl3VQ1h42
	 Mf1pzGLwSqQKqHKKdoKsWoMYBuQxkD9rARO0CPFjH4BT28P1lOIM7qX2znjJRt2rb7
	 O0EUlFm/bwq3yvuWs974589WIy++XTZLEB9Lr0Wke7gdHyM5bpa1CKza/g3kh7qblw
	 ndz0mwew+FMaQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: do not process consecutive RDDM event
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240111071406.14053-1-quic_bqiang@quicinc.com>
References: <20240111071406.14053-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171102122457.4024062.7715360244094507698.kvalo@kernel.org>
Date: Thu, 21 Mar 2024 11:40:26 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_044028_654229_9722CFCE 
X-CRM114-Status: UNSURE (   8.93  )
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

> Currently we do reset for each RDDM event from MHI, however there are
> cases, see below log, that we get two or more consecutive events, and
> it is pointless to do reset for the subsequent ones. What's more, it
> makes reset process more likely to fail.
> 
> [ 1502.115876] ath11k_pci 0000:04:00.0: boot notify status reason MHI_CB_EE_RDDM
> [ 1502.115884] ath11k_pci 0000:04:00.0: firmware crashed: MHI_CB_EE_RDDM
> [ 1502.224041] ath11k_pci 0000:04:00.0: boot notify status reason MHI_CB_EE_RDDM
> [ 1502.224050] ath11k_pci 0000:04:00.0: firmware crashed: MHI_CB_EE_RDDM
> 
> Add a check to avoid reset again and again. This is done by tracking previous
> MHI status: if we receive a new RDDM event while the previous one is
> also the same, we treat it as duplicate and ignore it, because normally
> we should receive a MHI_CB_EE_MISSION_MODE event between them.
> 
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

7c352a4d0183 wifi: ath11k: do not process consecutive RDDM event

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240111071406.14053-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


