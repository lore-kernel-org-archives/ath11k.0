Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3F4C0032E
	for <ath11k@archiver.kernel.org>; Wed, 25 Oct 2023 10:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKHVxOTR2CSFp0KTDuc1L9WLl2kiSn6S99cplsv+VPs=; b=uUy5GIk2Zg+KHi
	Fc6PgWaVxbz6sBp+FacI5F/TnPWMBpTWjC4QmlusSZb7sPGZHWo5OnmoF5I6NLvtiTXhPX+CG7szU
	ywijbetIujo97QQ2hQOPiswfrySKPZjbFmxtuhHyPvLKeGQTOfxKoOemDE3O5tVpeYot0uu5o9vo1
	Gw5DUTorB1O74X5SpU6FDxZnV3pmf0ZSfIb9nwm+OJU39iFYuJs3d6vXk3Ls1lCOHap3j76VQVt9J
	06sbJGv8q4PYk5z26ntq3vGZkzZllpd/GyxON3JBpS/tLarlw+w9uNlnh/yZhuN8RB5Rv9WjLM8M5
	y+awPL7980noIDcvqobw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvagf-00Btf2-2S;
	Wed, 25 Oct 2023 10:00:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvagc-00BteK-2Z
	for ath11k@lists.infradead.org;
	Wed, 25 Oct 2023 10:00:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D6A761C3D;
	Wed, 25 Oct 2023 10:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A68C433C8;
	Wed, 25 Oct 2023 10:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698228025;
	bh=F1/gkCmvsR0o6rzvIG81eu8MlRTMzJjQX+YLmYEwrMA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=l8VjcJSrhRs8tIxsZBYqxOMp0/7laXlM4HHfU546QUO904cgQQ2OjwYm8I8x2EUqC
	 MdOlQfdI1fgHBFXMnrJTG3hHaoTlh8UeBZ8NZaRbr2q+I6AOV07I7Kxn/hb0WfF8k/
	 /cpR/Uh8ZoL0wcxmhIaTs/WKTDend/EBqQddzrDWLnCaCPEchMCAR/c6oSkAEerxS5
	 n9048glGa39cv7afiYykRJiUkHKv28eNBZDZY7ukUXX8m1xz6+sgu3Cr5+EjUPf+Rg
	 TWTbDBxEBuOyxb2Coo0NIJjiLzCsil6tgfelMLoUii5O7+wqLlayVaVoZ3JJ7R6hBA
	 ApWawiwTHSVrA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: fix htt pktlog locking
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231019112521.2071-1-johan+linaro@kernel.org>
References: <20231019112521.2071-1-johan+linaro@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>, stable@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169822802217.891844.6410411832034607586.kvalo@kernel.org>
Date: Wed, 25 Oct 2023 10:00:24 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_030026_874434_E49A1408 
X-CRM114-Status: UNSURE (   6.72  )
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

Johan Hovold <johan+linaro@kernel.org> wrote:

> The ath11k active pdevs are protected by RCU but the htt pktlog handling
> code calling ath11k_mac_get_ar_by_pdev_id() was not marked as a
> read-side critical section.
> 
> Mark the code in question as an RCU read-side critical section to avoid
> any potential use-after-free issues.
> 
> Compile tested only.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Cc: stable@vger.kernel.org      # 5.6
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3f77c7d605b2 wifi: ath11k: fix htt pktlog locking

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231019112521.2071-1-johan+linaro@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
