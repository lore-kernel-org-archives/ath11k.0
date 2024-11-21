Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D94D6ED02
	for <ath11k@archiver.kernel.org>; Thu, 21 Nov 2024 10:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/XSk3V2VPzWmiwkK+1GF8tZsAHjmeJt1BlRyEGcx8g=; b=xpdG/Yh+Vqie2lx+M+tXJ7itCq
	XK4P8Mw/64dSUkwvtVz3hvcPPmUsYtNyvnwBX7iFdTvUkyMIHUKAaMbDGzI1DaRp0rFo+8jPUT6hU
	4eAI6LRWrUdcKlV5RvWJ82r8Rl/eL24/HoxPujLqzxMFKYQSeron93iiXmsCJruLcSXlgOdMmj/7b
	7TyNGDkfSGyYWHb9ivIOewunmtS5zClnpmN9YzjX/52O4KC2IAKM1r2UfztGUD8TUY5btrv30upAf
	n2Gx1ful1ScKQTDzUuDixz8pdYxDDSXl5AjnvDGkjwrGIHqNDQcsIniDsDtvI7XivAou8uKV6lAwS
	QMK9nKPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4ua-0000000HPgr-1ZOX;
	Thu, 21 Nov 2024 10:59:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE4uX-0000000HPep-2Omh
	for ath11k@lists.infradead.org;
	Thu, 21 Nov 2024 10:59:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 12EC85C573F;
	Thu, 21 Nov 2024 10:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2F9C4CECC;
	Thu, 21 Nov 2024 10:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732186784;
	bh=FNlUqpX3h8ygH4ry09EHX7f6Mff7DHs2rKLiP8rZXAI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=VCoCUzer2i4zyQ2nErD1io/AkQmH5fM5P8vLVsUB7Ocoa8TicDyl9/oMYBhPZqCC0
	 mU2p58whH5j/8PBIwS87Ec3oAI7NPm/qcF7klsIia+t4b6hw88oP4NXj0rHJ7/WVzc
	 jwDg8MBq2kMcj8VKPQumAcf68dak/SCxitmffXpAmsrv9cH9VV33ovDMh2rVdx8TjT
	 J43GiqgBADFwtkJufod1Y4aZcU5CzJ8zXF8YomxpPsK2dWEMtDCM0Q40obolXeZApa
	 TTymKUw/zcu/XS4QYKeE1VzNtuzJK7e3fG8Nc9sEB6+T3fQZAM9ukPaAUz5TDEa15j
	 a8R3ANdZ64Ccg==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jeff Johnson <jjohnson@kernel.org>,  ath11k@lists.infradead.org,
  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2 2/4] wifi: ath11k: cleanup struct
 ath11k_reg_tpc_power_info
References: <20241111070152.85140-1-dmantipov@yandex.ru>
	<20241111070152.85140-2-dmantipov@yandex.ru>
Date: Thu, 21 Nov 2024 12:59:41 +0200
In-Reply-To: <20241111070152.85140-2-dmantipov@yandex.ru> (Dmitry Antipov's
	message of "Mon, 11 Nov 2024 10:01:50 +0300")
Message-ID: <87jzcwyhr6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_025945_649251_9ED751EF 
X-CRM114-Status: UNSURE (   6.39  )
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

Dmitry Antipov <dmantipov@yandex.ru> writes:

> Remove unused 'ap_constraint_power' field of 'struct
> ath11k_reg_tpc_power_info' and adjust related comment.
> Compile tested only.
>
> Fixes: 6f4e235be655 ("wifi: ath11k: add parse of transmit power envelope element")
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

