Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4841BEE49A0
	for <ath11k@archiver.kernel.org>; Wed, 23 Aug 2023 14:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4pttXXn3T77LwUcnb3ZaXuIUuaqu1RV0JsanFaoo8E=; b=ec9EIMRAq/h0ov
	eSlaVC4mbeqvVK9htebUfs2fTMf5s/ZFnt87gAMCJ0wYpcCeC2/o0iFC7cOQxSxk/2hqocmcbi3M5
	3e78wXBLPLeycXu6Vaq8sN+iMqgeDyyBo5f1qjAQG0Tp9MzZWkhObqYsurzt04V3PRUtJdHvf6uxj
	CSlFVeTXNcJUyVKmKKLHaDSSXgkpDwGUWCh7Xod44aTwXdRjE7rBlKZMR9UQt7D+4Jv7gSHRd9bFB
	NborGOYaapEU3MjKlWBjjWT74b13vItyGdM0fqsAlWyb9j7i25hx9ThDXgus/XjOZgX1n5x2xVT4h
	GBi66oUWw4Y3+ts3gXQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYoTa-000o0N-3B;
	Wed, 23 Aug 2023 14:04:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYoTY-000nze-0b
	for ath11k@lists.infradead.org;
	Wed, 23 Aug 2023 14:04:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8B0F465FDD;
	Wed, 23 Aug 2023 14:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91D3C433C7;
	Wed, 23 Aug 2023 14:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692799486;
	bh=fMzG+5ZYJwqkyX40cSxyRVnbZtJ1KnHDIN0uI3j8Kco=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=BwZHZvPS+jqnh3gwaYlj7T7Siw6JGXZC7PSfeGq1tYJs1g5OuJDU8ARmJZwpth2Vn
	 AOFvWMxU3yG+v1UdBm7LGOr2wSyzjZlIZnLPOtpCNVxQ/1qappXwy/qSN5DXMSB3X0
	 3ch7nSVmxllTqzMuozBXFECvZIhdnhYA5SZ6bDdulxWd/AA3GWK2qBqAWShvc8M5fm
	 7jsB3Uwy5pvK0kg2zj+6BXJAAIXUUgGvIiU9LAX2jF64n0ixgshlG/4Vocuh8IR+V6
	 CTPmQ28trxzJGZrrLsc6JGJndrw1XDnAHZudZ7RJvfR79YEjjhC7HKpC3R0Bmt6BbI
	 VQMLIizTB6LWA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Consistently use ath11k_vif_to_arvif()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230821-ath11k_vif_to_arvif-v1-1-fa2c3b60b5cf@quicinc.com>
References: <20230821-ath11k_vif_to_arvif-v1-1-fa2c3b60b5cf@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169279948369.1241462.6552260393066152478.kvalo@kernel.org>
Date: Wed, 23 Aug 2023 14:04:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_070448_268656_3CDCFDE8 
X-CRM114-Status: UNSURE (   7.87  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Helper function ath11k_vif_to_arvif() exists to retrieve a struct
> ath11k_vif from a struct ieee80211_vif. However, in multiple places
> this logic is open-coded with inline typecasting. Since the
> typecasting prevents the compiler from type-checking the source and
> destination, update the driver to consistently use the helper
> function.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

9476cda44c13 wifi: ath11k: Consistently use ath11k_vif_to_arvif()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230821-ath11k_vif_to_arvif-v1-1-fa2c3b60b5cf@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
