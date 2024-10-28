Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5BAD33982
	for <ath11k@archiver.kernel.org>; Mon, 28 Oct 2024 14:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUhiEf6+l5tKArqT26cgpTT4p+imM0xL0rvlkqK0FBE=; b=ASvgtr9aRdvM9/kbMl/OiFgn0e
	JnhXj6xeqK5SqHDnAQImhuTIs1J+Bf5NUKbvveNNMGmxLGVLjpSMm0a3oh/dqx8fOvFgc+CQLmt94
	kqElyDdtfr5MRw6ivvdRW9bp+y9XrTmIbvGpRMV1ZhB5FHWTt+EKqUZ1vYpAiQRCFOs2AC/0M2Q0h
	gfu9rD29XNm0/kHPycOKLWVa0LAz23mcTTFa3krjYHgTtT4HMfAXu4DAte+OGpeD6/ouDNzU1k8fO
	/INsVSbtGPlKnGo1j99ooJ1riyw/yvKpBRkDeuRuGkIpF8hJ9hn4PzAVOrdarHIaPM1HbLA/VVZpe
	5ufxC9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QLc-0000000B1vo-0wL3;
	Mon, 28 Oct 2024 14:03:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5QKF-0000000B1cB-3tNB
	for ath11k@lists.infradead.org;
	Mon, 28 Oct 2024 14:02:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F60F5C59AD;
	Mon, 28 Oct 2024 14:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84F8C4CECD;
	Mon, 28 Oct 2024 14:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730124150;
	bh=/sTP+2WN1c6C61ayQbhYvOxsF1O045VWiiHAmCmxdRg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=vLZTdCt/SmyMqGbyieps+jmn3HmTfqbkIvQWC5aAXlIVh9Cc0Ac2lM8rAozGLiPMn
	 y6bH6K+N6XGReOyXKlQMmklXUjQTF8JVksK/6LOSGjC9gtgfXbHjLYSTDLVA+YcaAC
	 Wnx3Q1mLQB+j/gw51jia2B12CfA+/mc7cB7d5DyDgjnVgIw5SPM2XRIuXTXY/iJcJs
	 xEBsi1r8nqx0BigafejlIYsL9jHygbnvOMPXTCZSFmVm0UQjYkC2vyUmyIqRQRWpRC
	 pVL3xqe2AObh7h4gSdj3JRstxen20AOMnq5k4Z7uoe1kkY7MAItN/jfVNPQPb0ARVi
	 S6W5dJvsLnXaw==
From: Kalle Valo <kvalo@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,  <linux-wireless@vger.kernel.org>,
  <ath11k@lists.infradead.org>,  Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v2] ath11k: remove error checking for debugfs_create_file()
References: <20241025064235.382-1-thunder.leizhen@huawei.com>
Date: Mon, 28 Oct 2024 16:02:27 +0200
In-Reply-To: <20241025064235.382-1-thunder.leizhen@huawei.com> (Zhen Lei's
	message of "Fri, 25 Oct 2024 14:42:35 +0800")
Message-ID: <87v7xcgwb0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_070232_036757_DA29F739 
X-CRM114-Status: UNSURE (   8.60  )
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

Zhen Lei <thunder.leizhen@huawei.com> writes:

> Driver ath11k can work fine even if the debugfs files fail to be created.
> Therefore, the return value check of debugfs_create_file() should be
> ignored, as it says.
>
> Suggested-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Are you just guessing or did you confirm on a real device that ath11k
spectral really works without debugfs?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

